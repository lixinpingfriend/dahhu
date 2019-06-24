
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================
local BranchPackageName = AppData.BranchRunfastName
local TableResultView = Class('tableResultView', View)
local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath

function TableResultView:initialize(...)
    View.initialize(self, BranchPackageName .. "/module/tableresult/runfast_windowtableresult.prefab", "Runfast_WindowTableResult", 1)
    self.buttonBack = GetComponentWithPath(self.root, "Center/Buttons/ButtonBack", ComponentTypeName.Button)
    self.buttonShare = GetComponentWithPath(self.root, "Center/Buttons/ButtonShare", ComponentTypeName.Button)
    self.buttonXianLiaoShare = GetComponentWithPath(self.root, "Center/Buttons/ButtonXianLiaoShare", ComponentTypeName.Button)
    self.textRoomNum = GetComponentWithPath(self.root, "Title/TextRoomNum", ComponentTypeName.Text)
    self.textPlayInfo = GetComponentWithPath(self.root, "Title/TextPlayInfo", ComponentTypeName.Text)
    self.TextRoundNum = GetComponentWithPath(self.root, "Title/TextPlayInfo/TextRoundNum", ComponentTypeName.Text)
    self.textTime = GetComponentWithPath(self.root, "Title/TimeNum", ComponentTypeName.Text)
    self.goPlayersRoot = GetComponentWithPath(self.root, "Center/Players", ComponentTypeName.Transform).gameObject
    self.prefabItem = GetComponentWithPath(self.root, "Holder/Item", ComponentTypeName.Transform).gameObject
    ModuleCache.ComponentUtil.SafeSetActive(self.prefabItem, false)
    self.DissolveRoomInfoRoot = GetComponentWithPath(self.root, "Center/DissolveRoomInfo", ComponentTypeName.Transform).gameObject
    self:SetDissolveRoomInfoState()
    self.DissolveRoomInfoText = GetComponentWithPath(self.root, "Center/DissolveRoomInfo/Name", ComponentTypeName.Text)

    self.btnSelectText = GetComponentWithPath(self.root,"Center/SelectTextShare/SelectTextBtn", ComponentTypeName.Button)
    self.selectTextGou = GetComponentWithPath(self.root,"Center/SelectTextShare/SelectTextGou", ComponentTypeName.Transform).gameObject
    self.btnSelectShareObj  = GetComponentWithPath(self.root,"Center/SelectTextShare", ComponentTypeName.Transform).gameObject
end

function TableResultView:on_view_init()
end

function TableResultView:refreshRoomInfo(modelData)
    self.tableData = modelData.curTableData;

    -- 房间号
    self.textRoomNum.text = "房号:" .. self.tableData.roomInfo.roomNum;
    -- 局数
    self.TextRoundNum.text = string.format("第%d/%d局", self.tableData.roomInfo.curRoundNum, self.tableData.roomInfo.totalRoundCount);
    -- 玩法类型
    local gameType = self.tableData.roomInfo.createRoomRule.game_type;
    -- 玩法信息
    self.textPlayInfo.text = self.tableData.roomInfo.CurTip
    -- 结束时间
    self.textTime.text = os.date("%Y/%m/%d %H:%M", self.tableData.roomInfo.curAccountData.endTime);

    self.isGoldSettle = self.tableData.roomInfo.isGoldSettle
    print("==self.isJinBiChang=",tostring(self.isJinBiChang))
    print("==self.isGoldSettle=",tostring(self.isGoldSettle))

    self.endTime = self.tableData.roomInfo.curAccountData.endTime
    self.roomNum = self.tableData.roomInfo.roomNum
end

function TableResultView:init_view(playerResultList, maxScore, modelData)
    self.playerResultList = playerResultList
    local count = #playerResultList
    for i = 1, count do
        local playerResult = playerResultList[i]
        local item = ModuleCache.ComponentUtil.InstantiateLocal(self.prefabItem, self.goPlayersRoot)
        item.name = "player" .. i
        item:SetActive(true)
        if (maxScore > 0 and maxScore == playerResult.score) then
            playerResult.isWinner = true
        end
        self:fillItem(item, playerResult, modelData)
    end
    self.free_sponsor = modelData.curTableData.roomInfo.curAccountData.free_sponsor
    ModuleCache.ShareManager().share_room_result_text(self:get_result_share_data(playerResultList))
end

