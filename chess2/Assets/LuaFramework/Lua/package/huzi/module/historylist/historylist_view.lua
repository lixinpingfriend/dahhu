
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local HistoryListView = Class('historyListView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local TableUtilPaoHuZi = require("package.huzi.module.tablebase.table_util")

function HistoryListView:initialize(...)
    -- 初始View
    View.initialize(self, "huzi/module/historylist/huzi_windowhistorylist.prefab", "HuZi_WindowHistoryList", 0)


    self.buttonClose = GetComponentWithPath(self.root, "TopLeft/Child/ImageBack", ComponentTypeName.Button)
    self.buttonCheckRoundVideo = GetComponentWithPath(self.root, "TopRight/Child/LookMatch", ComponentTypeName.Button)
    -- 空数据背景实体
    self.spriteEmptyGB = GetComponentWithPath(self.root, "Top/SpriteEmpty", ComponentTypeName.Transform).gameObject;

    self.content = GetComponentWithPath(self.root, "Top/Panels/ListScrollView/Viewport/Content", ComponentTypeName.Transform).gameObject
    self.cloneObj = GetComponentWithPath(self.root, "Top/Panels/ItemPrefabHolder/HistoryItem", ComponentTypeName.Transform).gameObject

    self.stateSwitcher = ModuleCache.ComponentManager.GetComponent(self.root,"UIStateSwitcher")
    self.searchInput = GetComponentWithPath(self.root, "Top/Panels/AdmainTools/InputField", ComponentTypeName.InputField)

    self.timeDropdown = GetComponentWithPath(self.root, "Top/Panels/AdmainTools/TimeDropdown", ComponentTypeName.Dropdown)
    self.pageInfoText = GetComponentWithPath(self.root, "Top/Panels/AdmainTools/PageControl/PageInfoText", ComponentTypeName.Text)

end

function HistoryListView:refresh_admain_tool_page_info(curPage,totalPage)
    if 0 == totalPage then
        curPage = 0
    end
	self.pageInfoText.text = "第"..tostring(curPage).."/"..tostring(totalPage).."页"
end

function HistoryListView:on_view_init()

end

function HistoryListView:get_data(obj)
    return self.history[tonumber(obj.name)]
end

function HistoryListView:initLoopScrollViewList(historyList)

    -- 空数据,显示空数据背景
    if #historyList == 0 then
        self.spriteEmptyGB:SetActive(true);
    else
        self.spriteEmptyGB:SetActive(false);
    end

    self.history = historyList
    self.contents = TableUtil.get_all_child(self.content)
    self:reset()
    for i = 1, #historyList do
        local obj = nil
        local item = { }
        if (i <= #self.contents) then
            obj = self.contents[i]
        else
            obj = TableUtil.clone(self.cloneObj, self.content, Vector3.zero)
        end
        obj.name = i .. ""
        ComponentUtil.SafeSetActive(obj, true)
        item.gameObject = obj
        item.data = historyList[i]
        self:fillItem(item, i)
    end
end

function HistoryListView:reset()
    for i = 1, #self.contents do
        ComponentUtil.SafeSetActive(self.contents[i], false)
    end
end

function HistoryListView:fillItem(item)
    local data = item.data
    local textRoomNum = GetComponentWithPath(item.gameObject, "Title/RoomNameLbl", ComponentTypeName.Text)
    local textTime = GetComponentWithPath(item.gameObject, "Title/TimeLbl", ComponentTypeName.Text)

    textRoomNum.text = "房号：" .. data.roomNumber
    if type(data.closeTime) ~= "userdata" then
        textTime.text = data.closeTime
    else
        textTime.text = data.createTime
    end

    -- os.date("%Y-%m-%d   %H:%M", data.time)

    local redAtlas = GetComponentWithPath(item.gameObject, "RedNumbersHolder", "SpriteAtlas")
    local greenAtlas = GetComponentWithPath(item.gameObject, "GreenNumbersHolder", "SpriteAtlas")

    print_table(data)
    --assert(data.players == nil,print_table(data))
    -- -- 名字重新排序
    for i = 1, #data.players do
        if data.players[i].userId == tonumber(self.modelData.roleData.userID) then
            local temp = data.players[1]
            data.players[1] = data.players[i]
            data.players[i] = temp
        end
    end

    ---按得分排序
    local players = {}
    for i = 1, #data.players do
        local player = data.players[i]
        if #players <= 0 then
            table.insert(players,player)
        else
            local last =  true
            for j=1,#players do
                if player.playerScore > players[j].playerScore then
                    table.insert(players,j,player)
                    last = false
                    break
                end
            end
            if last then
                table.insert(players,player)
            end
        end
    end


    for i = 1, 4 do
        local playerGo = GetComponentWithPath(item.gameObject, "Players/player" .. i, ComponentTypeName.Transform).gameObject
        if (i <= #players) then
            ComponentUtil.SafeSetActive(playerGo, true)
            local textPlayerName = GetComponentWithPath(playerGo, "nameLbl", ComponentTypeName.Text)
            local textWrapRedScore = GetComponentWithPath(playerGo, "redScore", "TextWrap")
            local fangzhu = GetComponentWithPath(playerGo, "Image", ComponentTypeName.Transform).gameObject
            -- 玩家头像
            local spritePlayerIcon = GetComponentWithPath(playerGo, "Mask/SpritePlayerIcon", ComponentTypeName.Image);

            spritePlayerIcon.sprite = nil ---清空头像
            local onDownLoadIcon = function(sprite) ---获取玩家头像回调玩家头像
                if sprite ~= nil then
                    spritePlayerIcon.sprite = sprite;
                end
            end
            -- 下载头像
            local headImg = players[i].headImg
            self:image_load_sprite(nil, headImg, onDownLoadIcon,function ()
                print("获取头像失败，重试第一次")
                self:image_load_sprite(nil, headImg, onDownLoadIcon,function()
                    print("获取头像失败，重试第二次")
                    self:image_load_sprite(nil, headImg, onDownLoadIcon)
                end)
            end);

            if players[i].playerScore >= 0 then
                textWrapRedScore.atlas = redAtlas
            else
                textWrapRedScore.atlas = greenAtlas or redAtlas
            end

            if fangzhu then
                fangzhu:SetActive(data.creatorId and data.creatorId == players[i].userId)
            end

            textPlayerName.text = Util.filterPlayerName(players[i].playerName, 10)
            if tonumber(players[i].userId) == tonumber(self.modelData.roleData.userID) then
                textPlayerName.color = Color.New(177 / 255, 58 / 255, 31 / 255, 1)
            end
            local score = players[i].playerScore
            self:DealRatio(players[i])
            if players[i].ratio and 1 ~= players[i].ratio then ---处理积分系数，现阶段只有黄石晃晃
                score = players[i].playerScore * players[i].ratio
            end
            if (score > 0) then
                textWrapRedScore.text = "+" .. score
            else
                textWrapRedScore.text = tostring(score)
            end
        else
            ComponentUtil.SafeSetActive(playerGo, false)
        end
    end
end

function HistoryListView:DealRatio(player)
    if AppData.Game_Name == "XXZP" or AppData.Game_Name == "LDZP" then
        player.ratio = 0.001
    end
end


return HistoryListView