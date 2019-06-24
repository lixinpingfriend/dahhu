local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.roomtype.table_type_common')
---@class TableTypeGold:TableTypeCommon
---@field view TableCommonView
local TableTypeGold = class('tableTypeGold', Base)
local ModuleCache = ModuleCache
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local ComponentTypeName = ModuleCache.ComponentTypeName
local Vector3 = Vector3
local ModuleCache = ModuleCache
local Util = Util
local TableManager = TableManager
local ComponentUtil = ModuleCache.ComponentUtil

local MatchingManager = require("package.public.matching_manager")

---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')
---@type Mj2D
local Mj2D = require('package.majiang.module.tablenew.mj.mj2d')
local TableUtil = TableUtil


function TableTypeGold:on_initialize()
    ---金币场相关控件
    self.goldModeTopLeft = GetComponentWithPath(self.root, "TopLeft/Child/GoldMode", ComponentTypeName.Transform).gameObject
    self.gEixtBtn = GetComponentWithPath(self.root, "TopLeft/Child/GoldMode/GEixtBtn", ComponentTypeName.Transform).gameObject
    self.gRuleBtn = GetComponentWithPath(self.root, "TopLeft/Child/GoldMode/GRuleBtn", ComponentTypeName.Transform).gameObject
    self.gChangeBtn = GetComponentWithPath(self.root, "Bottom/Child/InviteAndExit/ButtonChange", ComponentTypeName.Transform).gameObject
    self.changeInvalidTag = GetComponentWithPath(self.root, "Bottom/Child/InviteAndExit/ButtonChange/ChangeInvalidTag", ComponentTypeName.Transform).gameObject
    self.dizhuObj = GetComponentWithPath(self.view.gameController, "DiZhu", ComponentTypeName.Transform).gameObject
    self.dizhuTxet = GetComponentWithPath(self.view.gameController, "DiZhu/Text", ComponentTypeName.Text)
    self.noIntrustbtn =  GetComponentWithPath(self.root, "Bottom1/Child/ButtonNoIntrust", ComponentTypeName.Transform).gameObject
    self.coinMatchCountdownObj =  GetComponentWithPath(self.root,"Center/Child/CoinMatchCountdown", ComponentTypeName.Transform).gameObject
    self.coinMatchCountdownTextWrap=  GetComponentWithPath(self.root,"Center/Child/CoinMatchCountdown/Image/Image",  "TextWrap")
    self.addGold = GetComponentWithPath(self.root, "Left/Child/ButtonAddGold", ComponentTypeName.Transform).gameObject
    self.changeInvalidTag:SetActive(false)
    self.view.jushuObj:SetActive(false)
    self.dizhuObj:SetActive(true)
    self.gChangeBtn:SetActive(false)
    self.view.buttonMic.gameObject:SetActive(false)

    self:display_opening_ani(nil)
end

function TableTypeGold:can_kick(seatID, seatHolder)
    return false
end

function TableTypeGold:show_me_ready()
    self.view.buttonInvite:SetActive(false)
    self.view.buttonExit:SetActive(false)
    --self.gChangeBtn:SetActive(false)
    self.gChangeBtn.transform.anchoredPosition = Vector3.New(0, self.gChangeBtn.transform.anchoredPosition.y, 0)
end

function TableTypeGold:show_me_not_ready(readyData)
    self.view.buttonInvite:SetActive(false)
    self.view.buttonExit:SetActive(false)
    --self.gChangeBtn:SetActive(true)
    --self.gChangeBtn.transform.anchoredPosition = Vector3.New(-200, self.view.buttonBegin.transform.anchoredPosition.y, 0)
    --self.view.buttonBegin.transform.anchoredPosition = Vector3.New(200, self.view.buttonBegin.transform.anchoredPosition.y, 0)
    if(readyData.RestTime and readyData.RestTime > 0) then
        self.view:show_ready_time_down(readyData.RestTime)
    end
end

--- 所有人都准备的显示
function TableTypeGold:update_ready_end(allReady,userState)
    self.goldModeTopLeft:SetActive(false)
    self.view.beginTopLeft:SetActive(false)
    self.view.readyTopLeft:SetActive(false)
    self.view.textRoomNum2.gameObject:SetActive(false)
    for i=1,#self.view.seatHolderArray do
        ---@types SeatHolder2D
        local seatHolder = self.view.seatHolderArray[i]
        seatHolder:show_ready(false)
    end
    self.view.textRoomNum2.gameObject:SetActive(false)
end

--- 显示局数
function TableTypeGold:show_round(gameState)
    if gameState then
        self.dizhuTxet.text = "底分:"..tostring(gameState.BaseCoinScore)
        if gameState.FeeNum and 0 ~= gameState.FeeNum then
            --local text = "本局服务费"..gameState.FeeNum.."金币"
            --ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(text)
        end    
    else
        self.view.gameController:SetActive(false)
    end
