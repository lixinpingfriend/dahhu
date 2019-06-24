



local Util = Util
local TableManager = TableManager
local Vector3 = Vector3
local Vector2 = Vector2
local math = math
local TableUtil = TableUtil
local ModuleCache = ModuleCache
local AppData = AppData
local Config = Config
local Tweening = DG.Tweening
local DOTween = DG.Tweening.DOTween
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local CSmartTimer = ModuleCache.SmartTimer.instance
local PlayerPrefs = UnityEngine.PlayerPrefs
local class = require("lib.middleclass")
local ViewBase = require('package.majiang.module.tablebase.tablebase_view')
--- @class TableView:TableBaseView
local TableView = class('tableView', ViewBase)
local Color = UnityEngine.Color
local totalSeat = 4
local gameState = nil
local curTableData = nil
local selectCardXOffset = 80
local selectCardYOffset = 135
local maxShouPaiNum = 14 -- 最大手牌数量
local xiaZhangWidth = { 80, 35, 82, 35 } -- 下张宽度
local rightWidthOffsets = -- 手张宽度偏移
{
    ["20"] = {82,35,38,35},
    ["14"] = {87,35,38,35}
}
local rightWidthOffset = nil
local xiaZhangScaleAll = --下张麻将比例
{
    ["20"] = {0.65, 0.86, 0.385, 0.86},
    ["14"] = {0.85, 1, 0.5, 1},
}
local pointerPos =
{
    Vector3.New(0,-38,0),
    Vector3.New(38,0,0),
    Vector3.New(0,38,0),
    Vector3.New(-38,0,0),
}
local xiaZhangScale = nil
local lastMJOffset = 20 --最后一张牌位移
local outGridCell =  --弃张摆放宫格位移
{
    {82,104},
    {-54,36},
    {-82,-104},
    {54,-36},
}
local outGridNum = 10 --弃张每行数量
local allCardNum = 43
local allCard = {}
local colorMj = {}
local seatAnchors = {"BottomLeft", "Right", "Top", "Left"}
local mCPGHLClipName

local mPaiClipName =
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

