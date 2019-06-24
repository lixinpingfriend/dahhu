
local class = require("lib.middleclass")
local ItemBaseView = class("ItemBaseView");

function ItemBaseView:initialize(go, initData)
    self.gameObject = go
    self.transform = go.transform
    self.initData = initData
    self.m_Data = nil
    self.m_owner = nil
end

function ItemBaseView:init()

end

function ItemBaseView:update_data()

end

function ItemBaseView:set_data(index, data)
    self.m_Data = data;
    self.m_index = index
    self:update_data();
end

function ItemBaseView:on_click()

end


return ItemBaseView;