end

--- 显示分数
function TableTypeGold:show_score(playerState, localSeat, serverSeat)
    local gameState = self.view.gameState
    ---@type SeatHolder2D
    local seatHolder = self.view.seatHolderArray[localSeat]
    seatHolder:show_gold_balance(Util.filterPlayerGoldNum(playerState.Balance)) ---金币场剩余金币
    if(gameState.ScoreSettle) then
        for i=1,#gameState.ScoreSettle do
            local scoresettle = gameState.ScoreSettle[i]
            if scoresettle.SeatID == seatHolder.serverSeat then
                seatHolder:play_score_change_text(scoresettle.ActualAmount)
                break
            end
        end
    end
end

--- 显示托管
function TableTypeGold:show_instrust(playerState, localSeat)
    local gameState = self.view.gameState
    if(self.view:is_me(localSeat)) then
        self.noIntrustbtn:SetActive(playerState.IntrustState == 1)
        if #gameState.MaiMa > 0 then
            self.noIntrustbtn:SetActive(false) ---买马不显示取消托管按钮
        end
    end
end

---开始设置玩家状态（gameState）
function TableTypeGold:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
    if self.view.gold_table_show_score then
        self.view:gold_table_show_score(playerState, localSeat, serverSeat)
    else
        self:show_score(playerState, localSeat, serverSeat)
    end
    self:show_instrust(playerState, localSeat)
end

--- 显示准备时的错误信息
function TableTypeGold:show_ready_error(data,module)
    if data.ErrCode == -888 then
		module:dispatch_module_event("roomsetting", "Event_RoomSetting_ExitRoom")
        local goldid = module.modelData.tableCommonData.goldFildId
        MatchingManager:gold_jump(goldid,function ()
            TableManager.curTableData.goldRoomExitTag = true ---金币场退出标记
			--module:dispatch_module_event("roomsetting", "Event_RoomSetting_ExitRoom")
            module:exit_room(nil,true)
        end)
    end
    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.ErrInfo)
end

--- 玩家离开座位
function TableTypeGold:player_leave_seat(seatHolder)
    if(not self.view.gameState) then
        seatHolder:show_gold_balance()
    end
    seatHolder.buttonNotSeatDown:SetActive(false)
end

--- 玩家在座位上
function TableTypeGold:player_on_seat(seatHolder, data)
    if(not self.view.gameState) then
        seatHolder:set_score("")
        seatHolder:show_gold_balance(Util.filterPlayerGoldNum(data.Balance))
    end
end

--- 游戏未开始时（整个牌局） --- 此时不是所有玩家都准备了
function TableTypeGold:set_game_not_begin_ui(seatHolder)
    seatHolder:set_game_begin_ui()
end

---显示牌桌预览相关操作控件
function TableTypeGold:show_table_presettlement(show)
    self.view.preButtonBegin:SetActive(false)
    self.view.buttonBackToSettle:SetActive(true)

    self.view.preButtonEixt:SetActive(true)
    self.view.preButtonChange:SetActive(false)
    self.view.buttonContinue:SetActive(true)

    self.view.preSettlementObj:SetActive(show)
end

---当牌桌右侧菜单状态变化时
function TableTypeGold:on_right_menu_state_change(state)
    Base.on_right_menu_state_change(self,state)
    self.view.rbuttonExit.gameObject:SetActive(true)
    self.view.rbuttonExitText.text = "退出"
end

---进入拦牌状态
function TableTypeGold:on_game_state_wait_action()
    Base.on_game_state_wait_action(self)
    self.view.timeDown:SetActive(true)
    self.view.waitObj:SetActive(false)
    self.view.playType:show_time_down()
end

---当现实结算时
function TableTypeGold:on_show_one_game_result(gameState)
    if self.view.ConfigData.goldResultType then
        local initData = {}
        initData.gameState = gameState
        initData.comType = self.view.ConfigData.goldResultType
        ModuleCache.ModuleManager.show_module("majiang", "goldgameresult", initData)
    else
        Base.on_show_one_game_result(self,gameState)
    end
end

---刷新3D模式推荐按钮状态
function TableTypeGold:on_refresh_goto3d_button_state()
    ComponentUtil.SafeSetActive(self.view.buttonGoTo3d,false)
    ComponentUtil.SafeSetActive(self.view.maskGoTo3d,false)
end