function TableView:initialize(...)
    mCPGHLClipName =
    {
        ["1"] = {"chi1"},
        ["2"] = {"peng1"},
        ["3"] = {"gang1"},
        ["4"] = {"gang1"},
        ["5"] = {"gang1"},
        ["6"] = {"dianpao1"},
        ["7"] = {"ting"},
        ["21"] = {"qishouhu1"},
        ["22"] = {"qishouhu2"},
        ["23"] = {"qishouhu3"},
        ["24"] = {"qishouhu4"},
        ["25"] = {"xg_liangdao"},
        ["31"] = {"zimo1"},
        ["33"] = {"dianpao1"},
    }

    gameState = nil
    curTableData = TableManager.curTableData
    self.packageName = "public"
    self.moduleName = 'table'
    ViewBase.initialize(self, "majiang/module/table/henanmj_table.prefab", "HeNanMJ_Table", 0, true)
    local gameEventCollector = ModuleCache.ComponentManager.GetComponent(self.root, "UGUIExtend.GameEventCollector")
    gameEventCollector.moduleName = "table"
    local UIStateSwitcher = ModuleCache.ComponentManager.GetComponent(self.root, "UIStateSwitcher")
    if(ModuleCache.GameManager.iosAppStoreIsCheck)then
        UIStateSwitcher:SwitchState("IosCheck")
    else
        UIStateSwitcher:SwitchState("Normal")
    end
    xiaZhangScale = xiaZhangScaleAll[maxShouPaiNum .. ""]
    rightWidthOffset = rightWidthOffsets[maxShouPaiNum .. ""]
    TableManager.seatNumTable = {0,1,2,3}

    self.tableBg1 = ModuleCache.ComponentUtil.Find(self.root, "Center/ImageBackground")
    self.tableBg2 = ModuleCache.ComponentUtil.Find(self.root, "Center/ImageBackground2")
    self.tableBg3 = ModuleCache.ComponentUtil.Find(self.root, "Center/ImageBackground3")

    self.tableBackgroundSprite = GetComponentWithPath(self.root, "Center/ImageBackground", ComponentTypeName.Image).sprite
    self.tableBackgroundSprite2 = GetComponentWithPath(self.root, "Center/ImageBackground2", ComponentTypeName.Image).sprite
    self.tableBackgroundSprite3 = GetComponentWithPath(self.root, "Center/ImageBackground3", ComponentTypeName.Image).sprite

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
    self.buttonWarning.gameObject:SetActive(false);
    self.rightMenu:SetActive(false);

    self.buttonMic = GetComponentWithPath(self.root, "BottomRight/Child/Action/ButtonMic", ComponentTypeName.Button)
    self.buttonChat = GetComponentWithPath(self.root, "BottomLeft/Child/Action/ButtonChat", ComponentTypeName.Button)
    self.textRoomNum1 = GetComponentWithPath(self.root, "TopLeft/Child/Begin/RoomID/ImageBackground/Text", ComponentTypeName.Text)
    self.textWanFa = GetComponentWithPath(self.root, "Center/Child/WanFa", ComponentTypeName.Text)
    self.textRoomNum2 = GetComponentWithPath(self.root, "Center/Child/ButtonRule", ComponentTypeName.Text)
    self.textRoomRule = GetComponentWithPath(self.root, "Top/Child/RoomInfo/Text", ComponentTypeName.Text)
    self.gameController = GetComponentWithPath(self.root, "Center/Child/GameController", ComponentTypeName.Transform).gameObject
    self.ImageRandom = GetComponentWithPath(self.root, "Center/Child/ImageRandom", ComponentTypeName.Transform).gameObject
    self.inviteAndExit = GetComponentWithPath(self.root, "Bottom/Child/InviteAndExit", ComponentTypeName.Transform).gameObject
    self.buttonInvite = GetComponentWithPath(self.inviteAndExit, "ButtonInvite", ComponentTypeName.Transform).gameObject
    --self.buttonExit = GetComponentWithPath(self.inviteAndExit, "ButtonExit", ComponentTypeName.Transform).gameObject
    self.buttonExit = GetComponentWithPath(self.root, "TopLeft/Child/Ready/ButtonExit", ComponentTypeName.Transform).gameObject
    self.buttonBegin = GetComponentWithPath(self.inviteAndExit, "ButtonBegin", ComponentTypeName.Transform).gameObject

    self.buttonEarlyStart = GetComponentWithPath(self.inviteAndExit, "ButtonEarlyStart", ComponentTypeName.Transform).gameObject
    self.earlyStartNumText = GetComponentWithPath(self.buttonEarlyStart, "Text", ComponentTypeName.Text)
    self.earlyStartGray =  GetComponentWithPath(self.buttonEarlyStart, "Gray", ComponentTypeName.Transform).gameObject
    self.earlyStartGrayText = GetComponentWithPath(self.earlyStartGray, "Text", ComponentTypeName.Text)

    self.beginCountDownObj = GetComponentWithPath(self.buttonBegin, "Count down",ComponentTypeName.Transform).gameObject
    self.beginImgObj = GetComponentWithPath(self.buttonBegin, "Image", ComponentTypeName.Transform).gameObject

    self.buttonBegin_countDownTex = GetComponentWithPath(self.inviteAndExit, "ButtonBegin/Count down/Text", ComponentTypeName.Text)
    self.selectZun = GetComponentWithPath(self.root, "Bottom/Child/SelectZun", ComponentTypeName.Transform).gameObject
    self.selectHua = GetComponentWithPath(self.root, "Bottom/Child/SelectHua", ComponentTypeName.Transform).gameObject
    self.selectHaiDi = GetComponentWithPath(self.root, "SelectHaiDi", ComponentTypeName.Transform).gameObject
    self.selectKaiGang = GetComponentWithPath(self.root, "Center/Child/KaiGang", ComponentTypeName.Transform).gameObject
    self.kaiGangMJ1 = GetComponentWithPath(self.selectKaiGang, "1", ComponentTypeName.Transform).gameObject
    self.kaiGangMJ2 = GetComponentWithPath(self.selectKaiGang, "2", ComponentTypeName.Transform).gameObject
    self.baoPai = GetComponentWithPath(self.root, "Left/Child/BaoPai", ComponentTypeName.Transform).gameObject
    self.laiGenMJ = GetComponentWithPath(self.baoPai, "Grid/LaiGenMJ", ComponentTypeName.Transform).gameObject
    self.laiZiMJ = GetComponentWithPath(self.baoPai, "Grid/LaiZiMJ", ComponentTypeName.Transform).gameObject
    self.laiGenText = GetComponentWithPath(self.baoPai, "Grid/LaiGenMJ/ImageText", ComponentTypeName.Text)
    self.laiZiText = GetComponentWithPath(self.baoPai, "Grid/LaiZiMJ/ImageText", ComponentTypeName.Text)
    self.baoPaiMidText = GetComponentWithPath(self.root, "Left/Child/BaoPai/ImageText", ComponentTypeName.Text)
    self.xlszObj = GetComponentWithPath(self.root, "Left/Child/XLSZ", ComponentTypeName.Transform).gameObject
    self.xlszGrid = GetComponentWithPath(self.root, "Left/Child/XLSZ/Grid", ComponentTypeName.Transform).gameObject
    self.xlszChilds = TableUtil.get_all_child(self.xlszGrid)
    self.xlszTitleText = GetComponentWithPath(self.root, "Left/Child/XLSZ/ImageText", ComponentTypeName.Text)

    self.waitAction = GetComponentWithPath(self.root, "Bottom/Child/WaitAction", ComponentTypeName.Transform).gameObject
    self.waitActions = TableUtil.get_all_child(self.waitAction)
    self.waitActions[#self.waitActions+1] = GetComponentWithPath(self.root, "Bottom/Child/Button_Guo", ComponentTypeName.Transform).gameObject

    self.actionBtHu = GetComponentWithPath(self.waitAction, "Button_Hu", ComponentTypeName.Transform).gameObject  ---1
    self.actionBtYaHu = GetComponentWithPath(self.waitAction, "Button_YaHu", ComponentTypeName.Transform).gameObject---2
    self.actionBtTing = GetComponentWithPath(self.waitAction, "Button_Ting", ComponentTypeName.Transform).gameObject ---3
    self.actionBtDiao = GetComponentWithPath(self.waitAction, "Button_Diao", ComponentTypeName.Transform).gameObject ---4
    self.actionBtChi = GetComponentWithPath(self.waitAction, "Button_Chi", ComponentTypeName.Transform).gameObject ---5
    self.actionBtPeng = GetComponentWithPath(self.waitAction, "Button_Peng", ComponentTypeName.Transform).gameObject ---6
    self.actionBtGang = GetComponentWithPath(self.waitAction, "Button_Gang", ComponentTypeName.Transform).gameObject ---7
    self.actionBtBuHua = GetComponentWithPath(self.waitAction, "Button_BuHua", ComponentTypeName.Transform).gameObject ---8
    self.actionBtLiang = GetComponentWithPath(self.waitAction, "Button_Liang", ComponentTypeName.Transform).gameObject ---9
    self.actionBtNang = GetComponentWithPath(self.waitAction, "Button_Nang", ComponentTypeName.Transform).gameObject ---10
    self.actionBtGuo = GetComponentWithPath(self.root, "Bottom/Child/Button_Guo", ComponentTypeName.Transform).gameObject --11

    self.waitActionCS = GetComponentWithPath(self.root, "Bottom/Child/WaitActionCS", ComponentTypeName.Transform).gameObject
    self.waitActionCSs = TableUtil.get_all_child(self.waitActionCS)

    self.feixiaoJi = GetComponentWithPath(self.root, "Bottom/Child/FeiXiaoJiBg", ComponentTypeName.Transform).gameObject
    self.feixiaoJiMJ1 = GetComponentWithPath(self.root, "Bottom/Child/FeiXiaoJiBg/BuZhang_1", ComponentTypeName.Transform).gameObject
    self.feixiaoJiMJ2 = GetComponentWithPath(self.root, "Bottom/Child/FeiXiaoJiBg/BuZhang_2", ComponentTypeName.Transform).gameObject

    self.buttongHuanSZ = GetComponentWithPath(self.root, "Bottom/Child/Button_Huan", ComponentTypeName.Transform).gameObject
    self.buttongHuanSZDisable = GetComponentWithPath(self.root, "Bottom/Child/Button_HuanDisable", ComponentTypeName.Transform).gameObject

    self.buliangObj = GetComponentWithPath(self.root, "BuLiangBg", ComponentTypeName.Transform).gameObject
    self.selectLiangObj = GetComponentWithPath(self.root, "SelectLiangBg", ComponentTypeName.Transform).gameObject
    ---@type UnityEngine.UI.Button
    self.selectLiangGray = GetComponentWithPath(self.root, "SelectLiangBg/Button_SelectGray", ComponentTypeName.Transform).gameObject

    self.sanKouObj = GetComponentWithPath(self.root, "BottomLeft/Child/SanKou", ComponentTypeName.Transform).gameObject
    self.openSanKouObj = GetComponentWithPath(self.root, "BottomLeft/Child/SanKou/Image1", ComponentTypeName.Transform).gameObject
    self.closeSanKouObj = GetComponentWithPath(self.root, "BottomLeft/Child/SanKou/Image2", ComponentTypeName.Transform).gameObject
    self.timeDown = GetComponentWithPath(self.gameController, "TimeDown", ComponentTypeName.Transform).gameObject
    self.waitObj = GetComponentWithPath(self.gameController, "Wait", ComponentTypeName.Transform).gameObject
    self.diceObj = GetComponentWithPath(self.root, "Dice", ComponentTypeName.Transform).gameObject
    self.diceAni = GetComponentWithPath(self.root, "Dice/Animation", "UIImageAnimation")
    self.diceImage1 = GetComponentWithPath(self.root, "Dice/Image1", ComponentTypeName.Image)
    self.diceImage2 = GetComponentWithPath(self.root, "Dice/Image2", ComponentTypeName.Image)
    self.diceImage1SH = GetComponentWithPath(self.root, "Dice/Image1", "SpriteHolder")
    self.diceImage2SH = GetComponentWithPath(self.root, "Dice/Image2", "SpriteHolder")
    self.timer1imgSprite = GetComponentWithPath(self.timeDown, "Image1", "SpriteHolder")
    self.timer2imgSprite = GetComponentWithPath(self.timeDown, "Image2", "SpriteHolder")
    self.timer1img = GetComponentWithPath(self.timeDown, "Image1", ComponentTypeName.Image)
    self.timer2img = GetComponentWithPath(self.timeDown, "Image2", ComponentTypeName.Image)
    self.pointerObj = GetComponentWithPath(self.root, "Center/Child/Pointer", ComponentTypeName.Transform).gameObject
    self.lightObj = GetComponentWithPath(self.gameController, "Light", ComponentTypeName.Transform).gameObject
    self.jushuObj = GetComponentWithPath(self.gameController, "JuShu", ComponentTypeName.Transform).gameObject
    self.jushu = GetComponentWithPath(self.gameController, "JuShu/Text", ComponentTypeName.Text)
    self.remain = GetComponentWithPath(self.gameController, "Remain/Text", ComponentTypeName.Text)
    self.remainAni = GetComponentWithPath(self.gameController, "Remain/Text", "UnityEngine.Animation")
    self.cloneParent = GetComponentWithPath(self.root, "Clone", ComponentTypeName.Transform).gameObject
    self.cloneSeat = GetComponentWithPath(self.cloneParent, "Seat", ComponentTypeName.Transform).gameObject
    self.selectCardPanel = GetComponentWithPath(self.root, "Bottom/Child/SelectCardPanel", ComponentTypeName.Transform).gameObject
    self.selectCardPanelRight = GetComponentWithPath(self.root, "BottomRight/Child/SelectCardPanelRight", ComponentTypeName.Transform).gameObject
    self.buttonGangRight = GetComponentWithPath(self.root, "BottomRight/Child/Button_Gang_Right", ComponentTypeName.Transform).gameObject
    self.buttonGangRightDisable = GetComponentWithPath(self.root, "BottomRight/Child/Button_Gang_Right_Disable", ComponentTypeName.Transform).gameObject
    self.selectCardClone1 = GetComponentWithPath(self.selectCardPanel, "1_SelectCard", ComponentTypeName.Transform).gameObject
    self.selectCardClone2 = GetComponentWithPath(self.selectCardPanel, "2_SelectCard", ComponentTypeName.Transform).gameObject
    self.selectCardClone3 = GetComponentWithPath(self.selectCardPanel, "3_SelectCard", ComponentTypeName.Transform).gameObject
    self.selectCardClone4 = GetComponentWithPath(self.selectCardPanel, "4_SelectCard", ComponentTypeName.Transform).gameObject
    self.selectCardClone1Pos = self.selectCardClone1.transform.localPosition
    self.selectCardClone2Pos = self.selectCardClone2.transform.localPosition
    self.selectCardClone3Pos = self.selectCardClone3.transform.localPosition
    self.selectCardClone4Pos = self.selectCardClone4.transform.localPosition
    self.grayMat = GetComponentWithPath(self.cloneParent, "GrayMatImage", ComponentTypeName.Image).material
    self.tingGridParent = GetComponentWithPath(self.root, "Bottom/Child/TingGrid", ComponentTypeName.Transform).gameObject
    self.huGridParent = GetComponentWithPath(self.root, "Bottom/Child/HuGrid", ComponentTypeName.Transform).gameObject
    self.tingGrid = GetComponentWithPath(self.tingGridParent, "Grid", ComponentTypeName.Transform).gameObject
    self.tingJianZiHu = GetComponentWithPath(self.tingGridParent, "JianZiHu", ComponentTypeName.Image)
    self.tingJianZiHuSH = GetComponentWithPath(self.tingGridParent, "JianZiHu", "SpriteHolder")
    self.huGrid = GetComponentWithPath(self.huGridParent, "Grid", ComponentTypeName.Transform).gameObject
    self.jianZiHu = GetComponentWithPath(self.huGridParent, "JianZiHu", ComponentTypeName.Image)
    self.jianZiHuSH = GetComponentWithPath(self.huGridParent, "JianZiHu", "SpriteHolder")
    self.readyTopLeft = GetComponentWithPath(self.root, "TopLeft/Child/Ready", ComponentTypeName.Transform).gameObject
    self.beginTopLeft = GetComponentWithPath(self.root, "TopLeft/Child/Begin", ComponentTypeName.Transform).gameObject
    self.huanSanzTip = GetComponentWithPath(self.root, "Center/Child/HuanTip", ComponentTypeName.Transform).gameObject
    self.csSelectKaiGang = GetComponentWithPath(self.root, "SelectKaiGang", ComponentTypeName.Transform).gameObject
    self.yangZhouTip = GetComponentWithPath(self.root, "Center/Child/YangZhouTip", ComponentTypeName.Transform).gameObject
    --GetComponentWithPath(self.buttonBegin, "Image", ComponentTypeName.Transform).gameObject:SetActive(curTableData.RoomType ~= 2)
    --GetComponentWithPath(self.buttonBegin, "Count down", ComponentTypeName.Transform).gameObject:SetActive(curTableData.RoomType == 2)
    self:set_begin_countdown_state(false)

    self.frontSpriteH = GetComponentWithPath(self.root, "Center/FrontSpriteH", "SpriteHolder")
    self.ceSpriteH = GetComponentWithPath(self.root, "Center/CeSpriteH", "SpriteHolder")
    self.TagSpriteH = GetComponentWithPath(self.root, "Center/TagSpriteH", "SpriteHolder")
    self.huTagSpriteH = GetComponentWithPath(self.root, "Center/HuTagSpriteH", "SpriteHolder")
    ---金币场相关控件
    self.goldModeTopLeft = GetComponentWithPath(self.root, "TopLeft/Child/GoldMode", ComponentTypeName.Transform).gameObject
    self.gEixtBtn = GetComponentWithPath(self.root, "TopLeft/Child/GoldMode/GEixtBtn", ComponentTypeName.Transform).gameObject
    self.gRuleBtn = GetComponentWithPath(self.root, "TopLeft/Child/GoldMode/GRuleBtn", ComponentTypeName.Transform).gameObject
    self.gChangeBtn = GetComponentWithPath(self.root, "Bottom/Child/InviteAndExit/ButtonChange", ComponentTypeName.Transform).gameObject
    self.ChangeInvalidTag = GetComponentWithPath(self.root, "Bottom/Child/InviteAndExit/ButtonChange/ChangeInvalidTag", ComponentTypeName.Transform).gameObject
    ComponentUtil.SafeSetActive(self.ChangeInvalidTag,false)
    self.dizhuObj = GetComponentWithPath(self.gameController, "DiZhu", ComponentTypeName.Transform).gameObject
    self.dizhuTxet = GetComponentWithPath(self.gameController, "DiZhu/Text", ComponentTypeName.Text)
    self.noIntrustbtn =  GetComponentWithPath(self.root, "Bottom1/Child/ButtonNoIntrust", ComponentTypeName.Transform).gameObject
    self.coinMatchCountdownObj =  GetComponentWithPath(self.root,"Center/Child/CoinMatchCountdown", ComponentTypeName.Transform).gameObject
    self.coinMatchCountdownTextWrap=  GetComponentWithPath(self.root,"Center/Child/CoinMatchCountdown/Image/Image",  "TextWrap")

    ----牌局结算预览相关
    self.PreSettlementObj = GetComponentWithPath(self.root, "PreSettlement", ComponentTypeName.Transform).gameObject
    self.buttonBackToSettle = GetComponentWithPath(self.root, "PreSettlement/Child/ButtonBackToSettle", ComponentTypeName.Transform).gameObject
    self.buttonContinue = GetComponentWithPath(self.root, "PreSettlement/Child/ButtonContinue", ComponentTypeName.Transform).gameObject
    self.preButtonChange = GetComponentWithPath(self.root, "PreSettlement/Child/ButtonChange", ComponentTypeName.Transform).gameObject
    self.preButtonBegin = GetComponentWithPath(self.root, "PreSettlement/Child/ButtonBegin", ComponentTypeName.Transform).gameObject
    ---End

    self.bigHuaSwitchState =  GetComponentWithPath(self.root, "Center/Child/ImageRandom", "UIStateSwitcher")
    self.addGold = GetComponentWithPath(self.root, "Left/Child/ButtonAddGold", ComponentTypeName.Transform).gameObject
    self:check_play_back()
    self:check_out_grid_num()
    local config = TableManager.curTableData.gameRuleConfig
    local wanfaType = Config.GetWanfaIdx(self.ruleJsonInfo.GameType)
    if(wanfaType > #config.createRoomTable) then
        wanfaType = 1
    end
    self.ConfigData = config.createRoomTable[wanfaType]
    self:init_config()
    xiaZhangScale = xiaZhangScaleAll[maxShouPaiNum .. ""]
    rightWidthOffset = rightWidthOffsets[maxShouPaiNum .. ""]
    self.colorChange = Color.New(255/255, 121/255, 0/255)
    TableUtil.move_clone(self.selectCardClone1, self.cloneParent)
    TableUtil.move_clone(self.selectCardClone2, self.cloneParent)
    TableUtil.move_clone(self.selectCardClone3, self.cloneParent)
    TableUtil.move_clone(self.selectCardClone4, self.cloneParent)
    self.pointerObjs = TableUtil.get_all_child(self.pointerObj)
    self.lightChilds = TableUtil.get_all_child(self.lightObj)
    self.selectZunChilds = TableUtil.get_all_child(self.selectZun)
    self.seatHolderArray = {}
    self.pointerChilds = {}
    for i=1,4 do
        local seatHolder = {}
        local seatPosTran = GetComponentWithPath(self.root, seatAnchors[i] .. "/Child/" .. i, ComponentTypeName.Transform).gameObject
        self:init_seat(seatHolder, i, seatPosTran)
        self.seatHolderArray[i] = seatHolder
        TableUtil.move_clone(seatHolder.outCloneMJ, self.cloneParent)
        seatHolder.outCloneMJ.transform.localScale = Vector3.New(1,1,1)
        TableUtil.move_clone(seatHolder.huaCloneMJ, self.cloneParent)
        seatHolder.huaCloneMJ.transform.localScale = Vector3.New(1,1,1)
        local pointerChild = GetComponentWithPath(self.pointerObjs[i], "Light", ComponentTypeName.Transform).gameObject
        table.insert(self.pointerChilds, pointerChild)
    end
    curTableData.totalSeat = totalSeat
    curTableData.seatHolderArray = self.seatHolderArray
    self.clones = TableUtil.get_all_child(self.cloneParent)

    self:reset_mj(true)

    self.mySeat = curTableData.SeatID
    if(not curTableData.isPlayBack) then
        local mySeatData =
        {
            UserID = curTableData.modelData.roleData.userID,
            SeatID = self.mySeat
        }
        self:refresh_seat_info(mySeatData)
    end

    self.robotBtn = GetComponentWithPath(self.root, "Left/Child/ButtonRobot", ComponentTypeName.Transform).gameObject
    self.robotBtn:SetActive(ModuleCache.GameManager.developmentMode)

    --self:InstantiateGameObjectAsync(ModuleCache.ComponentManager.Find(self.root, "BCS/ButtonBCS"), "publictable/effect/baicaishen/prefab/table_buttonbcs.prefab", "Table_ButtonBCS")
end

function TableView:init_config()
    if(self.ConfigData.isHuangShiHH or (self.ConfigData.isXueLiuCH and not self.ConfigData.isXueZhanDD) or self.ConfigData.isXJGSH) then
        self.bigHuaSwitchState:SwitchState("BigHua")
    else
        self.bigHuaSwitchState:SwitchState("Normal")
    end
    if(self.ConfigData.isKaWuXing) then
        mCPGHLClipName["7"] = {"xg_liangdao"}
    elseif(self.ConfigData.isChangSha) then
        mCPGHLClipName["11"] = {"gang1"}
        mCPGHLClipName["3"] = {"buzhang"}
        mCPGHLClipName["4"] = {"buzhang"}
        mCPGHLClipName["5"] = {"buzhang"}
    elseif(self.ConfigData.isHuangShiHH or self.ConfigData.isDaYeKKF) then
        mCPGHLClipName =
        {
            ["1"] = {"chi1","chi2"},
            ["2"] = {"peng1","peng2"},
            ["3"] = {"gang_bugang"},
            ["4"] = {"gang_angang"},
            ["5"] = {"gang1","gang2"},
            ["25"] = {"liangzhongfabai"},
            ["66"] = {"hu_pengpenghu"},
            ["44"] = {"hu_qingyise"},
            ["51"] = {"gang_fachaigang"},
            ["52"] = {"gang_hongzhonggang"},
            ["53"] = {"gang_laizigang"},
            ["54"] = {"hu_gangkai"},
            ["55"] = {"hu_haohuaqidui"},
            ["56"] = {"hu_jiangyise"},
            ["57"] = {"hu_zimoqidui"},
            ["58"] = {"hu_jiepaoqidui"},
            ["59"] = {"hu_menqingzimo"},
            ["61"] = {"hu_ruanmenqingzimo"},
            ["62"] = {"hu_pihu"},
            ["63"] = {"hu_ruanhuzimo"},
            ["64"] = {"hu_yinghujiepao"},
            ["65"] = {"hu_yingzimo"},
            ["31"] = {"hu_ruanhuzimo"},
            ["33"] = {"hu_wohule"},
        }
    end
    if(self.ConfigData.isDengZhou) then
        maxShouPaiNum = 20
    else
        maxShouPaiNum = 14
    end
end

function TableView:set_begin_countdown_state(off)
    self.beginCountDownObj:SetActive(off)
    self.beginImgObj:SetActive(not off)
end

function TableView:check_play_back()
    if(curTableData.isPlayBack) then
        self.gamerule = curTableData.videoData.gamerule
        self.wanfaName,self.ruleName,totalSeat = TableUtil.get_rule_name(curTableData.videoData.gamerule, curTableData.videoData.hallnum > 0)
        curTableData.HallID = curTableData.videoData.hallnum
    else
        self.gamerule = curTableData.Rule
        self.wanfaName,self.ruleName,totalSeat = TableUtil.get_rule_name(curTableData.Rule, curTableData.HallID > 0)
    end

    curTableData.wanfaName = self.wanfaName
    self.ruleJsonInfo = TableUtil.convert_rule(self.gamerule)
    curTableData.ruleJsonInfo = self.ruleJsonInfo
    self:refresh_mj_color_scale()
    self:refresh_table_bg()
    self.textRoomRule.text = string.format("%s %s", self.wanfaName, self.ruleName)
    ComponentUtil.SafeSetActive(self.topRightObj, not curTableData.isPlayBack)


    ComponentUtil.SafeSetActive(self.buttonSetting.gameObject, not curTableData.isPlayBack)
    ComponentUtil.SafeSetActive(self.bottomRightObj, not curTableData.isPlayBack)
    ComponentUtil.SafeSetActive(self.jushuObj, not curTableData.isPlayBack)
    if 4 == curTableData.RoomType then
        ComponentUtil.SafeSetActive(self.jushuObj,false) ---金币场不显示局数
        ComponentUtil.SafeSetActive(self.dizhuObj,true)
    else
        ComponentUtil.SafeSetActive(self.jushuObj, not curTableData.isPlayBack)
        ComponentUtil.SafeSetActive(self.dizhuObj,false)
    end
    ComponentUtil.SafeSetActive(self.inviteAndExit, not curTableData.isPlayBack)
    --ComponentUtil.SafeSetActive(self.ImageRandom, not curTableData.isPlayBack)
    if(not curTableData.isPlayBack) then
        if(curTableData.HallID > 0) then
            self.textRoomNum1.text = AppData.MuseumName .."房号:" .. curTableData.RoomID
        else
            self.textRoomNum1.text = "房号:" .. curTableData.RoomID
        end

        self.textWanFa.text = self.wanfaName
        self.textRoomNum2.text = self.textRoomNum1.text  --.." "..self.wanfaName
    else
        self.textWanFa.text = self.wanfaName
        if curTableData.videoData.roomid or curTableData.videoData.hallnum then
            if(curTableData.videoData.hallnum and curTableData.videoData.hallnum > 0) then
                self.textRoomNum1.text = AppData.MuseumName .."房号:" ..  curTableData.videoData.roomid
            else
                self.textRoomNum1.text = "房号:" ..  curTableData.videoData.roomid
            end
        end
    end
    if(self.ruleJsonInfo.isPrivateRoom) then
        self.textWanFa.text = self.wanfaName .. " 私人房"
    end
    self.anticheatSwitcher = GetComponentWithPath(self.root, "Center/Child", "UIStateSwitcher")
    --self.addGold:SetActive(curTableData.RoomType == 4)
end

function TableView:check_out_grid_num()---处理不同人数玩法下面，弃张布局不同
    if 2 == totalSeat then
        outGridNum = 17
    else
        outGridNum = 10
    end
end

---设置右侧菜单状态
function TableView:setRightMenuState(state)
    if curTableData.isPlayBack then
        self.rightMenu:SetActive(false)
        return
    end
    self.rightMenu:SetActive(state)
    self.buttonRightOpen.gameObject:SetActive(not state)
    local closeEixtBtn = false
    if nil == gameState then
        self.rbuttonExitText.text = "退出"
    else
        self.rbuttonExitText.text = "解散"
        if TableManager:cur_game_is_gold_room_type() then
            closeEixtBtn = true
        end
    end
    self.rbuttonExit.gameObject:SetActive(not closeEixtBtn)
end

---设置提前开局按钮状态
function TableView:set_early_start_button_state(state,isEnable,curPlayerNum,playerNumData)
    if curTableData.RoomType == 4 then
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

-- 隐藏碰杠列表以及吃法列表
function TableView:hide_wait_action_select_card()
    self.showWaitAction = false
    ComponentUtil.SafeSetActive(self.waitAction, false)
    ComponentUtil.SafeSetActive(self.waitActionCS, false)
    ComponentUtil.SafeSetActive(self.sanKouObj, false)
    ComponentUtil.SafeSetActive(self.actionBtGuo, false)
    self:hide_select_card_childs()
    self.csSelectKaiGang:SetActive(false)
    self.selectLiangObj:SetActive(false)
    self.buliangObj:SetActive(false)
end

-- 显示吃法列表
function TableView:show_chigrid()

    for i=1,#gameState.KeChi do
        local xAddOffset = 0
        for j=1,#gameState.KeChi[i].ChiFa do
            local target = TableUtil.poor("3_SelectCard", self.selectCardPanel,
                self.selectCardClone3Pos + Vector3.New(xAddOffset, (i - 1) * selectCardYOffset, 0), self.poorObjs, self.clones)
            local childs = TableUtil.get_all_child(target)
            local curPai = gameState.KeChi[i].Pai
            local index = #gameState.KeChi[i].ChiFa - j + 1
            for k=1,#childs do
                local mj = childs[k]
                local pai = gameState.KeChi[i].ChiFa[index] + (k - 1)
                if(pai == curPai) then
                    TableUtil.set_mj_color(mj, Color.yellow)
                else
                    TableUtil.set_mj_color(mj, Color.white)
                end
                TableUtil.set_mj(pai, mj, self.mjScaleSet, self.frontSpriteH)
                TableUtil.set_mj_bg(1, mj, self.mjColorSet)
            end
            target.name = "Chi" .. "_3_" .. gameState.KeChi[i].ChiFa[index] .. "_" .. gameState.KeChi[i].Pai
            xAddOffset = xAddOffset - selectCardXOffset * 3 - 10
        end
    end
    ComponentUtil.SafeSetActive(self.selectCardPanel, true)
end

function TableView:set_mj_color(mj, color)
    local childs = TableUtil.get_all_child(mj)
    for i=1,#childs do
        local image = ModuleCache.ComponentManager.GetComponent(childs[i], ComponentTypeName.Image)
        if(image) then
            image.color = color
        end
    end
end

-- 显示碰法列表
function TableView:show_penggrid()

    local xAddOffset = 0
    for i=1,#gameState.KePeng do
        local target = TableUtil.poor("3_SelectCard", self.selectCardPanel, self.selectCardClone3Pos + Vector3.New(xAddOffset, 0, 0), self.poorObjs, self.clones)
        local childs = TableUtil.get_all_child(target)
        local index = #gameState.KePeng - i + 1
        for k=1,#childs do
            local mj =childs[k]
            local pai = gameState.KePeng[index]
            TableUtil.set_mj_color(mj, Color.white)
            TableUtil.set_mj(pai, mj, self.mjScaleSet, self.frontSpriteH)
            TableUtil.set_mj_bg(1, mj, self.mjColorSet)
        end
        target.name = "Peng" .. "_3_" .. gameState.KePeng[index]
        xAddOffset = xAddOffset - selectCardXOffset * 3 - 10
    end
    ComponentUtil.SafeSetActive(self.selectCardPanel, true)
end

-- 显示杠法列表
function TableView:show_ganggrid(parent)
    local selectCardPanel = parent or self.selectCardPanel
    local xAddOffset = 0
    for i=1,#gameState.KeGang do
        if((i - 1) % 6 == 0) then
            xAddOffset = 0
        end
        local target = TableUtil.poor("1_SelectCard", selectCardPanel, self.selectCardClone1Pos + Vector3.New(xAddOffset, math.floor((i - 1) / 6) * (selectCardYOffset + 10), 0), self.poorObjs, self.clones)

        local childs = TableUtil.get_all_child(target)
        local index = #gameState.KeGang - i + 1
        for k=1,#childs do
            local mj = childs[k]
            local pai = gameState.KeGang[index]
            TableUtil.set_mj_color(mj, Color.white)
            TableUtil.set_mj(pai, mj, self.mjScaleSet, self.frontSpriteH)
            TableUtil.set_mj_bg(1, mj, self.mjColorSet)
        end
        target.name = "Gang" .. "_4_" .. gameState.KeGang[index]
        xAddOffset = xAddOffset - selectCardXOffset * 1 - 20
    end
    ComponentUtil.SafeSetActive(selectCardPanel, true)
end

-- 显示开杠列表
function TableView:show_kaiganggrid(parent)
    local selectCardPanel = parent or self.selectCardPanel
    local xAddOffset = 0
    for i=1,#gameState.KeKaiGang2 do
        if((i - 1) % 6 == 0) then
            xAddOffset = 0
        end
        local target = TableUtil.poor("1_SelectCard", selectCardPanel, self.selectCardClone1Pos + Vector3.New(xAddOffset, math.floor((i - 1) / 6) * (selectCardYOffset + 10), 0), self.poorObjs, self.clones)

        local childs = TableUtil.get_all_child(target)
        local index = #gameState.KeKaiGang2 - i + 1
        for k=1,#childs do
            local mj = childs[k]
            local pai = gameState.KeKaiGang2[index]
            TableUtil.set_mj_color(mj, Color.white)
            TableUtil.set_mj(pai, mj, self.mjScaleSet, self.frontSpriteH)
            TableUtil.set_mj_bg(1, mj, self.mjColorSet)
        end
        target.name = "Gang" .. "_4_" .. gameState.KeKaiGang2[index]
        xAddOffset = xAddOffset - selectCardXOffset * 1 - 20
    end
    ComponentUtil.SafeSetActive(selectCardPanel, true)
end

-- 显示钓对列表
function TableView:show_diaogrid()

    local xAddOffset = 0
    for i=1,#gameState.KeDiaoDui do
        local target = TableUtil.poor("2_SelectCard", self.selectCardPanel, self.selectCardClone2Pos + Vector3.New(xAddOffset, 0, 0), self.poorObjs, self.clones)
        local childs = TableUtil.get_all_child(target)
        local index = #gameState.KeDiaoDui - i + 1
        for k=1,#childs do
            local mj = childs[k]
            local pai = gameState.KeDiaoDui[index]
            TableUtil.set_mj_color(mj, Color.white)
            TableUtil.set_mj(pai, mj, self.mjScaleSet, self.frontSpriteH)
            TableUtil.set_mj_bg(1, mj, self.mjColorSet)
        end
        target.name = "Diao" .. "_2_" .. gameState.KeDiaoDui[index]
        xAddOffset = xAddOffset - selectCardXOffset * 2 - 10
    end
    ComponentUtil.SafeSetActive(self.selectCardPanel, true)
end

function TableView:hide_select_hua()
    ComponentUtil.SafeSetActive(self.selectHua, false)
end

-- 牌局还原到初始状态
function TableView:reset_mj(refreshState)
    --gameState = nil
    self.showStrategy = false
    self.isMeMoPai = false
    self.timerSum = -1
    self.timer = 0
    self.haveTing = false
    curTableData.dismiss = false
    self.colorPai = nil
    self.refreshState = refreshState
    colorMj = {}
    self.movePointerMj = {}
    ComponentUtil.SafeSetActive(self.selectZun, false)
    ComponentUtil.SafeSetActive(self.selectHua, false)
    for i=1,#self.seatHolderArray do
        self:reset_seat(i)
    end
    self:reset_seat_all_mj()
end

-- 隐藏选牌
function TableView:hide_select_card_childs()
    self:hide_select_card(self.selectCardPanel)
    self:hide_select_card(self.selectCardPanelRight)
end

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
    ComponentUtil.SafeSetActive(selectCardPanel, false)
end

-- 初始化座位信息
function TableView:init_seat(seatHolder, seatIndex, seatPosTran)
    local seatParent = GetComponentWithPath(seatPosTran, "Holder", ComponentTypeName.Transform).gameObject
    TableUtil.clone(self.cloneSeat, seatParent, Vector3.zero)
    local root = GetComponentWithPath(seatPosTran, "Holder/Seat", ComponentTypeName.Transform).gameObject
    local rootSwitcher = GetComponentWithPath(seatPosTran, "Holder/Seat", "UIStateSwitcher")
    if seatIndex == 1 or seatIndex == 4 then
       rootSwitcher:SwitchState("Left")
    elseif seatIndex == 2 then
       rootSwitcher:SwitchState("Right")
    elseif seatIndex == 3 then
        rootSwitcher:SwitchState("Top")
    end

    local seatNumObj14 = GetComponentWithPath(seatPosTran, "14", ComponentTypeName.Transform).gameObject
    local seatNumObj20 = GetComponentWithPath(seatPosTran, "20", ComponentTypeName.Transform).gameObject
    ComponentUtil.SafeSetActive(seatNumObj14, maxShouPaiNum == 14)
    ComponentUtil.SafeSetActive(seatNumObj20, maxShouPaiNum == 20)
    seatHolder.centerRandom = GetComponentWithPath(self.root, "Center/Child/ImageRandom/" .. seatIndex, ComponentTypeName.Transform).gameObject
    seatHolder.tingObj = GetComponentWithPath(self.root, "Center/Child/Ting/" .. seatIndex, ComponentTypeName.Transform).gameObject

    seatHolder.seatRoot = root
    seatHolder.seatParent = seatParent
    seatHolder.readySeatHolder = GetComponentWithPath(seatHolder.centerRandom, "Holder", ComponentTypeName.Transform)
    seatHolder.buttonNotSeatDown = GetComponentWithPath(root, "NotSeatDown", ComponentTypeName.Transform).gameObject
    seatHolder.goSeatInfo = GetComponentWithPath(root, "Info", ComponentTypeName.Transform).gameObject
    seatHolder.buttonKick = GetComponentWithPath(root, "Info/ButtonKick", ComponentTypeName.Transform).gameObject--踢人
    seatHolder.imagePlayerHead = GetComponentWithPath(root, "Info/Avatar/Mask/Image", ComponentTypeName.Image)
    seatHolder.textPlayerName = GetComponentWithPath(root, "Info/TextName", ComponentTypeName.Text)
    seatHolder.textScore =  GetComponentWithPath(root, "Info/Point/Text", ComponentTypeName.Text)
    seatHolder.imageDisconnect =  GetComponentWithPath(root, "Info/ImageStateDisconnect", ComponentTypeName.Image).gameObject
    seatHolder.imageLeave =  GetComponentWithPath(root, "Info/ImageStateLeave", ComponentTypeName.Image).gameObject

    seatHolder.imageReady = GetComponentWithPath(seatHolder.centerRandom, "ImageReady", ComponentTypeName.Transform).gameObject
    seatHolder.imageSanKou = GetComponentWithPath(root, "Info/ImageSanKou", ComponentTypeName.Transform).gameObject
    seatHolder.paiMJ = GetComponentWithPath(seatHolder.centerRandom, "PaiMJ", ComponentTypeName.Image).gameObject
    seatHolder.queSprite = GetComponentWithPath(root, "Info/QueBg/Image", ComponentTypeName.Image)
    seatHolder.QueSH = GetComponentWithPath(root, "Info/QueBg/Image", "SpriteHolder")
    seatHolder.showAdd1 = GetComponentWithPath(root, "Info/ShowAdd/1", ComponentTypeName.Transform).gameObject
    seatHolder.showAdd2 = GetComponentWithPath(root, "Info/ShowAdd/2", ComponentTypeName.Transform).gameObject
    seatHolder.showAdd1Text = GetComponentWithPath(root, "Info/ShowAdd/1/Text", ComponentTypeName.Text)
    seatHolder.showAdd2Text = GetComponentWithPath(root, "Info/ShowAdd/2/Text", ComponentTypeName.Text)
    seatHolder.imageBanker = GetComponentWithPath(root, "Info/ImageBanker", ComponentTypeName.Image).gameObject
    seatHolder.remainBankerText =  GetComponentWithPath(seatHolder.imageBanker, "Text", "TextWrap")
    --seatHolder.imageCreator = GetComponentWithPath(root, "Info/ImageCreator", ComponentTypeName.Image).gameObject
    seatHolder.imageYaHu = GetComponentWithPath(root, "Info/ImageYa", ComponentTypeName.Image).gameObject
    seatHolder.diAndTuo = GetComponentWithPath(root, "Info/DiAndTuo", ComponentTypeName.Transform).gameObject
    seatHolder.di = GetComponentWithPath(root, "Info/DiAndTuo/ImageDi", ComponentTypeName.Image).gameObject
    seatHolder.tuo = GetComponentWithPath(root, "Info/DiAndTuo/ImageTuo", ComponentTypeName.Image).gameObject
    seatHolder.huaAnimation = GetComponentWithPath(seatPosTran, "HuaTXPos", ComponentTypeName.Transform).gameObject
    seatHolder.goSpeak =  GetComponentWithPath(root, "State/Group/Speak", ComponentTypeName.Transform).gameObject
    seatHolder.waiZun =  GetComponentWithPath(root, "Info/TextWaitZun", ComponentTypeName.Text)
    seatHolder.beginUI =  GetComponentWithPath(root, "Begin", ComponentTypeName.Transform).gameObject
    seatHolder.rightPoint = GetComponentWithPath(seatPosTran, maxShouPaiNum .. "/RightPoint/HandMJ", ComponentTypeName.Transform).gameObject
    seatHolder.leftPoint = GetComponentWithPath(seatPosTran, maxShouPaiNum .. "/LeftPoint", ComponentTypeName.Transform).gameObject
    seatHolder.huaPoint = GetComponentWithPath(seatHolder.centerRandom, "HuaPoint", ComponentTypeName.Transform).gameObject
    seatHolder.outPoint = GetComponentWithPath(seatHolder.centerRandom, "OutPoint", ComponentTypeName.Transform).gameObject
    if 2 == totalSeat then  ---处理不同人数玩法下面，弃张布局不同
        local pos =  seatHolder.outPoint.transform.localPosition
        pos.x = (1 == seatIndex and -362 or 362)
        seatHolder.outPoint.transform.localPosition = pos
    end
    seatHolder.chuMJPos = GetComponentWithPath(seatPosTran, "ChuMJPos", ComponentTypeName.Transform).gameObject
    seatHolder.randomMJPos = GetComponentWithPath(seatHolder.centerRandom, "RandomPos", ComponentTypeName.Transform).gameObject
    seatHolder.chuTXPos = GetComponentWithPath(seatPosTran, "ChuTXPos", ComponentTypeName.Transform).gameObject
    seatHolder.huEffectOut = GetComponentWithPath(seatHolder.centerRandom, "Effect", ComponentTypeName.Transform).gameObject
    seatHolder.sanZObj = GetComponentWithPath(self.root, "Center/Child/ImageRandom/SanZ/" .. seatIndex, ComponentTypeName.Transform).gameObject
    seatHolder.sanZPos = seatHolder.sanZObj.transform.localPosition
    seatHolder.rightBeginPos = seatHolder.rightPoint.transform.localPosition
    seatHolder.leftBeginPos = seatHolder.leftPoint.transform.localPosition
    seatHolder.huaCloneMJ = GetComponentWithPath(seatHolder.huaPoint, seatIndex .. "_HuaMJ", ComponentTypeName.Transform).gameObject
    seatHolder.huaMjBeginPos = seatHolder.huaCloneMJ.transform.localPosition
    seatHolder.outCloneMJ = GetComponentWithPath(seatHolder.outPoint, seatIndex .. "_OutMJ", ComponentTypeName.Transform).gameObject
    seatHolder.outMjBeginPos = seatHolder.outCloneMJ.transform.localPosition
    seatHolder.inCloneMJ = GetComponentWithPath(seatHolder.rightPoint, seatIndex .. "_InMJ", ComponentTypeName.Transform).gameObject

    ---处理自己手张的锚定位置
    if 1 == seatIndex then
        seatHolder.inCloneMJ.transform.position = GetComponentWithPath(self.root, "BottomLeft/myHandMjAnchor/originAnchor",ComponentTypeName.Transform).position
        if 20 == maxShouPaiNum then
            seatHolder.inCloneMJ.transform.position = GetComponentWithPath(self.root, "BottomLeft/myHandMjAnchor/originAnchor_20",ComponentTypeName.Transform).position
        end
    end
    seatHolder.inMjBeginPos = seatHolder.inCloneMJ.transform.localPosition

    seatHolder.sanzObjChilds = TableUtil.get_all_child(seatHolder.sanZObj)
    ---分数变动提示
    seatHolder.scoreChangeText =  GetComponentWithPath(root, "ScoreChangeText", ComponentTypeName.Text)
    seatHolder.scoreChangeText.text = ""
    ---初始金币
    seatHolder.startBalanceText =  GetComponentWithPath(root, "Info/StartBalanceText", ComponentTypeName.Text)
    ComponentUtil.SafeSetActive(seatHolder.startBalanceText.gameObject,false)


    if(seatIndex ~= 1) then
        seatHolder.huGridParent = GetComponentWithPath(seatPosTran, "HuGrid", ComponentTypeName.Transform).gameObject
        seatHolder.huGrid = GetComponentWithPath(seatHolder.huGridParent, "Grid", ComponentTypeName.Transform).gameObject
        seatHolder.jianZiHu = GetComponentWithPath(seatHolder.huGridParent, "JianZiHu", ComponentTypeName.Image)
        seatHolder.jianZiHuSH = GetComponentWithPath(seatHolder.huGridParent, "JianZiHu", "SpriteHolder")
        seatHolder.sanzTipObj =  GetComponentWithPath(seatPosTran, "SanzTip", ComponentTypeName.Transform).gameObject
    end
    for i=1,maxShouPaiNum - 1 do
        TableUtil.clone(seatHolder.inCloneMJ, seatHolder.rightPoint, Vector3.zero)
    end
    seatHolder.enable = not (totalSeat == 3 and seatIndex == 3) and not (totalSeat == 2 and (seatIndex == 2 or seatIndex == 4))
    ComponentUtil.SafeSetActive(seatHolder.centerRandom, seatHolder.enable)
    ComponentUtil.SafeSetActive(seatPosTran, seatHolder.enable)
    if(seatIndex == 3) then
        seatHolder.diAndTuo.transform.anchoredPosition = Vector3.New(seatHolder.diAndTuo.transform.anchoredPosition.x, 65, 0)
    end
    seatHolder.anticheatHeadImage = GetComponentWithPath(root, "ImageAnticheat", ComponentTypeName.Image)
    seatHolder.anticheatEmptyHead = GetComponentWithPath(root, "EmptyAnticheat", ComponentTypeName.Transform).gameObject
    seatHolder.addGoldObj = GetComponentWithPath(root, "AddGold", ComponentTypeName.Transform).gameObject
    seatHolder.objChatFace = GetComponentWithPath(root, "State/Group/ChatFace", ComponentTypeName.Transform).gameObject
end

-- 座位重置
function TableView:reset_seat(index)
    local seatHolder = self.seatHolderArray[index]
    seatHolder.ready = false
    ComponentUtil.SafeSetActive(seatHolder.imageReady, false)
    ComponentUtil.SafeSetActive(seatHolder.buttonKick, false)
    ComponentUtil.SafeSetActive(seatHolder.imageBanker, false)
    ComponentUtil.SafeSetActive(seatHolder.diAndTuo, false)
    ComponentUtil.SafeSetActive(seatHolder.di, false)
    ComponentUtil.SafeSetActive(seatHolder.tuo, false)
    seatHolder.remainBankerText.text = ""

    ComponentUtil.SafeSetActive(seatHolder.queSprite.transform.parent.gameObject, false)
end

--小结算点击继续游戏调用
function TableView:reset_seat_mj(index)
    local seatHolder = self.seatHolderArray[index]
    local leftChilds = TableUtil.get_all_child(seatHolder.leftPoint)
    local outChilds = TableUtil.get_all_child(seatHolder.outPoint)
    local huaChilds = TableUtil.get_all_child(seatHolder.huaPoint)
    for i=1,#leftChilds do
        TableUtil.set_mj_color(leftChilds[i], Color.white)
        self.poorObjs = TableUtil.add_poor(leftChilds[i], self.poorObjs, self.cloneParent)
    end
    for i=1,#outChilds do
        local movePointer = GetComponentWithPath(outChilds[i], "MovePointer", ComponentTypeName.Transform).gameObject
        ComponentUtil.SafeSetActive(movePointer, false)
        outChilds[i]:SetActive(false)
    end
    for i=1,#huaChilds do
        TableUtil.set_mj_color(huaChilds[i], Color.white)
        huaChilds[i]:SetActive(false)
    end
    seatHolder.leftPoint.transform.localPosition = seatHolder.leftBeginPos
    seatHolder.rightPoint.transform.localPosition = seatHolder.rightBeginPos
    ComponentUtil.SafeSetActive(seatHolder.rightPoint, false)
    ComponentUtil.SafeSetActive(seatHolder.leftPoint, false)
    ComponentUtil.SafeSetActive(seatHolder.outPoint, false)
    ComponentUtil.SafeSetActive(seatHolder.huaPoint, false)
    ComponentUtil.SafeSetActive(seatHolder.huEffectOut, false)
    ComponentUtil.SafeSetActive(seatHolder.tingObj,false)
    ComponentUtil.SafeSetActive(seatHolder.imageSanKou, false)
    if(seatHolder.huGridParent) then
        seatHolder.huGridParent:SetActive(false)
    end
    seatHolder.outMJNum = 0
    seatHolder.huaMJNum = 0
    seatHolder.chuPaiCnt = -1
    seatHolder.lastHandData = nil
    seatHolder.lastDownData = nil
end

function TableView:reset_seat_all_mj()
    self.beginGame = true
    ComponentUtil.SafeSetActive(self.buttonGangRight, false)
    ComponentUtil.SafeSetActive(self.buttonGangRightDisable, false)
    ComponentUtil.SafeSetActive(self.yangZhouTip, false)
    ComponentUtil.SafeSetActive(self.gameController, false)
    for i=1,#self.seatHolderArray do
        self:reset_seat_mj(i)
    end
    for i=1,#self.lightChilds do
        ComponentUtil.SafeSetActive(self.lightChilds[i], false)
    end
    for i=1,#self.pointerChilds do
        ComponentUtil.SafeSetActive(self.pointerChilds[i], false)
    end
    ComponentUtil.SafeSetActive(self.tingGridParent, false)
    ComponentUtil.SafeSetActive(self.huGridParent, false)
    ComponentUtil.SafeSetActive(self.baoPai, false)
    self.xlszObj:SetActive(false)
    self:hide_select_card_childs()
end


-- 实时刷新游戏状态
function TableView:refresh_game_state(data, onlySet)
    self.lastGameState = gameState or data
    self.onlySet = onlySet
    gameState = data

    if(data.HuanSanZhang) then
        self.canDoSanZAni = true
        self.meHuanSanz = (#data.Player[self.mySeat + 1].SanZhang == 0)
    end
    if(data.SanZhangType > 0 and self.canDoSanZAni) then -- 换三张
        self:exchange_san_zhang(data)
        return
    end

    curTableData.gameState = gameState
    curTableData.totalSeat = totalSeat
    if(self.diceShow or self.randomSeat or not self.refreshState or gameState.Result == 2) then
        return
    end
    self.newMJArrow = 0
    if(curTableData.isPlayBack) then
        self:set_mj_arrow()
    end
    self:refresh_wait_action()
    self:refresh_timedown_clock()
    self:set_mj_arrow()
    self.onlySet = false
    if(onlySet) then
        return
    end

    if(data.Result == 0 and self.ConfigData.isKaWuXing and # data.MaiMa >0) then
        self:play_hu_sound(data)
        self:subscibe_time_event(2.5, false, 0):OnComplete(function(t)
            ModuleCache.ModuleManager.show_module("majiang", "tablepop", data)
        end)
    end

    if curTableData.RoomType == 3 then
        self.timerSum = data.IntrustRestTime
        self:show_time()
    end

    --ComponentUtil.SafeSetActive(self.buttonWarning.gameObject, false)
    ComponentUtil.SafeSetActive(self.inviteAndExit, false)
    ComponentUtil.SafeSetActive(self.selectZun, false)
    ComponentUtil.SafeSetActive(self.gameController, gameState.Result == 0)

    if(not curTableData.isPlayBack) then
        if(curTableData.RoomType == 3) then
            self.jushu.text = "第" .. gameState.CurRound
        else
            self.jushu.text = "第" .. gameState.CurRound .. "/" .. curTableData.RoundCount
        end
        if(self.ConfigData.roundTitle and self.ruleJsonInfo.isDoubleQuan) then
            self.jushu.text = self.jushu.text .. self.ConfigData.roundTitle
        else
            self.jushu.text = self.jushu.text .. "局"
        end
    end

    ---金币场处理
    if 4 == curTableData.RoomType then
        self.dizhuTxet.text = "底注:"..gameState.BaseCoinScore
        if gameState.FeeNum and 0 ~= gameState.FeeNum then
            local text = "本局服务费"..gameState.FeeNum.."金币"
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(text)
        end
    end

    local remainNum = #gameState.Dun

    if(not self.remainNum) then
        self.remainNum = remainNum
        self.remain.text = #gameState.Dun .. ""
    end
    if(self.remainNum ~= remainNum) then
        if(remainNum < 10) then
            if(self.remainAni.isPlaying) then
                self.remainAni:Stop()
                self.remain.color = Color.New(self.remain.color.r,self.remain.color.g,self.remain.color.b,0.7)
                self.remain.transform.localScale = Vector3.New(1,1,1) / 1.5
            end
            self.remainAni:Play()
            self:subscibe_time_event(0.49, false, 0):OnComplete(function(t)
                self.remainAni:Stop()
                self.remain.text = #gameState.Dun .. ""
                self.remain.color = Color.New(self.remain.color.r,self.remain.color.g,self.remain.color.b,0.7)
                self.remain.transform.localScale = Vector3.New(1,1,1) / 1.5
            end)
        else
            if(self.remainAni.isPlaying) then
                self.remainAni:Stop()
                self.remain.color = Color.New(self.remain.color.r,self.remain.color.g,self.remain.color.b,0.7)
                self.remain.transform.localScale = Vector3.New(1,1,1) / 1.5
            end
            self.remain.text = #gameState.Dun .. ""
        end
        self.remainNum = remainNum
    end
    if(data.HuanSanZhang and #gameState.Player[self.mySeat + 1].SanZhang == 0 and self.beginGame) then
        self.buttongHuanSZDisable:SetActive(true)
        self.huanSanzTip:SetActive(true)
        self:init_hsz()
    end
    ---牌局中打色子
    if 0 ~= gameState.KaiGangDice1 and 0 ~= gameState.KaiGangDice2 then
        self:play_dice(function ()

        end,gameState.KaiGangDice1,gameState.KaiGangDice2)
    end
    self.beginGame = false
end

function TableView:update_seat_pointer()
    local masterSeat = 0
    local localZhuangJia = TableUtil.get_local_seat(masterSeat, self.mySeat, totalSeat)
    local addNum = 0
    for i=1,4 do
        local index = localZhuangJia + i - 1
        if(totalSeat == 4) then
            if(index > 4) then
                index = index - 4
            end
            self.pointerObjs[i].transform.localPosition = pointerPos[index]
        elseif(totalSeat == 3) then
            ComponentUtil.SafeSetActive(self.pointerObjs[i], i <= totalSeat)
            if(i<=totalSeat) then
                if(index == 3) then
                    addNum = 1
                end
                index = index + addNum
                if(index > 4) then
                    index = index - 4
                end
                self.pointerObjs[i].transform.localPosition = pointerPos[index]
            end
        elseif(totalSeat == 2) then
            if(localZhuangJia == 1 and index ~= 1) then
                index = 3
            end
            if(localZhuangJia == 3 and index ~= 3) then
                index = 1
            end
            ComponentUtil.SafeSetActive(self.pointerObjs[i], i <= totalSeat)
            if(i <= totalSeat) then
                self.pointerObjs[i].transform.localPosition = pointerPos[index]
            end
        end
    end
end

-- 更新牌局倒计时
function TableView:refresh_timedown_clock()
    if(not self.onlySet) then
        local isTimeDown = false
        for i=1,#self.seatHolderArray do
            ComponentUtil.SafeSetActive(self.seatHolderArray[i].imageBanker, false)
            ComponentUtil.SafeSetActive(self.seatHolderArray[i].imageReady, false)
            ComponentUtil.SafeSetActive(self.seatHolderArray[i].buttonKick, false)
        end

        self:update_seat_pointer()

        if gameState.CurPlayer == 0xffffffff then

        elseif gameState.CurPlayer == 0xffffffff - 1 and curTableData.RoomType ~= 3 then -- 比赛场 拦牌 显示倒计时，不显示方向
            isTimeDown = false
            for i=1,#self.pointerChilds do
                ComponentUtil.SafeSetActive(self.pointerChilds[i], false)
            end
            for i=1,#self.lightChilds do
                ComponentUtil.SafeSetActive(self.lightChilds[i], false)
            end
            ComponentUtil.SafeSetActive(self.timeDown, false)
            ComponentUtil.SafeSetActive(self.waitObj, true)
        else
            isTimeDown = true
            ComponentUtil.SafeSetActive(self.timeDown, true)
            ComponentUtil.SafeSetActive(self.waitObj, false)
            ComponentUtil.SafeSetActive(self.timer1img.gameObject, true)
            ComponentUtil.SafeSetActive(self.timer2img.gameObject, true)
            if(curTableData.isPlayBack) then
                isTimeDown = false
                self.timer1img.sprite = self.timer1imgSprite:FindSpriteByName("0")
                self.timer2img.sprite = self.timer2imgSprite:FindSpriteByName("0")
            end

            if gameState.CurPlayer == 0xffffffff - 1 then -- 0xffffffff - 1  = -2 拦牌  比赛场 拦牌 显示倒计时，不显示方向
                for i=1,#self.pointerChilds do
                    ComponentUtil.SafeSetActive(self.pointerChilds[i], false)
                end
                for i=1,#self.lightChilds do
                    ComponentUtil.SafeSetActive(self.lightChilds[i], false)
                end
            else
                local localTargetSeat = TableUtil.get_local_seat(gameState.CurPlayer, 0, totalSeat)
                for i=1,#self.pointerChilds do
                    ComponentUtil.SafeSetActive(self.pointerChilds[i], i == localTargetSeat or (localTargetSeat == 4 and totalSeat == 3 and i == 3) or (localTargetSeat == 3 and totalSeat == 2 and i == 2))
                end
                local localSeat = TableUtil.get_local_seat(gameState.CurPlayer, self.mySeat, totalSeat)
                for i=1,#self.lightChilds do
                    ComponentUtil.SafeSetActive(self.lightChilds[i], i == localSeat)
                end
            end

        end

        if gameState.Result == 1 or gameState.Result == 2 or gameState.Result == 3 then
            if curTableData.RoomType ~= 3 then
                self.timerSum = -1
            end
        else
            if isTimeDown then
                if curTableData.RoomType ~= 3 then
                    self.timerSum = 15
                end
                self:show_time()
            else
                if curTableData.RoomType ~= 3 then
                    self.timerSum = -1
                end
            end
        end

        if(self.beginGame and gameState.Result == 0) then
            self:play_voice("common/startgame")
        end

    end

    -- 统计所有麻将
    for i=1,allCardNum do
        allCard[i] = 0
    end
    for i=1,#gameState.Player do
        local playerState = gameState.Player[i]
        for j=1,#playerState.ShouZhang do
            local pai = playerState.ShouZhang[j].Pai
            if(pai ~= 0) then
                allCard[pai] = allCard[pai] + 1
            end
        end
        for j=1,#playerState.QiZhang do
            local pai = playerState.QiZhang[j]
            if(pai ~= 0) then
                allCard[pai] = allCard[pai] + 1
            end
        end
        for j=1,#playerState.HuaPai do
            local pai = playerState.HuaPai[j]
            if(pai ~= 0) then
                allCard[pai] = allCard[pai] + 1
            end
        end
        for j=1,#playerState.XiaZhang do
            local pais = playerState.XiaZhang[j].Pai
            if(#pais == 4) then
                local realPais = playerState.XiaZhang[j].RealPai
                if(realPais and #realPais > 0) then --如果有真实的牌值
                    for k = 1, #realPais do
                        local pai = realPais[k]
                        if(pai ~= 0) then
                            allCard[pai] = allCard[pai] + 1
                        end
                    end
                elseif(playerState.XiaZhang[j].AnGang or (pais[1] == 0 and pais[4] ~= 0)) then
                    local pai = pais[4]
                    if(pai ~= 0) then
                        allCard[pai] = allCard[pai] + 4
                    end
                else
                    for i = 1, #pais do
                        local pai = pais[i]
                        if(pai ~= 0) then
                            allCard[pai] = allCard[pai] + 1
                        end
                    end
                end
            else
                for k=1,#pais do
                    local pai = pais[k]
                    if(pai ~= 0) then
                        allCard[pai] = allCard[pai] + 1
                    end
                end
            end
        end
    end

    if(gameState.LaiGen ~= 0 and allCard[gameState.LaiGen] < 4) then
        allCard[gameState.LaiGen] = allCard[gameState.LaiGen] + 1
    end

    self:update_hu_list(allCard)

    ComponentUtil.SafeSetActive(self.selectHua, gameState.KePiaoHua)
    ComponentUtil.SafeSetActive(self.baoPai, gameState.LaiZi ~= 0 or gameState.LaiGen ~= 0)
    ComponentUtil.SafeSetActive(self.laiGenMJ, gameState.LaiGen ~= 0)
    ComponentUtil.SafeSetActive(self.laiZiMJ, gameState.LaiZi ~= 0)
    if(gameState.LaiGen ~= 0) then
        TableUtil.set_mj(gameState.LaiGen, self.laiGenMJ, self.mjScaleSet, self.frontSpriteH)
        TableUtil.set_mj_bg(1, self.laiGenMJ, self.mjColorSet)
        if self.ConfigData.laigenTagTitle then
            self.laiGenText.text = self.ConfigData.laigenTagTitle
        else
            self.laiGenText.text = "翻牌"
        end
        if(self.ConfigData.isWuZhou and self.ruleJsonInfo.GuiPai == 2) then
            self.laiGenText.text = self.ConfigData.laiziTagTitle
        end
    end
    if(gameState.LaiZi ~= 0) then
        TableUtil.set_mj(gameState.LaiZi, self.laiZiMJ, self.mjScaleSet, self.frontSpriteH)
        TableUtil.set_mj_bg(1, self.laiZiMJ, self.mjColorSet)

        if self.ConfigData.laiziTagTitle then
            self.laiZiText.text = self.ConfigData.laiziTagTitle
        else
            self.laiZiText.text = "宝牌"
        end
    end
    if(gameState.WeiZhang ~= 0) then
        ComponentUtil.SafeSetActive(self.baoPai, true)
        ComponentUtil.SafeSetActive(self.laiGenMJ, true)
        TableUtil.set_mj(gameState.WeiZhang, self.laiGenMJ, self.mjScaleSet, self.frontSpriteH)
        TableUtil.set_mj_bg(1, self.laiGenMJ, self.mjColorSet)
        self.laiGenText.text = "杠后翻"
    end
    if(self.ConfigData.isFeiXiaoJi) then
        if(gameState.JiangPai and #gameState.JiangPai > 0) then
            ComponentUtil.SafeSetActive(self.baoPai, true)
            ComponentUtil.SafeSetActive(self.laiGenMJ, true)
            ComponentUtil.SafeSetActive(self.laiZiMJ, #gameState.JiangPai > 1)
            TableUtil.set_mj(gameState.JiangPai[1], self.laiGenMJ, self.mjScaleSet, self.frontSpriteH)
            TableUtil.set_mj_bg(1, self.laiGenMJ, self.mjColorSet)
            if(#gameState.JiangPai > 1) then
                TableUtil.set_mj(gameState.JiangPai[2], self.laiZiMJ, self.mjScaleSet, self.frontSpriteH)
                TableUtil.set_mj_bg(1, self.laiZiMJ, self.mjColorSet)
            end
            self.baoPaiMidText.text = "杠上花"
            self.laiZiText.text = ""
            self.laiGenText.text = ""
        else
            ComponentUtil.SafeSetActive(self.baoPai, false)
        end
    end
    if(self.ConfigData.isXJGSH) then
        if(gameState.JiangPai and #gameState.JiangPai > 0) then
            ComponentUtil.SafeSetActive(self.baoPai, true)
            ComponentUtil.SafeSetActive(self.laiGenMJ, true)
            TableUtil.set_mj(gameState.JiangPai[1], self.laiGenMJ, self.mjScaleSet, self.frontSpriteH)
            TableUtil.set_mj_bg(1, self.laiGenMJ, self.mjColorSet)
            self.laiGenText.text = "杠后牌"
            ComponentUtil.SafeSetActive(self.yangZhouTip, false)
        else
            ComponentUtil.SafeSetActive(self.baoPai, false)
            if(#gameState.Dun > 0 and gameState.Result == 0) then
                ComponentUtil.SafeSetActive(self.yangZhouTip, true)
            end
        end
    end

    local isChu = {}
    local allQue = true
    for i=1,#gameState.Player do
        isChu[i] = false
        if(gameState.Player[i].Que and gameState.Player[i].Que == 0) then
            allQue = false
        end
    end
    local showDingQue = true
    if(self.ConfigData.dingQueLocalJson) then
        showDingQue = self.ruleJsonInfo[self.ConfigData.dingQueLocalJson]
    end
    if(not self.doSanZAni and not gameState.HuanSanZhang and self.ConfigData.isDingQue and showDingQue) then
        if(not allQue) then
            ModuleCache.ModuleManager.show_module("majiang", "tableadd")
        else
            ModuleCache.ModuleManager.hide_module("majiang", "tableadd")
            -- print(totalSeat)
            --显示头像上的条，万，筒
            for i=1,#gameState.Player do
                local seatHolder = self.seatHolderArray[TableUtil.get_local_seat(i - 1, self.mySeat, totalSeat)]
                if(seatHolder.enable) then
                    ComponentUtil.SafeSetActive(seatHolder.queSprite.transform.parent.gameObject, true)

                    seatHolder.queSprite.sprite = seatHolder.QueSH:FindSpriteByName((gameState.Player[i].Que) .. "")
                    seatHolder.queSprite:SetNativeSize()
                end
            end
        end
    end
    if(not self.onlySet) then
        for i=1,#gameState.Action do
            local action = gameState.Action[i]
            --1:吃 2:碰 3:明杠 4:暗杠 5:点杠 6:和 7:听 8:出 9:自动出 10:摸 11:开杠 12:过牌 13：安庆宿松漂花 14：辣子先补花 21：板板胡  22 ：缺一色  23 ：六六顺  24 ：大四喜 25:亮中发白 31：自摸 32：放炮 33：接炮
            local localSeat = TableUtil.get_local_seat(action.SeatID, self.mySeat, totalSeat)
            if(localSeat == 1) then
                self:reset_color_pai()
                self:hide_ting_hu_grid()
            end
            if (9 == action.Action or (8 == action.Action and (curTableData.isPlayBack or localSeat ~= 1))) then
                isChu[action.SeatID + 1] = true
            end
            local seatHolder = self.seatHolderArray[localSeat]
            local newAction = self:get_action(action.Action)
            if(newAction ~= 6) then
                self:play_action_sound(newAction, seatHolder)
            end
            self:chu_tx(action.SeatID, newAction)
            if(newAction == 14) then--补花
                ComponentUtil.SafeSetActive(seatHolder.huaAnimation, true)
                local buhua = TableUtil.poor("BuHuaTX", seatHolder.huaAnimation, Vector3.zero, self.poorObjs, self.clones)
                self:subscibe_time_event(0.8, false, 0):OnComplete(function(t)
                    self.poorObjs = TableUtil.add_poor(buhua, self.poorObjs, self.cloneParent)
                end)
            end
        end
    end
    self.readyOutMJ = nil
    self:set_player_states(gameState, isChu)
    if(self.readyOutMJ) then
        self:change_mj_color(self:get_mj_pai(self.readyOutMJ))
        self:show_ting_hu_grid(self:get_mj_pai(self.readyOutMJ))
    end
end

function TableView:get_action(action)
    if(self.ConfigData.isKaWuXing and action == 7) then
        return 25
    end
    if(self.ConfigData.isHuangShiHH and action == 14) then
        return 0
    end
    return action
end

function TableView:set_player_states(newGameState, isChu)
    colorMj = {}

    for i=1,#newGameState.Player do
        local localSeat = TableUtil.get_local_seat(i - 1, self.mySeat, totalSeat)
        if(self.ConfigData.isXueLiuCH and localSeat == 1) then
            local playerState = newGameState.Player[i]
            if(playerState.SanZhangToOther and #playerState.SanZhangToOther > 0) then
                self.xlszObj:SetActive(true)
                local titles = {"换下家","换上家","换对家"}
                local huanType = 1
                for j = 1, #playerState.SanZhangToOther do
                    local data = playerState.SanZhangToOther[j]
                    local mj = self.xlszChilds[j]
                    huanType = data.type
                    TableUtil.set_mj(data.pai, mj, self.mjScaleSet, self.frontSpriteH)
                    TableUtil.set_mj_bg(1, mj, self.mjColorSet)
                end
                self.xlszTitleText.text = titles[huanType]
            end
        end
        self:set_player_state(localSeat, newGameState.Player[i], isChu[i], i, newGameState)

        if 4 == curTableData.RoomType then --如果是金币场
            ---设置取消托管按钮状态
            if 1 == localSeat then --如果是自己
                ModuleCache.ComponentUtil.SafeSetActive(self.noIntrustbtn,1 == newGameState.Player[i].IntrustState)
                if #newGameState.MaiMa > 0 then
                    ModuleCache.ComponentUtil.SafeSetActive(self.noIntrustbtn,false) ---买马不显示取消托管按钮
                end
            end
        end

    end
end

function TableView:get_tx_action(action)
    if(action == 8 or action == 9 or action == 10) then
        return 0
    end
    if(self.ConfigData.isHuangShiHH and action == 14) then
        return 0
    end
    if(not curTableData.isPlayBack and action == 12) then
        return 0
    end
    if(self.ConfigData.isKaWuXing and action == 7) then
        action = 25
    end
    if(action >= 3 and action <= 5) then
        if(self.ConfigData.isChangSha) then
            action = 100 + action
        end
        if(self.ConfigData.isXueLiuCH and not self.ConfigData.isXueZhanDD) then
            action = 200 + action
        end
    end
    return action
end

-- 出牌的特效
function TableView:chu_tx(seatId, action)
    action = self:get_tx_action(action)
    if(action == 0) then
        return
    end
    local seatInfo = self.seatHolderArray[TableUtil.get_local_seat(seatId, self.mySeat, totalSeat)]
    local newChuTX = TableUtil.poor("ChuTX", seatInfo.chuTXPos, Vector3.zero, self.poorObjs, self.clones)
    local chuimage = GetComponentWithPath(newChuTX, "Animator/WenBen", ComponentTypeName.Image)
    local imageSprite = GetComponentWithPath(newChuTX, "", "SpriteHolder")
    local chuimage1 = GetComponentWithPath(newChuTX, "Animator/GaoLiang", ComponentTypeName.Image)
    local getImage = imageSprite:FindSpriteByName(action .. "")
    newChuTX:SetActive(false)
    if(getImage) then
        newChuTX:SetActive(true)
        chuimage.sprite = getImage
        chuimage1.sprite = getImage
        chuimage:SetNativeSize()
        chuimage1:SetNativeSize()
        self:subscibe_time_event(1, false, 0):OnComplete(function(t)
            self.poorObjs = TableUtil.add_poor(newChuTX, self.poorObjs, self.cloneParent)
        end)
    else
        self.poorObjs = TableUtil.add_poor(newChuTX, self.poorObjs, self.cloneParent)
    end
end

-- 显示听胡列表
function TableView:show_ting_hu_grid(pai)
    if(#gameState.KeLiang > 0) then
        local tingChilds = TableUtil.get_all_child(self.tingGrid, "TingMJ")
        for i=1,#tingChilds do
            ComponentUtil.SafeSetActive(tingChilds[i], false)
        end
        local isShowTing = self:getIsShowTingSetting()
        self.haveTing = false
        for i=1,#gameState.KeLiang[1].KeChu do
            if(pai == gameState.KeLiang[1].KeChu[i].ChuPai) then
                self.tingPaiNum = #gameState.KeLiang[1].KeChu[i].TingPai
                if((self.tingPaiNum > 17 and self.ConfigData.isNanLing) or (self.tingPaiNum > 26 and not self.ConfigData.isNanLing)) then
                    self.haveTing = true
                    ComponentUtil.SafeSetActive(self.tingGridParent,isShowTing)---配置控制听列表是否打开
                    ComponentUtil.SafeSetActive(self.huGridParent, false)
                    ComponentUtil.SafeSetActive(self.tingJianZiHu.gameObject, true)
                    ComponentUtil.SafeSetActive(self.tingGrid.transform.gameObject, true)
                    if(self.ConfigData.isNanLing) then
                        self.tingJianZiHu.sprite = self.tingJianZiHuSH:FindSpriteByName("2")
                    else
                        self.tingJianZiHu.sprite = self.tingJianZiHuSH:FindSpriteByName("1")
                    end
                else
                    for j=1,#gameState.KeLiang[1].KeChu[i].TingPai do
                        local setPai = gameState.KeLiang[1].KeChu[i].TingPai[j]
                        ComponentUtil.SafeSetActive(self.tingGridParent,isShowTing)---配置控制听列表是否打开
                        ComponentUtil.SafeSetActive(self.huGridParent, false)
                        ComponentUtil.SafeSetActive(self.tingJianZiHu.gameObject, false)
                        ComponentUtil.SafeSetActive(self.tingGrid.transform.gameObject, true)
                        self.haveTing = true
                        local mj = nil
                        if(j <= #tingChilds) then
                            mj = tingChilds[j]
                        else
                            mj = TableUtil.poor("TingMJ", self.tingGrid, Vector3.zero, self.poorObjs, self.clones)
                        end
                        TableUtil.set_mj(setPai, mj, self.mjScaleSet, self.frontSpriteH)
                        TableUtil.set_mj_bg(1, mj, self.mjColorSet)
                        ComponentUtil.SafeSetActive(mj, true)
                        local remainText = GetComponentWithPath(mj, "Text", ComponentTypeName.Text)
                        remainText.text = (4 - allCard[setPai]) .. ""
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
end

function TableView:update_hu_kawuxing(playerState, localSeat)
    if(not self.ConfigData.isKaWuXing) then
        return
    end
    local seatHolder = self.seatHolderArray[localSeat]
    if(seatHolder.huGridParent) then
        ComponentUtil.SafeSetActive(seatHolder.huGridParent, #playerState.YiTing > 0)
        if(localSeat == 2) then
            if(#playerState.YiTing > 8) then
                seatHolder.huGridParent.transform.localPosition = Vector3.New(169, seatHolder.huGridParent.transform.localPosition.y, 0)
            else
                seatHolder.huGridParent.transform.localPosition = Vector3.New(49, seatHolder.huGridParent.transform.localPosition.y, 0)
            end
        end
        if(localSeat == 4) then
            if(#playerState.YiTing > 8) then
                seatHolder.huGridParent.transform.localPosition = Vector3.New(-320, seatHolder.huGridParent.transform.localPosition.y, 0)
            else
                seatHolder.huGridParent.transform.localPosition = Vector3.New(-203, seatHolder.huGridParent.transform.localPosition.y, 0)
            end
        end
        ComponentUtil.SafeSetActive(seatHolder.huGrid, true)
        ComponentUtil.SafeSetActive(seatHolder.jianZiHu.gameObject, false)
        local allHuChilds = TableUtil.get_all_child(seatHolder.huGrid)
        local huChilds = {}
        for i=2,#allHuChilds do
            ComponentUtil.SafeSetActive(allHuChilds[i], false)
            table.insert(huChilds, allHuChilds[i])
        end
        for i=1,#playerState.YiTing do
            local mj = nil
            local setPai = playerState.YiTing[i]
            if(i <= #huChilds) then
                mj = huChilds[i]
            else
                mj = TableUtil.poor("HuMJ", seatHolder.huGrid, Vector3.zero, self.poorObjs, self.clones)
            end
            TableUtil.set_mj(setPai, mj, self.mjScaleSet, self.frontSpriteH)
            TableUtil.set_mj_bg(1, mj, self.mjColorSet)
            ComponentUtil.SafeSetActive(mj, true)
            local remainDi = GetComponentWithPath(mj, "ImageDi", ComponentTypeName.Transform).gameObject
            local remainObj = GetComponentWithPath(mj, "Text", ComponentTypeName.Transform).gameObject
            remainDi:SetActive(false)
            remainObj:SetActive(false)
        end
    end
end

-- 更新胡牌列表
function TableView:update_hu_list(allCard)
    if(gameState.YiTing and gameState.YiTing[1] == 0) then
        return
    end
    local showJianZiHu = (#gameState.YiTing > 17 and self.ConfigData.isNanLing) or (#gameState.YiTing > 26 and not self.ConfigData.isNanLing)
    local isShowTing = self:getIsShowTingSetting()
    ComponentUtil.SafeSetActive(self.huGridParent, #gameState.YiTing > 0)
    ComponentUtil.SafeSetActive(self.huGrid, (not showJianZiHu) and  isShowTing)
    ComponentUtil.SafeSetActive(self.jianZiHu.gameObject, showJianZiHu and isShowTing)

    if(not showJianZiHu) then
        local allHuChilds = TableUtil.get_all_child(self.huGrid)
        local huChilds = {}
        for i=2,#allHuChilds do
            ComponentUtil.SafeSetActive(allHuChilds[i], false)
            table.insert(huChilds, allHuChilds[i])
        end
        for i=1,#gameState.YiTing do
            local mj = nil
            local setPai = gameState.YiTing[i]
            if(i <= #huChilds) then
                mj = huChilds[i]
            else
                mj = TableUtil.poor("HuMJ", self.huGrid, Vector3.zero, self.poorObjs, self.clones)
            end
            TableUtil.set_mj(setPai, mj, self.mjScaleSet, self.frontSpriteH)
            TableUtil.set_mj_bg(1, mj, self.mjColorSet)
            ComponentUtil.SafeSetActive(mj, true)
            local remainText = GetComponentWithPath(mj, "Text", ComponentTypeName.Text)
            remainText.text = (4 - allCard[setPai]) .. ""
        end
    elseif(self.ConfigData.isNanLing) then
        self.jianZiHu.sprite = self.jianZiHuSH:FindSpriteByName("2")
    else
        self.jianZiHu.sprite = self.jianZiHuSH:FindSpriteByName("1")
    end
end

-- 隐藏听胡列表
function TableView:hide_ting_hu_grid()
    ComponentUtil.SafeSetActive(self.tingGridParent, false)
end

-- 准备出牌时改变相关麻将颜色
function TableView:change_mj_color(pai)
    self:reset_color_pai()
    local mjs = colorMj[pai .. ""]

    if(mjs) then
        self.colorPai = pai
        for i=1,#mjs do
            --TableUtil.set_mj_color(mjs[i], self.colorChange)
            local luoDiZhangEffect = GetComponentWithPath(mjs[i], "LuoDiZhangEffect", ComponentTypeName.Transform)
            if(luoDiZhangEffect) then
                luoDiZhangEffect.gameObject:SetActive(true)
            end
        end
    end
end

-- 对应麻将变白
function TableView:change_mj_white(pai)
    local mjs = colorMj[pai .. ""]
    if(mjs) then
        for i=1,#mjs do
            --TableUtil.set_mj_color(mjs[i], Color.white)
            local luoDiZhangEffect = GetComponentWithPath(mjs[i], "LuoDiZhangEffect", ComponentTypeName.Transform)
            if(luoDiZhangEffect) then
                luoDiZhangEffect.gameObject:SetActive(false)
            end
            --if(self:is_laizi(pai, gameState)) then
            --    TableUtil.set_mj_color(mjs[i], Color.yellow)
            --elseif(self:is_hua_mj(mjs[i])) then
            --    TableUtil.set_mj_color(mjs[i], Color.New(180/255, 255/255, 0/255, 0.9))
            --end
        end
    end
end

-- 复位拖动的麻将
function TableView:reset_drag_mj()
    self:reset_color_pai()
    self:play_voice("common/xuanpai")
end


-- 准备拖动
function TableView:ready_drag_mj(obj, isDrag)
    if(not isDrag) then
        return
    end
    self:change_mj_color(self:get_mj_pai(obj))
    for i=1,#self.myHandMJs do
        local mj = self.myHandMJs[i]
        if(mj ~= obj and mj.activeSelf) then
            mj.name = string.format("inMJ_%s_%s", self:get_mj_pai(mj), self:get_mj_index(mj))
            mj.transform.localPosition = Vector3.New(mj.transform.localPosition.x, 0, mj.transform.localPosition.z)
        else

        end
    end
end

-- 准备出牌
function TableView:ready_chu_mj(obj, isDrag)
    if(not isDrag) then
        self:play_voice("common/xuanpai")
    end
    for i=1,#self.myHandMJs do
        local mj = self.myHandMJs[i]
        if(mj.activeSelf) then
            local pai = self:get_mj_pai(mj)
            if(mj == obj) then
                if(self:is_me_chu_mj(obj)) then
                    self:change_mj_color(pai)
                    mj.name = string.format("readyChuMJ_%s_%s", pai, self:get_mj_index(mj))
                    mj.transform.localPosition = Vector3.New(mj.transform.localPosition.x, lastMJOffset, mj.transform.localPosition.z)
                    self:show_ting_hu_grid(pai)
                else
                    mj.name = string.format("inMJ_%s_%s", pai, self:get_mj_index(mj))
                    if(mj.transform.localPosition.y > 0) then
                        mj.transform.localPosition = Vector3.New(mj.transform.localPosition.x, 0, mj.transform.localPosition.z)
                    else
                        mj.transform.localPosition = Vector3.New(mj.transform.localPosition.x, lastMJOffset, mj.transform.localPosition.z)
                    end
                end
            else
                mj.name = string.format("inMJ_%s_%s", pai, self:get_mj_index(mj))
                mj.transform.localPosition = Vector3.New(mj.transform.localPosition.x, 0, mj.transform.localPosition.z)
            end
        end
    end
end

-- 获取自己麻将的牌数
function TableView:get_mj_pai(obj)
    local names = string.split(obj.name, "_")
    return tonumber(names[2])
end

-- 获取自己麻将的索引
function TableView:get_mj_index(obj)
    local names = string.split(obj.name, "_")
    return tonumber(names[3])
end

function TableView:insert_mj_by_pai(mjTable, pai, mj)
    mjTable = mjTable or {}
    local paiStr = pai .. ""
    mjTable[paiStr] = mjTable[paiStr] or {}
    if(not TableUtil.have_table_index(mjTable[paiStr], mj)) then
        table.insert(mjTable[paiStr], mj)
    end
end

function TableView:remove_mj_by_pai(mjTable, pai, mj)
    mjTable = mjTable or {}
    local paiStr = pai .. ""
    mjTable[paiStr] = mjTable[paiStr] or {}
    for i = #mjTable[paiStr], 1,-1 do
        if(mjTable[paiStr][i] == mj) then
            table.remove(mjTable[paiStr], i)
        end
    end
end

function TableView:is_gray(obj)
    if(curTableData.isPlayBack or self.doSanZAni) then
        return 0
    end
    if(self.grayMJ) then
        for i=1,#self.grayMJ do
            if(obj == self.grayMJ[i]) then

                return i
            end
        end
    end
    return nil
end

-- 是否是我出牌
function TableView:is_me_chu_mj(obj)
    return self.isMeMoPai and self:is_gray(obj) == nil and not self.selectHua.activeSelf
        and (not self.showWaitAction or (self.showWaitAction and not self.openGuoHu)) and gameState
        and gameState.Result == 0
end

function TableView:check_state_hand_change(localSeat, playerState)
    if(localSeat == 1) then
        return true
    end
    local seatHolder = self.seatHolderArray[localSeat]
    if(not seatHolder.lastHandDatas) then
        self:set_last_hand_data(playerState, seatHolder)
        return true
    end
    if(#playerState.ShouZhang ~= #seatHolder.lastHandDatas) then
        self:set_last_hand_data(playerState, seatHolder)
        return true
    end
    local change = false
    for i = 1, #playerState.ShouZhang do
        local handData = playerState.ShouZhang[i]
        local lastHandData = seatHolder.lastHandDatas[i]
        if(handData.Pai ~= lastHandData.Pai or handData.State ~= lastHandData.State or handData.Gray ~= lastHandData.Gray) then
            change = true
            break
        end
    end
    self:set_last_hand_data(playerState, seatHolder)
    return change
end

function TableView:check_state_down_change(localSeat, playerState)
    local seatHolder = self.seatHolderArray[localSeat]
    if(not seatHolder.lastDownDatas) then
        self:set_last_down_data(playerState, seatHolder)
        return true
    end
    if(#playerState.XiaZhang ~= #seatHolder.lastDownDatas) then
        self:set_last_down_data(playerState, seatHolder)
        return true
    end
    local change = false
    for i = 1, #playerState.XiaZhang do
        local downData = playerState.XiaZhang[i]
        local lastDownData = seatHolder.lastDownDatas[i]
        if(#lastDownData.Pai ~= #downData.Pai) then
            change = true
            break
        end
        for j = 1, #downData.Pai do
            if(downData.Pai[j] ~= lastDownData.Pai[j]) then
                change = true
                break
            end
        end
    end
    if(change) then
        self:set_last_down_data(playerState, seatHolder)
    end
    return change
end

function TableView:set_last_hand_data(playerState, seatHolder)
    seatHolder.lastHandDatas = {}
    for i = 1, #playerState.ShouZhang do
        table.insert(seatHolder.lastHandDatas, playerState.ShouZhang[i])
    end
end

function TableView:set_last_down_data(playerState, seatHolder)
    seatHolder.lastDownDatas = {}
    for i = 1, #playerState.XiaZhang do
        table.insert(seatHolder.lastDownDatas, playerState.XiaZhang[i])
    end
end

function TableView:check_state_change(localSeat, playerState, checkType)
    local seatHolder = self.seatHolderArray[localSeat]
    if(curTableData.isPlayBack or self.onlySet) then
        if(self.onlySet) then
            seatHolder.outMJNum = 0
            seatHolder.huaMJNum = 0
        end
        if(curTableData.isPlayBack) then
            if(playerState.ChuPaiCnt > 0 and (playerState.showArrow == nil or playerState.showArrow)) then
                self.newMJArrow = localSeat
            end
        end
        return true
    end

    if(checkType == 1) then --手张
        if(self:check_state_hand_change(localSeat, playerState)) then
            --print("刷新手张座位", localSeat)
            return true
        end
    elseif(checkType == 2) then --弃张
        if(playerState.ChuPaiCnt > 0 and (playerState.showArrow == nil or playerState.showArrow)) then
            self.newMJArrow = localSeat
        end
        if(#playerState.QiZhang ~= seatHolder.outMJNum) then
            return true
        end
    elseif(checkType == 3) then --下张
        if(self:check_state_down_change(localSeat, playerState)) then
            --print("刷新下张座位", localSeat)
            return true
        end
    elseif(checkType == 4) then --花牌
        if(#playerState.HuaPai ~= seatHolder.huaMJNum) then
            --seatHolder.huaMJNum = #playerState.HuaPai
            --print("刷新花牌座位", localSeat)
            return true
        end
    end
    return false
end

-- 设置玩家状态
function TableView:set_player_state(localSeat, playerState, isChu, index, newGameState)
    self:update_hu_kawuxing(playerState, localSeat)
    local seatHolder = self.seatHolderArray[localSeat]

    seatHolder.tingObj:SetActive(#playerState.YiTing > 0 and not self.ConfigData.isChangSha and not self.ConfigData.isKaWuXing and not self.ConfigData.isXueLiuCH)
    seatHolder.sanZObj:SetActive(gameState.SanZhangType == 0 and #playerState.SanZhang > 0)
    local isHuanSanz = false
    if(seatHolder.sanZObj.activeSelf) then
        seatHolder.sanZObj.transform.localPosition = seatHolder.sanZPos
        if(localSeat == 1) then
            self.buttongHuanSZ:SetActive(false)
            self.buttongHuanSZDisable:SetActive(false)
            self.huanSanzTip:SetActive(false)
        end
        for i = 1, #seatHolder.sanzObjChilds do
            TableUtil.set_mj_bg_owner(1, seatHolder.sanzObjChilds[i], self.mjColorSet)
        end
    end
    if(gameState.HuanSanZhang and #playerState.SanZhang == 0) then
        if(localSeat == 1) then
            isHuanSanz = true
        else
            seatHolder.sanzTipObj:SetActive(true)
        end
    elseif(localSeat ~= 1) then
        seatHolder.sanzTipObj:SetActive(false)
    end
    if(localSeat == 1 and (not isHuanSanz or self.beginGame)) then
        self.grayMJ = {}
        self.myHandMJs = {}
    end
    seatHolder.seatID = index - 1
    ---金币场处理
    if 4 == curTableData.RoomType or curTableData.ruleJsonInfo.settleType == 1 then
        seatHolder.textScore.text = Util.filterPlayerGoldNum(playerState.Balance) --金币场剩余金币
        ---杠分变动提示
        if gameState.ScoreSettle then
            for i=1,#gameState.ScoreSettle do
                local scoresettle = gameState.ScoreSettle[i]
                if scoresettle.SeatID == seatHolder.seatID then
                    self:play_score_change_text(seatHolder,scoresettle.ActualAmount)
                    break
                end
            end
        end
        ComponentUtil.SafeSetActive(seatHolder.startBalanceText.gameObject, false)
    else
        local beishu = playerState.ZongBeiShu
        local change = playerState.ZongBeiShu - self.lastGameState.Player[index].ZongBeiShu
        if self.ConfigData.isHuangShiHH and not self.ConfigData.isDaYeKKF then  ---黄石晃晃显示分数除以十显示
            beishu = beishu / 10
            change = change / 10
        end
        seatHolder.textScore.text = beishu .. ""
        self:play_score_change_text(seatHolder,change)
    end

    if  self.ConfigData.isHuangShiHH then
        ComponentUtil.SafeSetActive(seatHolder.showAdd1, true)
        seatHolder.showAdd1Text.text = playerState.FanShu.."番" --黄石晃晃特殊处理
    end

    if(playerState.lianzhuangnum > 1) then
        seatHolder.remainBankerText.text = "x" .. playerState.lianzhuangnum
    end
    if(playerState.piaohuacfgnew and playerState.piaohuacfgnew >= 2) then
        local piaoTitles = {"飘花","不飘"}
        seatHolder.showAdd2:SetActive(true)
        seatHolder.showAdd2Text.text = piaoTitles[playerState.piaohuacfgnew - 1]
    end
    ComponentUtil.SafeSetActive(seatHolder.imageSanKou, playerState.BaoPaiJingGao ~= nil and playerState.BaoPaiJingGao)
    ComponentUtil.SafeSetActive(seatHolder.rightPoint, true)
    ComponentUtil.SafeSetActive(seatHolder.leftPoint, true)
    ComponentUtil.SafeSetActive(seatHolder.outPoint, true)
    ComponentUtil.SafeSetActive(seatHolder.huaPoint, true)
    ComponentUtil.SafeSetActive(seatHolder.diAndTuo, playerState.DiTuo)
    ComponentUtil.SafeSetActive(seatHolder.di, seatHolder.seatID ~= newGameState.ZhuangJia and playerState.DiTuo)
    ComponentUtil.SafeSetActive(seatHolder.tuo, seatHolder.seatID == newGameState.ZhuangJia and playerState.DiTuo)
    ComponentUtil.SafeSetActive(seatHolder.imageBanker, seatHolder.seatID == newGameState.ZhuangJia)
    ComponentUtil.SafeSetActive(seatHolder.imageYaHu, playerState.HuaPai and #playerState.HuaPai > 0 and self.ConfigData.isXJGSH)
    local newChilds = {}

    if(self:check_state_change(localSeat, playerState, 1)) then
        local rightChilds = TableUtil.get_all_child(seatHolder.rightPoint)
        seatHolder.mopai = (seatHolder.seatID == newGameState.ArrowPlayer)
        local rightOffset = 0
        for i=1,#rightChilds do -- 手张
            if localSeat == 1 then --自己
                local handData, handIndex = self:convert_hand_data(playerState)
                if(self.beginGame or not isHuanSanz or self.onlySet) then
                    self.isMeMoPai = (seatHolder.seatID == newGameState.CurPlayer)
                    local mj = rightChilds[i]
                    local downOffset = 19
                    if(maxShouPaiNum == 20) then
                        downOffset = 10
                    end
                    mj.transform.localPosition = seatHolder.inMjBeginPos + Vector3.New(rightOffset, 0 , 0)
                    rightOffset = rightOffset + rightWidthOffset[localSeat]
                    ComponentUtil.SafeSetActive(mj, i <= #handData)
                    local downObj = GetComponentWithPath(mj, "Down", ComponentTypeName.Transform).gameObject
                    local upObj = GetComponentWithPath(mj, "Up", ComponentTypeName.Transform).gameObject
                    if mj.activeSelf then
                        table.insert(self.myHandMJs, mj)
                        local shouZhangData = handData[i]
                        local mjObj = nil
                        local showHu = #playerState.HuPai ~= 0 and i > #handData - #playerState.HuPai and playerState.HuPai[1] ~= 0
                        local pathAttr = ""
                        if(self:pai_is_open(playerState, shouZhangData)) then
                            rightOffset = rightOffset - downOffset
                            pathAttr = ""
                            mjObj = downObj
                            ComponentUtil.SafeSetActive(downObj, true)
                            ComponentUtil.SafeSetActive(upObj, false)
                        else
                            pathAttr = ""
                            mjObj = upObj
                            ComponentUtil.SafeSetActive(downObj, false)
                            ComponentUtil.SafeSetActive(upObj, true)
                        end
                        local redPoint = GetComponentWithPath(mjObj, "RedPoint", ComponentTypeName.Transform)
                        if(redPoint) then
                            redPoint.gameObject:SetActive(shouZhangData.IsFromOther)
                        end
                        TableUtil.set_mj(shouZhangData.Pai, mjObj, self.mjScaleSet, self.frontSpriteH)
                        TableUtil.set_mj_bg(1, mjObj, self.mjColorSet)
                        TableUtil.set_mj_color(mjObj, Color.white)
                        if(shouZhangData.Gray) then
                            TableUtil.set_mj_color(mjObj, Color.gray)
                            table.insert(self.grayMJ, mj)
                        end
                        local tag = GetComponentWithPath(mjObj, pathAttr .. "Tag", ComponentTypeName.Transform).gameObject
                        local tagImage = GetComponentWithPath(mjObj, pathAttr .. "Tag", ComponentTypeName.Image)
                        ComponentUtil.SafeSetActive(tag, false)
                        if self.ConfigData.isHuangShiHH then
                            for i=1,#gameState.HuaPai do
                                if shouZhangData.Pai == gameState.HuaPai[i] then
                                    ComponentUtil.SafeSetActive(tag, true)
                                    tagImage.sprite = self.TagSpriteH:FindSpriteByName("10")
                                    break
                                end
                            end
                        end
                        if(self:show_ting(shouZhangData.Pai)) then
                            ComponentUtil.SafeSetActive(tag, true)
                            tagImage.sprite = self.TagSpriteH:FindSpriteByName("1")
                        end
                        if(self:is_laizi(shouZhangData.Pai, newGameState)) then
                            TableUtil.set_laizi_tag(mjObj, self.TagSpriteH, self.ConfigData, shouZhangData.Gray)
                        end
                        if(showHu) then
                            ComponentUtil.SafeSetActive(tag, true)
                            tagImage.sprite = self.TagSpriteH:FindSpriteByName("2")
                        end
                        local effectObj = nil
                        if(self.ConfigData.isKaWuXing and mjObj == downObj) then
                            effectObj = GetComponentWithPath(mjObj, "Effect", ComponentTypeName.Transform).gameObject
                            effectObj:SetActive(false)
                        end
                        if showHu or (i == #handData and seatHolder.mopai) then -- 最后一张
                            mj.name = string.format("inMJ_%s_%s", shouZhangData.Pai, handIndex[i])
                            mj.transform.localPosition = mj.transform.localPosition + Vector3.New(lastMJOffset, 0, 0)
                            if(not showHu and self:is_me_chu_mj(mj)) then
                                mj.name = string.format("readyChuMJ_%s_%s", shouZhangData.Pai, handIndex[i])
                                mj.transform.localPosition = Vector3.New(mj.transform.localPosition.x, lastMJOffset, mj.transform.localPosition.z)
                                self.readyOutMJ = mj
                            end
			                if(showHu and self.ConfigData.isKaWuXing and newGameState.DianPao == -1) then
                                effectObj:SetActive(true)
                    	    end
                        else
                            mj.name = string.format("inMJ_%s_%s", shouZhangData.Pai, handIndex[i])
                        end
                    end
                end
            else --非自己
                local handData = self:convert_hand_data_other(playerState)
                local mj = rightChilds[i]
                if(localSeat ~= 3) then
                    mj.transform.localPosition = seatHolder.inMjBeginPos + Vector3.New(0, rightOffset, 0)
                else
                    mj.transform.localPosition = seatHolder.inMjBeginPos + Vector3.New(rightOffset, 0, 0)
                end
                local downObj = GetComponentWithPath(mj, "Down", ComponentTypeName.Transform).gameObject
                local upObj = GetComponentWithPath(mj, "Up", ComponentTypeName.Transform).gameObject
                local shouZhangData = nil
                local showHu = false
                ComponentUtil.SafeSetActive(mj, i <= #handData)
                if(mj.activeSelf) then
                    shouZhangData = handData[i]
                    showHu = #playerState.HuPai ~= 0 and i == #handData and playerState.HuPai[1] ~= 0
                    if(i == #handData and (seatHolder.mopai or showHu)) then -- 最后一张
                        if(localSeat == 3) then
                            mj.transform.localPosition = mj.transform.localPosition + Vector3.New(-lastMJOffset, 0, 0)
                        elseif(localSeat == 4) then
                            mj.transform.localPosition = mj.transform.localPosition + Vector3.New(0, -lastMJOffset * 0.5, 0)
                        else
                            mj.transform.localPosition = mj.transform.localPosition + Vector3.New(0, lastMJOffset * 0.5, 0)
                        end
                    end
                end
                if localSeat == 2 then
                    rightOffset = rightOffset + rightWidthOffset[localSeat]
                elseif localSeat == 3 then
                    rightOffset = rightOffset - rightWidthOffset[localSeat]
                else
                    rightOffset = rightOffset - rightWidthOffset[localSeat]
                end
                if(shouZhangData and (self:pai_is_open(playerState, shouZhangData) or self:pai_is_covered(shouZhangData))) then
                    if(mj.activeSelf) then
                        table.insert(newChilds,mj)
                    end
                    ComponentUtil.SafeSetActive(downObj, true)
                    ComponentUtil.SafeSetActive(upObj, false)
                    TableUtil.set_mj_color(downObj, Color.white)
                    if(self:pai_is_covered(shouZhangData)) then
                        TableUtil.set_mj_bg(2, downObj, self.mjColorSet)
                    else
                        TableUtil.set_mj_bg(1, downObj, self.mjColorSet)
                    end
                    if(localSeat == 2 or localSeat == 4) then
                        TableUtil.set_mj(shouZhangData.Pai, downObj, self.mjScaleSet, self.ceSpriteH)
                    else
                        TableUtil.set_mj(shouZhangData.Pai, downObj, self.mjScaleSet, self.frontSpriteH)
                    end
                    local tag = GetComponentWithPath(downObj, "Tag", ComponentTypeName.Transform).gameObject
                    local tagImage = GetComponentWithPath(downObj, "Tag", ComponentTypeName.Image)
                    ComponentUtil.SafeSetActive(tag, false)
                    if(self:is_laizi(shouZhangData.Pai, newGameState)) then
                        TableUtil.set_laizi_tag(downObj, self.TagSpriteH, self.ConfigData)
                    end
                    local effectObj = nil
                    if(self.ConfigData.isKaWuXing) then
                        effectObj = GetComponentWithPath(downObj, "Effect", ComponentTypeName.Transform).gameObject
                        effectObj:SetActive(false)
                    end
                    if(showHu) then
                        ComponentUtil.SafeSetActive(tag, true)
                        tagImage.sprite = self.TagSpriteH:FindSpriteByName("2")
                        if(self.ConfigData.isKaWuXing and newGameState.DianPao == -1) then
                            effectObj:SetActive(true)
                        end
                    end
                else
                    if(maxShouPaiNum == 20) then
                        if localSeat == 2 then
                            rightOffset = rightOffset - 5
                        elseif localSeat == 4 then
                            rightOffset = rightOffset + 5
                        end
                    end
                    if(mj.activeSelf) then
                        table.insert(newChilds,mj)
                    end
                    ComponentUtil.SafeSetActive(downObj, false)
                    ComponentUtil.SafeSetActive(upObj, true)
                    TableUtil.set_mj_bg(1, upObj, self.mjColorSet)
                end
            end
        end
        if(localSeat == 2) then
            TableUtil.invert_mj_pos_hand(newChilds)
        end
    end

    if(self:check_state_change(localSeat, playerState, 2)) then
        local outChilds = TableUtil.get_all_child(seatHolder.outPoint)
        if(curTableData.isPlayBack) then
            for i = 1,#outChilds do
                outChilds[i]:SetActive(false)
            end
        end
        if(#playerState.QiZhang > seatHolder.outMJNum) then
            for i = seatHolder.outMJNum + 1, #playerState.QiZhang do
                self:simulate_down_mj(index - 1,localSeat,playerState,i,isChu)
            end
        end

        if(#playerState.QiZhang < seatHolder.outMJNum) then
            if(localSeat == 1 or localSeat == 2) then
                for i = 1, seatHolder.outMJNum - #playerState.QiZhang do
                    outChilds[i]:SetActive(false)
                    outChilds[i].transform:SetAsLastSibling()
                end
            else
                for i = #playerState.QiZhang + 1, seatHolder.outMJNum do
                    outChilds[i]:SetActive(false)
                    outChilds[i].transform:SetAsLastSibling()
                end
            end
        end
        if(not curTableData.isPlayBack) then
            seatHolder.outMJNum = #playerState.QiZhang
        end
    end

    if(#playerState.QiZhang > 0) then
        local outChilds = TableUtil.get_all_child(seatHolder.outPoint)
        if(self.ConfigData.isKaWuXing) then
            local lastMj = outChilds[#playerState.QiZhang]
            if(localSeat == 1 or localSeat == 2) then
                lastMj = outChilds[1]
            end
            if(self:is_hu_on_qizhang(tonumber(lastMj.name))) then
                local effectObj = ComponentUtil.GetComponentWithPath(lastMj, "Effect", ComponentTypeName.Transform).gameObject
                seatHolder.huEffectOut.transform.position = effectObj.transform.position
                seatHolder.huEffectOut:SetActive(true)
            end
        end
        self.colorOut = {}
        for i = 1, #outChilds do
            local mj = outChilds[i]
            if(mj.activeSelf) then
                table.insert(self.colorOut, {pai = mj.name, obj = mj})
            end
        end
    end

    if(self:check_state_change(localSeat, playerState, 4)) then
        local huaChilds = TableUtil.get_all_child(seatHolder.huaPoint)
        if(curTableData.isPlayBack) then
            for i = 1,#huaChilds do
                huaChilds[i]:SetActive(false)
            end
        end
        if(#playerState.HuaPai > seatHolder.huaMJNum) then
            for i = seatHolder.huaMJNum + 1, #playerState.HuaPai do
                self:simulate_hua_mj(localSeat, playerState, i)
            end
        end

        if(#playerState.HuaPai < seatHolder.huaMJNum) then
            if(localSeat == 4) then
                for i = 1, seatHolder.huaMJNum - #playerState.HuaPai do
                    huaChilds[i]:SetActive(false)
                    huaChilds[i].transform:SetAsLastSibling()
                end
            else
                for i = #playerState.HuaPai + 1, seatHolder.huaMJNum do
                    huaChilds[i]:SetActive(false)
                    huaChilds[i].transform:SetAsLastSibling()
                end
            end
        end
        if(not curTableData.isPlayBack) then
            seatHolder.huaMJNum = #playerState.HuaPai
        end
    end

    if(#playerState.HuaPai > 0) then
        local huaChilds = TableUtil.get_all_child(seatHolder.huaPoint)
        self.colorHua = {}
        for i = 1, #huaChilds do
            local mj = huaChilds[i]
            if(mj.activeSelf) then
                table.insert(self.colorHua, {pai = mj.name, obj = mj})
            end
        end
    end

    if(self:check_state_change(localSeat, playerState, 3)) then
        local leftChilds = TableUtil.get_all_child(seatHolder.leftPoint)
        for i = 1,#leftChilds do
            ComponentUtil.SafeSetActive(leftChilds[i], false)
        end
        local leftWidth = 0
        for i=1,#playerState.XiaZhang do --下张摆放位置更新
            local xiaZhangData =playerState.XiaZhang[i]
            if(#xiaZhangData.Pai <= 4) then
                local needGray = false
                local pais = {}
                local mj = nil
                if(i < #leftChilds) then
                    mj = leftChilds[i]
                    ComponentUtil.SafeSetActive(mj, true)
                else
                    local scale = Vector3.New(xiaZhangScale[localSeat], xiaZhangScale[localSeat], 1)
                    mj = TableUtil.poor(localSeat .. "_4MJ", seatHolder.leftPoint, Vector3.New(0, 0 , 0), self.poorObjs, self.clones, scale)
                end
                if (localSeat == 1) then
                    mj.transform.localPosition = Vector3.New(leftWidth, 0 , 0)
                elseif (localSeat == 2) then
                    mj.transform.localPosition = Vector3.New(0, leftWidth , 0)
                elseif (localSeat == 3) then
                    mj.transform.localPosition = Vector3.New(-leftWidth, 0 , 0)
                elseif (localSeat == 4) then
                    mj.transform.localPosition = Vector3.New(0, -leftWidth , 0)
                end
                local mjChilds = TableUtil.get_all_child(mj)
                for j=1,#mjChilds do
                    if(j <= #playerState.XiaZhang[i].Pai) then
                        --table.insert(colorMj, mjChilds[j])
                        local pai = nil
                        if(localSeat ~= 2) then
                            pai = playerState.XiaZhang[i].Pai[j]
                            if(pai == 0) then
                                TableUtil.set_mj_bg(2, mjChilds[j], self.mjColorSet)
                            else
                                TableUtil.set_mj_bg(1, mjChilds[j], self.mjColorSet)
                            end
                            ComponentUtil.SafeSetActive(mjChilds[j], true)
                            if(localSeat == 1 or localSeat == 3) then
                                TableUtil.set_mj(pai, mjChilds[j], self.mjScaleSet, self.frontSpriteH)
                            else
                                TableUtil.set_mj(pai, mjChilds[j], self.mjScaleSet, self.ceSpriteH)
                            end
                            if(j - 1 == xiaZhangData.JinZhang) then
                                if(#xiaZhangData.Pai > 2) then
                                    needGray = true
                                end
                            end
                            table.insert(pais, {pai = pai, obj = mjChilds[j]})
                            mjChilds[j].name = pai .. ""
                            if(self:is_laizi(pai, newGameState)) then
                                TableUtil.set_laizi_tag(mjChilds[j], self.TagSpriteH, self.ConfigData)
                            else
                                TableUtil.set_mj_white(mjChilds[j])
                            end
                        else
                            local curIndex = #mjChilds - j + 1
                            if(#mjChilds == 4) then
                                if(j == 4) then
                                    curIndex = j
                                else
                                    curIndex = #mjChilds - j
                                end
                            end
                            ComponentUtil.SafeSetActive(mjChilds[curIndex], true)
                            pai = playerState.XiaZhang[i].Pai[j]
                            if(pai == 0) then
                                TableUtil.set_mj_bg(2, mjChilds[curIndex], self.mjColorSet)
                            else
                                TableUtil.set_mj_bg(1, mjChilds[curIndex], self.mjColorSet)
                            end
                            if(localSeat == 1 or localSeat == 3) then
                                TableUtil.set_mj(pai, mjChilds[curIndex], self.mjScaleSet, self.frontSpriteH)
                            else
                                TableUtil.set_mj(pai, mjChilds[curIndex], self.mjScaleSet, self.ceSpriteH)
                            end
                            if(j - 1 == xiaZhangData.JinZhang) then
                                if(#xiaZhangData.Pai > 2) then
                                    needGray = true
                                end
                            end
                            table.insert(pais, {pai = pai, obj = mjChilds[curIndex]})
                            mjChilds[curIndex].name = pai .. ""
                            if(self:is_laizi(pai, newGameState)) then
                                TableUtil.set_laizi_tag(mjChilds[curIndex], self.TagSpriteH, self.ConfigData)
                            else
                                TableUtil.set_mj_white(mjChilds[curIndex])
                            end
                        end
                    else
                        if(localSeat ~= 2) then
                            ComponentUtil.SafeSetActive(mjChilds[j], false)
                        else
                            local curIndex = #mjChilds - j + 1
                            if(#mjChilds == 4) then
                                if(j == 4) then
                                    curIndex = j
                                else
                                    curIndex = #mjChilds - j
                                end
                            end
                            ComponentUtil.SafeSetActive(mjChilds[curIndex], false)
                        end
                    end
                end
                if(needGray) then
                    local xiaZhangSeat = TableUtil.get_local_seat(xiaZhangData.Seat, index - 1, totalSeat)
                    local mj = nil
                    local pai = 0
                    if(xiaZhangSeat == 2) then
                        if(#xiaZhangData.Pai == 4) then
                            mj = pais[3].obj
                            pai = pais[3].pai
                        else
                            mj = pais[#pais].obj
                            pai = pais[#pais].pai
                        end
                    elseif(xiaZhangSeat == 3) then
                        if(#xiaZhangData.Pai == 4) then
                            mj = pais[4].obj
                            pai = pais[4].pai
                        else
                            mj = pais[2].obj
                            pai = pais[2].pai
                        end
                    elseif(xiaZhangSeat == 4) then
                        mj = pais[1].obj
                        pai = pais[1].pai
                    else

                    end
                    if(mj) then
                        if(not self:is_laizi(pai, newGameState)) then
                            TableUtil.set_mj_white(mj, Color.gray)
                        else
                            TableUtil.set_laizi_tag(mj, self.TagSpriteH, self.ConfigData, true)
                        end
                    end
                end
                local num = math.min(3, #playerState.XiaZhang[i].Pai)
                leftWidth = leftWidth + xiaZhangWidth[localSeat] * xiaZhangScale[localSeat] * num + lastMJOffset * 0.8
                if(localSeat == 1 and maxShouPaiNum == 14) then
                    leftWidth = leftWidth + 20
                end
            else
                local pais={}
                local childs={}
                for j=1,#xiaZhangData.Pai do
                    local scale = Vector3.New(xiaZhangScale[localSeat], xiaZhangScale[localSeat], 1)
                    local mj = TableUtil.poor(localSeat .. "_4MJ", seatHolder.leftPoint, Vector3.New(0, 0 , 0), self.poorObjs, self.clones, scale)
                    local showIndex = 1
                    if (localSeat == 1) then
                        mj.transform.localPosition = Vector3.New(leftWidth, 0 , 0)
                    elseif (localSeat == 2) then
                        showIndex = 3
                        mj.transform.localPosition = Vector3.New(0, leftWidth , 0)
                    elseif (localSeat == 3) then
                        mj.transform.localPosition = Vector3.New(-leftWidth, 0 , 0)
                    elseif (localSeat == 4) then
                        mj.transform.localPosition = Vector3.New(0, -leftWidth , 0)
                    end
                    local pai = xiaZhangData.Pai[j]
                    table.insert(pais,pai)
                    local mjChilds = TableUtil.get_all_child(mj)
                    for k=1,#mjChilds do
                        ComponentUtil.SafeSetActive(mjChilds[k], k == showIndex)
                        if(k == showIndex) then
                            table.insert(childs,mjChilds[showIndex])
                            if(pai == 0) then
                                TableUtil.set_mj_bg(2, mjChilds[showIndex], self.mjColorSet)
                            else
                                TableUtil.set_mj_bg(1, mjChilds[showIndex], self.mjColorSet)
                            end
                            if(localSeat == 1 or localSeat == 3) then
                                TableUtil.set_mj(pai, mjChilds[showIndex], self.mjScaleSet, self.frontSpriteH)
                            else
                                TableUtil.set_mj(pai, mjChilds[showIndex], self.mjScaleSet, self.ceSpriteH)
                            end
                            if(self:is_laizi(pai, newGameState)) then
                                TableUtil.set_laizi_tag(mjChilds[showIndex], self.TagSpriteH, self.ConfigData)
                            else
                                TableUtil.set_mj_white(mjChilds[showIndex])
                            end
                            mjChilds[showIndex].name = pai .. ""
                        end
                    end
                    local num = 1
                    leftWidth = leftWidth + xiaZhangWidth[localSeat] * xiaZhangScale[localSeat] * num
                end
                if(localSeat == 1 or localSeat == 3) then
                    TableUtil.invert_mj_pos(childs,#childs,pais,localSeat == 2,true, self.mjScaleSet, self.frontSpriteH)
                else
                    TableUtil.invert_mj_pos(childs,#childs,pais,localSeat == 2,true, self.mjScaleSet, self.ceSpriteH)
                end
                leftWidth = leftWidth + lastMJOffset
            end
        end
        if (localSeat == 1) then
            seatHolder.rightPoint.transform.localPosition = seatHolder.rightBeginPos + Vector3.New(leftWidth, 0 , 0)
        elseif (localSeat == 2) then
            seatHolder.rightPoint.transform.localPosition = seatHolder.rightBeginPos + Vector3.New(0, leftWidth , 0)
        elseif (localSeat == 3) then
            seatHolder.rightPoint.transform.localPosition = seatHolder.rightBeginPos + Vector3.New(-leftWidth, 0 , 0)
        elseif (localSeat == 4) then
            seatHolder.rightPoint.transform.localPosition = seatHolder.rightBeginPos + Vector3.New(0, -leftWidth , 0)
        end
    end
    if(#playerState.XiaZhang > 0) then
        local leftChilds = TableUtil.get_all_child(seatHolder.leftPoint)
        self.colorXiaZhang = {}
        for i = 1, #leftChilds do
            local obj = leftChilds[i]
            if(obj.activeSelf) then
                local childs = TableUtil.get_all_child(obj)
                for j = 1, #childs do
                    local mj = childs[j]
                    if(mj.activeSelf) then
                        table.insert(self.colorXiaZhang, {pai = mj.name, obj = mj})
                    end
                end
            end
        end
    end

    if(self.colorOut) then
        for i = 1, #self.colorOut do
            local paiData = self.colorOut[i]
            self:insert_mj_by_pai(colorMj, paiData.pai, paiData.obj)
        end
    end
    if(self.colorHua) then
        for i = 1, #self.colorHua do
            local paiData = self.colorHua[i]
            self:insert_mj_by_pai(colorMj, paiData.pai, paiData.obj)
        end
    end
    if(self.colorXiaZhang) then
        for i = 1, #self.colorXiaZhang do
            local paiData = self.colorXiaZhang[i]
            self:insert_mj_by_pai(colorMj, paiData.pai, paiData.obj)
        end
    end
end

-- 显示听的牌
function TableView:show_ting(pai)
    local showTing = false
    if(#gameState.KeLiang > 0) then
        for j=1,#gameState.KeLiang[1].KeChu do
            if(pai == gameState.KeLiang[1].KeChu[j].ChuPai) then
                showTing = true
                break
            end
        end
    end
    return showTing
end

--泗洪麻将
function TableView:sihong_ting(pai)
    local showTing = false
    if(#gameState.KeLiang > 0) then
        for j=1,#gameState.KeLiang[1].KeChu do
            if(pai == gameState.KeLiang[1].KeChu[j].ChuPai and #gameState.KeLiang[1].KeChu[j].TingPai == 1) then
                showTing = true
                break
            end
        end
    end
    return showTing
end

function TableView:mj_is_ting(pai)
    return (not self.ConfigData.isSiHong and self:show_ting(pai)) or (self.ConfigData.isSiHong and self:sihong_ting(pai))
end

function TableView:sihong_action_ting()
    local showTing = false
    if(#gameState.KeLiang > 0) then
        for j=1,#gameState.KeLiang[1].KeChu do
            if(#gameState.KeLiang[1].KeChu[j].TingPai == 1) then
                showTing = true
                break
            end
        end
    end
    return showTing
end

function TableView:reset_color_pai()
    if(self.colorPai) then
        self:change_mj_white(self.colorPai)
        self.colorPai = nil
    end
end

function TableView:show_not_ting(isGray)
    self.grayMJ ={}
    local playerState = gameState.Player[self.mySeat + 1]
    if(isGray) then
        self:reset_color_pai()
    end
    for i=1,#self.myHandMJs do -- 手张
        local mj = self.myHandMJs[i]
        local downObj = GetComponentWithPath(mj, "Down", ComponentTypeName.Transform).gameObject
        local upObj = GetComponentWithPath(mj, "Up", ComponentTypeName.Transform).gameObject

        if mj.activeSelf then
            if not self:mj_is_ting(self:get_mj_pai(mj)) then
                mj.transform.localPosition = Vector3.New(mj.transform.localPosition.x, 0, mj.transform.localPosition.z)
                mj.name = string.format("inMJ_%s_%s", self:get_mj_pai(mj), self:get_mj_index(mj))
                local mjObj = nil
                if(#playerState.HuPai ~= 0) then
                    mjObj = downObj
                else
                    mjObj = upObj
                end

                if isGray then
                    TableUtil.set_mj_color(mjObj, Color.gray)
                    table.insert(self.grayMJ, mj)
                else
                    TableUtil.set_mj_color(mjObj, Color.white)
                end
            end
        end
    end

    if not isGray then
        self.grayMJ = nil
    end
end

-- 添加弃张
function TableView:add_qi_zhang(seatId, mj, showPointer, isChu, pai)
    --print("add_qi_zhang", seatId, mj, showPointer, isChu, pai)
    local playerState = gameState.Player[seatId + 1]
    local showBuHua = true
    if(playerState and playerState.piaohuacfgnew == 2) then
        showBuHua = false
    end
    local localSeat = TableUtil.get_local_seat(seatId, self.mySeat, totalSeat)
    if(showPointer) then
        if(mj) then
            if(playerState.showArrow == nil or playerState.showArrow) then
                local movePointer = ComponentUtil.Find(mj, "MovePointer")
                self.movePointerMj = self.movePointerMj or {}
                self.movePointerMj[localSeat] = self.movePointerMj[localSeat] or {}
                table.insert(self.movePointerMj[localSeat], movePointer)
            end
        end
        if(isChu)  then
            if(mj) then
                if(playerState.showArrow == nil or playerState.showArrow) then
                    self:play_voice("common/chupai")
                end
            end

            local seatInfo = self.seatHolderArray[localSeat]
            local isHuaPai = false
            for i=1,#gameState.HuaPai do
                if(pai == gameState.HuaPai[i] .. "" and showBuHua) then
                    isHuaPai = true
                    if self.ConfigData.isHuangShiHH then
                        ---黄石晃晃不播放补花
                    else
                        if(seatInfo.gender == 1) then
                            self:play_voice("femalesound_hn/buhua")
                        else
                            self:play_voice("malesound_hn/buhua")
                        end
                        ComponentUtil.SafeSetActive(seatInfo.huaAnimation, true)
                        local buhua = TableUtil.poor("BuHuaTX", seatInfo.huaAnimation, Vector3.zero, self.poorObjs, self.clones)
                        self:subscibe_time_event(0.8, false, 0):OnComplete(function(t)
                            self.poorObjs = TableUtil.add_poor(buhua, self.poorObjs, self.cloneParent)
                        end)
                        break
                    end
                end
            end
            if(not isHuaPai) then
                if(mPaiClipName[tonumber(pai)]) then
                    if(seatInfo.gender == 1) then
                        self:play_voice("femalesound_hn/" .. string.lower(mPaiClipName[tonumber(pai)]))
                    else
                        self:play_voice("malesound_hn/" .. string.lower(mPaiClipName[tonumber(pai)]))
                    end
                end
                if(localSeat ~= 1) then
                    local newChuMJ = TableUtil.poor("ChuMJ", seatInfo.chuMJPos, Vector3.zero, self.poorObjs, self.clones)
                    TableUtil.set_mj(pai, newChuMJ, self.mjScaleSet, self.frontSpriteH)
                    TableUtil.set_mj_bg(1, newChuMJ, self.mjColorSet)
                    self:subscibe_time_event(0.5, false, 0):OnComplete(function(t)
                        self.poorObjs = TableUtil.add_poor(newChuMJ, self.poorObjs, self.cloneParent)
                    end)
                end
            end
        end
    end
end

-- 出牌
function TableView:chu_mj(mj, pai)
    ComponentUtil.SafeSetActive(mj, false)
    --self:hide_ting_hu_grid()
    self:hide_wait_action_select_card()
    self:chu_pai_add_qi_zhang(pai, mj)
    self:reset_color_pai()
end

-- 出牌的时候先落地
function TableView:chu_pai_add_qi_zhang(pai, mj)
    self.isMeMoPai = false
    local playerState = gameState.Player[self.mySeat + 1]
    playerState.showArrow = true
    playerState.ChuPaiCnt = 1
    table.insert(playerState.QiZhang, pai)
    local outIndex = self:out_refresh_hand_data(playerState, mj)
    self.newMJArrow = 1
    self:simulate_down_mj(self.mySeat, 1, playerState, #playerState.QiZhang, true)
    self:simulate_hand_data(playerState, outIndex)
    self.seatHolderArray[1].outMJNum = #playerState.QiZhang
    self:set_mj_arrow()
end

function TableView:set_mj_arrow()
    if(self.onlySet) then
       return
    end
    if(self.movePointerMj) then
        for i = 1, 4 do
            if(self.movePointerMj[i]) then
                for j = #self.movePointerMj[i], 1, -1 do
                    if(self.newMJArrow == i) then
                        self.movePointerMj[i][j]:SetActive(true)
                    else
                        self.movePointerMj[i][j]:SetActive(false)
                        table.remove(self.movePointerMj[i], j)
                    end
                end
            end
        end
    end
end

function TableView:simulate_hand_data(playerState, outIndex)
    if(not playerState.MoZhang or (playerState.MoZhang and (playerState.MoZhang == 0 or outIndex == self.lastIndex))) then
        return
    end
    local rightOffset = 0
    local seatHolder = self.seatHolderArray[1]
    for i = 1, #playerState.ShouZhang do
        local mj = nil
        if(i >= outIndex) then
            if(i + 1 == self.lastIndex) then
                mj = self.myHandMJs[#self.myHandMJs]
            elseif(i + 1 > self.lastIndex) then
                mj = self.myHandMJs[i]
            else
                mj = self.myHandMJs[i + 1]
            end
        else
            if(i == self.lastIndex) then
                mj = self.myHandMJs[#self.myHandMJs]
            elseif(i > self.lastIndex) then
                mj = self.myHandMJs[i - 1]
            else
                mj = self.myHandMJs[i]
            end
        end
        mj.transform.localPosition = seatHolder.inMjBeginPos + Vector3.New(rightOffset, 0 , 0)
        rightOffset = rightOffset + rightWidthOffset[1]
    end
end

function TableView:simulate_down_mj(serverSeat, localSeat, playerState, addIndex, isChu)
    local seatHolder = self.seatHolderArray[localSeat]
    local outChilds = TableUtil.get_all_child(seatHolder.outPoint)
    local mj = nil
    if(addIndex <= #outChilds) then
        mj = outChilds[addIndex]
    else
        mj = TableUtil.poor(localSeat .. "_OutMJ", seatHolder.outPoint, Vector3.New(0, 0, 0), self.poorObjs, self.clones)
    end
    ComponentUtil.SafeSetActive(mj, true)
    if(localSeat == 1 or localSeat == 3) then
        mj.transform.localPosition = seatHolder.outMjBeginPos + Vector3.New(outGridCell[localSeat][1] * ((addIndex - 1) % outGridNum),
        outGridCell[localSeat][2]  * math.floor((addIndex - 1) / outGridNum), 0)
    else
        mj.transform.localPosition = seatHolder.outMjBeginPos + Vector3.New(outGridCell[localSeat][1]  * math.floor((addIndex - 1) / outGridNum),
        outGridCell[localSeat][2]  * ((addIndex - 1) % outGridNum), 0)
    end
    local qiZhangData = playerState.QiZhang[addIndex]
    if(localSeat == 2 or localSeat == 4) then
        TableUtil.set_mj(qiZhangData, mj, self.mjScaleSet, self.ceSpriteH)
    else
        TableUtil.set_mj(qiZhangData, mj, self.mjScaleSet, self.frontSpriteH)
    end
    TableUtil.set_mj_bg(1, mj, self.mjColorSet)
    if(self:is_laizi(qiZhangData, gameState)) then
        TableUtil.set_laizi_tag(mj, self.TagSpriteH, self.ConfigData)
    else
        TableUtil.set_mj_white(mj)
    end
    if(localSeat == 2 or localSeat == 1) then
        mj.transform:SetAsFirstSibling()
    end
    mj.name = qiZhangData .. ""
    self:add_qi_zhang(serverSeat, mj, addIndex > #playerState.QiZhang - playerState.ChuPaiCnt, isChu, playerState.QiZhang[addIndex] .. "")
end

function TableView:simulate_hua_mj(localSeat, playerState, addIndex)
    local seatHolder = self.seatHolderArray[localSeat]
    local huaChilds = TableUtil.get_all_child(seatHolder.huaPoint)
    local mj = nil
    if(addIndex <= #huaChilds) then
        mj = huaChilds[addIndex]
    else
        mj = TableUtil.poor(localSeat .. "_HuaMJ", seatHolder.huaPoint, Vector3.New(0, 0, 0), self.poorObjs, self.clones)
    end
    ComponentUtil.SafeSetActive(mj, true)
    if(localSeat == 1 or localSeat == 3) then
        mj.transform.localPosition = seatHolder.huaMjBeginPos + Vector3.New(-outGridCell[localSeat][1] * (addIndex - 1), 0, 0)
    else
        mj.transform.localPosition = seatHolder.huaMjBeginPos + Vector3.New(0, -outGridCell[localSeat][2]  * (addIndex - 1), 0)
    end

    local huapaiData = playerState.HuaPai[addIndex]
    if(huapaiData == 0) then
        TableUtil.set_mj_bg(2, mj, self.mjColorSet)
    else
        TableUtil.set_mj_bg(1, mj, self.mjColorSet)
    end
    if(self:is_laizi(huapaiData, gameState)) then
        TableUtil.set_laizi_tag(mj, self.TagSpriteH, self.ConfigData)
    elseif(self.ConfigData.isHuangShiHH) then
        TableUtil.set_tag(mj, self.TagSpriteH, 10)
    elseif(self.ConfigData.isXueLiuCH) then
        local huTagImage = GetComponentWithPath(mj, "HuTag/Image", ComponentTypeName.Image)
        local huTag = GetComponentWithPath(mj, "HuTag", ComponentTypeName.Transform).gameObject
        huTag:SetActive(true)
        local isZiMo = playerState.hupais[addIndex].zimo
        if(isZiMo) then
            --TableUtil.set_tag(mj, self.TagSpriteH, 102)
            huTagImage.sprite = self.huTagSpriteH:FindSpriteByName("0")
        else
            --TableUtil.set_tag(mj, self.TagSpriteH, 101)
            huTagImage.sprite = self.huTagSpriteH:FindSpriteByName(playerState.hupais[addIndex].pao .. "")
        end
        huTagImage:SetNativeSize()
    elseif(self:is_hua_mj(mj)) then
        TableUtil.set_mj_color(mj, Color.New(180/255, 255/255, 0/255, 0.9))
    else
        TableUtil.set_mj_white(mj)
    end
    if(localSeat == 2 or localSeat == 4) then
        TableUtil.set_mj(huapaiData, mj, self.mjScaleSet, self.ceSpriteH)
    else
        TableUtil.set_mj(huapaiData, mj, self.mjScaleSet, self.frontSpriteH)
    end
    mj.name = huapaiData .. ""
    if(localSeat == 4) then
        mj.transform:SetAsFirstSibling()
    end
end

-- 显示吃碰杠等按钮
function TableView:refresh_wait_action()
    self.showWaitAction = false
    self.canHu = false
    self.TingPaiState = 0 -- TingPaiState = 1 开局可听    TingPaiState = 2 牌局过程中的可以听
    self.onlyRightGang = false
    ComponentUtil.SafeSetActive(self.waitAction, true)
    self.buttonGangRight:SetActive(false)
    self.buttonGangRightDisable:SetActive(false)
    for i=1,#self.waitActions do
        ComponentUtil.SafeSetActive(self.waitActions[i], false)
    end

    if #gameState.KeHu > 0 then
        if(not self.ConfigData.isChangSha or (self.ConfigData.isChangSha and #gameState.KeHuLeiXing == 0)) then
            ComponentUtil.SafeSetActive(self.actionBtHu, true)
            self.showWaitAction = true
            self.canHu = true
        end
    end

    local showOtherAction = not ((self.ConfigData.isDongHai or
            (self.ConfigData.isXueLiuCH and #gameState.Player[self.mySeat + 1].HuaPai > 0) or (self.ConfigData.isXueZhanDD and #gameState.Dun <= 10)) and self.canHu)
    if #gameState.KeYaHu > 0 and showOtherAction then
        ComponentUtil.SafeSetActive(self.actionBtYaHu, true)
        self.showWaitAction = true
    end
    if #gameState.KeChi > 0 and showOtherAction then
        ComponentUtil.SafeSetActive(self.actionBtChi, true)
        self.showWaitAction = true
    end
    if #gameState.KePeng > 0 and showOtherAction  then
        ComponentUtil.SafeSetActive(self.actionBtPeng, true)
        self.showWaitAction = true
    end
    if #gameState.KeGang > 0 and showOtherAction  then
        if(not self.ConfigData.isChangSha) then
            --if(self.mySeat == gameState.ArrowPlayer) then
            --    self.buttonGangRight:SetActive(true)
            --    self.buttonGangRightDisable:SetActive(false)
            --    self.onlyRightGang = true
            --else
            --    ComponentUtil.SafeSetActive(self.actionBtGang, true)
            --    self.showWaitAction = true
            --end
            ComponentUtil.SafeSetActive(self.actionBtGang, true)
            if(self.mySeat == gameState.ArrowPlayer) then
                self.onlyRightGang = true
            else
                self.showWaitAction = true
            end
        else
            --ComponentUtil.SafeSetActive(self.actionBtBuHua , true)
            --self.showWaitAction = true
            ComponentUtil.SafeSetActive(self.actionBtBuHua , true)
            if(self.mySeat == gameState.ArrowPlayer) then
                self.onlyRightGang = true
            else
                self.showWaitAction = true
            end
        end
    end
     if #gameState.KeBuHua > 0 and showOtherAction  then
        ComponentUtil.SafeSetActive(self.actionBtBuHua , true)
        self.showWaitAction = true
    end
    if(self.ConfigData.isChangSha and gameState.KeKaiGang2 and #gameState.KeKaiGang2 > 0 and showOtherAction) then
        ComponentUtil.SafeSetActive(self.actionBtGang, true)
        if(self.mySeat == gameState.ArrowPlayer) then
            self.onlyRightGang = true
        else
            self.showWaitAction = true
        end
    end
    local showMidTing = true
    if(self.ConfigData.tingLocalJson) then
        showMidTing = self.ruleJsonInfo[self.ConfigData.tingLocalJson]
    end
    --KeTingBeg  开局可听    KeLiang 牌局过程中的可以听
    if(gameState.KeTingBeg or (#gameState.KeLiang > 0 and self.ConfigData.isMidTing and showMidTing)
        or (self.ConfigData.isSiHong and self:sihong_action_ting())) then
        if(showOtherAction) then
            if(self.ConfigData.isXueZhanDD) then
                ComponentUtil.SafeSetActive(self.actionBtNang, true)
            else
                ComponentUtil.SafeSetActive(self.actionBtTing, true)
            end
            self.showWaitAction = true
            if gameState.KeTingBeg then
                self.TingPaiState = 1
            else
                self.TingPaiState = 2
            end
            if(#gameState.Dun <= 10 and self.ConfigData.isXueZhanDD) then
                ComponentUtil.SafeSetActive(self.actionBtNang, false)
                self.showWaitAction = false
            end
        end
    end
    if(#gameState.KeLiang > 0 and self.ConfigData.isKaWuXing ) then
        if(showOtherAction) then
            ComponentUtil.SafeSetActive(self.actionBtLiang, true)
            self.onlyRightGang = true
            --self.showWaitAction = true
        end
    end
    if gameState.KeLiangZFB and self.ConfigData.isHuangShiHH then  ---黄石晃晃亮中发白操作
        ComponentUtil.SafeSetActive(self.actionBtLiang, true)
        print("!!!!@@@@@亮中发白："..tostring(gameState.KeLiangZFB))
        self.showWaitAction = true
    end
    if gameState.KeDiaoDui and #gameState.KeDiaoDui > 0 and showOtherAction then
        ComponentUtil.SafeSetActive(self.actionBtDiao, true)
        self.showWaitAction = true
    end
    if self.showWaitAction or self.onlyRightGang then
        ComponentUtil.SafeSetActive(self.waitAction, true)
        ComponentUtil.SafeSetActive(self.actionBtGuo, showOtherAction)
    end
    ComponentUtil.SafeSetActive(self.sanKouObj,  gameState.bpcs and #gameState.bpcs > 0)
    if(gameState.bpcs and #gameState.bpcs > 0) then
        ComponentUtil.SafeSetActive(self.openSanKouObj, self:sankou_is_open())
        ComponentUtil.SafeSetActive(self.closeSanKouObj, not self:sankou_is_open())
    end
    ComponentUtil.SafeSetActive(self.selectHaiDi, gameState.KeMo)

    ComponentUtil.SafeSetActive(self.waitActionCS, false)
    for i=1,#self.waitActionCSs do
        ComponentUtil.SafeSetActive(self.waitActionCSs[i], false)
    end
    -- 处理长沙麻将的Action
    if(self.ConfigData.isChangSha and #gameState.KeHuLeiXing > 0) then
        ComponentUtil.SafeSetActive(self.waitActionCS, true)
        for i = 1, #gameState.KeHuLeiXing do
            ComponentUtil.SafeSetActive(self.waitActionCSs[gameState.KeHuLeiXing[i]], true)
        end
        ComponentUtil.SafeSetActive(self.actionBtGuo, showOtherAction)
        --self.canHu = true
    end
    self.csSelectKaiGang:SetActive(false)
    if(gameState.GangPai and #gameState.GangPai > 0 and self.showWaitAction) then
        local kaiGangSeat = gameState.GangPai2.SeatID
        if(kaiGangSeat ~= self.mySeat) then
            ComponentUtil.SafeSetActive(self.waitAction, false)
            self:show_cs_kai_gang(kaiGangSeat)
        end
    end
    if(gameState.KeBuZhang and #gameState.KeBuZhang > 0) then
        self.feixiaoJi:SetActive(true)
        TableUtil.set_mj(gameState.KeBuZhang[1], self.feixiaoJiMJ1, self.mjScaleSet, self.frontSpriteH)
        TableUtil.set_mj_bg(1, self.feixiaoJiMJ1, self.mjColorSet)
        if(#gameState.KeBuZhang > 1) then
            self.feixiaoJiMJ2:SetActive(true)
            TableUtil.set_mj(gameState.KeBuZhang[2], self.feixiaoJiMJ2, self.mjScaleSet, self.frontSpriteH)
            TableUtil.set_mj_bg(1, self.feixiaoJiMJ2, self.mjColorSet)
            self.feixiaoJiMJ1.transform.localPosition = Vector3.New(-83, self.feixiaoJiMJ1.transform.localPosition.y, 0)
            self.feixiaoJiMJ2.transform.localPosition = Vector3.New(83, self.feixiaoJiMJ2.transform.localPosition.y, 0)
        else
            self.feixiaoJiMJ2:SetActive(false)
            self.feixiaoJiMJ1.transform.localPosition = Vector3.New(0, self.feixiaoJiMJ1.transform.localPosition.y, 0)
        end
    else
        self.feixiaoJi:SetActive(false)
    end
    --self.onlyRightGang = (self.buttonGangRight.activeSelf and not self.showWaitAction)
end

function TableView:sankou_is_open()
    for i=1,#gameState.bpcs do
        local sanKouData = gameState.bpcs[i]
        if(sanKouData.change)  then
            return true
        end
    end
    return false
end

-- 实时刷新牌局
function TableView:show_time()

    if self.kickedTimeId then
        CSmartTimer:Kill(self.kickedTimeId)
        ComponentUtil.SafeSetActive(self.coinMatchCountdownObj,false)
    end

    self.kickedTimeId = self:subscibe_time_event(self.timerSum, false, 1):OnUpdate(function(t)
        t = t.surplusTimeRound
           -- print("##################################t:",t)
        if t >= 20 then
            self.timer1img.sprite = self.timer1imgSprite:FindSpriteByName("2")
            self.timer2img.sprite = self.timer2imgSprite:FindSpriteByName((t % 10) .. "")
        elseif t >= 10 then
            self.timer1img.sprite = self.timer1imgSprite:FindSpriteByName("1")
            self.timer2img.sprite = self.timer2imgSprite:FindSpriteByName((t % 10) .. "")
        else
            if(t == 3) then
                if(gameState.Result == 0) then
                    self:play_voice("common/timedown")
                end
            end
            self.timer1img.sprite = self.timer1imgSprite:FindSpriteByName("0")
            if(t < 0) then
                t = 0
            end
            self.timer2img.sprite = self.timer2imgSprite:FindSpriteByName(t .. "")
            local isKeChu = gameState and gameState.KeChu
            if t == 0 and isKeChu then
                if(self.openShake) then
                    ModuleCache.GameSDKInterface:ShakePhone(1000)
                end
            end
        end
    end):OnComplete(function(t)

    end).id
end

-- 房间内用户上线
function TableView:refresh_user_online(data)
    local mySeat = self.newMySeat or self.mySeat
    local seatHolder = self.seatHolderArray[TableUtil.get_local_seat(data.SeatID, mySeat, totalSeat, TableManager.seatNumTable)]
    if(data.AppendData and data.AppendData ~= "") then
        local locationStr = string.split(data.AppendData, ",")
        if(#locationStr > 0) then
            seatHolder.locationData =
            {
                latitude = tonumber(locationStr[1]),
                longitude = tonumber(locationStr[2]),
                address = locationStr[3],
            }
        end
    else
        seatHolder.locationData = self:check_location_data(seatHolder.locationData)
    end
    if data.State and data.State ~= 0 then
        seatHolder.netState = data.State
    end
    self:update_gps()
end

-- 房间内用户离线
function TableView:refresh_user_offline(data)

end

function TableView:look_player_info(obj)
    if(self.randomSeat) then
        return
    end
    local seatHolder = self:get_click_local_seat(obj)
    if(seatHolder) then
        if(curTableData.isPlayBack) then
            self:play_back_switch_player(seatHolder)
            return
        end
        ModuleCache.ModuleManager.show_module("public", "playerinfo", seatHolder)
    end
end

function TableView:get_click_local_seat(obj)
    for i=1,#self.seatHolderArray do
        if(self.seatHolderArray[i].imagePlayerHead.gameObject == obj) then
            return self.seatHolderArray[i]
        end
    end
    return nil
end

-- 上传玩家状态
function TableView:refresh_report_state(data)
    local mySeat = self.newMySeat or self.mySeat
    local seatID = TableManager.seatNumTable[data.SeatID + 1]
    local localSeat = TableUtil.get_local_seat(seatID, mySeat, totalSeat)
    local seatHolder = self.seatHolderArray[localSeat]
    local isLeave = localSeat ~= 1 and data.State and data.State == 1
    local isDisconnect =  localSeat ~= 1 and data.State and data.State == 2
    ComponentUtil.SafeSetActive(seatHolder.imageLeave,isLeave)
    ComponentUtil.SafeSetActive(seatHolder.imageDisconnect, isDisconnect)
    if isDisconnect then
        seatHolder.imagePlayerHead.material = self.grayMat
    else
        seatHolder.imagePlayerHead.material = nil
    end
    if curTableData.RoomType == 2 and not self:all_is_ready() and gameState == nil then
        --快速组局 牌局没开始前 如果有玩家离线 显示踢人按钮
        ComponentUtil.SafeSetActive(seatHolder.buttonKick, seatHolder.imageDisconnect.activeSelf)
    end
    if(self.randomSeat) then
        seatHolder.netState = data.State
    end
end

function TableView:get_last_seat_data(userID)
    for i = 1, #self.lastUserState.State do
        local data = self.lastUserState.State[i]
        if(data.UserID == userID) then
            return data
        end
    end
end

function TableView:get_new_seat_data(userID)
    for i = 1, #self.userState.State do
        local data = self.userState.State[i]
        if(data.UserID == userID) then
            return data
        end
    end
    return nil
end

-- 刷新用户状态
function TableView:refresh_user_state(data)
    self.lastUserState = self.userState or data
    self.userState = data
    self.baseCoinScore = data.BaseCoinScore
    curTableData.serverIsNew = true --(data.randomseat == 1) 全是新版本了
    self.openRandomSeat = (data.randomseat == 1 and gameState == nil)
    local randomType = data.msgtype
    if(randomType == 1) then
        print("随机中 。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。")
        --ComponentUtil.SafeSetActive(self.ImageRandom, true)
        self.newMySeat = self:get_new_seat_data(curTableData.modelData.roleData.userID).SeatID
        self.randomSeat = true
        self:update_ready(data)
        for i = 1, #self.lastUserState.State do
            local newData = self:get_new_seat_data(self.lastUserState.State[i].UserID)
            local newSeatID = newData.SeatID
            print("最新的座位" .. newSeatID)
            print(TableUtil.get_local_seat(i - 1, self.mySeat, totalSeat))
            local seatHolder = self.seatHolderArray[TableUtil.get_local_seat(i - 1, self.mySeat, totalSeat)]
            seatHolder.netState = nil
            local randomMJ = TableUtil.poor("RandomMJ", seatHolder.randomMJPos, Vector3.zero, self.poorObjs, self.clones)
            TableUtil.set_mj(newSeatID, randomMJ, self.mjScaleSet)
            TableUtil.set_mj_bg(1, randomMJ, self.mjColorSet)
            ComponentUtil.SafeSetActive(seatHolder.paiMJ, false)
            ComponentUtil.SafeSetActive(seatHolder.imageReady, false)
            self:ready_random_seat()
            self:subscibe_time_event(3.4, false, 0):OnComplete(function(t)
                self.poorObjs = TableUtil.add_poor(randomMJ, self.poorObjs, self.cloneParent)
                if(self.randomSeat) then
                    self.randomSeat = false

                    self:delay_random_user_state(data)
                    if(gameState) then
                        self:refresh_game_state(gameState)
                    end
                    self:show_zun(data, i)
                end
            end)
        end
    else
        self:delay_random_user_state(data)
    end
end

function TableView:ready_random_seat()
    for i=1,#self.seatHolderArray do
        local seatHolder = self.seatHolderArray[i]
        ComponentUtil.SafeSetActive(seatHolder.waiZun.gameObject, false)
        ComponentUtil.SafeSetActive(seatHolder.startBalanceText.gameObject, false)
        seatHolder.textScore.text = ""
        seatHolder.seatRoot.transform:SetParent(seatHolder.readySeatHolder)
        ComponentUtil.SafeSetActive(seatHolder.beginUI, false)
        --seatHolder.textPlayerName.transform.anchoredPosition = Vector3.New(0, 20, 0)
        seatHolder.seatRoot.transform.anchoredPosition = Vector3.New(0, 0, 0)
    end
end

function TableView:update_ready(data)
    for i=1,#data.State do
        local SeatID = data.State[i].SeatID
        local localSeat = TableUtil.get_local_seat(SeatID, self.mySeat, totalSeat)
        if 1 == localSeat then ---如果是自己则检查是否有准备状态错误信息
        local ErrCode = data.State[i].ErrCode
            if ErrCode and 0~= ErrCode then
                if  4 == curTableData.RoomType
                        and -888 == ErrCode then
                    ModuleCache.ModuleManager.show_public_module("alertdialog"):show_other_confirm_cancel("您的金币不足，是否立即补充金币继续游戏？", function()
                        ModuleCache.ModuleManager.show_module("public", "goldadd")
                    end, nil, true, "确 认", "取 消")
                else
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.State[i].ErrInfo)
                end
            end
        end
        local seatHolder = self.seatHolderArray[localSeat]

        if  4 == curTableData.RoomType or curTableData.ruleJsonInfo.settleType == 1 then --金币场入场未准备倒计时
            if(gameState == nil) then
                if "0" ~= data.State[i].UserID then
                    seatHolder.textScore.text = ""
                    ComponentUtil.SafeSetActive(seatHolder.startBalanceText.gameObject, true)
                    seatHolder.startBalanceText.text = Util.filterPlayerGoldNum(data.State[i].Balance)
                else
                    ComponentUtil.SafeSetActive(seatHolder.startBalanceText.gameObject, false)
                end
            end
        end

        seatHolder.ready = data.State[i].Ready
        ComponentUtil.SafeSetActive(seatHolder.imageReady, data.State[i].Ready)
        if(gameState and gameState.Result == 3) then
            ComponentUtil.SafeSetActive(seatHolder.imageReady, false)
        end
        if(seatHolder.ready) then
            if(SeatID == self.mySeat) then
                if(gameState and gameState.Result == 1) then
                    self:reset_seat_all_mj()
                    ModuleCache.SoundManager.stop_all_sound()
                end
                ComponentUtil.SafeSetActive(self.gChangeBtn, false)
                ComponentUtil.SafeSetActive(self.buttonBegin, false)
                if 4 == curTableData.RoomType then
                    ComponentUtil.SafeSetActive(self.buttonInvite, false)
                    ComponentUtil.SafeSetActive(self.buttonExit, false)
                    --self.gChangeBtn.transform.anchoredPosition = Vector3.New(0, self.gChangeBtn.transform.anchoredPosition.y, 0)
                else
                    --self.buttonInvite.transform.anchoredPosition = Vector3.New(-200, self.buttonInvite.transform.anchoredPosition.y, 0)
                    --self.buttonExit.transform.anchoredPosition = Vector3.New(200, self.buttonExit.transform.anchoredPosition.y, 0)
                end

                ---关闭牌桌小结算预览相关控件
                ModuleCache.ComponentUtil.SafeSetActive(self.PreSettlementObj, false)
                print_debug("hide_table_presettlement .......................")
            end
        elseif(SeatID == self.mySeat and gameState == nil) then
            ComponentUtil.SafeSetActive(self.inviteAndExit, true)
            ComponentUtil.SafeSetActive(self.buttonBegin, true)
            self:set_begin_countdown_state(false)
            if 4 == curTableData.RoomType then
                ComponentUtil.SafeSetActive(self.buttonInvite, false)
                ComponentUtil.SafeSetActive(self.buttonExit, false)
                ComponentUtil.SafeSetActive(self.gChangeBtn, true)
                --self.gChangeBtn.transform.anchoredPosition = Vector3.New(-200, self.buttonBegin.transform.anchoredPosition.y, 0)
                --self.buttonBegin.transform.anchoredPosition = Vector3.New(200, self.buttonBegin.transform.anchoredPosition.y, 0)
                if(localSeat == 1 and data.State[i].RestTime and data.State[i].RestTime > 0) then
                    self:show_ready_time_down(data.State[i].RestTime)
                end
            else
                --self.buttonInvite.transform.anchoredPosition = Vector3.New(-440, self.buttonInvite.transform.anchoredPosition.y, 0)
                --self.buttonExit.transform.anchoredPosition = Vector3.New(440, self.buttonExit.transform.anchoredPosition.y, 0)
                ComponentUtil.SafeSetActive(self.gChangeBtn,false)
            end
        end
    end
    local allReady = self:all_is_ready()
    if(self.inviteAndExit.activeSelf) then
        ComponentUtil.SafeSetActive(self.inviteAndExit, not allReady)
    end

    self:update_gps()
    for i=1,#data.State do
        local SeatID = data.State[i].SeatID
        local seatHolder = self.seatHolderArray[TableUtil.get_local_seat(SeatID, self.mySeat, totalSeat)]
        if(allReady) then
            ComponentUtil.SafeSetActive(seatHolder.buttonKick, false)
        end
    end

end

function TableView:show_ready_time_down(timeDown)
    self:set_begin_countdown_state(true)
    if self.readykickedTimeId then
        CSmartTimer:Kill(self.readykickedTimeId)
    end
    self.readykickedTimeId = self:subscibe_time_event(timeDown, false, 0):OnUpdate(function(t)
        t = t.surplusTimeRound
        self.buttonBegin_countDownTex.text = "("..t.."s)"
    end):OnComplete(function(t)

    end).id
end

function TableView:show_zun(userState, i)
    local state = userState.State[i]
    if(self.ConfigData.isSuSong and state.SeatID == self.mySeat and state.PiaoType == 1) then
        local zunCount = 0
        if(gameState) then
            zunCount = gameState.zunnum
        end
        if(zunCount < 5) then
            ComponentUtil.SafeSetActive(self.selectZun, true)
            for i=1,6 do
                ComponentUtil.SafeSetActive(self.selectZunChilds[i + 6], i - 1 < zunCount)
                ComponentUtil.SafeSetActive(self.selectZunChilds[i], not (i - 1 < zunCount))
            end
        end
    end
    if(state.SeatID == self.mySeat and state.PiaoType == 1) then
        if(self.ConfigData.isDengZhou) then
            if(not ModuleCache.ModuleManager.module_is_active("majiang", "tablestrategy")) then
                ModuleCache.ModuleManager.show_module("majiang", "tablestrategy", self.mySeat == userState.ZhuangJia)
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
end

-- 等待随机座位结束
function TableView:delay_random_user_state(data)
    if not curTableData.isPlayBack then
        self.mySeat = self:get_new_seat_data(curTableData.modelData.roleData.userID).SeatID
    end
    curTableData.SeatID = self.mySeat
    print("我之后的座位：" .. self.mySeat)
    curTableData.seatUserIdInfo = {}
    self:update_seat_pointer()
    self:update_ready(data)
    for i=1,#data.State do
        local SeatID = data.State[i].SeatID
        if(data.State[i].UserID ~= "0") then
            curTableData.seatUserIdInfo[SeatID .. ""] = data.State[i].UserID
        end
        self:refresh_seat_info(data.State[i], self.mySeat, true)
        local localSeat = TableUtil.get_local_seat(SeatID, self.mySeat, totalSeat)
        local seatHolder = self.seatHolderArray[localSeat]
        seatHolder.addGoldObj:SetActive(data.State[i].State == 1)
        --ComponentUtil.SafeSetActive(seatHolder.paiMJ, self.openRandomSeat)
        if(seatHolder.ready) then
            if(data.State[i].PiaoType == 0) then
                if(SeatID == self.mySeat) then
                    ComponentUtil.SafeSetActive(self.selectZun, false)
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
            elseif(not self.randomSeat) then
                self:show_zun(data, i)
            end
        elseif(SeatID == self.mySeat and self.ConfigData.isKaWuXing and not gameState) then
            if(not ModuleCache.ModuleManager.module_is_active("majiang", "tablepop")) then
                ModuleCache.ModuleManager.show_module("majiang", "tablepop")
            end
        end
    end
    local allReady = self:all_is_ready()
    ---金币场相关设置
    if 4 == curTableData.RoomType then --金币场显示离开和游戏规则按钮
        ComponentUtil.SafeSetActive(self.goldModeTopLeft,true)
        ComponentUtil.SafeSetActive(self.beginTopLeft,false)
        ComponentUtil.SafeSetActive(self.readyTopLeft,false)
    else
        ComponentUtil.SafeSetActive(self.goldModeTopLeft,false)
        ComponentUtil.SafeSetActive(self.beginTopLeft, allReady or gameState ~= nil)
        ComponentUtil.SafeSetActive(self.readyTopLeft, not allReady and gameState == nil)
    end
    for i=1,#self.seatHolderArray do
        local seatHolder = self.seatHolderArray[i]
        if(allReady or gameState ~= nil or self.ConfigData.isKaWuXing or curTableData.RoomType == 4) then
            seatHolder.seatRoot.transform:SetParent(seatHolder.seatParent.transform)
            ComponentUtil.SafeSetActive(seatHolder.beginUI, true)
            --seatHolder.textPlayerName.transform.anchoredPosition = Vector3.New(0, -3, 0)
        else
            seatHolder.textScore.text = ""
            seatHolder.seatRoot.transform:SetParent(seatHolder.readySeatHolder)
            ComponentUtil.SafeSetActive(seatHolder.beginUI, false)
            if 4 == curTableData.RoomType or curTableData.ruleJsonInfo.settleType == 1 then
                --seatHolder.textPlayerName.transform.anchoredPosition = Vector3.New(0, -1, 0)
            else
                --seatHolder.textPlayerName.transform.anchoredPosition = Vector3.New(0, 20, 0)
            end
        end
        seatHolder.seatRoot.transform.anchoredPosition = Vector3.New(0, 0, 0)
    end
    for i=1,#data.State do
        local SeatID = data.State[i].SeatID
        local seatHolder = self.seatHolderArray[TableUtil.get_local_seat(SeatID, self.mySeat, totalSeat)]
        ComponentUtil.SafeSetActive(seatHolder.showAdd1.gameObject, false)
        ComponentUtil.SafeSetActive(seatHolder.showAdd2.gameObject, false)
        if(allReady) then
            ComponentUtil.SafeSetActive(seatHolder.buttonKick, false)
            if(data.State[i].PiaoType == 0) then
                self:on_show_head_add_info(seatHolder, data.State[i], data)
            end
        elseif(self.ConfigData.isKaWuXing) then
            self:on_show_head_add_info(seatHolder, data.State[i], data)
        end
        ComponentUtil.SafeSetActive(seatHolder.waiZun.gameObject, self.ConfigData.isSuSong and
            allReady and data.State[i].PiaoType == 1 and SeatID ~= self.mySeat)
    end

    self.diceShow = false
    if(data.DiceType) then
        self.diceShow = true
        ComponentUtil.SafeSetActive(self.diceObj, true)
        ComponentUtil.SafeSetActive(self.diceAni.gameObject, true)
        ComponentUtil.SafeSetActive(self.diceImage1.gameObject, false)
        ComponentUtil.SafeSetActive(self.diceImage2.gameObject, false)
        self.diceAni:Play(0)
        self:subscibe_time_event(self.diceAni.duration + 0.1, false, 0):OnComplete(function(t)
            ComponentUtil.SafeSetActive(self.diceAni.gameObject, false)
            ComponentUtil.SafeSetActive(self.diceImage1.gameObject, true)
            ComponentUtil.SafeSetActive(self.diceImage2.gameObject, true)
            if(gameState) then
                self.diceImage1.sprite = self.diceImage1SH:FindSpriteByName(gameState.Dice1 .. "")
                self.diceImage2.sprite = self.diceImage2SH:FindSpriteByName(gameState.Dice2 .. "")
                self:subscibe_time_event(1.2, false, 0):OnComplete(function(t)
                    ComponentUtil.SafeSetActive(self.diceObj, false)
                    self.diceShow = false
                    self:refresh_game_state(gameState)
                end)
            else
                ComponentUtil.SafeSetActive(self.diceObj, false)
            end
        end)
    end

    self:update_ui_anticheat()
    self:refresh_buttonActivity_state() ---刷新活动按钮状态
end

--- 显示头像附加信息1
function TableView:show_head_add_text1(text, seatHolder)
    text = text or ""
    if(text == "") then
        seatHolder.showAdd1:SetActive(false)
    else
        seatHolder.showAdd1:SetActive(true)
    end
    seatHolder.showAdd1Text.text = text
end

--- 显示头像附加信息2
function TableView:show_head_add_text2(text, seatHolder)
    text = text or ""
    if(text == "") then
        seatHolder.showAdd2:SetActive(false)
    else
        seatHolder.showAdd2:SetActive(true)
    end
    seatHolder.showAdd2Text.text = text
end

function TableView:on_show_head_add_info(seatHolder, seatData, userState)
    if(self.ConfigData.headTag) then
        local isMaster = (userState.ZhuangJia == seatData.SeatID)
        local showNum = seatData[self.ConfigData.headTag.serverJson]
        if(showNum ~= -1) then
            if(showNum == 0) then
                if(isMaster and self.ConfigData.headTag.zeroMasterJson) then
                    self:show_head_add_text1(self.ConfigData.headTag.zeroMasterJson, seatHolder)
                else
                    self:show_head_add_text1(self.ConfigData.headTag.zeroJson, seatHolder)
                end
            elseif(self.ConfigData.headTag.addJson) then
                if(isMaster and self.ConfigData.headTag.addMasterJson) then
                    self:show_head_add_text1(showNum .. self.ConfigData.headTag.addMasterJson, seatHolder)
                else
                    self:show_head_add_text1(showNum .. self.ConfigData.headTag.addJson, seatHolder)
                end
            elseif(self.ConfigData.headTag.preJson) then
                if(isMaster and self.ConfigData.headTag.preMasterJson) then
                    self:show_head_add_text1(self.ConfigData.headTag.preMasterJson .. showNum, seatHolder)
                else
                    self:show_head_add_text1(self.ConfigData.headTag.preJson .. showNum, seatHolder)
                end
            else
                if(isMaster and self.ConfigData.headTag.notZeroMasterJson) then
                    self:show_head_add_text1(self.ConfigData.headTag.notZeroMasterJson, seatHolder)
                else
                    self:show_head_add_text1(self.ConfigData.headTag.notZeroJson, seatHolder)
                end
            end
        end
        showNum = seatData[self.ConfigData.headTag.serverJson2]
        if(showNum ~= -1) then
            if(showNum == 0) then
                if(isMaster and self.ConfigData.headTag.zeroMasterJson2) then
                    self:show_head_add_text2(self.ConfigData.headTag.zeroMasterJson2, seatHolder)
                else
                    self:show_head_add_text2(self.ConfigData.headTag.zeroJson2, seatHolder)
                end
            elseif(self.ConfigData.headTag.addJson2) then
                if(isMaster and self.ConfigData.headTag.addMasterJson2) then
                    self:show_head_add_text2(showNum .. self.ConfigData.headTag.addMasterJson2, seatHolder)
                else
                    self:show_head_add_text2(showNum .. self.ConfigData.headTag.addJson2, seatHolder)
                end
            elseif(self.ConfigData.headTag.preJson2) then
                if(isMaster and self.ConfigData.headTag.preMasterJson2) then
                    self:show_head_add_text2(self.ConfigData.headTag.preMasterJson2 .. showNum, seatHolder)
                else
                    self:show_head_add_text2(self.ConfigData.headTag.preJson2 .. showNum, seatHolder)
                end
            else
                if(isMaster and self.ConfigData.headTag.notZeroMasterJson2) then
                    self:show_head_add_text2(self.ConfigData.headTag.notZeroMasterJson2, seatHolder)
                else
                    self:show_head_add_text2(self.ConfigData.headTag.notZeroJson2, seatHolder)
                end
            end
        end
    end
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
        self.diceImage1.gameObject:SetActive(true)
        self.diceImage2.gameObject:SetActive(true)
        if dice1 and dice2 then
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

-- 所有人都准备好了
function TableView:all_is_ready()
    local allReady = true
    for i=1,#self.seatHolderArray do
        if(not self.seatHolderArray[i].ready and self.seatHolderArray[i].enable) then
            allReady = false
            break
        end
    end
    return allReady
end

-- 获取被踢者的名字
function TableView:get_kick_player_name(obj)
    for i=1,#self.seatHolderArray do
        local seatHolder = self.seatHolderArray[i]
        if(obj == seatHolder.buttonKick) then
            return seatHolder.playerId, seatHolder.textPlayerName.text
        end
    end
end

-- 刷新座位信息
function TableView:refresh_seat_info(data, mySeat, noRefreshPos)
    local seatID = data.SeatID
    mySeat = mySeat or self.mySeat
    local localSeat = TableUtil.get_local_seat(seatID, mySeat, totalSeat)
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder.SeatID = seatID
    seatHolder.playerId = data.UserID or "0"

    if(not data.UserID or data.UserID == "0") then
        ComponentUtil.SafeSetActive(seatHolder.goSeatInfo, false)
        ComponentUtil.SafeSetActive(seatHolder.imageReady, false)
        ComponentUtil.SafeSetActive(seatHolder.buttonNotSeatDown, true)
        seatHolder.scoreChangeText.text = ""
        seatHolder.ready = false
        seatHolder.locationData = nil
        self:update_gps()
    else
        if(not curTableData.seatUserIdInfo) then
            curTableData.seatUserIdInfo = {}
        end

        curTableData.seatUserIdInfo[seatID .. ""] = data.UserID
        if(curTableData.isPlayBack) then
            seatHolder.seatRoot.transform:SetParent(seatHolder.seatParent.transform)
            ComponentUtil.SafeSetActive(seatHolder.beginUI, true)
            --seatHolder.textPlayerName.transform.anchoredPosition = Vector3.New(0, -3, 0)
        end

        if localSeat == 1 then
            ComponentUtil.SafeSetActive(seatHolder.imageLeave, false)
            ComponentUtil.SafeSetActive(seatHolder.imageDisconnect, false)
        else
            if data.State then
                ComponentUtil.SafeSetActive(seatHolder.imageLeave, data.State == 1)
                ComponentUtil.SafeSetActive(seatHolder.imageDisconnect, data.State == 2)
            elseif(seatHolder.netState) then
                ComponentUtil.SafeSetActive(seatHolder.imageLeave, seatHolder.netState == 1)
                ComponentUtil.SafeSetActive(seatHolder.imageDisconnect, seatHolder.netState == 2)
            end
        end
        ComponentUtil.SafeSetActive(seatHolder.goSeatInfo, true)
        ComponentUtil.SafeSetActive(seatHolder.buttonNotSeatDown, false)
        --curTableData.RoomType == 2为快速组局，快速组局没有踢人功能   curTableData.RoomType == 3为比赛场，没有踢人
        if(not self:all_is_ready() and seatID ~= 0 and mySeat == 0 and gameState == nil and curTableData.RoomType ~= 3 and curTableData.RoomType ~= 4) then --金币场不现实踢人按钮

            ComponentUtil.SafeSetActive(seatHolder.buttonKick, true)
            if  curTableData.RoomType == 2  then
                --快速组局 牌局没开始前 如果有玩家离线 显示踢人按钮
                ComponentUtil.SafeSetActive(seatHolder.buttonKick, seatHolder.imageDisconnect.activeSelf)
            end
        end
        if(not noRefreshPos) then
            if(data.AppendData and data.AppendData ~= "") then
                local locationStr = string.split(data.AppendData, ",")
                if(#locationStr > 0) then
                    seatHolder.locationData =
                    {
                        latitude = tonumber(locationStr[1]),
                        longitude = tonumber(locationStr[2]),
                        address = locationStr[3],
                    }
                end
            --else
                --seatHolder.locationData = self:check_location_data(seatHolder.locationData)
            end
        end
        TableUtil.download_seat_detail_info(data.UserID,function(playerInfo)
            if self.isDestroy then  -- 要注意缓存回调时有可能view已经销毁了
                return
            end
            seatHolder.imagePlayerHead.sprite = playerInfo.headImage
        end,function(playerInfo)
            if self.isDestroy then  -- 要注意缓存回调时有可能view已经销毁了
                return
            end
            seatHolder.textPlayerName.text = Util.filterPlayerName(playerInfo.playerName, 10, playerInfo.isRedName)
            seatHolder.gender = playerInfo.gender
            seatHolder.ip = playerInfo.ip
            self:update_gps()
        end)
    end
    self:update_ui_anticheat()
end

--- 座位是否设置防作弊
function TableView:seat_is_anticheat(localSeat)
    return localSeat ~= 1 and self.ruleJsonInfo.anticheat and not self:all_is_ready()
end

function TableView:update_gps()
    if(self.ruleJsonInfo.anticheat and not self:all_is_ready()) then
        return
    end
    local data ={};
    data.gameType="majiang";
    data.seatHolderArray = self.seatHolderArray;
    data.buttonLocation = self.buttonWarning

    data.roomID=curTableData.RoomID;
    data.tableCount=totalSeat;
    data.isPlay=self:all_is_ready();
    data.isShowLocation=false;
    --打开定位功能界面
    ModuleCache.ModuleManager.show_module("public", "tablelocation",data);
end


-- 计算距离
function TableView:caculate_distance(seatInfo1, seatInfo2)
    if(seatInfo1.locationData.latitude ~= 0 and seatInfo2.locationData.latitude ~= 0) then
        local distance = TableUtil.caculate_distance(seatInfo1.locationData.latitude,seatInfo1.locationData.longitude,
            seatInfo2.locationData.latitude,seatInfo2.locationData.longitude)

        local distanceShow = math.ceil(distance).."米"
        if distance<10 then
            distanceShow = "小于10米"
        end
        if distance >=1000 then
            distanceShow = string.format("%.0f",distance/1000) .."公里"
        end
        --print("距离：------- " .. distance)
        local tip = "玩家:<color=#b13a1f>"..seatInfo1.textPlayerName.text.."</color>与<color=#b13a1f>"..seatInfo2.textPlayerName.text.."</color>距离为:"..distanceShow.."\n"
        return tip
    end
    return ""
end

function TableView:get_gps_warn_text(checkPlayer)
    local showText = ""
    local tipText = ""
    local distanceText = ""
    local tip = ""
    if(#checkPlayer == 2) then
        local index1 = checkPlayer[1]
        local index2 = checkPlayer[2]
        local seatInfo1 = self.seatHolderArray[index1]
        seatInfo1.locationData = self:check_location_data(seatInfo1.locationData)
        if(seatInfo1.locationData.latitude == 0) then
            tip = "玩家:<color=#b13a1f>"..seatInfo1.textPlayerName.text.."</color>".. seatInfo1.locationData.address .. "\n"
            showText = showText..tip
            tipText = tipText..tip
        end
        local seatInfo2 = self.seatHolderArray[index2]
        seatInfo2.locationData = self:check_location_data(seatInfo2.locationData)
        if(seatInfo2.locationData.latitude == 0) then
            tip = "玩家:<color=#b13a1f>"..seatInfo2.textPlayerName.text.."</color>".. seatInfo2.locationData.address .. "\n"
            showText = showText..tip
            tipText = tipText..tip
        end

        if seatInfo1.ip == seatInfo2.ip then
            tip = "玩家:<color=#b13a1f>"..seatInfo1.textPlayerName.text.."</color>与<color=#b13a1f>"..seatInfo2.textPlayerName.text.."</color> IP地址相同\n"
            showText = showText..tip
            tipText = tipText..tip
        end
        tip = self:caculate_distance(seatInfo1, seatInfo2)
        distanceText = distanceText..tip
        showText = showText..tip

    elseif(#checkPlayer == 3) then
        for i=2,#checkPlayer do
            local seatInfo1 = self.seatHolderArray[i]
            seatInfo1.locationData = self:check_location_data(seatInfo1.locationData)
            if(seatInfo1.locationData.latitude == 0 and i == 2) then
                tip = "玩家:<color=#b13a1f>"..seatInfo1.textPlayerName.text.."</color>".. seatInfo1.locationData.address .. "\n"
                showText = showText..tip
                tipText = tipText..tip
            end
            for j=i+1,#checkPlayer+1 do
                local seatInfo2 = self.seatHolderArray[j]
                seatInfo2.locationData = self:check_location_data(seatInfo2.locationData)

                if seatInfo1.ip == seatInfo2.ip then
                    tip = "玩家:<color=#b13a1f>"..seatInfo1.textPlayerName.text.."</color>与<color=#b13a1f>"..seatInfo2.textPlayerName.text.."</color> IP地址相同\n"
                    showText = showText..tip
                    tipText = tipText..tip
                end
                tip = self:caculate_distance(seatInfo1, seatInfo2)
                distanceText = distanceText..tip
                showText = showText..tip
            end
        end
    end
    if(tipText == "") then
        tipText = "没有IP地址相同的玩家\n所有玩家已开启位置信息。"
    end
    if(distanceText == "") then
        distanceText = "没有位置距离信息"
    end
    return showText,tipText,distanceText
end

function TableView:check_location_data(data)
    if(not data) then
        data = {}
    end
    if(not data.address) then
        data.address = "未开启获取位置功能"
        data.latitude = 0
        data.longitude = 0
    end
    return data
end

function TableView:get_chat_short_text(index)
    local locationSetting = self:getCurLocationSetting()
    if(self.ConfigData.chatShotTextList and 1 == locationSetting) then
        return self.ConfigData.chatShotTextList[index]
    end
    return TableUtil.get_chat_text(index)
end

function TableView:show_chat_bubble(seat, content)
    if not content then
        return
    end
    local seat = TableUtil.get_local_seat(seat, self.mySeat, totalSeat, TableManager.seatNumTable)
    local seatInfo = self.seatHolderArray[seat]
    local seatRoot = seatInfo.seatRoot
    local chatBubble = GetComponentWithPath(seatRoot, "State/Group/ChatBubble", ComponentTypeName.RectTransform).gameObject
    local chatFace = GetComponentWithPath(seatRoot, "State/Group/ChatFace", ComponentTypeName.RectTransform).gameObject
    local chatText = nil
    if seat == 1 or seat == 4 then
       chatText = GetComponentWithPath(chatBubble, "TextBgLeft/Text", ComponentTypeName.Text)
    elseif seat == 2 or seat == 3 then
       chatText = GetComponentWithPath(chatBubble, "TextBgRight/Text", ComponentTypeName.Text)
    end
    chatText.text = TableUtil.cut_text(self.widthText,content,400)
    chatBubble:SetActive(true)
    chatFace:SetActive(false)
    if seatInfo.timeChatEventId then
        CSmartTimer:Kill(seatInfo.timeChatEventId)
        seatInfo.timeChatEventId = nil
    end
    seatInfo.timeChatEventId = self:subscibe_time_event(3, false, 0):OnComplete(function(t)
        chatBubble:SetActive(false)
    end).id
end

function TableView:update_seat_location(seat,locationData)
    local mySeat = self.newMySeat or self.mySeat
    local seat = TableUtil.get_local_seat(TableManager.seatNumTable[seat + 1], mySeat, totalSeat)
    local seatInfo = self.seatHolderArray[seat]
    seatInfo.locationData = locationData
    self:update_gps()
end

function TableView:show_chat_face(seat, content)
    local seat = TableUtil.get_local_seat(seat, self.mySeat, totalSeat, TableManager.seatNumTable)
    local seatInfo = self.seatHolderArray[seat]
    local seatRoot = seatInfo.seatRoot
    local chatBubble = GetComponentWithPath(seatRoot, "State/Group/ChatBubble", ComponentTypeName.RectTransform).gameObject
    local chatFace = GetComponentWithPath(seatRoot, "State/Group/ChatFace", ComponentTypeName.RectTransform).gameObject
    local faceObj= TableUtil.get_all_child(chatFace)

    for i=1,#faceObj do
        faceObj[i]:SetActive(i == content)
    end

    chatFace:SetActive(true)
    chatBubble:SetActive(false)
    if seatInfo.timeChatEventId then
        CSmartTimer:Kill(seatInfo.timeChatEventId)
        seatInfo.timeChatEventId = nil
    end
    seatInfo.timeChatEventId = self:subscibe_time_event(3, false, 0):OnComplete(function(t)
        chatFace:SetActive(false)
    end).id
end

function TableView:show_voice(seat)
    local seat = TableUtil.get_local_seat(seat, self.mySeat, totalSeat, TableManager.seatNumTable)
    local seatInfo = self.seatHolderArray[seat]
    local seatRoot = seatInfo.seatRoot
    local voice = GetComponentWithPath(seatRoot, "State/Group/Speak", ComponentTypeName.RectTransform).gameObject
    voice:SetActive(true)
end

function TableView:hide_voice(seat)
    local seat = TableUtil.get_local_seat(seat, self.mySeat, totalSeat, TableManager.seatNumTable)
    local seatInfo = self.seatHolderArray[seat]
    local seatRoot = seatInfo.seatRoot
    local voice = GetComponentWithPath(seatRoot, "State/Group/Speak", ComponentTypeName.RectTransform).gameObject
    voice:SetActive(false)
end

function TableView:show_shot_voice(index, seat)
    local seat = TableUtil.get_local_seat(seat, self.mySeat, totalSeat, TableManager.seatNumTable)
    local seatInfo = self.seatHolderArray[seat]
	if(seatInfo.gender and seatInfo.gender == 1)then
		self:play_voice("femalesound_hn/" .. "fix_msg_" .. index)
	else
		self:play_voice("malesound_hn/" .. "fix_msg_" .. index)
	end
end

function TableView:play_voice(path)
    if(self.onlySet) then
        return
    end
    local locationSetting = self:getCurLocationSetting()
    local array = string.split(path, "/")
    if(not string.find(path, "common")) then
        if(self.ConfigData.soundPath and 1 == locationSetting ) then
            path = self.ConfigData.soundPath .. "/" .. path
        end
    end
	ModuleCache.SoundManager.play_sound("majiang", "majiang/sound/".. path .. ".bytes", array[#array])
end

function TableView:play_action_sound(action, seatInfo)
    local sounds = mCPGHLClipName[action .. ""]
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

function TableView:get_seat_id(seatInfo)
    for i=1,#self.seatHolderArray do
        if(seatInfo == self.seatHolderArray[i]) then
            return i
        end
    end
end

function TableView:TimingChangeBtnInvalidTag(time)
    if self.ChangeBtnInvalidTimingID then
        CSmartTimer:Kill(self.ChangeBtnInvalidTimingID)
    end
    ComponentUtil.SafeSetActive(self.ChangeInvalidTag,true)
    self.ChangeBtnInvalidTimingID = self:subscibe_time_event(time, false, 0):OnComplete(function(t)
        ComponentUtil.SafeSetActive(self.ChangeInvalidTag,false)
    end).id
end

-- 回放选择玩家显示数据
function TableView:play_back_switch_player(seatHolder)
    local seatID = seatHolder.SeatID
    self.mySeat = seatID
    curTableData.SeatID = seatID
    self:refresh_user_state(self.userState)
    self:refresh_game_state(gameState)
end

function TableView:get_room_award_table(roomAward)
    for i = 1, #self.seatHolderArray do
        local seatHolder = self.seatHolderArray[i]
        if(seatHolder.playerId == roomAward.UserID) then
            return {
                position = seatHolder.buttonNotSeatDown.transform.position,
                awardMsg = roomAward.Message,
                isMe = (i == 1),
                canRob=roomAward.canRob,
                sign=roomAward.sign,
            }
        end
    end
    return nil
end


function TableView:refresh_mj_color_scale(refreshState)
    local config = curTableData.playModelData
    local defaultScale = 0
    local defaultColor = 0
    if(config.cardTheame) then
        local strs = string.split(config.cardTheame, "|")
        if(strs[1]) then
            defaultScale = tonumber(strs[1])
        end
        if(strs[2]) then
            defaultColor = tonumber(strs[2])
        end
    end
    self.mjScaleSet = PlayerPrefs.GetInt(string.format("%s_MJScale",curTableData.ruleJsonInfo.GameType), defaultScale)
    self.mjColorSet = PlayerPrefs.GetInt(string.format("%s_MJColor",curTableData.ruleJsonInfo.GameType), defaultColor)
    if(refreshState and gameState and gameState.Result == 0) then
        self:refresh_game_state(gameState, true)
    end
end

function TableView:refresh_table_bg()
    local config = curTableData.playModelData
    local defaultBg = 1
    if(config.cardTheame) then
        local strs = string.split(config.cardTheame, "|")
        if(strs[3]) then
            defaultBg = tonumber(strs[3])
        end
    end
    local tableBg = PlayerPrefs.GetInt(string.format("%s_MJBackground",curTableData.ruleJsonInfo.GameType), defaultBg)
    ModuleCache.ComponentUtil.SafeSetActive(self.tableBg1, tableBg == 1)
    ModuleCache.ComponentUtil.SafeSetActive(self.tableBg2, tableBg == 2)
    ModuleCache.ComponentUtil.SafeSetActive(self.tableBg3, tableBg == 3)
end

-- 手牌转换（其他人）
function TableView:convert_hand_data_other(playerState)
    if(not playerState.MoZhang or playerState.MoZhang == 0) then
        return playerState.ShouZhang
    end
    local check = false
    local handData = {}
    local lastData = nil
    if(playerState.MoZhang and playerState.MoZhang ~= 0) then
        for i = 1, #playerState.ShouZhang do
            local handPai = playerState.ShouZhang[i].Pai
            if(handPai == playerState.MoZhang and not check and not playerState.ShouZhang[i].Gray) then
                check = true
                lastData = playerState.ShouZhang[i]
            else
                table.insert(handData, playerState.ShouZhang[i])
            end
        end
    end
    if(lastData) then
        table.insert(handData, lastData)
    end
    return handData
end

-- 手牌转换（本人）
function TableView:convert_hand_data(playerState)
    local handIndex = {}
    local handData = {}
    local lastData = nil
    self.lastIndex = 0
    local check = false
    if(playerState.MoZhang and playerState.MoZhang ~= 0) then
        for i = 1, #playerState.ShouZhang do
            local handPai = playerState.ShouZhang[i].Pai
            if(handPai == playerState.MoZhang and not check and not playerState.ShouZhang[i].Gray) then
                self.lastIndex = i
                check = true
            end
        end
    end

    check = false
    for i = 1, #playerState.ShouZhang do
        local handPai = playerState.ShouZhang[i].Pai
        if(playerState.MoZhang and playerState.MoZhang ~= 0) then
            if((i == self.lastIndex or (self.lastIndex == 0 and handPai == playerState.MoZhang)) and not check) then
                lastData = playerState.ShouZhang[i]
                self.lastIndex = i
                check = true
            else
                table.insert(handData, playerState.ShouZhang[i])
                table.insert(handIndex, i)
            end
        else
            table.insert(handData, playerState.ShouZhang[i])
            table.insert(handIndex, i)
        end
    end
    if(lastData) then
        table.insert(handData, lastData)
        table.insert(handIndex, self.lastIndex)
    end
    return handData, handIndex
end

-- 出牌之后刷新手牌数据
function TableView:out_refresh_hand_data(playerState, obj)
    local outIndex = self:get_mj_index(obj)
    table.remove(playerState.ShouZhang, outIndex)
    return outIndex
end

--- 卡五星
-- 手张是否灰显
function TableView:pai_is_gray(pai)
    local playerState = gameState.Player[self.mySeat + 1]
    for i = 1, #playerState.ShouZhang do
        local shouZhangData = playerState.ShouZhang[i]
        if(shouZhangData.Gray and pai == shouZhangData.Pai) then
            return true
        end
    end
    return false
end

-- 取消选择亮
function TableView:cancel_liang()
    self.grayMJ = {}
    for i = 1, #self.myHandMJs do
        local mj = self.myHandMJs[i]
        if(mj.activeSelf) then
            mj.name = string.gsub(mj.name,"readyChuMJ","inMJ") ---还原名字
            mj.transform.localPosition = Vector3.New(mj.transform.localPosition.x, 0, mj.transform.localPosition.z)  ---还原坐标
            local upObj = GetComponentWithPath(mj, "Up", ComponentTypeName.Transform).gameObject
            if(self:pai_is_gray(self:get_mj_pai(mj))) then
                TableUtil.set_mj_color(upObj, Color.gray)
                table.insert(self.grayMJ, mj)
            else
                TableUtil.set_mj_color(upObj, Color.white)
            end
        end
    end
end

-- 选择刻子结束
function TableView:select_coverd_done()
    if(#self.selectKeZi == 0) then
        for i = 1, #gameState.KeLiang[1].KeChu do
            table.insert(self.keChuPai, gameState.KeLiang[1].KeChu[i].ChuPai)
        end
    end
    self.selectLiangObj:SetActive(false)
    self.grayMJ ={}
    for i = 1, #self.myHandMJs do
        local mj = self.myHandMJs[i]
        if(mj.activeSelf) then
            mj.transform.localPosition = Vector3.New(mj.transform.localPosition.x, 0, mj.transform.localPosition.z)
            local upObj = GetComponentWithPath(mj, "Up", ComponentTypeName.Transform).gameObject
            local pai = self:get_mj_pai(mj)
            if(not TableUtil.have_table_index(self.keChuPai, pai)) then
                TableUtil.set_mj_color(upObj, Color.gray)
                table.insert(self.grayMJ, mj)
            else
                TableUtil.set_mj_color(upObj, Color.white)
            end
        end
    end
end

-- 点击选择刻子 需要不亮
function TableView:click_select_coverd(selectPai)
    self.keChuPai = {}
    local num = 0
    for i = 1, #self.myHandMJs do
        local mj = self.myHandMJs[i]
        if(mj.activeSelf) then
            local pai = self:get_mj_pai(mj)
            if(selectPai == pai and num < 3) then
                if(mj.transform.localPosition.y < lastMJOffset) then
                    mj.transform.localPosition = Vector3.New(mj.transform.localPosition.x, lastMJOffset, mj.transform.localPosition.z)
                    if(not TableUtil.have_table_index(self.selectKeZi, pai)) then
                        table.insert(self.selectKeZi, pai)
                    end
                else
                    mj.transform.localPosition = Vector3.New(mj.transform.localPosition.x, 0, mj.transform.localPosition.z)
                    if(TableUtil.have_table_index(self.selectKeZi, pai)) then
                        TableUtil.remove_table_index(self.selectKeZi, pai)
                    end
                end
                num = num + 1
            end
        end
    end
    if(#self.selectKeZi == 0) then
        for i = 1, #gameState.KeLiang[1].KeChu do
            table.insert(self.keChuPai, gameState.KeLiang[1].KeChu[i].ChuPai)
        end
    else
        local liangIndex = 0
        for i = 1, #gameState.KeLiang do
            if(#gameState.KeLiang[i].Pai == #self.selectKeZi) then --可选择不亮的牌数量与选择的刻子数量相等
                local keZiNum = 0
                for j = 1, #self.selectKeZi do
                    if(not TableUtil.have_table_index(gameState.KeLiang[i].Pai, self.selectKeZi[j])) then
                        break
                    end
                    keZiNum = keZiNum + 1
                end
                if(keZiNum == #self.selectKeZi) then
                    liangIndex = i
                    break
                end
            end
        end
        if(liangIndex ~= 0) then
            for i = 1, #gameState.KeLiang[liangIndex].KeChu do
                table.insert(self.keChuPai, gameState.KeLiang[liangIndex].KeChu[i].ChuPai)
            end
        end
    end
    if(#self.keChuPai == 0) then --没有可出的牌
        self.selectLiangGray:SetActive(true)
    else
        self.selectLiangGray:SetActive(false)
    end
end

-- 选择不亮时牌的展示
function TableView:show_select_covered()
    self:reset_color_pai()
    self.selectKeZi = {}
    self.grayMJ ={}
    self.keChuPai = {}
    for i = 1, #self.myHandMJs do
        local mj = self.myHandMJs[i]
        if(mj.activeSelf) then
            mj.transform.localPosition = Vector3.New(mj.transform.localPosition.x, 0, mj.transform.localPosition.z)
            local upObj = GetComponentWithPath(mj, "Up", ComponentTypeName.Transform).gameObject
            local pai = self:get_mj_pai(mj)
            mj.name = string.format("inMJ_%s_%s", self:get_mj_pai(mj), self:get_mj_index(mj))
            if(not self:pai_can_covered(pai)) then
                TableUtil.set_mj_color(upObj, Color.gray)
                table.insert(self.grayMJ, mj)
            else
                TableUtil.set_mj_color(upObj, Color.white)
            end
        end
    end
end

-- 牌可以不亮
function TableView:pai_can_covered(pai)
    for i = 1, #gameState.BuLiang do
        if(pai == gameState.BuLiang[i]) then
            return true
        end
    end
    return false
end

-- 牌是否亮倒
function TableView:pai_is_open(playerState, handData)
    return curTableData.isPlayBack or (handData and handData.Pai ~= 0
        and (#playerState.HuPai ~= 0 or (self.ConfigData.isChangSha and handData.State == 2) or (not self.ConfigData.isChangSha and handData.State == 1)))
end

-- 牌是否扣倒
function TableView:pai_is_covered(handData)
    return (handData and not self.ConfigData.isChangSha and handData.State == 2)
end
--- end 卡五星
function TableView:is_laizi(pai, newGameState)
    return pai ~= 0 and (newGameState.LaiZi == pai or (self.ConfigData.isWuZhou and newGameState.LaiGen == pai and self.ruleJsonInfo.GuiPai == 2))
end

function TableView:play_hu_sound(newGameState)
    local ziMoIndex = 0
    print_pbc_table(newGameState)
    for i=1,#newGameState.Player do
        local state = newGameState.Player[i]
        --TODO 修复流局播放自摸的音效  state.HuPai 在胡的时候已经清空
        if(state.HuPai and #state.HuPai > 0 and newGameState.DianPao == -1 and ziMoIndex == 0) then --没有点炮
            ziMoIndex = i
            print("有人自摸了")
        end
    end
    for i=1,#newGameState.Player do
        local state = newGameState.Player[i]
        local localSeat = TableUtil.get_local_seat(i - 1, curTableData.SeatID, curTableData.totalSeat)
        local seatHolder = self.seatHolderArray[localSeat]
        if(localSeat == 1) then
            if(state.BeiShu <= 0) then
                self:play_voice("common/loss")
            else
                self:play_voice("common/win")
            end
        end
        if(not self.ConfigData.isXueLiuCH and not self.ConfigData.isHuangShiHH) then
            if(newGameState.DianPao ~= -1) then --有点炮
                if(state.BeiShu > 0) then
                    self:play_action_sound(6, seatHolder)
                    break
                end
            elseif(i == ziMoIndex) then --自摸
                self:play_action_sound(31, seatHolder)
                break
            end
        end
    end
end

function TableView:pre_delay_state_time(newGameState)
    for i=1,#newGameState.Action do
        local action = newGameState.Action[i]
        if (9 == action.Action) then
            return -1
        end
    end
    return 0
end

---播放分数变动文字弹出效果
function TableView:play_score_change_text(seatHolder,changeValue)
    if(self.ConfigData.isXueZhanDD) then
        return
    end
    changeValue = changeValue or 0
    if(changeValue == 0) then
        return
    end
    local rootT = seatHolder.scoreChangeText.transform
    seatHolder.scoreChangeText.text = ""
    if  changeValue > 0 then
        seatHolder.scoreChangeText.text = "+"..changeValue
    elseif  changeValue < 0 then
        seatHolder.scoreChangeText.text = ""..changeValue
    end

    local localSeatpos = TableUtil.get_local_seat(seatHolder.SeatID, self.mySeat, totalSeat)
    rootT.localPosition = Vector3.New(0,75,0)
    local yOffset = 0;
    if 3 == localSeatpos then
        yOffset = 0
    else
        yOffset = 150
    end
    rootT:DOLocalMoveY(yOffset,0.5):SetEase(DG.Tweening.Ease.OutBounce):OnComplete(function()
        self:subscibe_time_event(1.5, false, 0):OnComplete(function()
            seatHolder.scoreChangeText.text = ""
        end)
    end)
end

-- 是否是花牌麻将
function TableView:is_hua_mj(mj)
    return false
    --return mj.transform.parent.name == "HuaPoint" and not self.ConfigData.isXJGSH and not self.ConfigData.isXueLiuCH and not self.ConfigData.isHuangShiHH
end

-- 这个弃张是否是胡的牌
function TableView:is_hu_on_qizhang(pai)
    if(not self.ConfigData.isKaWuXing) then
        return false
    end
    local huPai = 0
    for i = 1, #gameState.Player do
        local playerState = gameState.Player[i]
        if(#playerState.HuPai > 0) then
            huPai = playerState.HuPai[1]
            break
        end
    end
    if(huPai ~= 0 and pai == huPai) then
       return true
    end
    return false
end

--- 长沙麻将
function TableView:show_cs_kai_gang(seatId)
    local playerId = curTableData.seatUserIdInfo[seatId .. ""]
    self.csSelectKaiGang:SetActive(true)
    local textName = GetComponentWithPath(self.csSelectKaiGang, "TextName", ComponentTypeName.Text)
    for i = 1, #gameState.GangPai do
        local actionObj = GetComponentWithPath(self.csSelectKaiGang, "" .. i, ComponentTypeName.Transform).gameObject
        local selectCardPanel = GetComponentWithPath(self.csSelectKaiGang, "SelectCardPanel" .. i, ComponentTypeName.Transform).gameObject
        self:set_kaigang_data(actionObj, selectCardPanel, gameState.GangPai[i])
    end
    TableUtil.download_seat_detail_info(playerId, nil, function(playerInfo)
        textName.text = Util.filterPlayerName(playerInfo.playerName, 10) .. " 开杠"
    end)
end

function TableView:set_kaigang_data(actionObj, selectCardPanel,  pai)
    local mj = GetComponentWithPath(actionObj, "MJ", ComponentTypeName.Transform).gameObject
    TableUtil.set_mj(pai, mj, self.mjScaleSet, self.frontSpriteH)
    TableUtil.set_mj_bg(1, mj, self.mjColorSet)
    local grid = GetComponentWithPath(actionObj, "Grid", ComponentTypeName.Transform).gameObject
    local selectCardBg = GetComponentWithPath(selectCardPanel, "Bg", ComponentTypeName.RectTransform)
    local childs = TableUtil.get_all_child(grid)
    local keChi = (self:kechi_kaigang(pai) ~= nil)
    local kePeng = self:keactions_kaigang(pai, gameState.KePeng)
    local keGang = self:keactions_kaigang(pai, gameState.KeKaiGang2)
    local keBu = self:keactions_kaigang(pai, gameState.keGang)
    local keHu = self:keactions_kaigang(pai, gameState.KeHu)
    childs[1]:SetActive(keChi)
    childs[2]:SetActive(not keChi)
    childs[3]:SetActive(kePeng)
    childs[4]:SetActive(not kePeng)
    childs[5]:SetActive(keGang)
    childs[6]:SetActive(not keGang)
    childs[7]:SetActive(keBu)
    childs[8]:SetActive(not keBu)
    childs[9]:SetActive(keHu)
    childs[10]:SetActive(not keHu)
    for i = 1, 5 do
        childs[i * 2 - 1].name = "ButtonCS_" .. i .. "_" .. pai
    end
    if(keChi) then
        local chiChilds = TableUtil.get_all_child(selectCardPanel)
        local newChiChilds = {}
        for i = 1, #chiChilds do
            if(chiChilds[i].name ~= "Bg" and chiChilds[i].name ~= "BtnNoSelectCardCS") then
                chiChilds[i]:SetActive(false)
                table.insert(newChiChilds,chiChilds[i])
            end
        end
        local chiNum = 0
        for i=1,#gameState.KeChi do
            local xAddOffset = 0
            local curPai = gameState.KeChi[i].Pai
            if(curPai == pai) then
                for j=1,#gameState.KeChi[i].ChiFa do
                    local target = nil
                    if(j <= #newChiChilds) then
                        target = newChiChilds[j]
                    else
                        target = TableUtil.poor("3_SelectCard", selectCardPanel,
                        self.selectCardClone3Pos + Vector3.New(xAddOffset, 0, 0), self.poorObjs, self.clones)
                    end
                    target:SetActive(true)
                    local childs = TableUtil.get_all_child(target)
                    local curPai = gameState.KeChi[i].Pai
                    local index = #gameState.KeChi[i].ChiFa - j + 1
                    for k=1,#childs do
                        local mj = childs[k]
                        local pai = gameState.KeChi[i].ChiFa[index] + (k - 1)
                        if(pai == curPai) then
                            TableUtil.set_mj_color(mj, Color.yellow)
                        else
                            TableUtil.set_mj_color(mj, Color.white)
                        end
                        TableUtil.set_mj(pai, mj, self.mjScaleSet, self.frontSpriteH)
                        TableUtil.set_mj_bg(1, mj, self.mjColorSet)
                    end
                    target.name = "Chi" .. "_3_" .. gameState.KeChi[i].ChiFa[index] .. "_" .. gameState.KeChi[i].Pai
                    xAddOffset = xAddOffset - selectCardXOffset * 3 - 10
                    chiNum = chiNum + 1
                end
            end
        end
        selectCardBg.sizeDelta = Vector2.New(390 + (chiNum - 1) * (selectCardXOffset * 3 + 10), selectCardBg.sizeDelta.y)
    end
    selectCardPanel:SetActive(false)
end

function TableView:kechi_kaigang(pai)
    if(#gameState.KeChi == 0) then
        return nil
    end
    for i = 1, #gameState.KeChi do
        if(pai == gameState.KeChi[i].Pai) then
            return gameState.KeChi[i].ChiFa
        end
    end
    return nil
end

function TableView:keactions_kaigang(pai,list)
    if(not list or (list and #list == 0)) then
        return false
    end
    for i = 1, #list do
        if(pai == list[i]) then
            return true
        end
    end
    return false
end

function TableView:show_cardsel_kaigang(actionObj)
    local selectCardPanel = GetComponentWithPath(actionObj.transform.parent.gameObject, "SelectCardPanel" .. actionObj.name, ComponentTypeName.Transform).gameObject
    selectCardPanel:SetActive(true)
end
--- end 长沙麻将

--- 血流
--换三张
function TableView:exchange_san_zhang(newGameState)
    self.canDoSanZAni = false
    self.meHuanSanz = false
    self.doSanZAni = true
    local height = 224
    if(newGameState.SanZhangType == 1) then --顺时针
        for i = 1, #self.seatHolderArray do
            local seatHolder = self.seatHolderArray[i]
            local pathVectors = {}
            for j = 1, 5 do
                local x,y=0
                if(i == 1) then
                    y = -height+(height/5)*j
                    x = -self:get_ellipse_x(y)
                elseif(i == 2) then
                    y = -(height/5)*j
                    x = self:get_ellipse_x(y)
                elseif(i == 3) then
                    y = height-(height/5)*j
                    x = self:get_ellipse_x(y)
                elseif(i == 4) then
                    y = (height/5)*j
                    x = -self:get_ellipse_x(y)
                end
                table.insert(pathVectors, Vector3.New(x,y,0))
            end
            seatHolder.sanZObj.transform:DOLocalPath(pathVectors, 1, Tweening.PathType.CatmullRom)
        end
    elseif(newGameState.SanZhangType == 2) then
        for i = 1, #self.seatHolderArray do
            local seatHolder = self.seatHolderArray[i]
            local pathVectors = {}
            for j = 1, 5 do
                local x,y=0
                if(i == 1) then
                    y = -height+(height/5)*j
                    x = self:get_ellipse_x(y)
                elseif(i == 2) then
                    y = (height/5)*j
                    x = self:get_ellipse_x(y)
                elseif(i == 3) then
                    y = height-(height/5)*j
                    x = -self:get_ellipse_x(y)
                elseif(i == 4) then
                    y = -(height/5)*j
                    x = -self:get_ellipse_x(y)
                end
                table.insert(pathVectors, Vector3.New(x,y,0))
            end
            seatHolder.sanZObj.transform:DOLocalPath(pathVectors, 1, Tweening.PathType.CatmullRom)
        end
    elseif(newGameState.SanZhangType == 3) then
        for i = 1, #self.seatHolderArray do
            local seatHolder = self.seatHolderArray[i]
            if(i == 1) then
                seatHolder.sanZObj.transform:DOLocalMove(self.seatHolderArray[3].sanZPos, 1, false)
            elseif(i == 2) then
                seatHolder.sanZObj.transform:DOLocalMove(self.seatHolderArray[4].sanZPos, 1, false)
            elseif(i == 3) then
                seatHolder.sanZObj.transform:DOLocalMove(self.seatHolderArray[1].sanZPos, 1, false)
            elseif(i == 4) then
                seatHolder.sanZObj.transform:DOLocalMove(self.seatHolderArray[2].sanZPos, 1, false)
            end
        end
    end
    self:subscibe_time_event(1.5, false, 0):OnComplete(function(t)
        self:refresh_game_state(gameState)
        self:add_sanz_animation()
    end)
end

-- 添加三张动画
function TableView:add_sanz_animation()
    local aniObjs = {}
    for i = 1, #self.myHandMJs do
        local mj = self.myHandMJs[i]
        local redPoint = GetComponentWithPath(mj, "Up/RedPoint", ComponentTypeName.Transform)
        if(redPoint and redPoint.gameObject.activeSelf) then
            table.insert(aniObjs, self.myHandMJs[i])
            self.myHandMJs[i].transform.localPosition = Vector3.New(self.myHandMJs[i].transform.localPosition.x, lastMJOffset, 0)
        end
    end
    for i = 1, #aniObjs do
        aniObjs[i].transform:DOLocalMoveY(0, 0.8, false)
    end
    self:subscibe_time_event(0.8, false, 0):OnComplete(function(t)
        self.doSanZAni = false
        self:refresh_game_state(gameState, true)
    end)
end

-- 计算椭圆的x值
function TableView:get_ellipse_x(y)
    local width = 382
    local height = 224
    return math.sqrt((1-(y*y)/(height*height))*(width*width))
end

-- 初始化换三张的牌
function TableView:init_hsz()
    self.hszPais = {}
    self.grayMJ = {}
    for i = 1, #self.myHandMJs do
        local mj = self.myHandMJs[i]
        if(mj.activeSelf) then
            mj.transform.localPosition = Vector3.New(mj.transform.localPosition.x, 0, mj.transform.localPosition.z)
            local upObj = GetComponentWithPath(mj, "Up", ComponentTypeName.Transform).gameObject
            if(not self:not_need_gray_hsz(self:get_mj_pai(mj))) then
                TableUtil.set_mj_color(upObj, Color.gray)
                table.insert(self.grayMJ, mj)
            else
                TableUtil.set_mj_color(upObj, Color.white)
            end
        end
    end
end

-- 点击选择换三张
function TableView:click_select_hsz(selectMj)
    local pai = self:get_mj_pai(selectMj)
    if(selectMj.transform.localPosition.y < lastMJOffset and #self.hszPais < 3) then
        selectMj.transform.localPosition = Vector3.New(selectMj.transform.localPosition.x, lastMJOffset, selectMj.transform.localPosition.z)
        table.insert(self.hszPais, pai)
    elseif(selectMj.transform.localPosition.y > 0) then
        selectMj.transform.localPosition = Vector3.New(selectMj.transform.localPosition.x, 0, selectMj.transform.localPosition.z)
        TableUtil.remove_table_index(self.hszPais, pai)
    end

    if(#self.hszPais == 0) then
        self:init_hsz()
    else
        local paiType = 0
        local upPai = self.hszPais[1]
        if(upPai >= 1 and upPai <= 9) then
            paiType = 1
        elseif(upPai >= 10 and upPai <= 18) then
            paiType = 2
        elseif(upPai >= 19 and upPai <= 27) then
            paiType = 3
        end
        for i = 1, #self.myHandMJs do
            local mj = self.myHandMJs[i]
            local upObj = GetComponentWithPath(mj, "Up", ComponentTypeName.Transform).gameObject
            if(not self:not_need_gray_select_hsz(self:get_mj_pai(mj), paiType)) then
                TableUtil.set_mj_color(upObj, Color.gray)
                table.insert(self.grayMJ, mj)
            else
                TableUtil.set_mj_color(upObj, Color.white)
            end
        end
        self.buttongHuanSZ:SetActive(#self.hszPais == 3)
        self.buttongHuanSZDisable:SetActive(#self.hszPais ~= 3)
    end
end

-- 选三张时需要灰显的牌
function TableView:not_need_gray_select_hsz(pai, paiType)
    return (pai >= 1 and pai <= 9 and paiType == 1) or (pai >= 10 and pai <= 18 and paiType == 2) or (pai >= 19 and pai <= 27 and paiType == 3)
end

-- 换三张初始化不需要灰显的牌
function TableView:not_need_gray_hsz(pai)
    local table1 = {}
    local table2 = {}
    local table3 = {}
    local playerState = gameState.Player[self.mySeat + 1]
    local handData, handIndex = self:convert_hand_data(playerState)
    for i = 1, #handData do
        local shouZhangData = handData[i]
        if(shouZhangData.Pai >= 1 and shouZhangData.Pai <= 9) then
            table.insert(table1, shouZhangData.Pai)
        end
        if(shouZhangData.Pai >= 10 and shouZhangData.Pai <= 18) then
            table.insert(table2, shouZhangData.Pai)
        end
        if(shouZhangData.Pai >= 19 and shouZhangData.Pai <= 27) then
            table.insert(table3, shouZhangData.Pai)
        end
    end
    return (pai >= 1 and pai <= 9 and #table1 >= 3) or (pai >= 10 and pai <= 18 and #table2 >= 3) or (pai >= 19 and pai <= 27 and #table3 >= 3)
end

--- end 血流

return  TableView