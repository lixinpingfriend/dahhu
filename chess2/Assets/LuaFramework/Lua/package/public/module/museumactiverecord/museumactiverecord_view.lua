
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local MuseumActiveRecordView = Class('museumActiveRecordView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil

local awardType = {[2] = "钻石", [3] ="体力", [4] ="元红包", [5] ="cdkey", [6] ="铜钱",
    [7] ="元宝", [8] ="抽奖券",[9] ="金币",  [10] ="道具", [11] ="实物", [12] ="特权商品购买", [14] ="红包劵"}

function MuseumActiveRecordView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/museumactiverecord/public_museumactiverecord.prefab", "Public_MuseumActiveRecord", 1)
    View.set_1080p(self)

    self.notDataObj = GetComponentWithPath(self.root, "Center/notDataText", ComponentTypeName.Transform).gameObject
    self.copyItem = GetComponentWithPath(self.root, "Center/ItemPrefabHolder/Item", ComponentTypeName.Transform).gameObject
    self.parent = GetComponentWithPath(self.root, "Center/ScrollRect/Viewport/Content", ComponentTypeName.Transform).gameObject
    self.parent = GetComponentWithPath(self.root, "Center/ScrollRect/Viewport/Content", ComponentTypeName.Transform).gameObject
    self.loadButton = GetComponentWithPath(self.root, "Center/ScrollRect/Viewport/Content/loadButton", ComponentTypeName.Transform).gameObject
end

function MuseumActiveRecordView:initLoopScrollViewList(data)    --panelIdx 1:成员  2：审核  3：消息

    self:reset()
    self.notDataObj:SetActive(#data.list== 0)

    if(#data.list > 0) then
        for i=1,#data.list do
            self:fillItem(self:get_item(data.list[i], i))
        end
    end

    self.loadButton:SetActive(data.page < data.totalPage)
    self.loadButton.transform:SetAsLastSibling()
end


function MuseumActiveRecordView:get_item(data, i)
    local obj = nil
    local item = {}
    if(i<=#self.contents and self.contents[i] ~= self.loadButton ) then
        obj = self.contents[i]
    else
        obj = TableUtil.clone(self.copyItem,self.parent,Vector3.zero)
    end
    obj.name = "item_" .. i
    ComponentUtil.SafeSetActive(obj, true)
    item.gameObject = obj
    item.data = data
    return item
end

function MuseumActiveRecordView:reset()

    self.contents = TableUtil.get_all_child(self.parent)
    for i=1,#self.contents do
        ComponentUtil.SafeSetActive(self.contents[i], false)
    end
end


function MuseumActiveRecordView:fillItem(item)
    local data = item.data
    local activeTypeTex = GetComponentWithPath(item.gameObject, "activeTypeTex", ComponentTypeName.Text)
    local nickName = GetComponentWithPath(item.gameObject, "nickTex", ComponentTypeName.Text)
    local contentTex = GetComponentWithPath(item.gameObject, "contentTex", ComponentTypeName.Text)
    local TimeTex = GetComponentWithPath(item.gameObject, "TimeTex", ComponentTypeName.Text)

    if(data) then
        activeTypeTex.text = data.activityName
        if data.activityName == "邀请活动" then
            contentTex.text = string.format("<color=#B44328>%s</color>  完成邀请好友活动，获得%s%s",Util.filterPlayerName(data.nickName, 10),data.amount,awardType[data.amountType])
        else
            if data.conditionTargetType and type(data.conditionTargetType) ~= "userdata" and  data.conditionTargetType ==  102 then --conditionTargetType  100局数任务 102大赢家次数
                contentTex.text = string.format("<color=#B44328>%s</color>  完成大赢家%s次，获得%s%s。",Util.filterPlayerName(data.nickName, 10),data.conditionTargetNum,data.amount,awardType[data.amountType])
            else
                contentTex.text = string.format("<color=#B44328>%s</color>  完成大局数%s局，获得%s%s。",Util.filterPlayerName(data.nickName, 10),data.conditionTargetNum,data.amount,awardType[data.amountType])
            end

        end

        TimeTex.text = data.createTime
    end
end


return MuseumActiveRecordView