function TableTypeGold:display_opening_ani(userState)
    local playerInfos = nil
    if userState then
        local players = {}
        for i=1,#userState.State do
            local player = {}
            player.UserID = tonumber(userState.State[i].UserID)
            player.SeatID = i - 1
            table.insert(players,player)
        end
        playerInfos =  players
    else
        ---@type OpeningModule
        local opening = require("package.majiang.module.opening.opening_module")
        playerInfos = opening:get_last_refresh_player_infos()
        opening:clear_last_refresh_player_infos()
    end
    if playerInfos then
        if 2 <= #playerInfos and #playerInfos <= 4 then
            ModuleCache.ModuleManager.show_module("majiang","opening",{
                players = playerInfos,
                aniStep = 2,
            })        
        end
    end
end


function TableTypeGold:on_click(obj, arg)
    if self.goldHuGridButton and obj == self.goldHuGridButton then
        self.tingHuInfosParent:SetActive(not self.tingHuInfosParent.activeSelf)
    else
        Base.on_click(obj, arg)
    end
end 

function TableTypeGold:init_gold_room_ting_hu_info_panel()
    if not self.tingHuInfoPanel then
        local s1 = "majiang/module/table/tinghuinfo.prefab"
        local s2 = "TingHuInfo"
        self.tingHuInfoPanel = ModuleCache.ViewUtil.InitGameObject(s1, s2,self.root)
        self.tingHuInfosParent = GetComponentWithPath(self.tingHuInfoPanel,"Bg", ComponentTypeName.Transform).gameObject
        self.tingHuInfoHolders = {}
        self.tinghuInfoTemplate = GetComponentWithPath(self.tingHuInfoPanel,"TingHuInfoTemplate", ComponentTypeName.Transform).gameObject
        self.tingHuInfoGridLayoutGroup = GetComponentWithPath(self.tingHuInfoPanel,"Bg",ComponentTypeName.GridLayoutGroup)
        self.tingHuInfoPanel.transform:SetSiblingIndex(self.view.preSettlementObj.transform:GetSiblingIndex())
        self.goldHuGridButton = GetComponentWithPath(self.tingHuInfoPanel,"Button_GoldHuGrid", ComponentTypeName.Transform).gameObject
        local gameEventCollector = ModuleCache.ComponentManager.GetComponent(self.tingHuInfoPanel, "UGUIExtend.GameEventCollector")
        if self.view.is3DTable then
            gameEventCollector.packageName = "majiang3d"
            gameEventCollector.moduleName = "table3d"
        else
            gameEventCollector.packageName = "majiang"
            gameEventCollector.moduleName = "tablenew"
        end
    end
end

function TableTypeGold:init_ting_hu_info_holder(gameObject)
    local holder = {}
    holder.gameObject = gameObject
    holder.gameObject.transform.parent = self.tingHuInfosParent.transform
    holder.gameObject.transform.localScale = Vector3.one
    holder.mj = GetComponentWithPath(gameObject,"Bg/MJ", ComponentTypeName.Transform).gameObject
    holder.leftNumObj = GetComponentWithPath(gameObject,"Bg/LeftNum", ComponentTypeName.Transform).gameObject
    holder.leftNumText = GetComponentWithPath(gameObject,"Bg/LeftNum/Text", ComponentTypeName.Text)
    holder.beiShuObj = GetComponentWithPath(gameObject,"Bg/BeiShu", ComponentTypeName.Transform).gameObject
    holder.beiShuText = GetComponentWithPath(gameObject,"Bg/BeiShu/Text", ComponentTypeName.Text)
    holder.jianZiHuTag = GetComponentWithPath(gameObject,"Bg/JianZiHu", ComponentTypeName.Transform).gameObject
    holder.jianZiHuImage = GetComponentWithPath(gameObject,"Bg/JianZiHu", ComponentTypeName.Image)
    holder.jianZiHuSpriteHolder = GetComponentWithPath(gameObject,"Bg/JianZiHu","SpriteHolder")
    table.insert(self.tingHuInfoHolders,holder)
    return holder
end

function TableTypeGold:clear_ting_hu_holder(holder)
    holder.leftNumText.text = ""
    holder.leftNumObj:SetActive(false)
    holder.beiShuText.text = ""
    holder.beiShuObj:SetActive(false)
    holder.jianZiHuTag:SetActive(false)
    holder.gameObject:SetActive(false)
end

function TableTypeGold:show_ting_hu_info()
    if not self.tingHuInfoPanel then
        return
    end
    local maxCount = self.tingHuInfosParent.transform.childCount
    if maxCount > 6 then
        maxCount = 6
    end
    self.tingHuInfoGridLayoutGroup.constraintCount = maxCount
    self.tingHuInfoPanel:SetActive(true)
end

function TableTypeGold:clear_ting_hu_info()
    if not self.tingHuInfoPanel then
        return
    end
    for i=1,#self.tingHuInfoHolders do
        local holder = self.tingHuInfoHolders[i]
        self:clear_ting_hu_holder(holder)
    end
    self.tingHuInfoPanel:SetActive(false)
