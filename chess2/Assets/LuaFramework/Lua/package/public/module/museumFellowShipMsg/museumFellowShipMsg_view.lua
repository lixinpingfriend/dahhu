
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local MuseumFellowShipMsgView = Class('museumFellowShipMsgView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local PlayerPrefsManager = ModuleCache.PlayerPrefsManager

function MuseumFellowShipMsgView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/museumfellowshipmsg/public_museumfellowshipmsg.prefab", "Public_MuseumFellowShipMsg", 1)
    View.set_1080p(self)

    self.copyItem = GetComponentWithPath(self.root, "Child/ItemPrefabHolder/CopyItem", ComponentTypeName.Transform).gameObject
    self.copyParent = GetComponentWithPath(self.root, "Child/ScrollRect/Viewport/Content", ComponentTypeName.RectTransform)
    self.notDataObj = GetComponentWithPath(self.root, "Child/notDataText", ComponentTypeName.Transform).gameObject
end


--初始化亲友圈列表
function MuseumFellowShipMsgView:initLoopScrollViewList(data)
    self.dataList = data

    self.notDataObj:SetActive(#self.dataList == 0)
    self:reset()
    if(#self.dataList > 0) then
        for i=1,#self.dataList do
            self.dataList[i].item = self:get_item(self.dataList[i], i)
            self:fillItem(self.dataList[i].item)
        end
    end
end

local groupString = {"正常","A组","B组","C组","封停","D组","E组","F组","G组","H组"}
function MuseumFellowShipMsgView:fillItem(item)
    local data = item.data
    local imageHead = GetComponentWithPath(item.gameObject, "Mask/ImageHead", ComponentTypeName.Image)
    local infoTex = GetComponentWithPath(item.gameObject, "infoTex", ComponentTypeName.Text)
    local timeTex = GetComponentWithPath(item.gameObject, "timeTex", ComponentTypeName.Text)
    if(data) then
        local detailJson = nil
        if data.detailJson and data.detailJson ~= ""then
            detailJson = ModuleCache.Json.decode(data.detailJson)
        end

        self:image_load_sprite(imageHead, data.headImg)
        timeTex.text = data.createTime

        --operate (integer, optional): 操作类型1添加 2删除 3亲友圈加入联谊 4亲友圈退出联谊 5联谊圈调整玩家归属 6玩家分组 ,
        --operateCase (integer, optional): 操作情况 添加： XXX通过免审核链接加入了亲友圈。2，XXX的申请已被圈主同意，加入了亲友圈。
        --3，XXX被圈主通过游戏ID添加到了亲友圈。删除：1，XXX主动退出了亲友圈。2，XXX被圈主移出了亲友圈。3，XXX由于更换圈主，自动移出了亲友圈。 ,
        if data.operate == 1 then
            if data.operateCase == 1 then
                infoTex.text = string.format("<color=#98951EFF>%s</color>通过免审核链接<color=#20902FFF>加入</color>了亲友圈。",Util.filterPlayerName(data.nickname, 10, data.isRedName))
            elseif data.operateCase == 2 then
                if not data.operateNickname or data.operateNickname == ""then
                    infoTex.text = string.format("<color=#98951EFF>%s</color>的申请已被圈主同意，<color=#20902FFF>加入</color>了亲友圈。",Util.filterPlayerName(data.nickname, 10, data.isRedName))
                else
                    infoTex.text = string.format("<color=#98951EFF>%s</color>的申请已被<color=#A34FD8FF>%s</color>同意，<color=#20902FFF>加入</color>了亲友圈。",Util.filterPlayerName(data.nickname, 10, data.isRedName),Util.filterPlayerName(data.operateNickname, 10))
                end

            elseif data.operateCase == 3 then
                if not data.operateNickname or data.operateNickname == ""then
                    infoTex.text = string.format("<color=#98951EFF>%s</color>被圈主通过游戏ID<color=#20902FFF>添加</color>到了亲友圈。",Util.filterPlayerName(data.nickname, 10, data.isRedName))
                else
                    infoTex.text = string.format("<color=#98951EFF>%s</color>被<color=#A34FD8FF>%s</color>通过游戏ID<color=#20902FFF>添加</color>到了亲友圈。",Util.filterPlayerName(data.nickname, 10, data.isRedName),Util.filterPlayerName(data.operateNickname, 10))
                end
            elseif data.operateCase == 4 then
                infoTex.text = string.format("<color=#98951EFF>%s</color>被圈主<color=#20902FFF>设置</color>成为管理员。",Util.filterPlayerName(data.nickname, 10, data.isRedName))
            end
        elseif data.operate == 2 then
            if data.operateCase == 1 then
                infoTex.text = string.format("<color=#98951EFF>%s</color>主动<color=#B62C2CFF>退出</color>了亲友圈。",Util.filterPlayerName(data.nickname, 10, data.isRedName))
            elseif data.operateCase == 2 then
                if not data.operateNickname or data.operateNickname == ""then
                    infoTex.text = string.format("<color=#98951EFF>%s</color>被圈主<color=#B62C2CFF>移出</color>了亲友圈。",Util.filterPlayerName(data.nickname, 10, data.isRedName))
                else
                    infoTex.text = string.format("<color=#98951EFF>%s</color>被<color=#A34FD8FF>%s</color><color=#B62C2CFF>移出</color>了亲友圈。",Util.filterPlayerName(data.nickname, 10, data.isRedName),Util.filterPlayerName(data.operateNickname, 10))
                end

            elseif data.operateCase == 3 then

                if not data.operateNickname or data.operateNickname == ""then
                    infoTex.text = string.format("<color=#98951EFF>%s</color>由于更换圈主，自动<color=#B62C2CFF>移出</color>了亲友圈。",Util.filterPlayerName(data.nickname, 10, data.isRedName))
                else
                    infoTex.text = string.format("<color=#98951EFF>%s</color>由于更换<color=#A34FD8FF>%s</color>，自动<color=#B62C2CFF>移出</color>了亲友圈。",Util.filterPlayerName(data.nickname, 10, data.isRedName),Util.filterPlayerName(data.operateNickname, 10))
                end
            elseif data.operateCase == 4 then

                infoTex.text = string.format("<color=#98951EFF>%s</color>已经被圈主<color=#20902FFF>取消</color>管理员。",Util.filterPlayerName(data.nickname, 10, data.isRedName))
            end

        elseif data.operate == 3 and detailJson then
            infoTex.text = string.format("亲友圈<color=#40bb0fFF>0%s</color>被管理员<color=#8b59a2FF>%s</color>邀请加入联谊",detailJson.slaveParlorNum,Util.filterPlayerName(data.operateNickname, 10, data.isRedName))
        elseif data.operate == 4 and detailJson then
            infoTex.text = string.format("亲友圈<color=#40bb0fFF>0%s</color>被管理员<color=#8b59a2FF>%s</color>退出联谊",detailJson.slaveParlorNum,Util.filterPlayerName(data.operateNickname, 10, data.isRedName))
        elseif data.operate == 5 and detailJson then
            infoTex.text = string.format("<color=#40bb0fFF>%s</color>被管理员<color=#8b59a2FF>%s</color>调整到归属于亲友圈<color=#40bb0fFF>0%s</color>",Util.filterPlayerName(data.nickname, 10, data.isRedName),Util.filterPlayerName(data.operateNickname, 10, data.isRedName),detailJson.slaveParlorNum)
        elseif data.operate == 6 and detailJson then
            infoTex.text = string.format("<color=#40bb0fFF>%s</color>被管理员<color=#8b59a2FF>%s</color>标记为<color=#e74100FF>%s</color>",Util.filterPlayerName(data.nickname, 10, data.isRedName),
            Util.filterPlayerName(data.operateNickname, 10, data.isRedName),groupString[tonumber(detailJson.groupNum+1)])

        end

    end

end

function MuseumFellowShipMsgView:get_item(data, i)
    local obj = nil
    local item = {}
    if i<=#self.contents  then
        obj = self.contents[i]
    else
        obj = TableUtil.clone(self.copyItem,self.copyParent.gameObject,Vector3.zero)
    end
    obj.name = "item_" .. i
    ComponentUtil.SafeSetActive(obj, true)
    item.gameObject = obj
    item.data = data
    return item
end

function MuseumFellowShipMsgView:reset()
    self.contents = TableUtil.get_all_child(self.copyParent.gameObject)
    for i=1,#self.contents do
        ComponentUtil.SafeSetActive(self.contents[i], false)
    end
end

return MuseumFellowShipMsgView