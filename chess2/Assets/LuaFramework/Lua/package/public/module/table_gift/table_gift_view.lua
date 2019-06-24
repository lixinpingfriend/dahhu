




local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath

local class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
local giftConfig = require('package.public.module.table_gift.gift_config')
local configTable = giftConfig.get_gift_config()
local TableGiftView = class('TableGiftView', View)

local localPos_0 = UnityEngine.Vector3.zero

function TableGiftView:initialize(...)

end

function TableGiftView:init()
    if(self.is_inited)then
        return
    end
    View.initialize(self, "public/module/tablegift/tablegift.prefab", "TableGift", 1)
    self.tranTmp = GetComponentWithPath(self.root, "tmp", ComponentTypeName.Transform)
    self.pathHolder = GetComponentWithPath(self.root, "Path", 'DG.Tweening.DOTweenPath')
    local goCamera = ModuleCache.ComponentUtil.Find(UnityEngine.GameObject.Find("GameRoot"), "Game/UIRoot/UICamera")
    self.uiCamera = ModuleCache.ComponentManager.GetComponent(goCamera, "UnityEngine.Camera")

    self.goGiftHolder = GetComponentWithPath(self.root, "GiftHolder", ComponentTypeName.Transform).gameObject
    self.giftTablePrefabHolder = {}
    self.chatFaceTablePrefabHolder = {}
    for i, v in pairs(configTable) do
        self.giftTablePrefabHolder[i] = GetComponentWithPath(self.root, 'Holder/' .. i, ComponentTypeName.Transform).gameObject
    end

    local chatConfigList = giftConfig.get_common_chatface_config()
    for i, v in ipairs(chatConfigList) do
        self.chatFaceTablePrefabHolder[v.key] = GetComponentWithPath(self.root, 'ChatFaceHolder/' .. v.key, ComponentTypeName.Transform).gameObject
    end
    self.is_inited = true
    View.show(self)
end

function TableGiftView:create_send_gift_anim(giftData)
    local needDelay = not self.is_inited
    self:init()
    if(needDelay)then
        self:subscibe_time_event(0.5, false, 0):OnComplete(function(t)
            self:start_play_send_gift(giftData)
        end)
    else
        self:start_play_send_gift(giftData)
    end
end

function TableGiftView:start_play_send_gift(giftData)
    if(giftData.is_common_chatface)then
        self:play_chatface_anim(giftData)
    else
        local times = giftData.times or 1
        for i = 1, times do
            self:subscibe_time_event(0.5 * (i - 1), false, 0):OnComplete(function(t)
                self:play_send_gift_anim(giftData)
            end)
        end
    end
end


