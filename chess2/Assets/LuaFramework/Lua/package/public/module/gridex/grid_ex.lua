local class = require("lib.middleclass")
local GridEx = class('GridEx')
local UnityEngine = UnityEngine
local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
local LayoutGroupMode = {
    Vertical = 1,
    Horizon = 2,
    Grid    = 3,
}
local offset = 200 --偏差

function GridEx:initialize(go, option)
    self.useLoopItems = option.useLoopItems            --是否使用无限循环列表，对于列表项中set_data方法执行消耗较大时不宜使用，因为set_data方法会在滚动的时候频繁调用
    self.useClickEvent = option.useClickEvent          --列表项是否监听点击事件
    self.layoutGroupMode = option.layoutGroupMode;    --布局方式，垂直=1，水平 = 2或 网格 = 3 网格功能未实现 Fuck
    self.gameObject = go
    self.transform = go.transform
    self.m_itemViews = {}
    self.m_startIndex = 0 --数据数组渲染的起始下标
    self:init()
end

--有没有注册进来的C#方法 所以部分数值采取写死方式
function GridEx:init()
    local toggleGroup = ModuleCache.ComponentManager.GetComponent(self.gameObject, ComponentTypeName.ToggleGroup)
    self.m_scrollRect =  ModuleCache.ComponentManager.GetComponent(self.gameObject, ComponentTypeName.ScrollRect)

    if self.layoutGroupMode == LayoutGroupMode.Vertical then
        self.m_LayoutGroup =  ModuleCache.ComponentManager.GetComponentWithPath(self.gameObject, "Viewport/Content", ComponentTypeName.VerticalLayoutGroup)
    elseif self.layoutGroupMode == LayoutGroupMode.Horizon then
        self.m_LayoutGroup =  ModuleCache.ComponentManager.GetComponentWithPath(self.gameObject, "Viewport/Content", ComponentTypeName.HorizontalLayoutGroup)
    elseif self.layoutGroupMode == LayoutGroupMode.Grid then
        self.m_LayoutGroup =  ModuleCache.ComponentManager.GetComponentWithPath(self.gameObject, "Viewport/Content", ComponentTypeName.GridLayoutGroup)
    end
    if self.m_scrollRect == nil or self.m_LayoutGroup == nil then
        error("GridEx:init could not find component scrollrect or layoutgroup !");
        return;
    end

    self.m_content = ModuleCache.ComponentManager.GetComponent(self.m_LayoutGroup.gameObject, ComponentTypeName.RectTransform)
    self.m_oldPadding = self.m_LayoutGroup ~= nil and  self.m_LayoutGroup.padding  or ModuleCache.CustomerUtil.ConvertRectOffset(0,0,0,0)
    self.m_tranScrollRect = ModuleCache.ComponentManager.GetComponent(self.m_scrollRect.gameObject, ComponentTypeName.RectTransform)
    self.m_isVertical = self.m_scrollRect.vertical; -- 是否是垂直滚动方式，否则是水平滚动
    self.m_constraint_count = self.m_LayoutGroup == nil and 1 or ((self.layoutGroupMode == LayoutGroupMode.Grid) and self.m_LayoutGroup.constraintCount or 1)
    self.m_viewSpace =  self.m_isVertical and (self.m_tranScrollRect.sizeDelta.y + offset) or (self.m_tranScrollRect.sizeDelta.x + offset) --可见区域长度

    if self.useLoopItems then
        self.m_scrollRect.onValueChanged:AddListener(function (args)
            self:on_scroll(args);
        end);
    end
    if toggleGroup ~= nil then toggleGroup.allowSwitchOff = self.useLoopItems end
end

--设置渲染显示项
function GridEx:set_item_view(itemObj, itemView, initData)
    self.m_itemObj = itemObj;
    self.ItemView = itemView;
    self.ItemInitData = initData
    local rTrs = ModuleCache.ComponentManager.GetComponent(self.m_itemObj, ComponentTypeName.RectTransform)
    if rTrs ~= nil and self.m_LayoutGroup ~= nil then
        if self.m_isVertical then
            if self.layoutGroupMode == LayoutGroupMode.Grid then
                self.m_itemSpace = rTrs.sizeDelta.y + self.m_LayoutGroup.spacing.x
            else
                self.m_itemSpace = rTrs.sizeDelta.y + self.m_LayoutGroup.spacing;
            end
        else
            if self.layoutGroupMode == LayoutGroupMode.Grid then
                self.m_itemSpace = rTrs.sizeDelta.x + self.m_LayoutGroup.spacing.y
            else
                self.m_itemSpace = rTrs.sizeDelta.x + self.m_LayoutGroup.spacing;
            end
        end
        self.m_viewItemCount = math.ceil(self.m_viewSpace / self.m_itemSpace);
    end
end

--设置数据，显示列表 callBack 多次数据获取用
function GridEx:set_datas(datas, callBack)
    if datas == nil then
        error("GridEx :set_datas datas is nil !");
        return
    end
    self.m_datas = datas;
    self.newData_callBack = callBack
    self.m_contentSpace = self.m_isVertical and self.m_content.sizeDelta.y or self.m_content.sizeDelta.x  --内容长度 需要滑动更新
    self.m_cacheCount = self.m_constraint_count + #self.m_datas % self.m_constraint_count; --缓存数量
    self.m_cacheUnitCount = self.m_LayoutGroup == nil and 1 or math.ceil(self.m_cacheCount / self.m_constraint_count) --缓存单元的行（列）数
    self.m_dataUnitCount = self.m_LayoutGroup == nil and #self.m_datas or math.ceil(#self.m_datas / self.m_constraint_count) --数据单元的行（列）数
    self:update_view();
end

--region 显示相关

