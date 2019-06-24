
local class = require("lib.middleclass")
local ViewBase = require('package.majiang.module.tablebase.tablebase_view')
--- @class TableMJView
local TableView = class('tableView', ViewBase)
local UnityEngine = UnityEngine
local Color = UnityEngine.Color
local Util = Util
local TableManager = TableManager
local Vector3 = Vector3
local Vector2 = Vector2
local math = math
local TableUtil = TableUtil
local ModuleCache = ModuleCache
local AppData = AppData
local Config = Config
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local CSmartTimer = ModuleCache.SmartTimer.instance
local PlayerPrefs = UnityEngine.PlayerPrefs
local coroutine = require("coroutine")
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')
---@type Mj2D
local Mj2D = require('package.majiang.module.tablenew.mj.mj2d')
local selectCardXOffset = 80
local selectCardYOffset = 135

local TextureScaler

--- 初始化
function TableView:initialize(...)
    self:on_initialize("majiang/module/table/henanmj_table.prefab", "HeNanMJ_Table", 0)
    self:init_config()
    self:init_ui()
    self:init_play_mode()
    self:on_init(self.maxMjNum)
end

--- 配置初始化
function TableView:init_config()

    self.paiName = 
    {
        [1] = "一条",
        [2] = "二条",
        [3] = "三条",
        [4] = "四条",
        [5] = "五条",
        [6] = "六条",
        [7] = "七条",
        [8] = "八条",
        [9] = "九条",

        [10] = "一万",
        [11] = "二万",
        [12] = "三万",
        [13] = "四万",
        [14] = "五万",
        [15] = "六万",
        [16] = "七万",
        [17] = "八万",
        [18] = "九万",

        [19] = "一筒",
        [20] = "二筒",
        [21] = "三筒",
        [22] = "四筒",
        [23] = "五筒",
        [24] = "六筒",
        [25] = "七筒",
        [26] = "八筒",
        [27] = "九筒",

        [28] = "东风",
        [29] = "南风",
        [30] = "西风",
        [31] = "北风",
        [32] = "红中",
        [33] = "发财",
        [34] = "白板",

        [35] = "春",
        [36] = "夏",
        [37] = "秋",
        [38] = "冬",
        
        [39] = "梅",
        [40] = "兰",
        [41] = "竹",
        [42] = "菊",
    }

    self.actions =
    {
        chi = 1,
        peng = 2,
        mingGang = 3,
        anGang = 4,
        dianGang = 5,
        hu = 6,
        ting = 7,
        out = 8,
        autoOut = 9,
        get = 10,
        kaigang = 11,
        pass = 12,
        zimo = 31,
        dianPao = 33,
    }
    self.actionSounds =
    {
        ["1"] = {"chi1"},
        ["2"] = {"peng1"},
        ["3"] = {"gang1"},
        ["4"] = {"gang1"},
        ["5"] = {"gang1"},
        ["6"] = {"dianpao1"},
        ["7"] = {"ting"},
        ["31"] = {"zimo1"},
        ["33"] = {"dianpao1"},
    }
    self.mjSounds =
    {
        "mjt3_1",
        "mjt3_2",
        "mjt3_3",
        "mjt3_4",
        "mjt3_5",
        "mjt3_6",
        "mjt3_7",
        "mjt3_8",
        "mjt3_9",
        "mjt1_1",
        "mjt1_2",
        "mjt1_3",
        "mjt1_4",
        "mjt1_5",
        "mjt1_6",
        "mjt1_7",
        "mjt1_8",
        "mjt1_9",
        "mjt2_1",
        "mjt2_2",
        "mjt2_3",
        "mjt2_4",
        "mjt2_5",
        "mjt2_6",
        "mjt2_7",
        "mjt2_8",
        "mjt2_9",
        "mjt4_1",
        "mjt4_2",
        "mjt4_3",
        "mjt4_4",
        "mjt4_5",
        "mjt4_6",
        "mjt4_7",
    }
    self.totalSeat = 4
    TableManager.seatNumTable = {0,1,2,3}
    self.curTableData = TableManager.curTableData
    self.mySeat = self.curTableData.SeatID
    self.gamerule = self.curTableData.gamerule
    self.ruleJsonInfo = self.curTableData.ruleJsonInfo
    local config = TableManager.curTableData.gameRuleConfig
    local wanfaType = Config.GetWanfaIdx(self.ruleJsonInfo.GameType)
    if(wanfaType > #config.createRoomTable) then
        wanfaType = 1
    end
    self.ConfigData = config.createRoomTable[wanfaType]
    self.maxMjNum = self:get_max_mj_num()
    local isMuseumRoom = self.curTableData.HallID and self.curTableData.HallID > 0
    self.wanfaName,self.ruleName,self.totalSeat = TableUtil.get_rule_name(self.gamerule, isMuseumRoom)
end

function TableView:on_initialize(prefabPath, prefabName, layer)
    ViewBase.initialize(self, prefabPath, prefabName, layer, true)
end

--- 初始化游戏模式
function TableView:init_play_mode()
    ---模式 普通开房 快速组局 比赛场 金币场 金币结算
    if(self.curTableData.RoomType == 2) then
        ---@type TableTypeCommon
        self.roomType = require('package.majiang.module.tablenew.roomtype.table_type_fast'):new(self)
    elseif(self.curTableData.RoomType == 3) then
        self.roomType = require('package.majiang.module.tablenew.roomtype.table_type_match'):new(self)
    elseif(TableManager:cur_game_is_gold_room_type()) then
        self.roomType = require('package.majiang.module.tablenew.roomtype.table_type_gold'):new(self)
    elseif(self.curTableData.ruleJsonInfo.settleType == 1) then
        self.roomType = require('package.majiang.module.tablenew.roomtype.table_type_gold_result'):new(self)
    else
        self.roomType = require('package.majiang.module.tablenew.roomtype.table_type_common'):new(self)
    end
    ---模式 正常 回放
    if(not self.curTableData.isPlayBack) then
        ---@type TableCustom
        self.playType = require('package.majiang.module.tablenew.playtype.table_custom'):new(self)
    else
        self.playType = require('package.majiang.module.tablenew.playtype.table_playback'):new(self)
    end
end

--- 初始化ui
function TableView:init_ui()
    local UIStateSwitcher = ComponentUtil.GetComponent(self.root, "UIStateSwitcher")
    if(ModuleCache.GameManager.iosAppStoreIsCheck)then
        UIStateSwitcher:SwitchState("IosCheck")
    else
        UIStateSwitcher:SwitchState("Normal")
    end
    self.robotBtn = GetComponentWithPath(self.root, "Left/Child/ButtonRobot", ComponentTypeName.Transform).gameObject
    self.robotBtn:SetActive(ModuleCache.GameManager.developmentMode)
    self.widthText = GetComponentWithPath(self.root, "WidthText", ComponentTypeName.Text)
    self.topRightObj = GetComponentWithPath(self.root, "TopRight", ComponentTypeName.Transform).gameObject
    self.topLeftObj = GetComponentWithPath(self.root, "TopLeft", ComponentTypeName.Transform).gameObject
    self.bottomRightObj = GetComponentWithPath(self.root, "BottomRight", ComponentTypeName.Transform).gameObject

    ---功能按钮右侧菜单
    self.buttonRightOpen = GetComponentWithPath(self.topRightObj, "Child/ButtonMenu", ComponentTypeName.Button)
    self.rightMenu = GetComponentWithPath(self.root, "RightMenu", ComponentTypeName.Transform).gameObject
    self.rbuttonExit = GetComponentWithPath(self.rightMenu, "Grid/ButtonExitOnMenu", ComponentTypeName.Button)
    self.rbuttonExitText = GetComponentWithPath(self.rbuttonExit.gameObject, "Text",ComponentTypeName.Text)
    self.buttonSetting = GetComponentWithPath(self.rightMenu, "Grid/ButtonSettings", ComponentTypeName.Button)
    self.buttonWarning = GetComponentWithPath(self.rightMenu, "Grid/ButtonWarning", ComponentTypeName.Button)
    self.button2Dor3DSwitch = GetComponentWithPath(self.rightMenu, "Grid/Button2Dor3DSwitch", ComponentTypeName.Button)
    self.button2Dor3DSwitch.gameObject:SetActive(1 == TableManager:get_cur_majiang_game_open_3d_state());
    self.buttonWarning.gameObject:SetActive(false);
    self.rightMenu:SetActive(false);
    ----------------End

    self.buttonMic = GetComponentWithPath(self.root, "BottomRight/Child/Action/ButtonMic", ComponentTypeName.Button)
    self.buttonChat = GetComponentWithPath(self.root, "BottomLeft/Child/Action/ButtonChat", ComponentTypeName.Button)
    self.textRoomNum1 = GetComponentWithPath(self.root, "TopLeft/Child/Begin/RoomID/ImageBackground/Text", ComponentTypeName.Text)
    self.textWanFa = GetComponentWithPath(self.root, "Center/Child/WanFa", ComponentTypeName.Text)
    self.textRoomNum2 = GetComponentWithPath(self.root, "Center/Child/ButtonRule", ComponentTypeName.Text)
    self.textRoomRule = GetComponentWithPath(self.root, "Top/Child/RoomInfo/Text", ComponentTypeName.Text)
    self.inviteAndExit = GetComponentWithPath(self.root, "Bottom/Child/InviteAndExit", ComponentTypeName.Transform).gameObject
    self.buttonInvite = GetComponentWithPath(self.inviteAndExit, "ButtonInvite", ComponentTypeName.Transform).gameObject
    --self.buttonExit = GetComponentWithPath(self.inviteAndExit, "ButtonExit", ComponentTypeName.Transform).gameObject
    self.buttonExit = GetComponentWithPath(self.root, "TopLeft/Child/Ready/ButtonExit", ComponentTypeName.Transform).gameObject
    self.buttonBegin = GetComponentWithPath(self.inviteAndExit, "ButtonBegin", ComponentTypeName.Transform).gameObject

    self.buttonEarlyStart = GetComponentWithPath(self.inviteAndExit, "ButtonEarlyStart", ComponentTypeName.Transform).gameObject
    self.earlyStartNumText = GetComponentWithPath(self.buttonEarlyStart, "Text", ComponentTypeName.Text)
    self.earlyStartGray =  GetComponentWithPath(self.buttonEarlyStart, "Gray", ComponentTypeName.Transform).gameObject
    self.earlyStartGrayText = GetComponentWithPath(self.earlyStartGray, "Text", ComponentTypeName.Text)

    self.buttonBackHall = GetComponentWithPath(self.inviteAndExit, "ButtonBackHall", ComponentTypeName.Transform).gameObject

    self.beginCountDownObj = GetComponentWithPath(self.buttonBegin, "Count down",ComponentTypeName.Transform).gameObject
    self.beginImgObj = GetComponentWithPath(self.buttonBegin, "Image", ComponentTypeName.Transform).gameObject
    self.buttonBeginCountDownTex = GetComponentWithPath(self.inviteAndExit, "ButtonBegin/Count down/Text", ComponentTypeName.Text)
    self.readyTopLeft = GetComponentWithPath(self.root, "TopLeft/Child/Ready", ComponentTypeName.Transform).gameObject
    self.beginTopLeft = GetComponentWithPath(self.root, "TopLeft/Child/Begin", ComponentTypeName.Transform).gameObject
    self.baoPai = GetComponentWithPath(self.root, "Left/Child/BaoPai", ComponentTypeName.Transform).gameObject
    self.laiGenMJ = GetComponentWithPath(self.baoPai, "Grid/LaiGenMJ", ComponentTypeName.Transform).gameObject
    self.laiGenMJ1 = GetComponentWithPath(self.baoPai, "Grid/LaiGenMJ1", ComponentTypeName.Transform).gameObject
    self.laiZiMJ = GetComponentWithPath(self.baoPai, "Grid/LaiZiMJ", ComponentTypeName.Transform).gameObject
    self.WeiZhang = GetComponentWithPath(self.baoPai, "Grid/WeiZhang", ComponentTypeName.Transform).gameObject
    self.laiGenText = GetComponentWithPath(self.baoPai, "Grid/LaiGenMJ/ImageText", ComponentTypeName.Text)
    self.laiGenText1 = GetComponentWithPath(self.baoPai, "Grid/LaiGenMJ1/ImageText", ComponentTypeName.Text)
    self.laiZiText = GetComponentWithPath(self.baoPai, "Grid/LaiZiMJ/ImageText", ComponentTypeName.Text)
    self.weiZhangText = GetComponentWithPath(self.baoPai, "Grid/WeiZhang/ImageText", ComponentTypeName.Text)
    self.baoPaiMidText = GetComponentWithPath(self.root, "Left/Child/BaoPai/ImageText", ComponentTypeName.Text)
    self.waitAction = GetComponentWithPath(self.root, "Bottom/Child/WaitAction", ComponentTypeName.Transform).gameObject
    self.actionHu = GetComponentWithPath(self.waitAction, "Button_Hu", ComponentTypeName.Transform).gameObject
    self.actionTing = GetComponentWithPath(self.waitAction, "Button_Ting", ComponentTypeName.Transform).gameObject
    self.actionChi = GetComponentWithPath(self.waitAction, "Button_Chi", ComponentTypeName.Transform).gameObject
    self.actionPeng = GetComponentWithPath(self.waitAction, "Button_Peng", ComponentTypeName.Transform).gameObject
    self.actionGang = GetComponentWithPath(self.waitAction, "Button_Gang", ComponentTypeName.Transform).gameObject
    self.actionBuHua = GetComponentWithPath(self.waitAction, "Button_BuHua", ComponentTypeName.Transform).gameObject
    self.actionGuo = GetComponentWithPath(self.root, "Bottom/Child/Button_Guo", ComponentTypeName.Transform).gameObject
    self.sanKouObj = GetComponentWithPath(self.root, "BottomLeft/Child/SanKou", ComponentTypeName.Transform).gameObject
    self.openSanKouObj = GetComponentWithPath(self.root, "BottomLeft/Child/SanKou/Image1", ComponentTypeName.Transform).gameObject
    self.closeSanKouObj = GetComponentWithPath(self.root, "BottomLeft/Child/SanKou/Image2", ComponentTypeName.Transform).gameObject
    self.cloneParent = GetComponentWithPath(self.root, "Clone", ComponentTypeName.Transform).gameObject
    self.cloneSeat = GetComponentWithPath(self.cloneParent, "Seat", ComponentTypeName.Transform).gameObject
    self.grayMat = GetComponentWithPath(self.cloneParent, "GrayMatImage", ComponentTypeName.Image).material
    self.selectCardPanel = GetComponentWithPath(self.root, "Bottom/Child/SelectCardPanel", ComponentTypeName.Transform).gameObject
    self.selectHua = GetComponentWithPath(self.root, "Bottom/Child/SelectHua", ComponentTypeName.Transform).gameObject
    self.diceObj = GetComponentWithPath(self.root, "Dice", ComponentTypeName.Transform).gameObject
    self.diceAni = GetComponentWithPath(self.root, "Dice/Animation", "UIImageAnimation")
    self.diceImage1 = GetComponentWithPath(self.root, "Dice/Image1", ComponentTypeName.Image)
    self.diceImage2 = GetComponentWithPath(self.root, "Dice/Image2", ComponentTypeName.Image)
    self.diceImage1SH = GetComponentWithPath(self.root, "Dice/Image1", "SpriteHolder")
    self.diceImage2SH = GetComponentWithPath(self.root, "Dice/Image2", "SpriteHolder")

    self.tingGridParent = GetComponentWithPath(self.root, "Bottom/Child/TingGrid", ComponentTypeName.Transform).gameObject
    self.tingGrid = GetComponentWithPath(self.tingGridParent, "Grid", ComponentTypeName.Transform).gameObject
    self.tingJianZiHu = GetComponentWithPath(self.tingGridParent, "JianZiHu", ComponentTypeName.Image)
    self.tingJianZiHuSH = GetComponentWithPath(self.tingGridParent, "JianZiHu", "SpriteHolder")
    self.tingGridCtrlButtou = GetComponentWithPath(self.tingGridParent, "Button_HuGrid", ComponentTypeName.Transform).gameObject


    self.huGridParent = GetComponentWithPath(self.root, "Bottom/Child/HuGrid", ComponentTypeName.Transform).gameObject
    self.huGrid = GetComponentWithPath(self.huGridParent, "Grid", ComponentTypeName.Transform).gameObject
    self.jianZiHu = GetComponentWithPath(self.huGridParent, "JianZiHu", ComponentTypeName.Image)
    self.jianZiHuSH = GetComponentWithPath(self.huGridParent, "JianZiHu", "SpriteHolder")
    self.huGridCtrlButtou = GetComponentWithPath(self.huGridParent, "Button_HuGrid", ComponentTypeName.Transform).gameObject

    self:show_begin_button_time_down(false)

    ----牌局结算预览相关
    self.preSettlementObj = GetComponentWithPath(self.root, "PreSettlement", ComponentTypeName.Transform).gameObject
    self.buttonBackToSettle = GetComponentWithPath(self.root, "PreSettlement/Child/ButtonBackToSettle", ComponentTypeName.Transform).gameObject
    self.buttonContinue = GetComponentWithPath(self.root, "PreSettlement/Child/ButtonContinue", ComponentTypeName.Transform).gameObject
    self.preButtonChange = GetComponentWithPath(self.root, "PreSettlement/Child/ButtonChange", ComponentTypeName.Transform).gameObject
    self.preButtonBegin = GetComponentWithPath(self.root, "PreSettlement/Child/ButtonBegin", ComponentTypeName.Transform).gameObject
    self.preButtonEixt = GetComponentWithPath(self.root, "PreSettlement/Child/ButtonEixt", ComponentTypeName.Transform).gameObject
    self.preButtonLookTotal = GetComponentWithPath(self.root, "PreSettlement/Child/ButtonLookTotal", ComponentTypeName.Transform).gameObject
    ---End
    self.anticheatSwitcher = GetComponentWithPath(self.root, "Center/Child",ComponentTypeName.Image)

    ---推荐出牌相关
    self.recommendOutMjParent = GetComponentWithPath(self.root, "BottomRight/Child/RecommmendOutMj", ComponentTypeName.Transform).gameObject
    self:hide_recommend_out_mj()
    ---End

    ---玩家等待状态标记
    self.playerWaitStateParent = GetComponentWithPath(self.root, "WaitStateTags", ComponentTypeName.Transform).gameObject
    self.playerWaitStateTags = {}
    for i=1,4 do
        local tagTable = {}
        tagTable.root =  GetComponentWithPath(self.playerWaitStateParent,tostring(i), ComponentTypeName.Transform).gameObject
        tagTable.tags = TableUtil.get_all_child(tagTable.root)  ---暂留字段，鬼知道以后要添加什么其他waitStaterefresh_table_bgTag，现在只有等待操作这一个Tag
        table.insert(self.playerWaitStateTags,tagTable)
    end
    ---End

    ---牌桌中央提示相关
    self.cnenterTipsObj = GetComponentWithPath(self.root, "Center/Child/TableTips", ComponentTypeName.Transform).gameObject
    self.cnenterTipsText = GetComponentWithPath(self.root, "Center/Child/TableTips/Text", ComponentTypeName.Text)
    self.cnenterTipsObj:SetActive(false)
    ---End

    ---未开局规则提示相关
    self.ruleTitelObj = GetComponentWithPath(self.root,"TopRight/Child/RuleTitel", ComponentTypeName.Transform).gameObject
    self.ruleTitelObj:SetActive(false)
    self.ruleTtitelText = GetComponentWithPath(self.root,"TopRight/Child/RuleTitel/Bg/Text", ComponentTypeName.Text)
    self.ruleTitelVerticalLayoutGroup = GetComponentWithPath(self.root,"TopRight/Child/RuleTitel/Bg","UnityEngine.UI.VerticalLayoutGroup")
    ---End

	--self:InstantiateGameObjectAsync(ModuleCache.ComponentManager.Find(self.root, "BCS/ButtonBCS"), "publictable/effect/baicaishen/prefab/table_buttonbcs.prefab", "Table_ButtonBCS")
	local Manager = require("package.public.module.function_manager")
	self:fixed_tran_size(Manager.FindObject(self.root, "Left"))
	self:fixed_tran_size(Manager.FindObject(self.root, "Right"))
	self:fixed_tran_size(Manager.FindObject(self.root, "BottomRight"))
	self:fixed_tran_size(Manager.FindObject(self.root, "BottomLeft"))
	self:fixed_tran_size(Manager.FindObject(self.root, "TopRight"))
	self:fixed_tran_size(Manager.FindObject(self.root, "TopLeft"))
	self:fixed_tran_size(Manager.FindObject(self.root, "RightMenu"))
end

function TableView:show_table_center_tips(text,time)
    self:close_center_tips()
    self.cnenterTipsObj:SetActive(true)
    self.cnenterTipsText.text = text
    if time then
        self.tableTipsTimerId = self:subscibe_time_event(time, false, 1):OnComplete(function(t)
            self:close_center_tips()
        end).id    
    end 
end

function TableView:close_center_tips()
    if self.tableTipsTimerId then
        CSmartTimer:Kill(self.tableTipsTimerId)
    end
    self.cnenterTipsObj:SetActive(false)
    self.cnenterTipsText.text = ""
    self.tableTipsTimerId = nil
end

---显示玩家拓展状态信息，在通用逻辑中不会调用，哪个玩法需要，自己重载和调用，这里只做最基础的资源加载
function TableView:show_player_ex_state()
    if not self.PlayerExStatePanel then
        local s1 = "majiang/module/table/playerexstate.prefab"
        local s2 = "PlayerExState"
        self.PlayerExStatePanel = ModuleCache.ViewUtil.InitGameObject(s1, s2,self.root)
        local Players = GetComponentWithPath(self.PlayerExStatePanel,"Players", ComponentTypeName.Transform).gameObject
        self.PlayerExStateHolders = {}
        local objs = TableUtil.get_all_child(Players)
        for i=1,#objs do
            local obj = objs[i]
            local holder = {}
            holder.root = obj
            holder.bgObj = GetComponentWithPath(obj,"Bg",ComponentTypeName.Transform).gameObject
            holder.bgImage = GetComponentWithPath(obj,"Bg",ComponentTypeName.Image)
            holder.stateTags = TableUtil.get_all_child(holder.bgObj)
            holder.hideTag = function (this)
                for i=1,#this.stateTags do
                    local tagObj = this.stateTags[i]
                    tagObj:SetActive(false)
                end
                this.bgObj:SetActive(false)
            end
            holder:hideTag()
            holder.showTag = function (this,name)
                local hasTag = false
                for i=1,#this.stateTags do
                    local tagObj = this.stateTags[i]
                    if tagObj.name == name then
                        tagObj:SetActive(true)
                        hasTag = true
                    else
                        tagObj:SetActive(false)
                    end
                end
                this.bgObj:SetActive(hasTag)
            end
            table.insert(self.PlayerExStateHolders,holder)
        end
        local topNodeObj = GetComponentWithPath(self.root, "Top",ComponentTypeName.Transform).gameObject
        self.PlayerExStatePanel.transform:SetSiblingIndex(topNodeObj.transform:GetSiblingIndex())
        self:hide_player_ex_state()
    end
    self.PlayerExStatePanel:SetActive(true)
end

---隐藏玩家拓展状态信息
function TableView:hide_player_ex_state()
    if self.PlayerExStatePanel then
        self.PlayerExStatePanel:SetActive(false)
        for i=1,#self.PlayerExStateHolders do
            local holder = self.PlayerExStateHolders[i]
            holder:hideTag()
        end
    end
end

function TableView:show_brief_one_result(gameState)
    if not self.BriefOneResultPanel then
        local s1 = "majiang/module/table/briefoneresult.prefab"
        local s2 = "BriefOneResult"
        self.BriefOneResultPanel = ModuleCache.ViewUtil.InitGameObject(s1, s2,self.root)
        local Players = GetComponentWithPath(self.BriefOneResultPanel,"Players", ComponentTypeName.Transform).gameObject
        self.BORPlayerHolders = {}
        local objs = TableUtil.get_all_child(Players)
        for i=1,#objs do
            local obj = objs[i]
            local holder = {}
            holder.root = obj
            holder.bgImage =  GetComponentWithPath(obj,"bg", ComponentTypeName.Image)
            holder.addPointText =  GetComponentWithPath(obj,"bg/addPointText", "TextWrap")
            holder.subPointText =  GetComponentWithPath(obj,"bg/subPointText", "TextWrap")
            holder.huRangeText = GetComponentWithPath(obj, "bg/HuRangeText", "TextWrap")
            holder.text = GetComponentWithPath(obj,"bg/Text", ComponentTypeName.Text)
            table.insert(self.BORPlayerHolders,holder)
        end

        local btnContinueAnchorPoint = GetComponentWithPath(self.BriefOneResultPanel,"ButtonContinueAnchorPoint",ComponentTypeName.Transform).gameObject
        local btnLookTotalAnchorPoint  = GetComponentWithPath(self.BriefOneResultPanel,"ButtonLookTotalAnchorPoint",ComponentTypeName.Transform).gameObject

        self.briefOneResultBtnContinue = UnityEngine.GameObject.Instantiate(self.buttonContinue,btnContinueAnchorPoint.transform)  ---克隆现成的按钮，不然事件没法挂上去
        self.briefOneResultBtnContinue.transform.localPosition = Vector3.zero
        self.briefOneResultBtnContinue.name = self.buttonContinue.name

        self.briefOneResultBtnLookTotal = UnityEngine.GameObject.Instantiate(self.preButtonLookTotal,btnLookTotalAnchorPoint.transform) ---克隆现成的按钮，不然事件没法挂上去
        self.briefOneResultBtnLookTotal.transform.localPosition = Vector3.zero
        self.briefOneResultBtnLookTotal.name = self.preButtonLookTotal.name

        self.BriefOneResultPanel.transform:SetSiblingIndex(self.preSettlementObj.transform:GetSiblingIndex())
    end

    local showLookTotal = self.curTableData.needShowTotalResult
    local isPlayBack = self.curTableData.isPlayBack

    self.briefOneResultBtnContinue:SetActive((not isPlayBack) and (not showLookTotal))
    self.briefOneResultBtnLookTotal:SetActive((not isPlayBack) and showLookTotal)

    for i=1,#self.BORPlayerHolders do
        local holder = self.BORPlayerHolders[i]
        holder.root:SetActive(false)
    end
    local mySeat = self.newMySeat or self.mySeat
    for i=1,#gameState.Player do
        local localSeat = self:server_to_local_seat(i - 1,mySeat)
        local holder = self.BORPlayerHolders[localSeat]
        local playerState = gameState.Player[i]
        local ScoreSettle = gameState.ScoreSettle[i]
        local text = ""
        local count = 1
        for k=1,#playerState.HuFa do
            local hufa = playerState.HuFa[k]
            if hufa.display_type == 1 then
                local rTex = ""
                if  count > 1 then
                    rTex = "\n"
                end
                text = text..rTex.."【"..tostring(hufa.Name).."】"
                count = count + 1
            end
        end
        holder.text.text = text
        local BeiShuScale = self.ConfigData.resultBeiShuScale or 1
        holder.addPointText.gameObject:SetActive(playerState.BeiShu > 0)
        holder.subPointText.gameObject:SetActive(playerState.BeiShu <= 0)
        if playerState.BeiShu > 0 then
            holder.addPointText.text = "+"..tostring( playerState.BeiShu / BeiShuScale)
            holder.text.color = Color.New(252/255,239/255,50/255,1)
        elseif playerState.BeiShu == 0 then
            holder.subPointText.text = "-0"
            holder.text.color = Color.New(28/255,220/255,255/255,1)
        else
            holder.subPointText.text = tostring( playerState.BeiShu / BeiShuScale)
            holder.text.color = Color.New(28/255,220/255,255/255,1)
        end
        holder.huRangeText.text = ""
        if playerState.huPaiSep ~= 0 then
            holder.huRangeText.text = tostring(playerState.huPaiSep)
        end
        holder.root:SetActive(true)
        local w = holder.text.preferredWidth > 280 and holder.text.preferredWidth or 280
        local h = 80 + holder.text.preferredHeight
        holder.bgImage.transform.sizeDelta = Vector2(w,h)
    end
    self.BriefOneResultPanel:SetActive(true)
end

function TableView:hide_brief_one_result()
    if self.BriefOneResultPanel then
        self.BriefOneResultPanel:SetActive(false)
    end
end

---获取2D，3D麻将 切换示意图
function TableView:get_selected_2d_or_3d_Sprite()
    if not self.select2dOr3dDisPic then
        local parent = GetComponentWithPath(self.root, "Center", ComponentTypeName.Transform).gameObject
        local s1 = "majiang/module/table/2dor3dselectpic.prefab"
        local s2 = "2dOr3dSelectPic"
        self.select2dOr3dDisPic = ModuleCache.ViewUtil.InitGameObject(s1, s2,parent)
        self.selected2dSprite = GetComponentWithPath(self.select2dOr3dDisPic, "2d", ComponentTypeName.Image).sprite
        self.selected3dSprite = GetComponentWithPath(self.select2dOr3dDisPic, "3d", ComponentTypeName.Image).sprite
    end
    return self.selected2dSprite,self.selected3dSprite
end


TableView.playerWaitTagType =
{
    hideAll = 0,
    commonWait = 1, ---普通提示
    readyHaiDi = 2, ---即将海底提示
    haiDiing = 3, ---海底中提示
    last8Zhang = 4, --- 最后8张
}
---设置对应座位的玩家等待标记状态
function TableView:setPlayerWaitStateTagsState(localSeat,playerWaitTagType,state)
    playerWaitTagType = playerWaitTagType or self.playerWaitTagType.hideAll
    local tagTable = self.playerWaitStateTags[localSeat]
    for i=1,#tagTable.tags do
        local tag = tagTable.tags[i]
        local tagIndex = tonumber(tag.name)
        if self.playerWaitTagType.hideAll == playerWaitTagType then
            ComponentUtil.SafeSetActive(tag,false)
        elseif playerWaitTagType == tagIndex then
            ComponentUtil.SafeSetActive(tag,state)
        end
    end
    ComponentUtil.SafeSetActive(tagTable.root,self.playerWaitTagType.hideAll ~= playerWaitTagType)
end


---设置右侧菜单状态
function TableView:setRightMenuState(state)
    if self.curTableData.isPlayBack then
        self.rightMenu:SetActive(false)
        return
    end
    self.rightMenu:SetActive(state)
    self.buttonRightOpen.gameObject:SetActive(not state)
    local closeEixtBtn = false
    if nil == self.gameState and (not self.allReady)  then
        self.rbuttonExitText.text = "退出"
    else
        self.rbuttonExitText.text = "解散"
    end
    self.rbuttonExit.gameObject:SetActive(not closeEixtBtn)
    self.roomType:on_right_menu_state_change(state)
end

---设置提前开局按钮状态
function TableView:set_early_start_button_state(state,isEnable,curPlayerNum,playerNumData)
    if TableManager:cur_game_is_gold_room_type() then
        ComponentUtil.SafeSetActive(self.buttonEarlyStart.gameObject, false)
        return
    end
    ComponentUtil.SafeSetActive(self.buttonEarlyStart.gameObject, state)
    if not state then
        return
    end
    if isEnable then
        self.buttonEarlyStart.name = "ButtonEarlyStart"
        self.earlyStartNumText.text = "("..tostring(curPlayerNum).."人)"
        ComponentUtil.SafeSetActive(self.earlyStartNumText.gameObject,true)
        ComponentUtil.SafeSetActive(self.earlyStartGray.gameObject,false)
    else
        self.buttonEarlyStart.name = "ButtonEarlyStart_"
        ComponentUtil.SafeSetActive(self.earlyStartGray.gameObject,true)
        ComponentUtil.SafeSetActive(self.earlyStartNumText.gameObject,false)
        local text = ""
        for i=1,#playerNumData do
            text = text..tostring(playerNumData[i]).."人"..(i == #playerNumData and "" or "/")
        end
        self.earlyStartGrayText.text = text.."也可开局"
    end
end

--- 更新UI 在防作弊模式下
function TableView:update_ui_anticheat()
    if(not self.ruleJsonInfo.anticheat) then
        return
    end
    if(not self:all_is_ready()) then
        self.anticheatSwitcher:SwitchState("Anticheat")
        for i = 2, #self.seatHolderArray do
            local seatHolder = self.seatHolderArray[i]
            if(seatHolder.playerId and seatHolder.playerId ~= "0") then
                seatHolder.buttonNotSeatDown:SetActive(false)
                seatHolder.anticheatEmptyHead:SetActive(false)
                seatHolder.goSeatInfo:SetActive(false)
                seatHolder.anticheatHeadImage.gameObject:SetActive(true)
                seatHolder.beginUI:SetActive(false)
            else
                seatHolder.buttonNotSeatDown:SetActive(false)
                seatHolder.anticheatEmptyHead:SetActive(true)
                seatHolder.anticheatHeadImage.gameObject:SetActive(false)
                seatHolder.beginUI:SetActive(false)
            end
        end
        ComponentUtil.SafeSetActive(self.buttonWarning.gameObject, false)
    else
        self.anticheatSwitcher:SwitchState("Normal")
        for i = 2, #self.seatHolderArray do
            local seatHolder = self.seatHolderArray[i]
            if(seatHolder.playerId and seatHolder.playerId ~= "0") then
                seatHolder.buttonNotSeatDown:SetActive(false)
                seatHolder.anticheatEmptyHead:SetActive(false)
                seatHolder.goSeatInfo:SetActive(true)
                seatHolder.anticheatHeadImage.gameObject:SetActive(false)
                seatHolder.beginUI:SetActive(true)
            else
                seatHolder.buttonNotSeatDown:SetActive(true)
                seatHolder.anticheatEmptyHead:SetActive(false)
                seatHolder.anticheatHeadImage.gameObject:SetActive(false)
                seatHolder.beginUI:SetActive(false)
            end
        end
    end
end

---显示牌桌预览相关操作控件
function TableView:show_table_presettlement(show)
    self.roomType:show_table_presettlement(show)
    self.preSettlementObj:SetActive(false) ---蜜汁逻辑，先关闭一下，触发Grid的排序
    self.preSettlementObj:SetActive(show)
end

--- 显示开始按钮上倒计时
function TableView:show_begin_button_time_down(show)
    self.beginCountDownObj:SetActive(show)
    self.beginImgObj:SetActive(not show)
end

--- 依据最大手牌数初始化
function TableView:on_init(maxNum)
    self.curTableData.totalSeat = self.totalSeat
    self.curTableData.wanfaName = self.wanfaName
    self.seatHolderArray = {}
    self:init_seats()
    self.clones = TableUtil.get_all_child(self.cloneParent)
    self.curTableData.seatHolderArray = self.seatHolderArray
    self.playType:on_init()
end

--- 初始化最大麻将数
function TableView:get_max_mj_num()
    return 14
end

--- 隐藏操作以及弹出的操作列表
function TableView:hide_wait_action_select_card()
    self.waitAction:SetActive(false)
    self.actionGuo:SetActive(false)
    self.sanKouObj:SetActive(false)
    self:hide_select_card_childs()
end

--- 显示吃列表
function TableView:show_chi_grid()
    for i=1,#self.gameState.KeChi do
        local xAddOffset = 0
        for j=1,#self.gameState.KeChi[i].ChiFa do
            local target = TableUtil.poor("3_SelectCard", self.selectCardPanel,
            self.selectCardClonePos[3] + Vector3.New(xAddOffset, (i - 1) * selectCardYOffset, 0), self.poorObjs, self.clones)
            local childs = TableUtil.get_all_child(target)
            local curPai = self.gameState.KeChi[i].Pai
            local index = #self.gameState.KeChi[i].ChiFa - j + 1
            for k=1,#childs do
                local pai = self.gameState.KeChi[i].ChiFa[index] + (k - 1)
                ---@type Mj2D
                local mj = Mj2D:new(pai, nil, {gameObject = childs[k], spriteHolder = self.frontSpriteH})
                if(pai == curPai) then
                    mj:set_color(Color.yellow)
                else
                    mj:set_color(Color.white)
                end
                mj:set_skin(self.mjColorSet, self.mjScaleSet)
                MjManager.insert(mj, MjManager.mjType.custom)
            end
            target.name = "Chi" .. "_3_" .. self.gameState.KeChi[i].ChiFa[index] .. "_" .. self.gameState.KeChi[i].Pai
            xAddOffset = xAddOffset - selectCardXOffset * 3 - 10
        end
    end
    self.selectCardPanel:SetActive(true)
end

--- 显示碰列表
function TableView:show_peng_grid()
    local xAddOffset = 0
    for i=1,#self.gameState.KePeng do
        local target = TableUtil.poor("3_SelectCard", self.selectCardPanel, self.selectCardClonePos[3]
        + Vector3.New(xAddOffset, 0, 0), self.poorObjs, self.clones)
        local childs = TableUtil.get_all_child(target)
        local index = #self.gameState.KePeng - i + 1
        for k=1,#childs do
            local pai = self.gameState.KePeng[index]
            ---@type Mj2D
            local mj = Mj2D:new(pai, nil, {gameObject = childs[k], spriteHolder = self.frontSpriteH})
            mj:set_color(Color.white)
            mj:set_skin(self.mjColorSet, self.mjScaleSet)
            MjManager.insert(mj, MjManager.mjType.custom)
        end
        target.name = "Peng" .. "_3_" .. self.gameState.KePeng[index]
        xAddOffset = xAddOffset - selectCardXOffset * 3 - 10
    end
    self.selectCardPanel:SetActive(true)
end

function TableView:show_common_gang_grid(gangList)
    local selectCardPanel = self.selectCardPanel
    local xAddOffset = 0
    for i=1,#gangList do
        if((i - 1) % 6 == 0) then
            xAddOffset = 0
        end
        local target = TableUtil.poor("1_SelectCard", selectCardPanel, self.selectCardClonePos[1]
                + Vector3.New(xAddOffset, math.floor((i - 1) / 6) * (selectCardYOffset + 10), 0), self.poorObjs, self.clones)
        local childs = TableUtil.get_all_child(target)
        local index = #gangList - i + 1
        for k=1,#childs do
            local pai = gangList[index]
            ---@type Mj2D
            local mj = Mj2D:new(pai, nil, {gameObject = childs[k], spriteHolder = self.frontSpriteH})
            mj:set_color(Color.white)
            mj:set_skin(self.mjColorSet, self.mjScaleSet)
            MjManager.insert(mj, MjManager.mjType.custom)
        end
        target.name = "Gang" .. "_4_" .. gangList[index]
        xAddOffset = xAddOffset - selectCardXOffset * 1 - 20
    end
    selectCardPanel:SetActive(true)
end

--- 显示杠列表
function TableView:show_gang_grid()
    self:show_common_gang_grid(self.gameState.KeGang)
end

--- 显示开杠列表
function TableView:show_kai_gang_grid()
    self:show_common_gang_grid(self.gameState.KeKaiGang2)
end

--- 隐藏所有操作选牌弹框
function TableView:hide_select_card_childs()
    self:hide_select_card(self.selectCardPanel)
end

--- 隐藏飘花选择
function TableView:hide_select_hua()
    self.selectHua:SetActive(false)
end

--- 隐藏指定操作选牌弹框
function TableView:hide_select_card(selectCardPanel)
    if(not selectCardPanel.activeSelf) then
        return
    end
    local childs = TableUtil.get_all_child(selectCardPanel)
    for i=1,#childs do
        if(childs[i].name ~= "BtnNoSelectCard") then
            local array = string.split(childs[i].name, "_")
            if(array[2] == "3") then
                childs[i].name = "3_SelectCard"
            elseif(array[2] == "4") then
                childs[i].name = "1_SelectCard"
            elseif(array[2] == "2") then
                childs[i].name = "2_SelectCard"
            end
            self.poorObjs = TableUtil.add_poor(childs[i], self.poorObjs, self.cloneParent)
        end
    end
    selectCardPanel:SetActive(false)
end

--- 显示准备阶段的倒计时（开始按钮上的）
function TableView:show_ready_time_down(timeDown)
    self:show_begin_button_time_down(true)
    if self.readykickedTimeId then
        CSmartTimer:Kill(self.readykickedTimeId)
    end
    self.readykickedTimeId = self:subscibe_time_event(timeDown, false, 0):OnUpdate(function(t)
        t = t.surplusTimeRound
        self.buttonBeginCountDownTex.text = "("..t.."s)"
    end):OnComplete(function(t)

    end).id
end

--- 初始化所有的座位
function TableView:init_seats()
    self.selectCardClonePos = {}
    for i=1,4 do
        local selectCardPanel = GetComponentWithPath(self.selectCardPanel, i .. "_SelectCard", ComponentTypeName.Transform).gameObject
        table.insert(self.selectCardClonePos, selectCardPanel.transform.localPosition)
        TableUtil.move_clone(selectCardPanel, self.cloneParent)
    end
end

--- 开始刷新gameState
function TableView:game_state_begin(gameState)
    if(not self.lastGameState) then
        self:begin_game(gameState)
    end
    self.lastGameState = self.gameState or gameState
    self.gameState = gameState
    self:update_seat_pointer()
    self:hide_select_card_childs()
    self.inviteAndExit:SetActive(false)
    self.actionGuo:SetActive(false)
    for i = 1, #self.seatHolderArray do
        ---@type SeatHolder2D
        local seatHolder = self.seatHolderArray[i]
        seatHolder:show_ready(false)
        seatHolder:show_kick(false)
        seatHolder:show_banker_tag(seatHolder.serverSeat == gameState.ZhuangJia)
    end
    self.playType:show_round(gameState)
    self.roomType:game_state_begin(gameState)
    self:refresh_haidi_status(gameState)
end

---刷新海底提示状态
function TableView:refresh_haidi_status(gameState)
    ---暂时是一个全局提示，使用1号座位玩家的控件来提示，鬼知道以后要不要换成单独提示
    self:setPlayerWaitStateTagsState(1,self.playerWaitTagType.readyHaiDi,gameState.HaiDiStatus == 1)
    self:setPlayerWaitStateTagsState(1,self.playerWaitTagType.haiDiing,gameState.HaiDiStatus == 2)
end

--- 开始游戏
function TableView:begin_game(gameState)
    if(gameState.Result == 0) then
        self:play_voice("common/startgame")
    end
end

--- 开始倒计时
function TableView:begin_time_down(timeDown, callback)
    self:end_time_down()
    if(timeDown <= 0) then
        return
    end
    self.timeDownId = self:subscibe_time_event(timeDown, false, 1):OnUpdate(function(t)
        t = t.surplusTimeRound
        if(callback) then
            callback(t)
        end
    end):OnComplete(function(t)

    end).id
end

--- 显示倒计时
function TableView:show_time_down(t)

end

--- 结束倒计时
function TableView:end_time_down()
    if self.timeDownId then
        CSmartTimer:Kill(self.timeDownId)
        self.timeDownId = nil
    end
end

--- 播放补花
function TableView:play_buhua(localSeat)
    local seatInfo = self.seatHolderArray[localSeat]
    if(seatInfo.gender == 1) then
        self:play_voice("femalesound_hn/buhua")
    else
        self:play_voice("malesound_hn/buhua")
    end
    seatInfo.huaAnimation:SetActive(true)
    local buhua = TableUtil.poor("BuHuaTX", seatInfo.huaAnimation, Vector3.zero, self.poorObjs, self.clones)
    self:subscibe_time_event(0.8, false, 0):OnComplete(function(t)
        self.poorObjs = TableUtil.add_poor(buhua, self.poorObjs, self.cloneParent)
    end)
end

--- 打出普通牌
function TableView:play_custom(pai, localSeat)

end

--- 重置状态 点击继续游戏
function TableView:reset_state()
    for i = 1, #self.seatHolderArray do
        ---@type SeatHolder2D
        local seatHolder = self.seatHolderArray[i]
        seatHolder:reset()
        self:setPlayerWaitStateTagsState(i,self.playerWaitTagType.hideAll)
    end
    MjManager.clear()
    self.lastGameState = nil
    self.mjPointers = {}
    self.tingGridParent:SetActive(false)
    self.huGridParent:SetActive(false)
    self.baoPai:SetActive(false)
    self:hide_select_card_childs()
    self:hide_wait_action_select_card()
    self:hide_brief_one_result()
    self:hide_player_ex_state()
end

--- 设置麻将箭头
function TableView:set_mj_pointer()
    if(self.mjPointers) then
        for i = 1, 4 do
            if(self.mjPointers[i]) then
                for j = #self.mjPointers[i], 1, -1 do
                    if(self.newMJPointer == i) then
                        self.mjPointers[i][j]:show_pointer(true)
                    else
                        self.mjPointers[i][j]:show_pointer(false)
                        table.remove(self.mjPointers[i], j)
                    end
                end
            end
        end
    end
end



--- 座位指向是否高亮
function TableView:pointer_is_light(localTargetSeat, index)
    return index == localTargetSeat or
        (localTargetSeat == 4 and self.totalSeat == 3 and index == 3) or (localTargetSeat == 3 and self.totalSeat == 2 and index == 2)
end

--- 牌是否亮倒
function TableView:pai_is_open(playerState, handData)
    return self.curTableData.isPlayBack or (handData and handData.Pai ~= 0 and (#playerState.HuPai ~= 0 or handData.State == 1))
end

--- 牌是否扣倒
function TableView:pai_is_covered(handData)
    return handData and handData.State == 2
end

--- 显示听标记
function TableView:show_ting(pai)
    local showTing = false
    if(#self.gameState.KeLiang > 0) then
        for j=1,#self.gameState.KeLiang[1].KeChu do
            if(pai == self.gameState.KeLiang[1].KeChu[j].ChuPai) then
                showTing = true
                break
            end
        end
    end
    return showTing
end

--- 报听中的听牌
function TableView:show_mid_ting_pai(pai)
    return self:show_ting(pai)
end

--- 牌局中报听处理
function TableView:mid_ting_handle(isGray)
    if(not self.isMidTing and not isGray) then
        return
    end
    local mjs = self:get_my_hand_mjs()
    for i = 1, #mjs do
        ---@type Mj2D
        local mj = mjs[i]
        local pai = mj.pai
        if(mj.gameObject.activeSelf) then
            local gray = isGray and not self:show_mid_ting_pai(pai)
            mj:set_disable(gray)
            if(gray) then
                mj:set_color(Color.gray, mj.skinObj)
            else
                mj:set_color(Color.white, mj.skinObj)
            end
        end
    end
    self.isMidTing = isGray
end

--- 可以出牌
function TableView:can_out()
    if(self:is_observer_mode()) then
        return false
    end
    return self.gameState.CurPlayer == self.curTableData.SeatID and not self:add_action_active()
        and (not self:action_active() or (self:action_active() and not self.openGuoHu))
end

--- 是否是观察者模式
function TableView:is_observer_mode()
    if(self.curTableData.isPlayBack or self.gameState.Result ~= 0) then
        return true
    end
    return false
end

--- 手牌已经弹起可以直接打出去
function TableView:hand_mj_is_outing(obj)
    
end

--- 可出牌的情况下点击手牌（手牌未弹起时）
function TableView:click_hand_mj_can_out(obj, isDrag)

end

--- 出不了牌的情况下点击手牌（点击又有反应）
function TableView:click_hand_mj_cant_out(obj)

end

--- 是否是癞子
function TableView:is_laizi(pai,gameState)
    gameState = gameState or self.gameState
    return pai ~= 0 and gameState.LaiZi == pai --todo:新的协议中 gameState.LaiZis 中也会包喊癞根数据
end

--- 是否是癞根
function TableView:is_pizi(pai,gameState)
    gameState = gameState or self.gameState
    return pai ~= 0 and gameState.LaiGen == pai  --todo:新的协议中 gameState.LaiGens 中也会包喊癞根数据
end

--- 是否是花牌
function TableView:is_hua(pai, playerState)
    for i=1,#self.gameState.HuaPai do
        if(pai == self.gameState.HuaPai[i] and playerState.piaohuacfgnew ~= 2) then
            return true
        end
    end
    return false
end

---检测一张可听的牌是否可胡选择是最多的
function TableView:check_ting_is_duo(pai,gameState)
    if 0 >= pai then
        return false
    end
    local conterInfo = {}
    if(#self.gameState.KeLiang > 0) then
        for j=1,#self.gameState.KeLiang[1].KeChu do
            local info = {}
            local totalZhangShu = 0
            local ting = self.gameState.KeLiang[1].KeChu[j]
            local tindPai = ting.TingPai
            for i=1,#tindPai do
                totalZhangShu = totalZhangShu + (4 - self.allCard[tindPai[i]])
            end
            info.ChuPai = ting.ChuPai
            info.totalZhangShu = totalZhangShu
            table.insert(conterInfo,info)
        end
    end
    local isSamme = true
    local sameCheckValue = -1
    for i=1,#conterInfo do
        local info = conterInfo[i]
        if -1 == sameCheckValue then
            sameCheckValue = info.totalZhangShu
        else
            if sameCheckValue ~= info.totalZhangShu then
                isSamme = false
                break
            end
        end
    end
    if isSamme then ---如果所有的听牌张数相同，则不显示多标记
        return false
    end
    local maxCounter = 0
    local curCounter = 0
    for i=1,#conterInfo do
        local info = conterInfo[i]
        if info.totalZhangShu > maxCounter then
            maxCounter = info.totalZhangShu
        end
        if(pai == info.ChuPai) then
            curCounter = info.totalZhangShu
        end
    end
    if 0 == curCounter then
        return false
    end
    if curCounter >= maxCounter then
        return true
    end
    return false
end
---检测一张可听的牌是否可胡选择番数是最大的
function TableView:check_ting_is_da(pai,gameState)
    if 0 >= pai then
        return false
    end
    local maxCounter = 0
    local curCounter = 0
    local counterInfo = {}
    if(#self.gameState.KeLiang > 0) then
        for j=1,#self.gameState.KeLiang[1].KeChu do
            local localMaxFen = 0
            local ting = self.gameState.KeLiang[1].KeChu[j]
            local fens = ting.Fen
            for k=1,#fens do
                local fen = fens[k]
                if fen > maxCounter then
                    maxCounter = fen
                end
                if fen > localMaxFen then
                    localMaxFen = fen
                end
                if(pai == ting.ChuPai and fen > curCounter) then
                    curCounter = fen
                end
            end
            local info = {}
            info.ChuPai = ting.ChuPai
            info.localMaxFen = localMaxFen
            table.insert(counterInfo,info)
        end
    end

    local isSamme = true
    local sameCheckValue = -1
    for i=1,#counterInfo do
        local info = counterInfo[i]
        if -1 == sameCheckValue then
            sameCheckValue = info.localMaxFen
        else
            if sameCheckValue ~= info.localMaxFen then
                isSamme = false
                break
            end
        end
    end
    if isSamme then   ---如果所有牌的听牌番数都相同，则不提示大
        return false
    end
    if 0 == curCounter then
        return false
    end
    if curCounter >= maxCounter then
        return true
    end
    return false
end

--- 手牌刷新之前 serverSeat 服务器座位
function TableView:game_state_begin_hand(serverSeat)

end

--- 设置手牌 handData 手牌数据 localSeat 本地座位 index 位置索引 playerState 玩家整个数据 showHu 显示胡  lastMjMove 最后的牌是否偏移 dataIndex 数据索引
function TableView:set_hand_data(params)

end

--- 根据即将出的手牌处理所有牌局中的麻将 要变色啥的
function TableView:handle_mjs_out_hand_mj(pai)
    self:show_ting_hu_grid(pai)
    for i = 1, #self.seatHolderArray do
        ---@type SeatHolder2D
        local seatHolder = self.seatHolderArray[i]
        seatHolder.mjHeapDown:handle_mjs_ready_out(pai)
        seatHolder.mjHeapOut:handle_mjs_ready_out(pai)
        seatHolder.mjHeapHua:handle_mjs_ready_out(pai)
    end
end

--- 手牌刷新之后 serverSeat 服务器座位
function TableView:game_state_end_hand(serverSeat)

end

--- 更新座位指向
function TableView:update_seat_pointer()

end

--- 显示听胡列表
function TableView:show_ting_hu_grid(pai)
    if(#self.gameState.KeLiang > 0) then
        local tingChilds = TableUtil.get_all_child(self.tingGrid, "TingMJ")
        for i=1,#tingChilds do
            tingChilds[i]:SetActive(false)
        end
        local isShowTing = self:getIsShowTingSetting()
        self.haveTing = false
        for i=1,#self.gameState.KeLiang[1].KeChu do
            if(pai == self.gameState.KeLiang[1].KeChu[i].ChuPai) then
                self.tingPaiNum = #self.gameState.KeLiang[1].KeChu[i].TingPai
                if(self:show_jianzihu(self.tingPaiNum)) then
                    self.haveTing = true
                    self.tingGridParent:SetActive(true) ---配置控制听列表是否打开
                    self.huGridParent:SetActive(false)
                    self.tingJianZiHu.gameObject:SetActive(true)
                    self.tingGrid.transform.gameObject:SetActive(false)
                    self:set_jianzihu(self.tingJianZiHu, self.tingJianZiHuSH)
                else
                    for j=1,#self.gameState.KeLiang[1].KeChu[i].TingPai do
                        local setPai = self.gameState.KeLiang[1].KeChu[i].TingPai[j]
                        self.tingGridParent:SetActive(true) ---配置控制听列表是否打开
                        self.huGridParent:SetActive(false)
                        self.tingJianZiHu.gameObject:SetActive(false)
                        self.tingGrid.transform.gameObject:SetActive(isShowTing)
                        self.haveTing = true
                        ---@type Mj2D
                        local mj = Mj2D:new(setPai, self.tingGrid, {cloneName = "TingMJ", index = j, spriteHolder = self.frontSpriteH})
                        mj:set_skin(self.mjColorSet, self.mjScaleSet)
                        MjManager.insert(mj, MjManager.mjType.custom)
                        local remainText = GetComponentWithPath(mj.gameObject, "Text", ComponentTypeName.Text)
                        local remainCount = 4 - self.allCard[setPai]
                        remainCount = remainCount >= 0 and remainCount or 0
                        remainText.text = tostring(remainCount)
                    end
                end
            end
        end
        if(not self.haveTing) then
            self:hide_ting_hu_grid()
        end
    else
        self:hide_ting_hu_grid()
    end
    self.roomType:on_show_ting_hu_grid(pai)
end

--- 获取我的手牌列表
function TableView:get_my_hand_mjs()
    return MjManager.get_seat_mjs(MjManager.mjType.hand, 1)
end

--- 更新胡牌列表
function TableView:update_hu_list(yiTing, allCard,isShowTing)
    local isShowHu = self:getIsShowTingSetting()
    self.huGridParent:SetActive(yiTing)
    if(not yiTing) then
        return
    end
    self.huGrid:SetActive(isShowHu)
    local showJianZiHu = self:show_jianzihu(#self.gameState.YiTing)
    self.huGrid:SetActive((not showJianZiHu )and isShowTing)
    self.jianZiHu.gameObject:SetActive(showJianZiHu and isShowTing)
    if(not showJianZiHu) then
        local allHuChilds = TableUtil.get_all_child(self.huGrid)
        for i=2,#allHuChilds do
            allHuChilds[i]:SetActive(false)
        end
        for i=1,#self.gameState.YiTing do
            local setPai = self.gameState.YiTing[i]
            ---@type Mj2D
            local mj = Mj2D:new(setPai, self.huGrid, {cloneName = "HuMJ", index = i, spriteHolder = self.frontSpriteH})
            mj:set_skin(self.mjColorSet, self.mjScaleSet)
            MjManager.insert(mj, MjManager.mjType.custom)
            local remainText = GetComponentWithPath(mj.gameObject, "Text", ComponentTypeName.Text)
            local remainCount = 4 - allCard[setPai]
            remainCount = remainCount >= 0 and remainCount or 0
            remainText.text = tostring(remainCount)
        end
    else
        self:set_jianzihu(self.jianZiHu, self.jianZiHuSH)
    end
    self.roomType:on_update_hu_list(yiTing, allCard,isShowTing)
end

--- 显示见字胡
function TableView:show_jianzihu(num)
    return num > 26
end

--- 设置见字胡
function TableView:set_jianzihu(jianZiHuImage, jianZiHuSH)
    jianZiHuImage.sprite = jianZiHuSH:FindSpriteByName("1")
end

--- 隐藏听胡列表
function TableView:hide_ting_hu_grid(showHu)
    self.tingGridParent:SetActive(false)
    self.roomType:on_hide_ting_hu_grid()
end

--- 复位拖动的麻将
function TableView:reset_drag_mj()
    self:handle_mjs_out_hand_mj(0)
    self:play_voice("common/xuanpai")
end

--- 准备拖动
function TableView:ready_drag_mj(obj, isDrag)

end

--- 出牌
function TableView:out_mj(obj)
    obj:SetActive(false)
    self:hide_ting_hu_grid(true)
    self:hide_wait_action_select_card()
    self:handle_mjs_out_hand_mj(0)
end

--- 出牌之后更新手牌位置 outIndex 出的索引 getIndex 上次摸牌的索引
function TableView:out_mj_update_data(playerState, outIndex, getIndex)

end

--- 获取麻将实例
function TableView:get_mj(obj)
    return MjManager.get_mj(obj)
end

--- 操作被激活
function TableView:action_active()
    local isActive = false
    if self.waitAction.activeSelf then
        local allActChilds = TableUtil.get_all_child(self.waitAction)
        for i=1,#allActChilds do
            local actBt = allActChilds[i]
            if actBt.gameObject.activeSelf then
                isActive = true
                break
            end
        end
    end
    return isActive
end

--- 额外操作被激活
function TableView:add_action_active()
    return self.selectHua.activeSelf
end

--- 房间内用户上线
function TableView:refresh_user_online(data)
    local mySeat = self.newMySeat or self.mySeat
    local localSeat = self:server_to_local_seat(data.SeatID, mySeat)
    local seatHolder = self.seatHolderArray[localSeat]
    if(data.AppendData and data.AppendData ~= "") then
        seatHolder:set_location_data(data.AppendData)
    else
        seatHolder:set_empty_location_data(seatHolder.locationData)
    end
    self:update_gps()
end

--- 获取点击的本地座位
function TableView:get_click_local_seat(obj)
    for i=1,#self.seatHolderArray do
        if(self.seatHolderArray[i].imagePlayerHead.gameObject == obj) then
            return self.seatHolderArray[i]
        end
    end
    return nil
end

--- 房间内用户离线
function TableView:refresh_user_offline(data)

end

--- 查看玩家信息
function TableView:look_player_info(obj)
    local seatHolder = self:get_click_local_seat(obj)
    self.playType:look_player_info(seatHolder)
end

--- 上传玩家状态
function TableView:refresh_report_state(data)
    local mySeat = self.newMySeat or self.mySeat
    local localSeat = self:server_to_local_seat(data.SeatID, mySeat)
    ---@type SeatHolder2D
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder:show_levave(localSeat ~= 1 and data.State and data.State == 1)
    local isDisconnect = (localSeat ~= 1 and data.State and data.State == 2)
    seatHolder:show_disconnect(isDisconnect)
    self.roomType:show_report_kick(seatHolder)
end

---刷新玩家离线状态
function TableView:refresh_user_offline_state(userOfflineState)
    ViewBase.refresh_user_offline_state(self,userOfflineState)
    for i=1,#userOfflineState.OfflineTime do
        local localSeat = self:server_to_local_seat(i - 1)
        local offlineTime = userOfflineState.OfflineTime[i]
        ---@type SeatHolder2D
        local seatHolder = self.seatHolderArray[localSeat]
        local pos = seatHolder.imageDisconnect.transform.localPosition
        seatHolder.imageDisconnect.transform.localPosition =
            Vector3(pos.x,73.5,pos.z)
        seatHolder.disconnectTimingText.text = ""
        if seatHolder.disconnectTimingID then
            CSmartTimer:Kill(seatHolder.disconnectTimingID)
            seatHolder.disconnectTimingID = nil
        end
        if -1 ~= offlineTime then
            seatHolder.imageDisconnect.transform.localPosition =
                Vector3(pos.x,73.5,pos.z)
            local maxTiming = 99999999
            seatHolder.disconnectTimingID = self:subscibe_time_event(maxTiming, false, 1):OnUpdate(function(t)
                local timing = t.elapsedTimeRound + offlineTime
                local m = math.floor((timing % 3600) / 60)
                local s = (timing % 3600) % 60
                local mStr = m >= 10 and  tostring(m)..":" or ("0"..tostring(m)..":")
                local sStr = s >= 10 and tostring(s) or ("0"..tostring(s))
                local timeStr = mStr..sStr
                seatHolder.disconnectTimingText.text = timeStr
            end).id
        end
    end
end

--- 显示开始随机座位时的相关
function TableView:show_begin_random(localSeat, randomSeat)
    ---@type SeatHolder2D
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder:show_begin_random(randomSeat)
end

--- 显示结束随机座位时的相关
function TableView:show_end_random(localSeat)
    ---@type SeatHolder2D
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder:show_end_random()
end

--- 游戏未开始时（整个牌局） --- 此时不是所有玩家都准备了
function TableView:set_game_not_begin_ui()
    for i = 1, #self.seatHolderArray do
        local seatHolder = self.seatHolderArray[i]
        seatHolder:set_game_not_begin_ui()
        self.roomType:set_game_not_begin_ui(seatHolder)
    end
end

--- 游戏开始时（整个牌局）--- 或者所有人都准备了
function TableView:set_game_begin_ui()
    for i = 1, #self.seatHolderArray do
        local seatHolder = self.seatHolderArray[i]
        seatHolder:set_game_begin_ui()
    end
end

--- 别个已经准备的显示
function TableView:show_other_ready(localSeat, seatData)

end

--- 自己已经准备的显示
function TableView:show_me_ready()
    self.buttonBegin:SetActive(false)
    if(self.gameState and self.gameState.Result == 1) then
        self.lastGameState = nil
    end
    self.roomType:show_me_ready()
end

--- 自己还没准备的显示
function TableView:show_me_not_ready(seatData)
    self.inviteAndExit:SetActive(true)
    self.buttonBegin:SetActive(true)
    self.roomType:show_me_not_ready(seatData)
end

--- 显示座位的准备信息
function TableView:show_seat_ready_info(localSeat, seatData)
    ---@type SeatHolder2D
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder.ready = seatData.Ready
    seatHolder:show_ready(seatData.Ready)
end

--- 准备结束
function TableView:update_ready_end(userState)
    local allReady = self:all_is_ready()
    if(self.inviteAndExit.activeSelf) then
        self.inviteAndExit:SetActive(not allReady)
    end
    self.roomType:update_ready_end(allReady,userState)
    self:update_gps()
    if allReady then
        for i = 1, #self.seatHolderArray do
            ---@type SeatHolder2D
            local seatHolder = self.seatHolderArray[i]
            seatHolder:show_ready(false)
        end
    end
end

--- 可以显示头像旁的额外信息（跑漂等）
function TableView:can_show_head_add_info(seatData)
    return self:all_is_ready() and seatData.PiaoType == 0
end

--- 显示头像额外信息（跑漂等）
function TableView:show_head_add_info(localSeat, seatData, userState)
    ---@type SeatHolder2D
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder:show_head_add_text1("")
    seatHolder:show_head_add_text2("")
    if(self:can_show_head_add_info(seatData)) then
        self:on_show_head_add_info(seatHolder, seatData, userState)
    end
end

function TableView:on_show_head_add_info(seatHolder, seatData, userState)
    if(self.ConfigData.headTag) then
        local isMaster = userState and (userState.ZhuangJia == seatData.SeatID) or false
        local showNum = seatData[self.ConfigData.headTag.serverJson]
        if(showNum ~= -1) then
            if(showNum == 0) then
                if(isMaster and self.ConfigData.headTag.zeroMasterJson) then
                    seatHolder:show_head_add_text1(self.ConfigData.headTag.zeroMasterJson)
                else
                    seatHolder:show_head_add_text1(self.ConfigData.headTag.zeroJson)
                end
            elseif(self.ConfigData.headTag.addJson) then
                if(isMaster and self.ConfigData.headTag.addMasterJson) then
                    seatHolder:show_head_add_text1(showNum .. self.ConfigData.headTag.addMasterJson)
                else
                    seatHolder:show_head_add_text1(showNum .. self.ConfigData.headTag.addJson)
                end
            elseif(self.ConfigData.headTag.preJson) then
                if(isMaster and self.ConfigData.headTag.preMasterJson) then
                    seatHolder:show_head_add_text1(self.ConfigData.headTag.preMasterJson .. showNum)
                else
                    seatHolder:show_head_add_text1(self.ConfigData.headTag.preJson .. showNum)
                end
            else
                if(isMaster and self.ConfigData.headTag.notZeroMasterJson) then
                    seatHolder:show_head_add_text1(self.ConfigData.headTag.notZeroMasterJson)
                else
                    seatHolder:show_head_add_text1(self.ConfigData.headTag.notZeroJson)
                end
            end
        end
        showNum = seatData[self.ConfigData.headTag.serverJson2]
        if(showNum ~= -1) then
            if(showNum == 0) then
                if(isMaster and self.ConfigData.headTag.zeroMasterJson2) then
                    seatHolder:show_head_add_text2(self.ConfigData.headTag.zeroMasterJson2)
                else
                    seatHolder:show_head_add_text2(self.ConfigData.headTag.zeroJson2)
                end
            elseif(self.ConfigData.headTag.addJson2) then
                if(isMaster and self.ConfigData.headTag.addMasterJson2) then
                    seatHolder:show_head_add_text2(showNum .. self.ConfigData.headTag.addMasterJson2)
                else
                    seatHolder:show_head_add_text2(showNum .. self.ConfigData.headTag.addJson2)
                end
            elseif(self.ConfigData.headTag.preJson2) then
                if(isMaster and self.ConfigData.headTag.preMasterJson2) then
                    seatHolder:show_head_add_text2(self.ConfigData.headTag.preMasterJson2 .. showNum)
                else
                    seatHolder:show_head_add_text2(self.ConfigData.headTag.preJson2 .. showNum)
                end
            else
                if(isMaster and self.ConfigData.headTag.notZeroMasterJson2) then
                    seatHolder:show_head_add_text2(self.ConfigData.headTag.notZeroMasterJson2)
                else
                    seatHolder:show_head_add_text2(self.ConfigData.headTag.notZeroJson2)
                end
            end
        end
    end
end

--- 显示准备时的错误信息
function TableView:show_ready_error(data,module)
    self.roomType:show_ready_error(data,module)
end

--- 播放打骰子
function TableView:play_dice(endCall,dice1,dice2)
    self.diceObj:SetActive(true)
    self.diceAni.gameObject:SetActive(true)
    self.diceImage1.gameObject:SetActive(false)
    self.diceImage2.gameObject:SetActive(false)
    self.diceAni:Play(0)
    self:subscibe_time_event(self.diceAni.duration + 0.1, false, 0):OnComplete(function(t)
        self.diceAni.gameObject:SetActive(false)
        self.diceImage1.gameObject:SetActive(dice1 ~= 0)
        self.diceImage2.gameObject:SetActive(dice2 ~= 0)
        if not dice1 or not dice2 then
            if(self.newGameState) then
                self.diceImage1.sprite = self.diceImage1SH:FindSpriteByName(self.newGameState.Dice1 .. "")
                self.diceImage2.sprite = self.diceImage2SH:FindSpriteByName(self.newGameState.Dice2 .. "")
                self:subscibe_time_event(1.2, false, 0):OnComplete(function(t)
                    self.diceObj:SetActive(false)
                    if(endCall) then
                        endCall()
                    end
                end)
            else
                self.diceObj:SetActive(false)
            end
        else
            self.diceImage1.sprite = self.diceImage1SH:FindSpriteByName(tostring(dice1))
            self.diceImage2.sprite = self.diceImage2SH:FindSpriteByName(tostring(dice2))
            self:subscibe_time_event(1.2, false, 0):OnComplete(function(t)
                self.diceObj:SetActive(false)
                if(endCall) then
                    endCall()
                end
            end)
        end
    end)
end

--- 隐藏牌桌额外弹窗（选跑漂等）
function TableView:hide_table_pop()
    if(ModuleCache.ModuleManager.module_is_active("majiang", "tablepop")) then
        ModuleCache.ModuleManager.hide_module("majiang", "tablepop")
    end
    if(ModuleCache.ModuleManager.module_is_active("majiang", "tablestrategy")) then
        ModuleCache.ModuleManager.hide_module("majiang", "tablestrategy")
    end
    if(ModuleCache.ModuleManager.module_is_active("majiang", "tablepop2")) then
        ModuleCache.ModuleManager.hide_module("majiang", "tablepop2")
    end
end

--- 显示牌桌额外弹窗（选跑漂等）
function TableView:show_table_pop(userState, i)
    if(self.ConfigData.isStrategy) then
        if(not ModuleCache.ModuleManager.module_is_active("majiang", "tablestrategy")) then
            local initData = {}
            initData.gameName = TableManager.curTableData.Game_Name
            initData.isTuo = (self.mySeat == userState.ZhuangJia)
            ModuleCache.ModuleManager.show_module("majiang", "tablestrategy", initData)
        end
    end
    if(self.ConfigData.isTablePop) then
        if(not ModuleCache.ModuleManager.module_is_active("majiang", "tablepop")) then
            ModuleCache.ModuleManager.show_module("majiang", "tablepop")
        end
    end
    if(self.ConfigData.isTablePop2) then
        if(not ModuleCache.ModuleManager.module_is_active("majiang", "tablepop2")) then
            self.ruleJsonInfo.ZhuangJia = (self.mySeat == userState.ZhuangJia)
            ModuleCache.ModuleManager.show_module("majiang", "tablepop2", self.ruleJsonInfo)
        end
    end
end

--- 刷新座位信息
function TableView:refresh_seat_info(data)
    local seatID = data.SeatID
    local localSeat = self:server_to_local_seat(seatID)
    ---@type SeatHolder2D
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder.serverSeat = seatID
    seatHolder.SeatID = seatHolder.serverSeat ---有部分外部模块用这个字段调用座位得服务器座位索引
    seatHolder.playerId = data.UserID or "0"
    self.curTableData.seatUserIdInfo = self.curTableData.seatUserIdInfo or {}
    self.curTableData.seatUserIdInfo[seatID .. ""] = data.UserID
    if(not data.UserID or data.UserID == "0") then
        seatHolder:player_leave_seat()
        self.roomType:player_leave_seat(seatHolder)
    else
        seatHolder:player_on_seat(data.UserID, seatID, data)
        self.roomType:player_on_seat(seatHolder, data)
    end
    self:update_ui_anticheat()
end

--- 所有人都准备好了
function TableView:all_is_ready()
    return self.allReady
end

--- 更新gps
function TableView:update_gps()
    if self.corou_update_gps ~= nil then
        coroutine.stop(self.corou_update_gps)
        self.corou_update_gps = nil
    end
    self.corou_update_gps = self:start_lua_coroutine(function ()
        self:update_gps_coroutine()
    end)
end

function TableView:update_gps_coroutine()
    coroutine.wait(1)
    if(self.ruleJsonInfo.anticheat and not self:all_is_ready()) then
        return
    end
    if TableManager:cur_game_is_gold_room_type() then
        return
    end
    if TableManager.curTableData.isPlayBack then
        return
    end

    local data = {}
    data.gameType = "majiang"
    data.seatHolderArray = self.seatHolderArray
    data.buttonLocation = self.buttonWarning
    data.roomID = self.curTableData.RoomID
    data.tableCount = self.totalSeat
    data.isPlay = self:all_is_ready()
    data.isShowLocation = false

    local lastRefreshRoomID = PlayerPrefs.GetInt("Refresh2dOr3dRoomID",0) ---获取切换2D，3D模式时候的保存的房间号ID
    if lastRefreshRoomID == self.curTableData.RoomID then
        data.seatHolderArray = {}
    end
    ---打开定位功能界面
    ModuleCache.ModuleManager.show_module("public", "tablelocation",data)
end

--- 更新位置信息 ---通过聊天回包更新
function TableView:update_seat_location(seat,locationData)
    local mySeat = self.newMySeat or self.mySeat
    local seatInfo = self.seatHolderArray[self:server_to_local_seat(seat, mySeat)]
    seatInfo.locationData = locationData
    self:update_gps()
end

--- 获取被踢者的名字
function TableView:get_kick_player_name(obj)
    for i=1,#self.seatHolderArray do
        local seatHolder = self.seatHolderArray[i]
        if(obj == seatHolder.buttonKick) then
            return seatHolder.playerId, seatHolder.textPlayerName.text
        end
    end
end

--- 获取奖励数据
function TableView:get_room_award_table(roomAward)
    for i = 1, #self.seatHolderArray do
        local seatHolder = self.seatHolderArray[i]
        if(seatHolder.playerId == roomAward.UserID) then
            return {
                position = seatHolder.buttonNotSeatDown.transform.position,
                awardMsg = roomAward.Message,
                isMe = self:is_me(i)
            }
        end
    end
    return nil
end

---显示聊天表情
function TableView:show_chat_face(seat, content)
    ---@type SeatHolder2D
    local seatInfo = self.seatHolderArray[self:server_to_local_seat(seat)]
    seatInfo:show_chat_face(content)
end

---显示聊天气泡
function TableView:show_chat_bubble(seat, content)
    ---@type SeatHolder2D
    local seatInfo = self.seatHolderArray[self:server_to_local_seat(seat)]
    seatInfo:show_chat_bubble(content)
end

---显示语言
function TableView:show_voice(seat)
    ---@type SeatHolder2D
    local seatInfo = self.seatHolderArray[self:server_to_local_seat(seat)]
    seatInfo:show_voice()
end

---隐藏语音
function TableView:hide_voice(seat)
    ---@type SeatHolder2D
    local seatInfo = self.seatHolderArray[self:server_to_local_seat(seat)]
    seatInfo:hide_voice()
end

--- 短语播放
function TableView:show_shot_voice(index, seat)
    local seatInfo = self.seatHolderArray[self:server_to_local_seat(seat)]
    if(seatInfo.gender and seatInfo.gender == 1)then
        self:play_voice("femalesound_hn/" .. "fix_msg_" .. index)
    else
        self:play_voice("malesound_hn/" .. "fix_msg_" .. index)
    end
end

---播放音效
function TableView:play_voice(path)
    local locationSetting = self:getCurLocationSetting()
    print(" locationSetting ： "..tostring(locationSetting))
    local array = string.split(path, "/")
    if(not string.find(path, "common")) then
        if(self.ConfigData.soundPath and 1 == locationSetting ) then
            path = self.ConfigData.soundPath .. "/" .. path
        end
    end
    ModuleCache.SoundManager.play_sound("majiang", "majiang/sound/".. path .. ".bytes", array[#array])
end

--- 播放操作声音
function TableView:play_action_sound(action, seatInfo)
    local sounds = self.actionSounds[action .. ""]
    if(not sounds) then
        return
    end
    local sound = sounds[math.random(#sounds)]
    print(action,"-------------play_action_sound:",sound)
    if(seatInfo.gender == 1) then
        self:play_voice("femalesound_hn/" .. sound)
    else
        self:play_voice("malesound_hn/" .. sound)
    end
end

--- 获取本地座位
function TableView:get_seat_id(seatInfo)
    for i=1,#self.seatHolderArray do
        if(seatInfo == self.seatHolderArray[i]) then
            return i
        end
    end
end

--- 回放选择玩家显示数据
function TableView:play_back_switch_player(seatHolder)

end

---播放胡的音效
function TableView:play_hu_sound(gameState)
    local ziMoIndex = 0
    for i=1,#gameState.Player do
        local state = gameState.Player[i]
        --TODO 修复流局播放自摸的音效  state.HuPai 在胡的时候已经清空
        if(state.HuPai and #state.HuPai > 0 and gameState.DianPao == -1 and ziMoIndex == 0) then --没有点炮
            ziMoIndex = i
            print("有人自摸了")
        end
    end
    for i=1,#gameState.Player do
        local state = gameState.Player[i]
        local localSeat = self:server_to_local_seat(i - 1)
        local seatHolder = self.seatHolderArray[localSeat]
        if(localSeat == 1) then
            if(state.BeiShu <= 0) then
                self:play_voice("common/loss")
            else
                self:play_voice("common/win")
            end
        end
        if(self:play_hu_sound_on_result()) then
            if(gameState.DianPao ~= -1) then --有点炮
                if(state.BeiShu > 0) then
                    self:play_action_sound(self.actions.hu, seatHolder)
                    break
                end
            elseif(i == ziMoIndex) then --自摸
                self:play_action_sound(self.actions.zimo, seatHolder)
                break
            end
        end
    end
end

--- 小结算时需要播放胡音效
function TableView:play_hu_sound_on_result()
    return true
end

---在view中处理局数信息显示，返回 true 则不会在 table_type 中处理局数信息显示
function TableView:process_round_info_display(gameName)
    return false
end

--- 延迟刷新游戏状态时间
function TableView:pre_delay_state_time(gameState)
    for i=1,#gameState.Action do
        local action = gameState.Action[i]
        if (9 == action.Action) then
            return -1
        end
    end
    return 0
end

--- 是否是我自己
function TableView:is_me(localSeat, serverSeat)
    if(localSeat) then
        return localSeat == 1
    end
    if(serverSeat) then
        return (serverSeat == self.mySeat)
    end
    return false
end

--- 服务器座位转换本地座位
function TableView:server_to_local_seat(seatId, targetSeat)
    targetSeat = targetSeat or self.mySeat
    return TableUtil.get_local_seat(seatId,targetSeat,self.totalSeat)
end

--- 是否是对家
function TableView:is_top(seatId, targetSeat)
    local localSeat = self:server_to_local_seat(seatId, targetSeat)
    return localSeat == 3
end

--- 是否是上家
function TableView:is_left(seatId, targetSeat)
    local localSeat = self:server_to_local_seat(seatId, targetSeat)
    return localSeat == 4
end

--- 是否是下家
function TableView:is_right(seatId, targetSeat)
    local localSeat = self:server_to_local_seat(seatId, targetSeat)
    return localSeat == 2
end

--- 缓存状态刷新延迟的时间
function TableView:delay_cache_state_time()
    return 0
end

---设置墩
function TableView:game_state_dun()

end
---设置打骰子
function TableView:game_state_dice()

end
---拦牌状态
function TableView:game_state_wait_action()

end
---光标指向对应玩家
function TableView:game_state_pointer_player()

end
---癞子
function TableView:game_state_lai_zi(show)
    self.laiZiMJ:SetActive(show)
    if(not show) then
        return
    end
    ---@type Mj2D
    local mj = Mj2D:new(self.gameState.LaiZi, nil, {gameObject = self.laiZiMJ, spriteHolder = self.frontSpriteH})
    mj:set_skin(self.mjColorSet, self.mjScaleSet)
    MjManager.insert(mj, MjManager.mjType.custom)
    self.laiZiText.text = self.ConfigData.laiziTagTitle or "宝牌"
    self.baoPai:SetActive(true)
end
---癞根
function TableView:game_state_lai_gen(show)
    self.laiGenMJ:SetActive(show)
    if(not show) then
        return
    end
    ---@type Mj2D
    local mj = Mj2D:new(self.gameState.LaiGen, nil, {gameObject = self.laiGenMJ, spriteHolder = self.frontSpriteH})
    mj:set_skin(self.mjColorSet, self.mjScaleSet)
    MjManager.insert(mj, MjManager.mjType.custom)
    self.laiGenText.text = self.ConfigData.laigenTagTitle or "翻牌"
    self.baoPai:SetActive(true)
end
---尾张
function TableView:game_state_wei_zhang(show)
    self.WeiZhang:SetActive(show)
    if(not show) then
        return
    end
    ---@type Mj2D
    local mj = Mj2D:new(self.gameState.WeiZhang, nil, {gameObject = self.WeiZhang, spriteHolder = self.frontSpriteH})
    mj:set_skin(self.mjColorSet, self.mjScaleSet)
    MjManager.insert(mj, MjManager.mjType.custom)
    self.weiZhangText.text = "杠后翻"
    self.baoPai:SetActive(true)
end
--- 可以显示过
function TableView:can_show_guo()
    return true
end
---显示操作选择
function TableView:show_wait_action()
    self.waitAction:SetActive(true)
    self.actionGuo:SetActive(self:can_show_guo())
    self.lastShowActionWaitTime = UnityEngine.Time.time  ---记录最近一次显示Action操作的时间
end
---可吃
function TableView:show_ke_chi(show)
    self.actionChi:SetActive(show)
    if(show) then
        self:show_wait_action()
    end
end
---可碰
function TableView:show_ke_peng(show)
    self.actionPeng:SetActive(show)
    if(show) then
        self:show_wait_action()
    end
end
---可杠
function TableView:show_ke_gang(show)
    self.actionGang:SetActive(show)
    if(show) then
        self:show_wait_action()
    end
end
---可补花
function TableView:show_ke_bu_hua(show)
    self.actionBuHua:SetActive(show)
    if(show) then
        self:show_wait_action()
    end
end
---可胡
function TableView:show_ke_hu(show)
    self.actionHu:SetActive(show)
    if(show) then
        self:show_wait_action()
    end
    if show then
        ModuleCache.LogManager.try_write_log("actionHu 当前状态 : "..tostring(self.actionHu.activeSelf))
        ModuleCache.LogManager.try_write_log("waitAction 当前状态 : "..tostring(self.waitAction.activeSelf))
    end
end
---可飘花
function TableView:show_ke_piao_hua(show)
    self.selectHua:SetActive(show)
end
---可听
function TableView:show_ke_ting(show)
    self.actionTing:SetActive(show)
    if(show) then
        self:show_wait_action()
    end
end
---定缺条件
function TableView:can_ding_que()
    return true
end
---显示定缺
function TableView:show_ding_que(allQue)
    if(not self:can_ding_que()) then
        return
    end
    if(not allQue) then
        ModuleCache.ModuleManager.show_module("majiang", "tableadd")
    else
        ModuleCache.ModuleManager.hide_module("majiang", "tableadd")
        --显示头像上的条，万，筒
        for i=1,#self.gameState.Player do
            local seatHolder = self.seatHolderArray[self:server_to_local_seat(i - 1)]
            if(seatHolder.enable) then
                ComponentUtil.SafeSetActive(seatHolder.queSprite.transform.parent.gameObject, true)

                seatHolder.queSprite.sprite = seatHolder.QueSH:FindSpriteByName((self.gameState.Player[i].Que) .. "")
                seatHolder.queSprite:SetNativeSize()
            end
        end
    end
end
---自己处理state中的action
function TableView:handle_action_me(localSeat, action)
    self:handle_mjs_out_hand_mj(0)
    self:hide_ting_hu_grid()
    self:handle_action_other(localSeat, action)
end
---他人处理state中的action
function TableView:handle_action_other(localSeat, action)
    local seatHolder = self.seatHolderArray[localSeat]
    self:play_action_sound(self:get_action_sound(action), seatHolder)
    self:play_action_tx(self:get_action_tx(action), seatHolder)
end
---获取操作的声音
function TableView:get_action_sound(action)
    if(action == self.actions.hu) then
        return 0
    end
    return action
end
---获取操作的特效
function TableView:get_action_tx(action)
    if(not self.curTableData.isPlayBack and action == self.actions.pass) then
        return 0
    end
    return action
end
---中途能否报听
function TableView:show_mid_ting(showMidTing)
    return #self.gameState.KeLiang > 0 and self.ConfigData.isMidTing and showMidTing
end
---播放操作的特效
function TableView:play_action_tx(action, seatInfo)
    seatInfo:play_action_tx(action)
end
---显示座位的三口标记
function TableView:show_seat_sankou(localSeat, show)
    ---@type SeatHolder2D
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder:show_sankou(show)
end
---三口被打开（三口已被激活）
function TableView:game_state_sankou_open()
    self.sanKouObj:SetActive(true)
    self.openSanKouObj:SetActive(true)
    self.closeSanKouObj:SetActive(false)
end
---三口被关闭（三口已被激活）
function TableView:game_state_sankou_close()
    self.sanKouObj:SetActive(true)
    self.openSanKouObj:SetActive(false)
    self.closeSanKouObj:SetActive(true)
end
---三口没激活
function TableView:game_state_sankou_disable()
    self.sanKouObj:SetActive(false)
end
---显示听牌标志
function TableView:show_ting_pai_tag(localSeat, show)
    ---@type SeatHolder2D
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder:show_ting_pai_tag(show)
end
--- 显示飘花
function TableView:show_piao_hua(piaoHuaNum, localSeat)
    ---@type SeatHolder2D
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder:show_piao_hua(piaoHuaNum)
end
--- 显示连庄
function TableView:show_remain_banker_num(lianzhuangnum, localSeat)
    ---@type SeatHolder2D
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder:show_remain_banker_num(lianzhuangnum)
end
---开始设置玩家状态（gameState）
function TableView:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
    self.roomType:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
end
---结束设置玩家状态（gameState）
function TableView:game_state_end_set_player_state(playerState, localSeat, serverSeat)

end
---结束刷新gameState
function TableView:game_state_end()
    self.roomType:game_state_end()
end

--- 弃牌刷新之前 serverSeat 服务器座位
function TableView:game_state_begin_out(serverSeat)

end

--- 弃牌刷新之后 serverSeat 服务器座位 curOutNum 当前弃牌数量 preOutNum 前次弃牌数量
function TableView:game_state_end_out(params)

end

--- 设置弃牌 outData 弃牌数据 localSeat 本地座位 outIndex 索引 showPointer 显示箭头 lastOut 最后出的一个牌 serverSeat 服务器座位 playerState 玩家数据
function TableView:set_out_data(params)

end

--- 刷新下张之前 serverSeat 服务器座位
function TableView:game_state_begin_down(serverSeat)

end

--- 刷新下张之后 changeType 0 不变 1 增加 2 减少 serverSeat 服务器座位
function TableView:game_state_end_down(serverSeat, changeType)

end

--- 设置下张牌堆 downData 下张数据 localSeat 本地座位 serverSeat 服务器座位 downIndex 索引
function TableView:set_down_data(params)

end

--- 花刷新之前 serverSeat 服务器座位
function TableView:game_state_begin_hua(serverSeat)

end

--- 花牌刷新之后 serverSeat 服务器座位 curHuaNum 当前花牌数量 preHuaNum 前次花牌数量
function TableView:game_state_end_hua(params)

end

--- 设置花牌 huaData 花牌数据 serverSeat 服务器座位 huaIndex 索引 playerState 玩家数据
function TableView:set_hua_data(params)

end

--- 刷新所有麻将皮肤
function TableView:refresh_all_mj_skin()
    local allMj = MjManager.all()
    for key, value in pairs(allMj) do
        ---@type Mj2D
        local mj = value.mj
        mj:set_skin(self.mjColorSet, self.mjScaleSet, value.gameObject)
    end
end

--- 刷新麻将样式和背景颜色
function TableView:refresh_mj_color_scale(refreshState)

end

--- 刷新牌桌背景颜色
function TableView:refresh_table_bg()

end

--- 可以胡
function TableView:can_hu()
    return self.actionHu.activeSelf and self.waitAction.activeSelf
end

--- 显示分数
function TableView:show_score(playerState, localSeat, serverSeat)
    local gameState = self.gameState
    ---@type SeatHolder2D
    local seatHolder = self.seatHolderArray[localSeat]
    local beishu = playerState.ZongBeiShu
    local change = playerState.ZongBeiShu - self.lastGameState.Player[serverSeat + 1].ZongBeiShu
    seatHolder:set_score(beishu)
    local briefResultSetting  = self:getBriefOneGameResultSetting()
    local isBriefResult = self.ConfigData.useBriefOneGameResult and (briefResultSetting == 1)
    if isBriefResult then
        return
    end
    seatHolder:play_score_change_text(change)
end

--- 获取短语
function TableView:get_chat_short_text(index)
    local locationSetting = self:getCurLocationSetting()
    if(self.ConfigData.chatShotTextList and 1 == locationSetting) then
        return self.ConfigData.chatShotTextList[index]
    end
    return TableUtil.get_chat_text(index)
end

---显示推荐出牌
function TableView:show_recommend_out_mj(pai)
    ComponentUtil.SafeSetActive(self.recommendOutMjParent, true)
    if not self.frontSpriteH then
        self.frontSpriteH = GetComponentWithPath(self.root, "Center/FrontSpriteH", "SpriteHolder")
    end
    ---@type Mj2D
    local mj = Mj2D:new(pai,self.recommendOutMjParent, {cloneName = "Button_RecOutMj",index = 1,spriteHolder = self.frontSpriteH})
    mj:set_skin(self.mjColorSet, self.mjScaleSet)
    MjManager.insert(mj,MjManager.mjType.custom,1)
end
---隐藏推荐出牌
function TableView:hide_recommend_out_mj()
    ComponentUtil.SafeSetActive(self.recommendOutMjParent, false)
end
---打出推荐出牌
function TableView:recommend_out_mj(obj)
    if self:can_out() then
        ---@type Mj2D
        local recommendMj = self:get_mj(obj)
        local pai = recommendMj.pai
        local myhandMjs = self:get_my_hand_mjs()
        for i=1,#myhandMjs do
            ---@type Mj2D
            local mj = myhandMjs[i]
            if mj.pai == pai then
                --self:hide_recommend_out_mj()
                return mj
            end
        end
    end
end

---显示开杠打色
function TableView:show_kaigang_dice(dice1,dice2,callback)
    self:play_dice(callback,dice1,dice2)
end


---获取手张中，牌角标类型
function TableView:get_hand_tag_type(pai,gameState)
    if self:is_laizi(pai,gameState) then
        return self.ConfigData.laiziTag or 4
    end
    return nil
end
---获取花牌中,牌角标类型
function TableView:get_hua_tag_type(pai,gameState)
    if self:is_laizi(pai,gameState) then
        return self.ConfigData.laiziTag or 4
    end
    return nil
end
---获取弃张中，牌角标类型
function TableView:get_out_tag_type(pai,gameState)
    if self:is_laizi(pai,gameState) then
        return self.ConfigData.laiziTag or 4
    end
    return nil
end
---获取下张中，牌角标类型
function TableView:get_down_tag_type(pai,gameState)
    if self:is_laizi(pai,gameState) then
        return self.ConfigData.laiziTag or 4
    end
    return nil
end

---判断是否能够使用简略小结算显示小结算
function TableView:need_use_brief_one_game_result(resultType)
    local isBriefResult = false
    local briefResultSetting = self:getBriefOneGameResultSetting()
    isBriefResult = self.ConfigData.useBriefOneGameResult and (briefResultSetting == 1) and (resultType ~= 2)
    return isBriefResult
end

---从文件直接加载播放2D特效
function TableView:play_2d_effect_form_file(effectName,time,worldPos,parentGameObject,scaleZoom)
    local s1 = "majiang/effect/mahjong/prefab/2deffect/"..string.lower(effectName)..".prefab"
    local s2 = effectName
    scaleZoom = scaleZoom or 1
    local obj = ModuleCache.ViewUtil.InitGameObject(s1, s2,parentGameObject)
    obj.transform.position = worldPos
    obj.transform.localScale = Vector3.one * scaleZoom
    if time then
        self:subscibe_time_event(time, false, 0):OnComplete(function()
            UnityEngine.GameObject.Destroy(obj)
        end)
    end
    return obj
end


function TableView:show_player_score_change_display(seatHolder,change)
    if 0 == change then
        return
    end
    local localSeat = seatHolder.seatId
    if not self.playerScoreChangeAniPanel then
        local s1 = "majiang/module/table/playerscorechangedisplay.prefab"
        local s2 = "PlayerScoreChangeDisplay"
        self.playerScoreChangeAniPanel = ModuleCache.ViewUtil.InitGameObject(s1, s2,self.root)
        local Players = GetComponentWithPath(self.playerScoreChangeAniPanel,"Players", ComponentTypeName.Transform).gameObject
        self.PSCPlayerHolders = {}
        local objs = TableUtil.get_all_child(Players)
        for i=1,#objs do
            local obj = objs[i]
            local holder = {}
            holder.root = obj
            holder.scoreText = GetComponentWithPath(obj,"ScoreText","TextWrap")
            holder.text = GetComponentWithPath(obj,"bg/Text", ComponentTypeName.Text)
            holder.root:SetActive(false)
            table.insert(self.PSCPlayerHolders,holder)
        end
        self.PSCAddTextAtlas = GetComponentWithPath(self.playerScoreChangeAniPanel,"AddTextAtlas","SpriteAtlas")
        self.PSCSubTextAtlas = GetComponentWithPath(self.playerScoreChangeAniPanel,"SubTextAtlas","SpriteAtlas")
    end
    local holder = self.PSCPlayerHolders[localSeat]
    holder.root:SetActive(true)
    local effectName = nil
    if change > 0 then
        holder.scoreText.atlas = self.PSCAddTextAtlas
        holder.scoreText.text = "+"..change
        effectName = "Effect_jinbi_jinse"
    elseif change < 0 then
        holder.scoreText.atlas = self.PSCSubTextAtlas
        holder.scoreText.text = tostring(change)
        effectName = "Effect_jinbi_lanse"
    else
        holder.scoreText.text = "0"
        holder.root:SetActive(false)
    end
    if effectName then
      local effectObj = self:play_2d_effect_form_file(effectName,2,holder.root.transform.position,holder.root)
      effectObj.transform.localPosition = Vector3(92,effectObj.transform.localPosition.y,effectObj.transform.localPosition.z)
    end
end

function TableView:hide_player_score_change_display(localSeat)
    if not self.PSCPlayerHolders then
        return
    end
    if not localSeat then
        for i=1,#self.PSCPlayerHolders do
            local holder = self.PSCPlayerHolders[i]
            holder.root:SetActive(false)
        end
    else
        self.PSCPlayerHolders[localSeat].root:SetActive(false)
    end
end


---上传可以胡牌时的截图
function TableView:try_uploald_hu_screen_shot()
    if true then
        return  ---暂时屏蔽这个功能
    end

    if not self.ConfigData.openHuScreenShotUpload then
        return
    end


    if not self.gameState
            or (not self.gameState.KeHu)
            or  (#self.gameState.KeHu <= 0) then
        return
    end

    local gameState = self.gameState
    local myUserId = TableManager.curTableData.seatUserIdInfo[tostring(TableManager.curTableData.SeatID)]
    local roomId = TableManager.curTableData.RoomID
    local curRound = gameState.CurRound
    local seqNo = gameState.SeqNo
    local time = os.date("%Y-%m-%d-%H-%M-%S", os.time())
    local key =  TableManager.curTableData.App_Name.."_"..tostring(myUserId).."_"..tostring(roomId).."_"..tostring(curRound).."_"..tostring(seqNo).."_"..tostring(time) .. ".jpg"

    if not TextureScaler then
        --TODO:六安iOS端没有直接导出TextureScaler
        TextureScaler = require("TextureScaler")
    end

    ModuleCache.Coroutine.StartCoroutine(function ()
        ModuleCache.Coroutine.WaitForEndOfFrame()
        local startTime = ModuleCache.Log.cur_time()
        local screenWith = UnityEngine.Screen.width
        local screenHeight = UnityEngine.Screen.height
        ModuleCache.TextureCacheManager.init()
        local texture2D_ScreenShot = UnityEngine.Texture2D(screenWith, screenHeight, ModuleCache.TextureCacheManager.textprompt, false)
        texture2D_ScreenShot:ReadPixels(UnityEngine.Rect(0, 0, screenWith, screenHeight), 0, 0, false);
        texture2D_ScreenShot:Apply()
        local diffTime1 = ModuleCache.Log.cur_time() - startTime
        ModuleCache.Coroutine.Yield()
        ModuleCache.Coroutine.Yield()

        startTime = ModuleCache.Log.cur_time()
        local diffTime2 = ModuleCache.Log.cur_time() - startTime
        local v2 = ModuleCache.TextureCacheManager.GetTexture2dSize(texture2D_ScreenShot)
        local height = 480
        texture2D_ScreenShot = TextureScaler.scaled(texture2D_ScreenShot, math.ceil(v2.x / v2.y * height), height,3)
        ModuleCache.Coroutine.Yield()

        startTime = ModuleCache.Log.cur_time()
        local bytes = UnityEngine.ImageConversion.EncodeToJPG(texture2D_ScreenShot, 15)
        local diffTime3 = ModuleCache.Log.cur_time() - startTime

        ModuleCache.OssManager.upload_file("PlayerHuStateScreenShot".."/"..key, nil, bytes, function(key, path, bytes, url)
            print("可胡截图上传成功")
        end,nil,"image/jpeg", nil,function(key, path, bytes, url)
            print("可胡截图上传失败")
            local screenShotPath = UnityEngine.Application.persistentDataPath .. "/screenShotHu/" .. key.. ".jpg"
            ModuleCache.FileUtility.SaveFile(screenShotPath, bytes, false)
        end)
        if diffTime1 > 10 then
            ModuleCache.Log.report_exception("麻将胡牌截图太慢",  tostring(diffTime1) .. "_" ..tostring(diffTime2).. "_" ..tostring(diffTime3))
        end
    end)
end 

return  TableView