function TableGiftView:GetLastIdIndex(IdList,Id)
    if(IdList and #IdList > 0) then
        for i = #IdList, 1,-1 do
            if(IdList[i] == Id) then
                return i
            end
        end
    end
    return 0
end

function TableGiftView:RemoveFirstId(IdList,Id)
    local newList = {}
    if(IdList and #IdList > 0) then
        for i = 1, #IdList do
            if(IdList[i] == Id) then
            else
                table.insert(newList, IdList[i])
            end
        end
    end
    return newList
end

function TableGiftView:play_send_gift_anim(giftData)
    print_table(giftData)
    --不同的玩家显示表情,各部影响,但是如果同一时间,同一玩家收到多个表情时需要,依次显示,而不是一起显示
    local ReceiverId = tonumber(giftData.receiverId or 0)
    if(giftData.toPos) then --这里是要飞的
        self.ReceiverIdList = self.ReceiverIdList or {}
        local LastIndex = self:GetLastIdIndex(self.ReceiverIdList,ReceiverId)
        if(LastIndex > 0) then
            self:subscibe_time_event(LastIndex * 2, false, 0):OnComplete(function(t)
                --print("==需等待飞")
                self:play_send_gift_anim(giftData)
            end)
            return
        else
            --print("==无需等待,直接飞")
        end
        table.insert(self.ReceiverIdList,ReceiverId)
    end

    local goPrefab = self.giftTablePrefabHolder[giftData.giftName]
    local config = configTable[giftData.giftName]
    if(goPrefab and config)then
        local clone = ModuleCache.ComponentUtil.InstantiateLocal(goPrefab, self.goGiftHolder, localPos_0)
        local effect = GetComponentWithPath(clone, "effect", ComponentTypeName.Transform)
        local go = GetComponentWithPath(clone, "go", ComponentTypeName.Transform)
        if(effect and go)then
            ModuleCache.ComponentUtil.SafeSetActive(go.gameObject, true)
            ModuleCache.ComponentUtil.SafeSetActive(effect.gameObject, false)
        end
        clone.transform.position = giftData.fromPos

        local localFromPos = self:worldPosToLocal(giftData.fromPos)
        local localToPos
        if(giftData.toPos)then
            localToPos = self:worldPosToLocal(giftData.toPos)
            local duration = 0.5
            self:flyFromTo(clone, localFromPos, localToPos, duration, function()
                self.ReceiverIdList = self:RemoveFirstId(self.ReceiverIdList,ReceiverId)
            end, true)
            self:subscibe_time_event(duration - 0.1, false, 0):OnComplete(function(t)
                if(effect and go)then
                    ModuleCache.ComponentUtil.SafeSetActive(go.gameObject, false)
                    ModuleCache.ComponentUtil.SafeSetActive(effect.gameObject, true)
                    ModuleCache.SoundManager.play_sound("public", string.format("publictable/sound/tablegift/%s.bytes", giftData.giftName), giftData.giftName)
                end
                local effectTime = config.effectTime or 3
                self:subscibe_time_event(effectTime, false, 0):OnComplete(function(t)
                    UnityEngine.GameObject.Destroy(clone)
                end)
            end)
        else
            if(effect and go)then
                ModuleCache.ComponentUtil.SafeSetActive(go.gameObject, true)
                ModuleCache.ComponentUtil.SafeSetActive(effect.gameObject, true)
            end
            local effectTime = config.effectTime or 3
            self:subscibe_time_event(effectTime, false, 0):OnComplete(function(t)
                UnityEngine.GameObject.Destroy(clone)
            end)
        end
    end
end

function TableGiftView:play_chatface_anim(giftData)
    local goPrefab = self.chatFaceTablePrefabHolder[giftData.chatface_id .. '']
    if(goPrefab)then
        local clone = ModuleCache.ComponentUtil.InstantiateLocal(goPrefab, self.goGiftHolder, localPos_0)
        clone.transform.position = giftData.fromPos
        ModuleCache.ComponentUtil.SafeSetActive(clone, true)
        local duration = 3
        self:subscibe_time_event(duration, false, 0):OnComplete(function(t)
            UnityEngine.GameObject.Destroy(clone)
        end)
    end
end

function TableGiftView:flyTest(obj, arg)
    self:init()
    local from = UnityEngine.Vector3.New(-500, 200, 0)
    local screenPos = UnityEngine.Input.mousePosition
    local position = self.uiCamera:ScreenToWorldPoint(Vector3.New(screenPos.x, screenPos.y, 0))
    self.tranTmp.position = position
    local to = self.tranTmp.localPosition
    self:flyFromTo(self.goSeat, from, to)
end

function TableGiftView:worldPosToLocal(pos)
    self.tranTmp.position = pos
    return self.tranTmp.localPosition
end

function TableGiftView:flyFromTo(go, from, to, duration, onFinish, useDirectMove)
    self:init()
    duration = duration or 0.7
    go.transform.localPosition = from
    local keyPos = self:calcKeyPos(from, to)
    local keyPosList = self.pathHolder.wps
    keyPosList:Clear()
    keyPosList:Add(from)
    keyPosList:Add(keyPos)
    keyPosList:Add(to)
    local array = keyPosList:ToArray()
    local sequence = self:create_sequence()
    if(useDirectMove)then
        sequence:Append(go.transform:DOLocalMove(to, duration, false):SetEase(DG.Tweening.Ease.Linear))
    else
        sequence:Append(go.transform:DOLocalPath(array, duration, DG.Tweening.PathType.CatmullRom):SetEase(DG.Tweening.Ease.Linear))
    end
    sequence:OnComplete(function ()
        if(onFinish)then
            onFinish()
        end
    end)
end

function TableGiftView:calcKeyPos(from, to)
    local distance = 200
    local y1_y2 = from.y - to.y
    local x2_x1 = to.x - from.x
    if(x2_x1 == 0)then
        x2_x1 = 0.5
    end
    local x1x2 = from.x + to.x
    local y1y2 = from.y + to.y
    local tmp = distance * math.sqrt(1/(math.pow(y1_y2/x2_x1, 2) + 1))
    local targetX = tmp * (y1_y2 / x2_x1) + x1x2 * 0.5
    local targetY = tmp + y1y2 * 0.5
    local targetX1 = -tmp * (y1_y2 / x2_x1) + x1x2 * 0.5
    local targetY1 = -tmp + y1y2 * 0.5
    if(math.abs(targetX) > math.abs(targetX1))then
        targetX = targetX1
    end
    if(math.abs(targetY) > math.abs(targetY1))then
        targetY = targetY1
    end
    return UnityEngine.Vector3.New(targetX, targetY, 0)
end


function TableGiftView:show(showTop)
    if(self.is_inited)then
        View.show(self, showTop)
    end
end

function TableGiftView:set_1080p()
    if(self.is_inited)then
        View.set_1080p(self)
    end
end

function TableGiftView:set_image_fill(image,size)
    if(self.is_inited)then
        View.set_image_fill(self)
    end
end

function TableGiftView:hide()
    if(self.is_inited)then
        View.hide(self)
    end
end

function TableGiftView:is_active()
    if(self.is_inited)then
        return View.is_active(self)
    end
    return false
end

function TableGiftView:destroy()
    if(self.is_inited)then
        View.destroy(self)
    end
end

return  TableGiftView