--更新列表视图
function GridEx:update_view()
    if self.m_itemObj == nil or self.m_content == nil  then return end
    if self.useLoopItems then
        self.m_startIndex = math.max(0, math.min(self.m_startIndex / self.m_constraint_count, self.m_dataUnitCount - self.m_viewItemCount - self.m_cacheUnitCount)) * self.m_constraint_count;
        local frontSpace = self.m_startIndex / self.m_constraint_count * self.m_itemSpace;
        local behindSpace = math.max(0, self.m_itemSpace * (self.m_dataUnitCount - self.m_cacheUnitCount) - frontSpace - (self.m_itemSpace * self.m_viewItemCount));
        if self.m_isVertical then
            --if self.layoutGroupMode ~= LayoutGroupMode.Grid then
               self.m_content.sizeDelta = Vector2.New(self.m_content.sizeDelta.x, behindSpace)
                --self.m_LayoutGroup.padding = UnityEngine.RectOffset.New(self.m_oldPadding.left, self.m_oldPadding.right, frontSpace, behindSpace)  -- ModuleCache.CustomerUtil.ConvertRectOffset(self.m_oldPadding.left, self.m_oldPadding.right, frontSpace, behindSpace);
            --end
        else
            self.m_LayoutGroup.padding = UnityEngine.RectOffset.New(frontSpace, behindSpace, self.m_oldPadding.top, self.m_oldPadding.bottom)-- ModuleCache.CustomerUtil.ConvertRectOffset(frontSpace, behindSpace, self.m_oldPadding.top, self.m_oldPadding.bottom);
        end
    else
        self.m_startIndex = 0;
    end

    local itemLength = self.useLoopItems and self.m_viewItemCount * self.m_constraint_count + self.m_cacheCount or #self.m_datas;
    itemLength = math.min(itemLength, #self.m_datas);
    for i = itemLength + 1, #self.m_itemViews do
        if self.m_itemViews[i] ~= nil then
            UnityEngine.GameObject.DestroyImmediate(self.m_itemViews[i].gameObject);
            self.m_itemViews[i] = nil;
        end
    end

    for i = 1,  itemLength do
        while true do
            local index = self.m_startIndex + i;
            if index > #self.m_datas or index < 0 then
                break;
            end
            if i < #self.m_itemViews + 1 then
                self.m_itemViews[i]:set_data(index, self.m_datas[index]);
            else
                local go = ModuleCache.ComponentUtil.InstantiateLocal(self.m_itemObj);
                go.name = self.m_itemObj.name;
                go.transform:SetParent(self.m_content, false);
                go:SetActive(true);

                local itemView = self.ItemView:new(go, self.ItemInitData);
                itemView:init();
                itemView:set_data(index, self.m_datas[index]);
                itemView.m_owner = self;

                if self.useClickEvent then
                    ModuleCache.ComponentManager.GetComponent(go, ComponentTypeName.Button).onClick:AddListener(
                            function() itemView:on_click() end
                    )
                end
                table.insert(self.m_itemViews, itemView);
            end

            --当没有数据的时候 看看是否有需要获取新的数据
            if index == #self.m_datas and  self.newData_callBack ~= nil then
                self.newData_callBack()
            end

            break;
        end

    end
end

--响应滑动事件
function GridEx:on_scroll(data)
    self.m_contentSpace = self.m_isVertical and self.m_content.sizeDelta.y or self.m_content.sizeDelta.x  --内容长度 需要滑动更新
    local value = (self.m_contentSpace - self.m_viewSpace) * (self.m_isVertical and data.y or 1 - data.x);
    local start = self.m_contentSpace - value - self.m_viewSpace
    local startIndex = math.floor(start / self.m_itemSpace) * self.m_constraint_count;
    startIndex = math.max(0, startIndex);
    if startIndex ~= self.m_startIndex then
        self.m_startIndex = startIndex;
        self:update_view();
    end
end

--endregion


--region 辅助方法

function GridEx:remove_item(go)
    if go == nil then
        error("GridEx:remove_item go is nil...");
        return;
    end

    local idx = 0;
    for k,v in pairs(self.m_itemViews) do
        if v ~= nil and v.gameObject == go then
            idx = k;
            break;
        end
    end
    if idx ~= 0 then
        table.remove(self.m_itemViews,idx);
    else
        print("GridEx:remove_item does not exsit this item in m_itemViews...");
    end
end

--重置滚动位置，如果同时还要赋值新的datas，请在赋值之前调用本方法
--初始创建时不需要重置,如果在set_datas以后马上调用，不起效果（不知道为什么reset以后会响应onscroll，多刷新一遍，延迟一帧调用即可）
function GridEx:reset_scroll_position(index)
    if self.m_datas == nil then
        return;
    end
    index = index == nil and 1 or index
    local unitIndex = Mathf.Clamp(index / self.m_constraint_count, 0, self.m_dataUnitCount - self.m_viewItemCount > 0 and self.m_dataUnitCount - self.m_viewItemCount or 0);
    local value = (unitIndex * self.m_itemSpace) / (math.max(self.m_viewSpace, self.m_contentSpace - self.m_viewSpace));
    value = Mathf.Clamp(value,0,1);

    --特殊处理无法使指定条目置顶的情况——拉到最后
    if unitIndex ~= index / self.m_constraint_count then
        value = 1;
    end

    if self.m_isVertical then
        self.m_scrollRect.verticalNormalizedPosition = 1 - value;
    else
        self.m_scrollRect.horizontalNormalizedPosition = value;
    end

    self.m_startIndex = unitIndex * self.m_constraint_count;
    self:update_view();
end

function GridEx:set_position_toporbottom(top)
    if self.m_datas == nil then
        return;
    end

    local index = top and 0 or #self.m_datas;
    self:reset_scroll_position(index);
end

--endregion

return GridEx;