end

function TableTypeGold:add_ting_hu_info(pai,leftnum,beishu,isJianZiHu)
    isJianZiHu = isJianZiHu or false
    local newholder = nil
    for i=1,#self.tingHuInfoHolders do
        local holder = self.tingHuInfoHolders[i]
        if not holder.gameObject.activeSelf then
            newholder = holder
            break
        end
    end
    if not newholder then
        newholder = self:init_ting_hu_info_holder(self.tinghuInfoTemplate)
    end
    if leftnum then
        newholder.leftNumObj:SetActive(true)
        newholder.leftNumText.text = tostring(leftnum)
    end
    if beishu then
        newholder.beiShuObj:SetActive(true)
        newholder.beiShuText.text = tostring(beishu)
    end
    if isJianZiHu then
        newholder.jianZiHuTag:SetActive(true)
        self.view:set_jianzihu(newholder.jianZiHuImage,newholder.jianZiHuSpriteHolder)
        newholder.mj:SetActive(false)
    else
        newholder.jianZiHuTag:SetActive(false)
        newholder.mj:SetActive(true)
        ---@type Mj2D
        local mj = Mj2D:new(pai, self.tingGrid, 
        {
            gameObject = newholder.mj,
            spriteHolder = self.view.frontSpriteH
        })
        mj:set_skin(self.view.mjColorSet, self.view.mjScaleSet)
        MjManager.insert(mj, MjManager.mjType.custom) 
    end
    newholder.gameObject:SetActive(true)
end

function TableTypeGold:on_show_ting_hu_grid(pai)
    if true then
        return
    end
    self.view.tingGridParent:SetActive(false)
    self.view.huGridParent:SetActive(false)
    self.view.tingGridCtrlButtou:SetActive(false)
    self.view.huGridCtrlButtou:SetActive(false)
    if not self.tingHuInfoPanel then
        self:init_gold_room_ting_hu_info_panel()
    end
    if(#self.view.gameState.KeLiang > 0) then
        self:clear_ting_hu_info()
        local isShowTing = self.view:getIsShowTingSetting()
        local haveTing = false
        for i=1,#self.view.gameState.KeLiang[1].KeChu do
            if(pai == self.view.gameState.KeLiang[1].KeChu[i].ChuPai) then
                self.view.tingPaiNum = #self.view.gameState.KeLiang[1].KeChu[i].TingPai
                if(self.view:show_jianzihu(self.view.tingPaiNum)) then
                    self:add_ting_hu_info(nil,nil,nil,true)
                else
                    for j=1,#self.view.gameState.KeLiang[1].KeChu[i].TingPai do
                        local setPai = self.view.gameState.KeLiang[1].KeChu[i].TingPai[j]
                        haveTing = true
                        local remainCount = 4 - self.view.allCard[setPai]
                        remainCount = remainCount >= 0 and remainCount or 0
                        self:add_ting_hu_info(setPai,remainCount,0,false)
                    end
                end
            end
        end
        if(not haveTing) then
            self:clear_ting_hu_info()
        else
            self:show_ting_hu_info()
            self.tingHuInfosParent:SetActive(true)
        end
    else
        self:clear_ting_hu_info()
    end
end

function TableTypeGold:on_hide_ting_hu_grid()
    if true then
        return
    end
    if not self.tingHuInfoPanel then
        return
    end
    self:clear_ting_hu_info()
end

function TableTypeGold:on_update_hu_list(yiTing, allCard,isShowTing)
    if true then
        return
    end
    self.view.tingGridParent:SetActive(false)
    self.view.huGridParent:SetActive(false)
    self.view.tingGridCtrlButtou:SetActive(false)
    self.view.huGridCtrlButtou:SetActive(false)
    if not self.tingHuInfoPanel then
        self:init_gold_room_ting_hu_info_panel()
    end
    if(not yiTing) then
        return
    end
    local showJianZiHu = self.view:show_jianzihu(#self.view.gameState.YiTing)
    if (not showJianZiHu )and isShowTing then
        self:clear_ting_hu_info()
        local hasYiTing = false
        for i=1,#self.view.gameState.YiTing do
            local setPai = self.view.gameState.YiTing[i]
            local remainCount = 4 - allCard[setPai]
            remainCount = remainCount >= 0 and remainCount or 0
            self:add_ting_hu_info(setPai,remainCount,0,false)
            hasYiTing = true
        end
        if hasYiTing then
            self:show_ting_hu_info()
        end
    elseif showJianZiHu and isShowTing then
        self:add_ting_hu_info(nil,nil,nil,true)
        self:show_ting_hu_info()
    end
end

return TableTypeGold