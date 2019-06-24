





local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")

---@class TextPromptModule
---@field view TextPromptView
local TextPromptModule = class("Hall.TextPromptModule", ModuleBase)

local ModuleCache = ModuleCache

local Sequence = DG.Tweening.DOTween.Sequence
local EaseLinear = DG.Tweening.Ease.Linear

local list = require("list")

function TextPromptModule:initialize(...)
    -- 开始初始化
    ModuleBase.initialize(self, "textprompt_view", nil, ...)
    self.staticModule = true

    self._unusedCenterTipsEntity = list:new()
    self._unusedCenterTipsEntityRedPacket = list:new()

    -- 需要按照权重来播放,从1、2、3、4开始，还有触发的时间等等都要重新排序
    self._systemAnnounceContents = list:new()
end

-- 创建
-- tipType={1=通用提示,2=红包雨提示}
function TextPromptModule:create_center_tips_entity(tipType, tipItem)
    local entity = nil;
    if tipType == 1 then
        entity = self._unusedCenterTipsEntity:pop()
    elseif tipType == 2 then
        entity = self._unusedCenterTipsEntityRedPacket:pop()
    end

    if not entity then
        entity = { }
        entity.rootGameObject = ModuleCache.ComponentUtil.InstantiateLocal(tipItem.gameObject, tipItem.parent.gameObject)
        entity.rootTransform = entity.rootGameObject.transform
        entity.centerTipsBaseItemCanvasGroup = ModuleCache.ComponentManager.GetComponent(entity.rootGameObject, "UnityEngine.CanvasGroup")
        entity.textCenterInfo = ModuleCache.ComponentManager.GetComponentWithPath(entity.rootGameObject, "Image/Text", ModuleCache.ComponentTypeName.Text)
        entity.textCenterInfoBg = ModuleCache.ComponentManager.GetComponentWithPath(entity.rootGameObject, "Image", ModuleCache.ComponentTypeName.RectTransform)
    end
    entity.rootTransform:SetAsLastSibling()
    entity.rootGameObject:SetActive(true)
    entity.centerTipsBaseItemCanvasGroup.alpha = 1
    return entity
end

-- 回收
function TextPromptModule:recyle_center_tips_entity(tipType, entity)
    entity.rootGameObject:SetActive(false)

    if tipType == 1 then
        self._unusedCenterTipsEntity:push(entity);
    elseif tipType == 2 then
        self._unusedCenterTipsEntityRedPacket:push(entity);
    end
end

--- 添加
function TextPromptModule:show_center_tips(text, color, remainTime, type)
    print("show_center_tips：", text)
    local sequence = self:create_sequence();
    local entity = self:create_center_tips_entity(1, self.view.centerTipsBaseItem);
    entity.textCenterInfo.text = text
    entity.textCenterInfoBg.sizeDelta = Vector2.New(entity.textCenterInfo.preferredWidth + 200, entity.textCenterInfoBg.sizeDelta.y)
    ModuleCache.LuaBridge.TransformUtil.SetY(entity.rootTransform, 0, true)
    sequence:Append(entity.rootTransform:DOLocalMoveY(0, 1, false):SetDelay(1))
    sequence:Join(entity.centerTipsBaseItemCanvasGroup:DOFade(0, 0.5):SetDelay(1))
    sequence:OnComplete( function()
        self:recyle_center_tips_entity(1, entity)
    end )

    --    sequence.Append(en.entityGo.transform.DOScale(Vector3.one * 1.2f, 0.3f).From().SetEase(Ease.InOutExpo));
    --    sequence.AppendInterval(remainTime);
    --    sequence.Append(en.entityGo.transform.DOLocalMoveY(250f, 1));
    --    //en.entityGo.GetComponent<CanvasGroup>().DOFade(0, 0.5f).SetDelay(0.5f)
    --    sequence.Join(en.text.DOFade(0, 0.5f).SetDelay(0.5f));
    --    sequence.OnComplete(() => {
    --    Recycle(en);
    --    });
end
--- 红包类型上浮提示
function TextPromptModule:show_center_tips_redpacket(text)
    local sequence = self:create_sequence();
    local entity = self:create_center_tips_entity(2, self.view.centerTipsBaseItemRedPacket)
    entity.textCenterInfo.text = text
    ModuleCache.LuaBridge.TransformUtil.SetY(entity.rootTransform, 0, true)
    sequence:Append(entity.rootTransform:DOLocalMoveY(120, 1.2, false):SetDelay(1))
    sequence:Join(entity.centerTipsBaseItemCanvasGroup:DOFade(0, 0.5):SetDelay(1))
    sequence:OnComplete( function()
        self:recyle_center_tips_entity(2, entity)
    end )
end

-- 显示系统跑马灯
function TextPromptModule:add_system_announce(content)
    if self.systemAnnounceIsShow then
        self._systemAnnounceContents:push(content)
        return
    end
    self.systemAnnounceIsShow = true
    self:_show_system_announce(content)
end

function TextPromptModule:_show_system_announce(content)
    self.view.systemAnnounceRoot:SetActive(true)
    local textTips = self.view.systemAnnounceText
    local textTipsTransform = textTips.transform
    textTips.text = content
    local textPreferredWidth = textTips.preferredWidth
    ModuleCache.TransformUtil.SetSizeDeltaX(textTipsTransform, textPreferredWidth + 30)
    ModuleCache.TransformUtil.SetX(textTipsTransform,(560 + textPreferredWidth / 2) + 20, true)
    local endPosX = 0 -(560 + textPreferredWidth / 2)
    local time = 10 * textPreferredWidth /(textPreferredWidth + 30)
    local sequence = self:create_sequence();
    sequence:Append(textTipsTransform:DOLocalMoveX(endPosX, time, false):SetEase(EaseLinear):OnComplete( function()
        local entity = self:_get_need_show_system_entity()
        if entity then
            self:_show_system_announce(entity)
        else
            self.systemAnnounceIsShow = false
            self.view.systemAnnounceRoot:SetActive(false)
        end
    end ))
end

function TextPromptModule:_get_need_show_system_entity()
    return self._systemAnnounceContents:pop()
end




return TextPromptModule