function TableResultView:fillItem(item, playerResult, modelData)

    local textUid = GetComponentWithPath(item, "Role/ID/TextID", ComponentTypeName.Text)
    local textName = GetComponentWithPath(item, "Role/Name/TextName", ComponentTypeName.Text)
    local player = playerResult.player
    textUid.text = "ID:" .. player.uid
    textName.text = Util.filterPlayerName(player.nickname)
    local free_sponsor = modelData.curTableData.roomInfo.curAccountData.free_sponsor
    if(free_sponsor and free_sponsor == tonumber(player.uid)) then
        self:SetDissolveRoomInfoState(player.nickname)
        local ImageJieSan = GetComponentWithPath(item, "Role/ImageJieSan", ComponentTypeName.Image)
        ModuleCache.ComponentUtil.SafeSetActive(ImageJieSan.gameObject, true)
    end
    local headImage = GetComponentWithPath(item, "Role/Avatar/Avatar/Image", ComponentTypeName.Image)
    GetComponentWithPath(item, "WinTimes/value", ComponentTypeName.Text).text = playerResult.win_cnt .. ""
    GetComponentWithPath(item, "LoseTimes/value", ComponentTypeName.Text).text = playerResult.lost_cnt .. ""
    GetComponentWithPath(item, "ZaDanTimes/value", ComponentTypeName.Text).text = playerResult.bomb_cnt .. ""

    local imageRoomCreator = GetComponentWithPath(item, "Role/ImageRoomCreator", ComponentTypeName.Image)
    local imageWinner = GetComponentWithPath(item, "Role/ImageWinner", ComponentTypeName.Image)
    ModuleCache.ComponentUtil.SafeSetActive(imageRoomCreator.gameObject, player.seatInfo.isCreator)
    ModuleCache.ComponentUtil.SafeSetActive(imageWinner.gameObject, playerResult.isWinner)

    local myID = modelData.curTableData.roomInfo.mySeatInfo.playerId;

    -- 玩家自己背景图
    local spriteRoomCreatorBg = GetComponentWithPath(item, "bg", ComponentTypeName.Image);
    local color = spriteRoomCreatorBg.color;

    -- 判断是否为自己,玩家自己的背景高亮
    if tonumber(playerResult.player_id) == tonumber(myID) then
        spriteRoomCreatorBg.color = Color.New(color.r, color.g, color.b, 1);
    else
        spriteRoomCreatorBg.color = Color.New(color.r, color.g, color.b, 0.5);
    end

    local TotalScoreRoot = GetComponentWithPath(item, "TotalScore", ComponentTypeName.Transform).gameObject
    local CoinRoot = GetComponentWithPath(item, "CoinRoot", ComponentTypeName.Transform).gameObject
    local isGoldSettle = self.isGoldSettle
    ModuleCache.ComponentUtil.SafeSetActive(CoinRoot.gameObject, isGoldSettle)
    ModuleCache.ComponentUtil.SafeSetActive(TotalScoreRoot.gameObject, not isGoldSettle)
    --金币结算
    if(isGoldSettle) then
        local RedBag = GetComponentWithPath(item, "CoinRoot/RedBag", ComponentTypeName.Transform).gameObject
        if(playerResult.restCoin and playerResult.restCoin ~= 0) then--红包
            ModuleCache.ComponentUtil.SafeSetActive(RedBag.gameObject, true)
            GetComponentWithPath(item, "CoinRoot/RedBag/Text", ComponentTypeName.Text).text = self:GetColorText(playerResult.restCoin/100)
        else
            ModuleCache.ComponentUtil.SafeSetActive(RedBag.gameObject, false)
        end
        GetComponentWithPath(item, "CoinRoot/Coin/Text", ComponentTypeName.Text).text = self:GetColorText(playerResult.coin)
    else--积分结算
        if (playerResult.score >= 0) then
            GetComponentWithPath(item, "TotalScore/redScore", "TextWrap").text = "+" .. tostring(playerResult.score)
        else
            GetComponentWithPath(item, "TotalScore/greenScore", "TextWrap").text = tostring(playerResult.score)
        end
    end

    if (player.headImg and player.headImg ~= "") then
        self:image_load_sprite(headImage, player.headImg, function(headsprite)
            -- body
        end )
    end
end

function TableResultView:getPlayerInfo(playerId, textName, imageHead, textUID)
end


function TableResultView:SetDissolveRoomInfoState(_playerName)
    ModuleCache.ComponentUtil.SafeSetActive(self.DissolveRoomInfoRoot.gameObject,false)
    --print("--设置解散房间的信息")
    --if(_playerName) then
    --    ModuleCache.ComponentUtil.SafeSetActive(self.DissolveRoomInfoRoot.gameObject,true)
    --    self.DissolveRoomInfoText.text = Util.filterPlayerName(_playerName)
    --else
    --    ModuleCache.ComponentUtil.SafeSetActive(self.DissolveRoomInfoRoot.gameObject,false)
    --end
end

function TableResultView:GetColorText(count)
    if(count == nil) then
        count = 0
        print("====count == nil")
    end
    local countStr = Util.filterPlayerGoldNum(count)
    if(count >= 0) then
        return "<color=#E20C0C>".. "+" .. countStr .."</color>"
    else
        return "<color=#02C714>" .. countStr .."</color>"
    end
end


function TableResultView:get_result_share_data(list)
    list = list or self.playerResultList
    local resultData = {
        roomID = self.roomNum,
        hallID = self.modelData.roleData.HallID,
    }
    if(self.endTime)then
        resultData.endTime = os.date("%Y/%m/%d %H:%M:%S", self.endTime)
    end
    local playerDatas = {}
    local count = #list
    for i=1,count do
        local playerResult = list[i]
        local tmp = {
            playerResult.player.nickname,
            playerResult.score,
        }
        table.insert(playerDatas,tmp)
        if(self.free_sponsor and self.free_sponsor == tonumber(playerResult.player.uid))then
            resultData.dissRoomPlayName = playerResult.player.nickname
        end
    end
    resultData.playerDatas = playerDatas

    local Rule = self.tableData.roomInfo.createRoomRule
    resultData.payType = Rule.payType
    resultData.roundCount = Rule.roundCount
    resultData.curRound = self.tableData.roomInfo.curRoundNum
    --print("====resultData.payType=",resultData.payType)
    --print("===============分享数据")
    --print_table(resultData)


    return resultData
end


--显示选中文字分享
function TableResultView:showShareText(isShareText)
    self.selectTextGou:SetActive(isShareText)
end

return TableResultView