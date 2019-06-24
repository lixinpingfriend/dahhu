local BranchPackageName = AppData.BranchRunfastName
local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local CSmartTimer = ModuleCache.SmartTimer.instance
local GameSDKInterface = ModuleCache.GameSDKInterface
local Sequence = DG.Tweening.DOTween.Sequence
local class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
local TableData = require("package/runfast/module/tablerunfast/tablerunfast_data")
local TableSound = require(TableData.Path_tablerunfast_sound)
local TableRunfastHelper = require(TableData.Path_tablerunfast_helper)

---@class TableRunfastView
local TableRunfastView = class('TableRunfastView', View)
local PlayerPrefs = UnityEngine.PlayerPrefs
local MatchingManager = require("package.public.matching_manager")
local cjson = require("cjson")

------初始化
function TableRunfastView:initialize( ... )
    self.curTableData_PB = TableManager.curTableData_PB
    local level = 0
    if(self.curTableData_PB ~= nil and self.curTableData_PB.isPlayBack) then
        level = 1
    end
    View.initialize(self, BranchPackageName.."/module/tablerunfast/runfast_table.prefab", "Runfast_Table", level)
    self.TestButton1 = GetComponentWithPath(self.root, "Top/TopInfo/TestButton1", ComponentTypeName.Button)
    if(not ModuleCache.GameManager.developmentMode) then
        ModuleCache.ComponentUtil.SafeSetActive(self.TestButton1.gameObject, false)  
    end

    self.BtnSwitchSkin = GetComponentWithPath(self.root,"Bottom/Action/BtnSwitchSkin", ComponentTypeName.Button)
    self.DoingMatchingRoot = GetComponentWithPath(self.root,"Center/DoingMatchingRoot", ComponentTypeName.Transform).gameObject
    self:SetState_DoingMatchingRoot(false)
    self.BtnLuckyBox = GetComponentWithPath(self.root,"Top/Layout/BtnLuckyBox", ComponentTypeName.Button)
    self:SetState_BtnLuckyBox(false)
    self.BtnFirstGiftBag = GetComponentWithPath(self.root,"Top/Layout/BtnFirstGiftBag", ComponentTypeName.Button)
    self:SetState_BtnFirstGiftBag(false)

    self.FaPaiAnimOriginalPosRoot = GetComponentWithPath(self.root,"Center/FaPaiAnimOriginalPosRoot/back", ComponentTypeName.Transform).gameObject
    self.RankRoot = GetComponentWithPath(self.root,"Top/RankRoot", ComponentTypeName.Transform).gameObject
    self:SetRankInfo(false)
    self.RankState_CurRank = GetComponentWithPath(self.root,"Top/RankRoot/BtnRank/CurState/CurRank", ComponentTypeName.Text)
    self.RankState_Total = GetComponentWithPath(self.root,"Top/RankRoot/BtnRank/CurState/Total", ComponentTypeName.Text)
    self.RankState_Instructions = GetComponentWithPath(self.root,"Top/RankRoot/BtnRank/Instructions", ComponentTypeName.Text)

    self.StartRoundAnimRoot = GetComponentWithPath(self.root,"StartRoundAnimRoot", ComponentTypeName.Transform).gameObject
    self:SetState_StartRoundAnimRoot(false)

    self.PromotionInfoRoot = GetComponentWithPath(self.root,"Center/PromotionInfoRoot", ComponentTypeName.Transform).gameObject
    self.PromotionInfoText = GetComponentWithPath(self.root,"Center/PromotionInfoRoot/Text3", ComponentTypeName.Text)
    self:SetState_PromotionInfoRoot(false)

    self.Announce = GetComponentWithPath(self.root,"Top/Announce", ComponentTypeName.Transform).gameObject
    self.AnnounceText = GetComponentWithPath(self.root,"Top/Announce/WidthHeightRoot/Bg/Mask/Text", ComponentTypeName.Text)
    self.AnnounceTextRectTransform = GetComponentWithPath(self.root,"Top/Announce/WidthHeightRoot/Bg/Mask/Text", ComponentTypeName.RectTransform)
    self.AnnounceTextContentSizeFitter = GetComponentWithPath(self.root,"Top/Announce/WidthHeightRoot/Bg/Mask/Text", "UnityEngine.UI.ContentSizeFitter")
    self:SetState_Announce(false)

    self.ComTipRoot = GetComponentWithPath(self.root,"Center/ComTipRoot",ComponentTypeName.Transform).gameObject
    self.ComTipText = GetComponentWithPath(self.root,"Center/ComTipRoot/ComTipBG/ComTipText", ComponentTypeName.Text)
    self.ComTipTime = GetComponentWithPath(self.root,"Center/ComTipRoot/ComTipBG/ComTipText/ComTipTime", ComponentTypeName.Text)
    self:SetComTip(false)

    self.TopRootUIStateSwitcher = GetComponentWithPath(self.root,"TopRight/TopRoot", "UIStateSwitcher")
    self.AnticheatMatchingRoot = GetComponentWithPath(self.root,"Center/AnticheatMatchingRoot", ComponentTypeName.Transform).gameObject
    ModuleCache.ComponentUtil.SafeSetActive(self.AnticheatMatchingRoot.gameObject,false)

    self.JinBiChangStateSwitcher = GetComponentWithPath(self.root, "Bottom/Action/JinBiChangStateSwitcher", "UIStateSwitcher")
    self.ButtonReplaceTable = GetComponentWithPath(self.root, "Bottom/Action/JinBiChangStateSwitcher/ButtonReplaceTable", ComponentTypeName.Button)
    self.ButtonReplaceTableText = GetComponentWithPath(self.root, "Bottom/Action/JinBiChangStateSwitcher/ButtonReplaceTableGray/Text", ComponentTypeName.Text)
    self.ButtonJinBiChangReady = GetComponentWithPath(self.root, "Bottom/Action/JinBiChangStateSwitcher/ButtonJinBiChangReady", ComponentTypeName.Button)

    self.BtnIntrust = GetComponentWithPath(self.root,"TopLeft/Root/LeftRoot/Bg/JinBiChangMatch/BtnIntrust", ComponentTypeName.Button)
    self.CancelIntrustRoot = GetComponentWithPath(self.root, "Bottom/CancelIntrustRoot", ComponentTypeName.Transform).gameObject
    self.BtnCancelIntrust = GetComponentWithPath(self.root, "Bottom/CancelIntrustRoot/BtnCancelIntrust", ComponentTypeName.Button)
    self:SetCancelIntrustState(false)

    self.BtnMenu2D = GetComponentWithPath(self.root,"TopLeft/Root/LeftRoot/Bg/JinBiChangMatch/BtnMenu2D", ComponentTypeName.Button)
    self.BtnMenu3D = GetComponentWithPath(self.root,"TopLeft/Root/LeftRoot/Bg/JinBiChangMatch/BtnMenu3D", ComponentTypeName.Button)
    ModuleCache.ComponentUtil.SafeSetActive(self.BtnMenu2D.gameObject,false)
    ModuleCache.ComponentUtil.SafeSetActive(self.BtnMenu3D.gameObject,false)
    self.ButtonShop = GetComponentWithPath(self.root,"TopLeft/Root/ButtonShop", ComponentTypeName.Button)
    self.ButtonJinBiChangExit = GetComponentWithPath(self.root,"TopLeft/Root/LeftRoot/Bg/JinBiChangMatch/ButtonJinBiChangExit", ComponentTypeName.Button)
    self.ButtonJinBiChangExitText = GetComponentWithPath(self.root,"TopLeft/Root/LeftRoot/Bg/JinBiChangMatch/ButtonJinBiChangExit/Text", ComponentTypeName.Text)
    self.ButtonRuleExplain = GetComponentWithPath(self.root,"TopLeft/Root/LeftRoot/Bg/JinBiChangMatch/ButtonRuleExplain", ComponentTypeName.Button)
    self.BtnLeftOpen = GetComponentWithPath(self.root,"TopLeft/Root/BtnLeftOpen", ComponentTypeName.Button)
    self.BtnLeftClose = GetComponentWithPath(self.root,"TopLeft/Root/LeftRoot/BtnLeftClose", ComponentTypeName.Button)
    self.LeftRoot = GetComponentWithPath(self.root,"TopLeft/Root/LeftRoot", ComponentTypeName.Transform)
    self.leftPoint = GetComponentWithPath(self.root, "TopLeft/Root/leftPoint", ComponentTypeName.Transform)
    self:SetState_LeftRoot(false)
    self.RecordPokerRoot = GetComponentWithPath(self.root,"Top/TopInfo/RecordPokerRoot",ComponentTypeName.Transform).gameObject
    self:SetState_RecordPokerRoot(false)
    self.BtnRecordPoker = GetComponentWithPath(self.root, "Top/TopInfo/RecordPokerRoot/BtnRecordPoker", ComponentTypeName.Button)
    self.RecordPokerShowRoot = GetComponentWithPath(self.root,"Top/TopInfo/RecordPokerRoot/RecordPokerShowRoot",ComponentTypeName.Transform).gameObject
    self:SetState_RecordPokerShowRoot(false)
    self.RecordPokerCountSlotArray = {}
    for i=1,13 do
        local RecordPokerCountPath = "Top/TopInfo/RecordPokerRoot/RecordPokerShowRoot/PokerCount/Text" .. i
        local RecordPokerCountText = GetComponentWithPath(self.root, RecordPokerCountPath, ComponentTypeName.Text)
        table.insert(self.RecordPokerCountSlotArray,RecordPokerCountText)
    end
    self.RecordPokerTimeRoot = GetComponentWithPath(self.root,"Top/TopInfo/RecordPokerRoot/RecordPokerTimeRoot",ComponentTypeName.Transform).gameObject
    self:SetState_RecordPokerTimeRoot(false)
    self.RecordPokerTimeText = GetComponentWithPath(self.root, "Top/TopInfo/RecordPokerRoot/RecordPokerTimeRoot/TextBg/Time", ComponentTypeName.Text)


    self.EffectXuanZhuanHeiTao3Root = GetComponentWithPath(self.root,"Center/EffectXuanZhuanHeiTao3Root",ComponentTypeName.Transform).gameObject
    self:SetEffectXuanZhuanHeiTao3RootState(false)
    self.EffectXuanZhuan_PaiMian = GetComponentWithPath(self.root,"Center/EffectXuanZhuanHeiTao3Root/Anim_DGT_RunfastXuanZhuan/Animator/HeXinZu/PuKe1/PaiMian",ComponentTypeName.Transform).gameObject
    
    self.CenterRule = GetComponentWithPath(self.root, "Background/CenterRule", ComponentTypeName.Text)
    --self.BGUIStateSwitcher = GetComponentWithPath(self.root,"Background/BGUIStateSwitcher", "UIStateSwitcher")
    self.TableBg2DRoot = GetComponentWithPath(self.root,"Background/TableBg2DRoot", ComponentTypeName.Transform).gameObject
    self.TableBg2DImageList = {}
    for i = 1, 0 do
        local TableBgImage = GetComponentWithPath(self.root,"Background/TableBg2DRoot/"..i, ComponentTypeName.Image)
        self.TableBg2DImageList[i] = TableBgImage
    end

    self.TableBg3DRoot = GetComponentWithPath(self.root,"Background/TableBg3DRoot", ComponentTypeName.Transform).gameObject
    self.TableBg3DImageList = {}
    for i = 1, 3 do
        local TableBgImage = GetComponentWithPath(self.root,"Background/TableBg3DRoot/"..i, ComponentTypeName.Image)
        self.TableBg3DImageList[i] = TableBgImage
    end
    self.TableBgView2D = GetComponentWithPath(self.root,"Background/TableBgView2D", ComponentTypeName.Image)
    self.TableBgView3D = GetComponentWithPath(self.root,"Background/TableBgView3D", ComponentTypeName.Image)


    self.NotAllowActionMask = GetComponentWithPath(self.root, "NotAllowActionMask", ComponentTypeName.Transform).gameObject
    self:SetNotAllowActionMaskState(false)
    self.NotAllowActionMaskLastPokerAuto = GetComponentWithPath(self.root, "NotAllowActionMaskLastPokerAuto", ComponentTypeName.Transform).gameObject
    self:SetNotAllowActionMaskLastPokerAutoState(false)

    self.PokerPrefabParent = GetComponentWithPath(self.root, "Bottom/HandPokers", ComponentTypeName.Transform).gameObject
    self.PokerPrefab = GetComponentWithPath(self.root, "Bottom/HandPokers/PokerPrefab", ComponentTypeName.Transform).gameObject
    self.HandPokersLayout = GetComponentWithPath(self.root, "Bottom/HandPokers/PokerPrefab", "HorizontalLayoutGroup")
    self:InstantiatePokerSlot()

    --第一人称打出去的牌的槽的数组
    self.FirstThrowPokerGridLayoutGroupRoot = GetComponentWithPath(self.root, "Bottom/ThrowPokerRoot/GridLayoutGroup", ComponentTypeName.Transform).gameObject
    self.FirstThrowPokerSlotArray = {}
    for i=1,TableData.pokerSlotMaxCount do
        local locFirstPath = "Bottom/ThrowPokerRoot/GridLayoutGroup/PokerPrefab"..i
        local SlotData = {}
        SlotData.PrefabGo = GetComponentWithPath(self.root, locFirstPath,ComponentTypeName.Transform).gameObject
        ModuleCache.ComponentUtil.SafeSetActive(SlotData.PrefabGo,false)
        SlotData.FaceImage = GetComponentWithPath(self.root, locFirstPath.."/face",ComponentTypeName.Image)
        table.insert(self.FirstThrowPokerSlotArray,SlotData)
    end

    self.buttonInvite = GetComponentWithPath(self.root, "Bottom/Action/ButtonInviteFriend", ComponentTypeName.Button)

    self.buttonReady_quickStart = GetComponentWithPath(self.root, "Bottom/Action/ButtonReady_quickStart", ComponentTypeName.Button)
    self.buttonReady_quickStart_TextWrap = GetComponentWithPath(self.buttonReady_quickStart.gameObject, "NumberImage", "TextWrap")

    self.ButtonInviteFriendDray = GetComponentWithPath(self.root, "Bottom/Action/ButtonInviteFriendDray", ComponentTypeName.Button)
    self.buttonReady = GetComponentWithPath(self.root, "Bottom/Action/ButtonReady", ComponentTypeName.Button) 
    self.ButtonLeave = GetComponentWithPath(self.root, "Bottom/Action/ButtonLeave", ComponentTypeName.Button) 
    self.ButtonLeaveText = GetComponentWithPath(self.root, "Bottom/Action/ButtonLeave/Text", ComponentTypeName.Text) 
    self.ButtonLeave_LeaveRoom = GetComponentWithPath(self.root, "Bottom/Action/ButtonLeave/LeaveRoom", ComponentTypeName.Transform).gameObject
    self.ButtonLeave_DissolveRoom = GetComponentWithPath(self.root, "Bottom/Action/ButtonLeave/DissolveRoom", ComponentTypeName.Transform).gameObject
    self.buttonCancelReady = GetComponentWithPath(self.root, "Bottom/Action/ButtonCancelReady", ComponentTypeName.Button)
    self.buttonStart = GetComponentWithPath(self.root, "Bottom/Action/ButtonStart", ComponentTypeName.Button)

    self.DoingRoot = GetComponentWithPath(self.root, "Bottom/Action/DoingRoot", ComponentTypeName.Transform).gameObject
    self:SetDoingState(false)
    self.DoingRootUIStateSwitcher = GetComponentWithPath(self.root,"Bottom/Action/DoingRoot", "UIStateSwitcher")
    self.BtnHint = GetComponentWithPath(self.root, "Bottom/Action/DoingRoot/BtnHintRoot/BtnHint", ComponentTypeName.Button)--提示按钮
    self.BtnThrowCard = GetComponentWithPath(self.root, "Bottom/Action/DoingRoot/BtnThrowCardRoot/BtnThrowCard", ComponentTypeName.Button)--出牌按钮
    self.BtnThrowCardDray = GetComponentWithPath(self.root, "Bottom/Action/DoingRoot/BtnThrowCardRoot/BtnThrowCardDray", ComponentTypeName.Button)--出牌按钮
    self.BtnNotAffordRoot = GetComponentWithPath(self.root, "Bottom/Action/DoingRoot/BtnNotAffordRoot", ComponentTypeName.Transform).gameObject
    self.BtnNotAfford = GetComponentWithPath(self.root, "Bottom/Action/DoingRoot/BtnNotAffordRoot/BtnNotAfford", ComponentTypeName.Button)--要不起按钮
    self.BtnNotAffordDray = GetComponentWithPath(self.root, "Bottom/Action/DoingRoot/BtnNotAffordRoot/BtnNotAffordDray", ComponentTypeName.Button)--要不起按钮
    self.BtnUnSelectedAllPoker = GetComponentWithPath(self.root, "Background/BtnUnSelectedAllPoker", ComponentTypeName.Button)--不选任何牌按钮

    self.ZhaDanScoreRoot = GetComponentWithPath(self.root, "ZhaDanScoreRoot", ComponentTypeName.Transform).gameObject
    self.ZhaDanScorePrefab = GetComponentWithPath(self.root, "ZhaDanScoreRoot/ZhaDanScorePrefab", ComponentTypeName.Transform).gameObject
    ModuleCache.ComponentUtil.SafeSetActive(self.ZhaDanScorePrefab,false)

    self.TopInfo = GetComponentWithPath(self.root, "Top/TopInfo", ComponentTypeName.Transform).gameObject
    self.BtnSetting = GetComponentWithPath(self.root,"TopLeft/Root/LeftRoot/Bg/JinBiChangMatch/BtnSetting", ComponentTypeName.Button)
    self.BtnLocation = GetComponentWithPath(self.root,"TopLeft/Root/LeftRoot/Bg/JinBiChangMatch/BtnLocation", ComponentTypeName.Button)
    ModuleCache.ComponentUtil.SafeSetActive(self.BtnLocation.gameObject, false)

    self.ButtonRoomRule = GetComponentWithPath(self.root,"TopRight/TopRoot/ButtonRule", ComponentTypeName.Button)
    --房间id
    self.textRoomNum = GetComponentWithPath(self.root,"TopRight/TopRoot/RoomID/Text", ComponentTypeName.Text)
    --顶部右的节点
    self.TopRight = GetComponentWithPath(self.root,"TopRight", ComponentTypeName.Transform).gameObject
    --电池,电池充电
    self.BatteryImage = GetComponentWithPath(self.root,"TopRight/TopRoot/Battery/ImageBackground/ImageLevel", ComponentTypeName.Image)
    self.BatteryChargingRoot = GetComponentWithPath(self.root,"TopRight/TopRoot/Battery/ImageCharging", ComponentTypeName.Transform).gameObject
    --当前的时间
    self.textTime = GetComponentWithPath(self.root,"TopRight/TopRoot/Time/Text", ComponentTypeName.Text)
    --当前的网络信号信息
    self.goGState2G = GetComponentWithPath(self.root,"TopRight/TopRoot/NetState/GState/2g", ComponentTypeName.Transform).gameObject
    self.goGState3G = GetComponentWithPath(self.root,"TopRight/TopRoot/NetState/GState/3g", ComponentTypeName.Transform).gameObject
    self.goGState4G = GetComponentWithPath(self.root,"TopRight/TopRoot/NetState/GState/4g", ComponentTypeName.Transform).gameObject
    self.textPingValue = GetComponentWithPath(self.root,"TopRight/TopRoot/PingVal", ComponentTypeName.Text)
    self.goWifiStateArray = {}    
    for i=1,5 do
        local goState = GetComponentWithPath(self.root,"TopRight/TopRoot/NetState/WifiState/state" .. (i - 1), ComponentTypeName.Transform).gameObject
        table.insert(self.goWifiStateArray, goState)
    end
    --对话,语音
    self.buttonChat = GetComponentWithPath(self.root, "Bottom/Action/ButtonChat", ComponentTypeName.Button)
	self.buttonMic = GetComponentWithPath(self.root, "Bottom/Action/ButtonMic", ComponentTypeName.Button)
	
	local size = 0.93
	local Manager = require("package.public.module.function_manager")
	self:fixed_tran_size(Manager.FindObject(self.root, "Center"), size)
	self:fixed_tran_size(Manager.FindObject(self.root, "Bottom"), size)
	self:fixed_tran_size(Manager.FindObject(self.root, "TopLeft"), size)
	self:fixed_tran_size(Manager.FindObject(self.root, "TopRight"), size)
    
    --selfHandPokerRoot自己手上的牌的节点
    local selfHandPokerRoot = GetComponentWithPath(self.root, "Bottom/HandPokers", ComponentTypeName.Transform).gameObject
    self.uiStateSwitcherSeatPrefab = GetComponentWithPath(self.root, "Holder/Seat", "UIStateSwitcher")
    ModuleCache.ComponentUtil.SafeSetActive(self.uiStateSwitcherSeatPrefab.gameObject, false)

    self.CardAssetHolder1 = GetComponentWithPath(self.root, "Holder/CardAssetHolder1", "SpriteHolder")
    self.CardAssetHolder2 = GetComponentWithPath(self.root, "Holder/CardAssetHolder2", "SpriteHolder")
    self:CheckStyleType()
    self.HeadAssetHolder = GetComponentWithPath(self.root, "Holder/HeadAssetHolder", "SpriteHolder")

    self.srcSeatHolderArray = {}
    local seatMaxCount = TableData.seatMaxCount --最多几人玩

    for i=1,seatMaxCount do
        local seatPosTran = GetComponentWithPath(self.root, "Center/Seats/" .. i, ComponentTypeName.Transform)
        local goSeat = ModuleCache.ComponentUtil.InstantiateLocal(self.uiStateSwitcherSeatPrefab.gameObject, seatPosTran.gameObject)
        local seatHolder = {}
        if(i == 1) then
            TableRunfastHelper:initSeatHolder(seatHolder, i, goSeat, selfHandPokerRoot)
            seatHolder.WhoWinEffectRoot = GetComponentWithPath(self.root, "Bottom/Action/WhoWinEffectRoot", ComponentTypeName.Transform).gameObject
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.WhoWinEffectRoot, false)
            seatHolder.WhoFirstPlayingRoot = GetComponentWithPath(self.root, "Bottom/Action/WhoFirstPlayingRoot", ComponentTypeName.Transform).gameObject
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.WhoFirstPlayingRoot, false)
            seatHolder.NotAffordEffectRoot = GetComponentWithPath(self.root, "Bottom/NotAfford/NotAffordImage", ComponentTypeName.Transform).gameObject
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.NotAffordEffectRoot,false)
            if(TableData.MyselfClockIsUseCenter) then
                local locGoClock = GetComponentWithPath(self.root,"Bottom/Action/DoingRoot/Clock", ComponentTypeName.Transform).gameObject
                ModuleCache.ComponentUtil.SafeSetActive(locGoClock,false)
                seatHolder.clockHolder =
                {
                    goClock = locGoClock,
                    textClock = GetComponentWithPath(locGoClock, "Text", "TextWrap")
                }
            end


            seatHolder.EffectRoot = GetComponentWithPath(self.root,"Bottom/Effect/", ComponentTypeName.Transform).gameObject
            seatHolder.EffectType = {}
            local effectPath = "Bottom/Effect/"
            seatHolder.EffectType.Effect_Feiji = GetComponentWithPath(self.root, (effectPath.."Ainm_Paixing_Feiji"), ComponentTypeName.Transform).gameObject
            seatHolder.EffectType.Effect_Liandui = GetComponentWithPath(self.root, (effectPath.."Ainm_Paixing_Liandui"), ComponentTypeName.Transform).gameObject
            seatHolder.EffectType.Effect_Sandaier = GetComponentWithPath(self.root, (effectPath.."Ainm_Paixing_Sandaier"), ComponentTypeName.Transform).gameObject
            seatHolder.EffectType.Effect_Sandaiyi = GetComponentWithPath(self.root, (effectPath.."Ainm_Paixing_Sandaiyi"), ComponentTypeName.Transform).gameObject
            seatHolder.EffectType.Effect_Shunzi = GetComponentWithPath(self.root, (effectPath.."Ainm_Paixing_Shunzi"), ComponentTypeName.Transform).gameObject
            seatHolder.EffectType.Effect_Zhadan = GetComponentWithPath(self.root, (effectPath.."Ainm_Paixing_Zhadan"), ComponentTypeName.Transform).gameObject
        else 
            TableRunfastHelper:initSeatHolder(seatHolder, i, goSeat, nil)
        end

        TableRunfastHelper:refreshSeatInfo(seatHolder, {})
        seatHolder.seatPosTran = seatPosTran
        self.srcSeatHolderArray[i] = seatHolder
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.seatRoot, false) 
    end

    if ModuleCache.GameManager.iosAppStoreIsCheck then
        ModuleCache.ComponentUtil.SafeSetActive(self.BtnRecordPoker.gameObject, false)
        ModuleCache.ComponentUtil.SafeSetActive(self.buttonChat.gameObject,false)
        ModuleCache.ComponentUtil.SafeSetActive(self.buttonMic.gameObject,false)
        ModuleCache.ComponentUtil.SafeSetActive(self.BtnSetting.gameObject,false)
        ModuleCache.ComponentManager.Find(self.root, "TopLeft/Root/LeftRoot/Bg/JinBiChangMatch/ButtonCustomService"):SetActive(false)
        ModuleCache.ComponentUtil.SafeSetActive(self.BtnSetting.gameObject,false)
    end

    self:InitiPB()
    self:refresh_table_bg()
end


------设置房间信息
function TableRunfastView:setRoomInfo()
    local roomInfo = self.modelData.curTableData.roomInfo
    if self.modelData.roleData.HallID and self.modelData.roleData.HallID > 0 then
        self.textRoomNum.text = AppData.MuseumName .."房号:" .. roomInfo.roomNum
    else
        self.textRoomNum.text = "房号:" .. roomInfo.roomNum
    end

    local locResult = ""
    local ruleTable = roomInfo.createRoomRule
    if(ruleTable) then
        if(self:isJinBiChang()) then
            locResult = locResult .. " 底分:" .. roomInfo.baseCoinScore
            locResult = locResult .. (ruleTable.NoShuffle and " 不洗牌" or "")
        elseif(self:isMatchTable()) then
            if(roomInfo.matchInfo and roomInfo.matchInfo.baseScore and roomInfo.matchInfo.baseScore ~= 0) then
                locResult = "底分:".. roomInfo.matchInfo.baseScore
            else
                print("error====比赛场底分为nil请服务器检查数据")
            end
            locResult = locResult .. " ".. "第" .. roomInfo.curRoundNum .. "/" .. roomInfo.totalRoundCount .. "局"
        else
            if(ruleTable.game_type == nil) then
            else
                locResult = locResult .. " ".. TableManager:GetCurTip(ruleTable.game_type)
            end
            if ruleTable.init_card_cnt then
                locResult = locResult .. " ".. ruleTable.init_card_cnt .. "张牌"
            end
            locResult = locResult .. (ruleTable.pay_all and " 放走包赔" or "")
            locResult = locResult .. " "..(ruleTable.allow_pass and "可过牌" or "有牌必压")
            locResult = locResult .. (ruleTable.have2mustpressA and " 有2必打A" or "")
            locResult = locResult .. (ruleTable.isPrivateRoom and " 私人房" or "")
            locResult = locResult .. " ".. "第" .. roomInfo.curRoundNum .. "/" .. roomInfo.totalRoundCount .. "局"
        end
    end
    self.CenterRule.text = locResult
end

function TableRunfastView:SetState_CenterRule(isShow,waitTimeAutoShow)
    ModuleCache.ComponentUtil.SafeSetActive(self.CenterRule.gameObject,isShow)
    if(not isShow) then
        if(waitTimeAutoShow and waitTimeAutoShow > 0) then
            self:subscibe_time_event(waitTimeAutoShow, false, 0):OnComplete(function(t)
                ModuleCache.ComponentUtil.SafeSetActive(self.CenterRule.gameObject,true)
            end)
        end
    end
end

------刷新电池,时间,网络信号信息
function TableRunfastView:refreshBatteryAndTimeInfo()
    local batteryValue = GameSDKInterface:GetCurBatteryLevel()
    batteryValue = batteryValue * 0.01
    self.BatteryImage.fillAmount = batteryValue
    self.textTime.text = os.date("%H:%M", os.time())
    ModuleCache.ComponentUtil.SafeSetActive(self.BatteryChargingRoot, GameSDKInterface:GetCurChargeState())
    local signalType = ModuleCache.SDKInterface().get_cur_signal_type()
    if(signalType == "none")then
        self:showWifiState(true, 0)
        self:show4GState(false)
    elseif(signalType == "wifi")then
        local wifiLevel = ModuleCache.SDKInterface().get_cur_signal_strength()
        self:showWifiState(true, math.ceil(wifiLevel))
        self:show4GState(false)
    else
        self:showWifiState(false)
        self:show4GState(true, signalType)
    end
end


------wifi信号的强度:show 是否显示,wifiLevel wifi强度
function TableRunfastView:showWifiState(show, wifiLevel)    
    for i=1,#self.goWifiStateArray do        
        ModuleCache.ComponentUtil.SafeSetActive(self.goWifiStateArray[i], show and wifiLevel + 1 == i)   
    end
end


------移动信号:show 是否显示,signalType 移动网络信号类型
function TableRunfastView:show4GState(show, signalType)
    ModuleCache.ComponentUtil.SafeSetActive(self.goGState2G, show and signalType == "2g")       
    ModuleCache.ComponentUtil.SafeSetActive(self.goGState3G, show and signalType == "3g")       
    ModuleCache.ComponentUtil.SafeSetActive(self.goGState4G, show and signalType == "4g")       
end

------进入牌桌已经开始游戏清理按钮
function TableRunfastView:EnterTableAlreadyStartGameClearBtn()
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonReady.gameObject, false) 
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonInvite.gameObject, false)
    ModuleCache.ComponentUtil.SafeSetActive(self.ButtonInviteFriendDray.gameObject, false)
    ModuleCache.ComponentUtil.SafeSetActive(self.ButtonLeave.gameObject, false)

    ModuleCache.ComponentUtil.SafeSetActive(self.buttonReady_quickStart.gameObject, false)
end

------显示准备按钮
function TableRunfastView:showReadyBtn(show)
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonReady.gameObject, show)   
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonInvite.gameObject, show and (not ModuleCache.GameManager.iosAppStoreIsCheck))  
end

------
function TableRunfastView:EnterTableShowBtn(show,_isCreate)
    --RoomType == 2 快速组局
    if(self:isMatchTable()) then
        ModuleCache.ComponentUtil.SafeSetActive(self.ButtonLeave.gameObject, false)
        ModuleCache.ComponentUtil.SafeSetActive(self.buttonInvite.gameObject, false)
        ModuleCache.ComponentUtil.SafeSetActive(self.ButtonLeave_LeaveRoom.gameObject, false)
        ModuleCache.ComponentUtil.SafeSetActive(self.ButtonLeave_DissolveRoom.gameObject, false)
        return
    end
    if self.modelData.roleData.RoomType ~= 2 then
        ModuleCache.ComponentUtil.SafeSetActive(self.ButtonLeave.gameObject, show)
        ModuleCache.ComponentUtil.SafeSetActive(self.buttonInvite.gameObject, show and (not ModuleCache.GameManager.iosAppStoreIsCheck))
        ModuleCache.ComponentUtil.SafeSetActive(self.ButtonLeave_LeaveRoom, not _isCreate)
        ModuleCache.ComponentUtil.SafeSetActive(self.ButtonLeave_DissolveRoom, _isCreate)
    --else
    --    ModuleCache.ComponentUtil.SafeSetActive(self.ButtonLeave.gameObject, show)
    --    ModuleCache.ComponentUtil.SafeSetActive(self.buttonInvite.gameObject, false)
    --    ModuleCache.ComponentUtil.SafeSetActive(self.buttonReady_quickStart.gameObject, show)
    --    ModuleCache.ComponentUtil.SafeSetActive(self.ButtonLeave_LeaveRoom, show)
    end
end

--牌友圈快速组局 点击准备
function TableRunfastView:readyDoneShow()
    --ModuleCache.ComponentUtil.SafeSetActive(self.buttonReady_quickStart.gameObject, false)
    --self.ButtonLeave.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(0,-100,0)

end

--牌友圈快速组局刷新所以按钮状态
function TableRunfastView:refreshAllBtnState()
    if(self.modelData.curTableData.roomInfo.curRoundNum <= 0 and self.modelData.roleData.RoomType == 2) then
        local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
        --人满了
        local isMaxPlayer = #seatInfoList == self.modelData.curTableData.roomInfo.maxPlayerCount

        ModuleCache.ComponentUtil.SafeSetActive(self.ButtonLeave.gameObject, true)
        ModuleCache.ComponentUtil.SafeSetActive(self.ButtonLeave_LeaveRoom, true)
        ModuleCache.ComponentUtil.SafeSetActive(self.ButtonLeave_DissolveRoom, false)

        ModuleCache.ComponentUtil.SafeSetActive(self.ButtonInviteFriendDray.gameObject, isMaxPlayer)
        ModuleCache.ComponentUtil.SafeSetActive(self.buttonInvite.gameObject, not isMaxPlayer)

        if(self.modelData.curTableData.roomInfo.mySeatInfo.isReady) then
            ModuleCache.ComponentUtil.SafeSetActive(self.buttonReady.gameObject, false)
            ModuleCache.ComponentUtil.SafeSetActive(self.buttonReady_quickStart.gameObject, false)

            if isMaxPlayer then
                self.ButtonLeave.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(-150,-100,0)
                self.ButtonInviteFriendDray.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(150,-100,0)
            else
                self.ButtonLeave.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(-150,-100,0)
                self.buttonInvite.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(150,-100,0)
            end
        else
            ModuleCache.ComponentUtil.SafeSetActive(self.buttonReady.gameObject, not isMaxPlayer)
            ModuleCache.ComponentUtil.SafeSetActive(self.buttonReady_quickStart.gameObject, isMaxPlayer)

            if isMaxPlayer then
                self.ButtonLeave.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(-300,-100,0)
                self.ButtonInviteFriendDray.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(0,-100,0)
                self.buttonReady_quickStart.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(300,-100,0)
            else
                self.ButtonLeave.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(-300,-100,0)
                self.buttonInvite.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(0,-100,0)
                self.buttonReady.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(300,-100,0)
            end
        end
    end
end

------显示继续按钮
function TableRunfastView:showContinueBtn(show)
    if(show)then
        ModuleCache.ComponentUtil.SafeSetActive(self.buttonReady.gameObject, false)    
        ModuleCache.ComponentUtil.SafeSetActive(self.buttonInvite.gameObject, false)   
    end
end

------显示开始按钮
function TableRunfastView:showStartBtn(show)
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonStart.gameObject, false)    
end

function TableRunfastView:showBetBtns(show)
end


------刷新座位
function TableRunfastView:refreshSeat(seatData, showCardFace, showCardWithAnim)
    local seatHolder = self.seatHolderArray[seatData.localSeatIndex]
    self:refreshSeatInfo(seatData)--刷新座位基本信息
    self:refreshSeatState(seatData)--刷新座位状态

    --刷新手中的牌
    if(seatData.localSeatIndex == 1) then --自己发牌

    else --别人发牌
        if(self.isPlayBacking) then
            TableRunfastHelper:refreshInHandCardsForOthers(seatData)
        end
    end

    self:SetState_handPokerCardsRoot(seatData,#seatData.inHandPokerList ~= 0)
end

------牌的选择
function TableRunfastView:refreshSeatCardsSelect(seatData, withoutAnim)
    local seatHolder = self.seatHolderArray[seatData.localSeatIndex]  
    local inHandCards = seatHolder.inhandCardsArray
    for i=1,#inHandCards do
        self:refreshCardSelect(inHandCards[i], withoutAnim)    
    end    
end

------
function TableRunfastView:refreshCardSelect(cardHolder, withoutAnim)
    local targetPosY    
    if(cardHolder.selected) then 
        targetPosY = 25
    else
        targetPosY = 0
    end
    
    if(withoutAnim) then        
        ModuleCache.TransformUtil.SetY(cardHolder.cardRoot.transform, targetPosY, true)
    else        
        --local sequence = self:create_sequence();
        --sequence:Append(cardHolder.cardRoot.transform:DOLocalMoveY(targetPosY, 0.1, true))
        cardHolder.cardRoot.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(0,targetPosY,0)
    end
end

function TableRunfastView:resetSelectedPokers()
	local cardsArray = self.seatHolderArray[1].inhandCardsArray
	for i=1,#cardsArray do		
		self:refreshCardSelect(cardsArray[i], true)		
	end	
end

function TableRunfastView:SetBtnThrowCardState(_canClick)
    ModuleCache.ComponentUtil.SafeSetActive(self.BtnThrowCard.gameObject, _canClick) 
    ModuleCache.ComponentUtil.SafeSetActive(self.BtnThrowCardDray.gameObject,not _canClick) 
end

function TableRunfastView:SetBtnNotAffordState(_canClick)
    ModuleCache.ComponentUtil.SafeSetActive(self.BtnNotAfford.gameObject, _canClick) 
    ModuleCache.ComponentUtil.SafeSetActive(self.BtnNotAffordDray.gameObject,not _canClick) 
end

------显示语音:localSeatIndex 座位号
function TableRunfastView:show_voice(localSeatIndex)
    local seatInfo = self.seatHolderArray[localSeatIndex]
    local seatRoot = seatInfo.seatRoot
    if(seatRoot ~= nil) then
        local voice = GetComponentWithPath(seatRoot.gameObject, "State/Group/Speak", ComponentTypeName.Transform).gameObject
        voice:SetActive(true)
    end
end

function TableRunfastView:refresh_voice_shake()
    self.openVoice = (PlayerPrefs.GetInt("openVoice", 1) == 1)
end

------隐藏语音
function TableRunfastView:hide_voice(localSeatIndex)
    local seatInfo = self.seatHolderArray[localSeatIndex]
    local seatRoot = seatInfo.seatRoot
    if(seatRoot~=nil) then
        local voice = GetComponentWithPath(seatRoot.gameObject, "State/Group/Speak", ComponentTypeName.Transform).gameObject
        if(voice ~= nil) then
            voice:SetActive(false)
        end
    end
end


------显示聊天气泡
function TableRunfastView:show_chat_bubble(localSeatIndex, content)
    local seatInfo = self.seatHolderArray[localSeatIndex]
    local seatRoot = seatInfo.seatRoot
    local chatBubble = GetComponentWithPath(seatRoot, "State/Group/ChatBubble", ComponentTypeName.RectTransform).gameObject
    local chatText = GetComponentWithPath(chatBubble, "TextBg/Text", ComponentTypeName.Text)
    chatText.text = content
    chatBubble:SetActive(true)

    if seatInfo.timeChatEventId then 
        CSmartTimer:Kill(seatInfo.timeChatEventId)
        seatInfo.timeChatEventId = nil
    end

    local timeChatEvent = self:subscibe_time_event(3, false, 0):OnComplete(function(t)
        if(chatBubble ~=nil) then
            ModuleCache.ComponentUtil.SafeSetActive(chatBubble, false) 
        end
    end)
    seatInfo.timeChatEventId = timeChatEvent.id

end


------刷新座位信息
function TableRunfastView:refreshSeatInfo(seatData)
    local seatHolder = self.seatHolderArray[seatData.localSeatIndex]
    TableRunfastHelper:refreshSeatInfo(seatHolder, seatData)
end

------刷新座位玩家状态
function TableRunfastView:refreshSeatState(seatData)
    TableRunfastHelper:refreshSeatState(self.seatHolderArray[seatData.localSeatIndex], seatData)
end

------刷新在线状态
function TableRunfastView:refreshSeatOfflineState(seatInfo)
    if(self:IsAnticheatWaitReady() and self.modelData.curTableData.roomInfo.maxPlayerCount <= 3) then
        return
    end
    TableRunfastHelper:refreshSeatOfflineState(self.seatHolderArray[seatInfo.localSeatIndex], seatInfo)
end

function TableRunfastView:SetDoingState(show,delayTime)
    if(delayTime ~= nil and delayTime > 0) then
        self:subscibe_time_event(delayTime, false, 0):OnComplete(function(t)
             ModuleCache.ComponentUtil.SafeSetActive(self.DoingRoot, show)
        end)
    else
         ModuleCache.ComponentUtil.SafeSetActive(self.DoingRoot, show)
    end
end

------实例化扑克牌的槽
function TableRunfastView:InstantiatePokerSlot()
    ModuleCache.ComponentUtil.SafeSetActive(self.PokerPrefab, false)
    local pokerSlotMaxCount = TableData.pokerSlotMaxCount
    for i=1,pokerSlotMaxCount do
        local tPoker =ModuleCache.ComponentUtil.InstantiateLocal(self.PokerPrefab, self.PokerPrefabParent)
        tPoker.name = tostring(i)
        ModuleCache.ComponentUtil.SafeSetActive(tPoker, false)
    end
end

------刷新手中剩余的牌数
function TableRunfastView:RefreshRemainPokerInHand()
    local roomInfo = self.modelData.curTableData.roomInfo
    local isShowRemain = false
    if(roomInfo.CurRuleTable) then
        isShowRemain = roomInfo.CurRuleTable.notify_card_cnt
    end
    local myseatHolder = self.seatHolderArray[1]
    local seatInfoList = roomInfo.seatInfoList
    for i=1,#seatInfoList do
        local seatInfo = seatInfoList[i]
        local seatHolder = self.seatHolderArray[seatInfo.localSeatIndex]
        if(myseatHolder == seatHolder) then
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.RemainPokerRoot, false)
            self:WarningSingle(seatInfo)
        else
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.RemainPokerRoot, isShowRemain)
	        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.RemainPokerInHand.gameObject, true and seatInfo.rest_card_cnt > 0)
            seatHolder.RemainPokerInHand.text = tostring(seatInfo.rest_card_cnt)
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.Warning.gameObject, seatInfo.is_single)
            self:WarningSingle(seatInfo)
            if(seatInfo.is_single) then
                ModuleCache.ComponentUtil.SafeSetActive(seatHolder.RemainPokerInHand.gameObject, true and isShowRemain)
                seatHolder.RemainPokerInHand.text = tostring(1)
            end
        end
    end
end

function TableRunfastView:WarningSingle(seatInfo)
    if(seatInfo.is_single) then
        --print("==seatInfo.is_single="..tostring(seatInfo.is_single))
        if(seatInfo.is_single_soundplayed == false) then
            --print("==报单id="..tostring(seatInfo.playerId))
            local isMale = seatInfo.playerInfo ~= nil and seatInfo.playerInfo.gender == 1
            self:subscibe_time_event(0.8, false, 0):OnComplete(function(t)
                TableSound:PlaySound_OnlyOneWarning(isMale)
            end)
            seatInfo.is_single_soundplayed = true
            self:SetState_WarningBubbleRoot(seatInfo,seatInfo.is_single_soundplayed,2)
        end
    end
end

------设置手中剩余的牌数
function TableRunfastView:SetRemainPokerInHand(seatInfo)
    local myseatHolder = self.seatHolderArray[1]
	local seatHolder = self.seatHolderArray[seatInfo.localSeatIndex]
    if(myseatHolder == seatHolder) then
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.RemainPokerRoot, false)
        self:WarningSingle(seatInfo)
    else
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.RemainPokerRoot, true)
	    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.RemainPokerInHand.gameObject, false)
        local intCount = tonumber(seatInfo.rest_card_cnt)
	    seatHolder.RemainPokerInHand.text = tostring(intCount)
        --print("====intCount="..tostring(intCount))
        local boolShowWarning = seatInfo.is_single
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.Warning.gameObject, boolShowWarning)
        self:WarningSingle(seatInfo)
    end
end

------隐藏OK图标
function TableRunfastView:HideOkIcon()
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i=1,#seatInfoList do
        local seatInfo = seatInfoList[i]
        local seatHolder= self.seatHolderArray[seatInfo.localSeatIndex]
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.imageReady.gameObject,false)
    end    
end

------隐藏别人收上的背景牌
function TableRunfastView:HideOthersBackPoker()
	local localMyId = tonumber(self.modelData.curTableData.roomInfo.mySeatInfo.playerId)
	local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
	for i=1,#seatInfoList  do
		local seatInfo = seatInfoList[i]
		local seatInfoPlayerId = tonumber(seatInfo.playerId)
		if(seatInfoPlayerId == localMyId) then
		else
			local seatHolder = self.seatHolderArray[seatInfo.localSeatIndex]
			ModuleCache.ComponentUtil.SafeSetActive(seatHolder.handPokerRoot,false)
		end
	end
end

function TableRunfastView:SetNotAllowActionMaskState(boolActive,delayTime)
    if(delayTime ~= nil and delayTime > 0) then
        self:subscibe_time_event(delayTime, false, 0):OnComplete(function(t)
            ModuleCache.ComponentUtil.SafeSetActive(self.NotAllowActionMask, boolActive)
        end)
    else
        ModuleCache.ComponentUtil.SafeSetActive(self.NotAllowActionMask, boolActive)
    end
end

function TableRunfastView:SetNotAllowActionMaskLastPokerAutoState(boolActive,delayTime)
    if(delayTime ~= nil and delayTime > 0) then
        self:subscibe_time_event(delayTime, false, 0):OnComplete(function(t)
            ModuleCache.ComponentUtil.SafeSetActive(self.NotAllowActionMaskLastPokerAuto, boolActive)
        end)
    else
        ModuleCache.ComponentUtil.SafeSetActive(self.NotAllowActionMaskLastPokerAuto, boolActive)
    end
end

--根据规则布局UI
function TableRunfastView:CheckLayoutUI(ruleTable)    
    if(self.isPlayBacking) then --回放的位置调整
        --if(ruleTable.playerCount == 4) then--四人玩法位置调整
        --    for i=1,#self.seatHolderArray do
        --        local seatHolder = self.seatHolderArray[i]
        --        if(seatHolder ~= nil) then
        --            local locV3 = seatHolder.seatPosTran.localPosition
        --            if(i == 2 or i == 4) then --四人玩法代码里面有调整顺序,所以是2和4,不是2和3.在UI中实际改的值是2,3的位置
        --                locV3.y = 90
        --                seatHolder.seatPosTran.localPosition = locV3
        --            elseif(i == 3) then ----四人玩法代码里面有调整顺序,所以在UI中实际改的值是4的位置
        --                locV3.x = -280
        --                seatHolder.seatPosTran.localPosition = locV3
        --                local v3_ThrowPoker = seatHolder.ThrowPokerGridLayoutGroup.transform.localPosition
        --                v3_ThrowPoker.x = 280
        --                seatHolder.ThrowPokerGridLayoutGroup.transform.localPosition = v3_ThrowPoker
        --            end
        --        end
        --    end
        --end
        self:SwitchState_Currency()
        return
    end
    
    --允许过牌的UI:可过牌有不要按钮,必压没有不要的按钮
    if(ruleTable.allow_pass) then
        self.DoingRootUIStateSwitcher:SwitchState("ThreeBtn")
    else
        self.DoingRootUIStateSwitcher:SwitchState("TwoBtn")
    end

    ----四人玩法位置调整
    --if(ruleTable.playerCount == 4) then
    --    for i=1,#self.seatHolderArray do
    --        local seatHolder = self.seatHolderArray[i]
    --        if(seatHolder ~= nil) then
    --            if(i == 2 or i == 4) then --四人玩法代码里面有调整顺序,所以是2和4,不是2和3
    --                local locV3 = seatHolder.seatPosTran.localPosition
    --                locV3.y = 40
    --                seatHolder.seatPosTran.localPosition = locV3
    --            end
    --        end
    --    end
    --end
    self:CheckUIState()
    --self:CheckAnticheatUI()


    if(self:isMatchTable()) then
        ModuleCache.ComponentUtil.SafeSetActive(self.buttonChat.gameObject,false)
        ModuleCache.ComponentUtil.SafeSetActive(self.buttonMic.gameObject,false)
    end
end

------初始化回放
function TableRunfastView:InitiPB()
    self.isPlayBacking = false
    self.PB_UIRoot =  GetComponentWithPath(self.root, "PlayBackUIRoot", ComponentTypeName.Transform).gameObject
    self.PB_ReplayBtn = GetComponentWithPath(self.root, "PlayBackUIRoot/Action/Top/PB_ReplayBtn", ComponentTypeName.Button)
    self.PB_StopBtn = GetComponentWithPath(self.root, "PlayBackUIRoot/Action/Top/PB_StopBtn", ComponentTypeName.Button)
    self.PB_BackBtn = GetComponentWithPath(self.root, "PlayBackUIRoot/Action/Bottom/PB_BackBtn", ComponentTypeName.Button)
    self.PB_PauseBtn = GetComponentWithPath(self.root, "PlayBackUIRoot/Action/Bottom/PB_PauseBtn", ComponentTypeName.Button)
    self.PB_PlayBtn = GetComponentWithPath(self.root, "PlayBackUIRoot/Action/Bottom/PB_PlayBtn", ComponentTypeName.Button)
    self.PB_PreRoundBtn = GetComponentWithPath(self.root, "PlayBackUIRoot/Action/Top/PB_PreRoundBtn", ComponentTypeName.Button)
    self.PB_NextRoundBtn = GetComponentWithPath(self.root, "PlayBackUIRoot/Action/Top/PB_NextRoundBtn", ComponentTypeName.Button)
    ModuleCache.ComponentUtil.SafeSetActive(self.PB_PlayBtn.gameObject,false)
    self.PB_ForwardBtn = GetComponentWithPath(self.root, "PlayBackUIRoot/Action/Bottom/PB_ForwardBtn", ComponentTypeName.Button)
    
    if(self.curTableData_PB ~= nil and self.curTableData_PB.isPlayBack) then
        self:PBUI()
    end
end

------回放隐藏的UI
function TableRunfastView:PBUI()
    --状态标识
    self.isPlayBacking = true
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonMic.gameObject,not self.isPlayBacking)
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonChat.gameObject,not self.isPlayBacking)
    ModuleCache.ComponentUtil.SafeSetActive(self.ButtonRoomRule.gameObject,not self.isPlayBacking)
    --ModuleCache.ComponentUtil.SafeSetActive(self.TopRight,not self.isPlayBacking)
    self.TopRootUIStateSwitcher:SwitchState("Playback")
    ModuleCache.ComponentUtil.SafeSetActive(self.PB_UIRoot,self.isPlayBacking)
    if ModuleCache.GameManager.iosAppStoreIsCheck then
        self.buttonMic.gameObject:SetActive(false)
    end
    local playBackInitData = self.curTableData_PB.playBackInitData
    if(playBackInitData)then
        self.PB_NextRoundBtn.gameObject:SetActive(true)
        self.PB_PreRoundBtn.gameObject:SetActive(true)
    else
        self.PB_NextRoundBtn.gameObject:SetActive(false)
        self.PB_PreRoundBtn.gameObject:SetActive(false)
    end
end

function TableRunfastView:PBUI2()
    if(not self.isPlayBacking) then
        return 
    end

    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i=1,#seatInfoList do
        local seatInfo = seatInfoList[i]
        print_table(seatInfo)
        local localSeatIndex = seatInfo.localSeatIndex
        local seatHolder= self.seatHolderArray[localSeatIndex]
        if(localSeatIndex == 1) then
            self.PokerPrefabParent.transform.localScale = ModuleCache.CustomerUtil.ConvertVector3(0.75, 0.75, 1)
            self.PokerPrefabParent.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(0, -290, 0)
            self.FirstThrowPokerGridLayoutGroupRoot.transform.localScale = ModuleCache.CustomerUtil.ConvertVector3(0.6, 0.6, 1)
        else
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.handPokerRoot,true)
            seatHolder.ThrowPokerGridLayoutGroup.transform.localScale = ModuleCache.CustomerUtil.ConvertVector3(0.6, 0.6, 1)
        end
    end
end


function TableRunfastView:show_ping_delay(show, delaytime)
    ModuleCache.ComponentUtil.SafeSetActive(self.textPingValue.gameObject, show)       
    if(not show)then
        return
    end
    delaytime = math.floor(delaytime * 1000)
    local content = ''
    if(delaytime >= 1000)then
        delaytime = delaytime / 1000
        delaytime = Util.getPreciseDecimal(delaytime, 2)
        content = '<color=#a31e2a>' .. delaytime .. 's</color>'
    elseif(delaytime >= 200)then
        content = '<color=#a31e2a>' .. delaytime .. 'ms</color>'
    elseif(delaytime >= 100)then
        content = '<color=#b5a324>' .. delaytime .. 'ms</color>'
    else
        content = '<color=#44b916>' .. delaytime .. 'ms</color>'
    end
    self.textPingValue.text = content
end

function TableRunfastView:get_room_award_table(roomAward)
    local myID = self.modelData.curTableData.roomInfo.mySeatInfo.playerId;
    local isMyself = false;
    if myID == roomAward.UserID then
        isMyself=true;
    end

    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList;
    for i = 1, #seatInfoList do
        if(seatInfoList[i].playerId == roomAward.UserID) then
            return {
                position =self.seatHolderArray[i].seatPosTran.position,
                awardMsg = roomAward.Message,
                isMe = isMyself,
                canRob=roomAward.canRob,
                sign=roomAward.sign,
            }
        end
    end
    return nil
end


function TableRunfastView:SetEffectXuanZhuanHeiTao3RootState(isShow)
    ModuleCache.ComponentUtil.SafeSetActive(self.EffectXuanZhuanHeiTao3Root.gameObject, isShow)
end

function TableRunfastView:PlayHeiTao3Anim(seatInfo,FinishCallBack)
    local seatHolder = self:GetSeatHolderBySeatInfo(seatInfo)
    if(seatHolder) then
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.EffectXuanZhuanHeiTao3Root.gameObject, true)
        seatHolder.EffectXuanZhuanHeiTao3Root.transform.localScale = Vector3.one
        self:subscibe_time_event(1.5, false, 0):OnComplete(function(t)
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.EffectXuanZhuanHeiTao3Root.gameObject, false)
            --local dstScale = Vector3.New(0.22, 0.27, 1)
            --local duration = 0.5
            --local sequence = self:create_sequence()
            --sequence:Join(seatHolder.EffectXuanZhuanHeiTao3Root.transform:DOScale(dstScale, duration))
            --sequence:OnComplete(function ()
            --    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.EffectXuanZhuanHeiTao3Root.gameObject, false)
            --    seatHolder.EffectXuanZhuanHeiTao3Root.transform.localScale = Vector3.one
            --end)
            if(FinishCallBack) then
                FinishCallBack()
            end
        end)
    end
end


function TableRunfastView:GetSeatHolderBySeatInfo(seatInfo)
    --print("--通过seatInfo获取seatHolder")
    if(seatInfo == nil) then
        return nil
    end
    return self.seatHolderArray[seatInfo.localSeatIndex]
end

function TableRunfastView:GetSeatHolder(seatInfo,localSeatIndex)
    --print("--获取seatHolder")
    if(seatInfo) then
        return self.seatHolderArray[seatInfo.localSeatIndex]
    elseif(localSeatIndex and localSeatIndex > 0) then
        return self.seatHolderArray[localSeatIndex]
    else
        return nil
    end
end

function TableRunfastView:isFriendTable()
    --print("--是否是好友场")
    return self.modelData.tableCommonData.tableType == 0
end

function TableRunfastView:isGoldFriendTable()
    --print("--是否是比赛场")
    return self.modelData.tableCommonData.isGoldFriendTable
end

function TableRunfastView:isMatchTable()
    --print("--是否是比赛场")
    return self.modelData.tableCommonData.tableType == 2
end

function TableRunfastView:isJinBiChang()
    --0:房卡场  1:金币场  2:比赛场
    return self.modelData.tableCommonData.tableType == 1
end

function TableRunfastView:isGoldUnlimited()
    --print("====欢乐跑得快废弃")
    return false
    --print("--是否是金币场无限局")
    --return self.modelData.tableCommonData.isGoldUnlimited
end

function TableRunfastView:isGoldSettle()
    --print("--是否金币结算:包括普通创建房间时用消耗的是金币")
    return self:isJinBiChang()
end

function TableRunfastView:RefreshAllSeatInfoCurrency()
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i=1,#seatInfoList do
        self:RefreshSeatInfoCurrency(seatInfoList[i])
    end
end

function TableRunfastView:RefreshSeatInfoCurrency(seatInfo)
    --print("--刷新玩家的货币数量")
    if(seatInfo) then
        local seatHolder = self:GetSeatHolderBySeatInfo(seatInfo)
        if(seatHolder) then
            if(self:isGoldSettle()) then
                seatHolder.GoldCount.text = Util.filterPlayerGoldNum(seatInfo.coinBalance)
            else
                seatHolder.textScore.text = tostring(seatInfo.score)
            end
        end
    end
end

--获取当前的底注
function TableRunfastView:GetCurBaseCoinScore()
    return self.modelData.curTableData.roomInfo.baseCoinScore
end

function TableRunfastView:CheckUIState()
    local roomInfo = self.modelData.curTableData.roomInfo
    local TopRootType = "Normal"
    local ExitRoomShowStr = "退出"
    local isShowBtnIntrust = true
    local isShowBtnMic = false
    if(self:isJinBiChang()) then
        --金币场有记牌,没有房号,没有商城入口
        self:SetState_RecordPokerRoot(TableData.IsHave_RecordPoker)
        if(self:IsAnticheat()) then
            TopRootType = "HideRoomId"
        end
        TopRootType = "HideRoomId"
    elseif(self:isMatchTable()) then
        --比赛场没有记牌,没有房号,没有商城入口
        self:SetState_RecordPokerRoot(false)
        TopRootType = "HideRoomId"
    else
        --好友场没有记牌,有房号,没有商城入口
        self:SetState_RecordPokerRoot(false)
        ExitRoomShowStr = "解散"
        isShowBtnIntrust = false
        isShowBtnMic = true
        if ModuleCache.GameManager.iosAppStoreIsCheck then
            isShowBtnMic = false
        end
    end
    ModuleCache.ComponentUtil.SafeSetActive(self.ButtonShop.gameObject,false)
    self.TopRootUIStateSwitcher:SwitchState(TopRootType)
    self.ButtonJinBiChangExitText.text = ExitRoomShowStr
    ModuleCache.ComponentUtil.SafeSetActive(self.BtnIntrust.gameObject,isShowBtnIntrust)
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonMic.gameObject,isShowBtnMic)


    local CurrencyUIStateSwitcherType = "Point"
    if(self:isGoldSettle()) then
        CurrencyUIStateSwitcherType = "Gold"
    end
    self:SwitchState_Currency(CurrencyUIStateSwitcherType)
end

function TableRunfastView:SetState_LeftRoot(show)
    ModuleCache.ComponentUtil.SafeSetActive(self.LeftRoot.gameObject, show)
    ModuleCache.ComponentUtil.SafeSetActive(self.BtnLeftOpen.gameObject,not show)
    --local x = self.leftPoint.localPosition.x + 50
    --if not show then
    --    x = -1000
    --end
    --self:do_positionX(self.LeftRoot,0.4,x,function()
    --    if not show then
    --        self.LeftRoot.gameObject:SetActive(false)
    --    else
    --        self.LeftRoot.gameObject:SetActive(true)
    --    end
    --end)
end


function TableRunfastView:SetState_RecordPokerRoot(isShow)
    ModuleCache.ComponentUtil.SafeSetActive(self.RecordPokerRoot.gameObject, isShow)
end

function TableRunfastView:SetState_RecordPokerShowRoot(isShow)
    ModuleCache.ComponentUtil.SafeSetActive(self.RecordPokerShowRoot.gameObject, isShow)
end

function TableRunfastView:SetState_RecordPokerTimeRoot(isShow)
    ModuleCache.ComponentUtil.SafeSetActive(self.RecordPokerTimeRoot.gameObject, isShow)
end

function TableRunfastView:SetRecordPokerCountSlotArrayData(itemList)
    if(itemList == nil or #itemList ~= 13) then
        print("error===itemList == nil or #itemList ~= 13")
        return
    end

    for i=1,#itemList do
        local locData = itemList[i]
        local locCount = locData.remainCount
        if(locCount == nil or locCount < 0) then
            print("error===数据错误")
        else
            local RecordPokerCountText = self.RecordPokerCountSlotArray[locData.cardName]
            RecordPokerCountText.text = locData.remainCount
        end
    end
    self:SetState_RecordPokerShowRoot(true)
end

function TableRunfastView:ShowServiceFee(FeeNum)
    if(self:isJinBiChang()) then
        FeeNum = FeeNum or self.modelData.curTableData.roomInfo.feeNum
        if(FeeNum and FeeNum > 0) then
            self:subscibe_time_event(3, false, 0):OnComplete(function(t)
                local ShowStr = "本局游戏服务费为:".. tostring(FeeNum)
                self:SetComTip(true, ShowStr)
                self:subscibe_time_event(2, false, 1):OnComplete( function(t)
                    self:SetComTip(false)
                end)
            end)
        else
            print("warning====服务器没有发送台费过来")
        end
    end
end

function TableRunfastView:SetCancelIntrustState(show)
    ModuleCache.ComponentUtil.SafeSetActive(self.CancelIntrustRoot.gameObject, show)
end

function TableRunfastView:ResetReplaceTableWaitId(isHide)
    if self.ReplaceTableWaitId then
        CSmartTimer:Kill(self.ReplaceTableWaitId)
        self.ReplaceTableWaitId = nil
    end

    if(isHide) then
        self.JinBiChangStateSwitcher:SwitchState("Disable")
    end
end

function TableRunfastView:SetJinBiChangStateSwitcher(type)
    if(type == false) then
        type = "Disable"
    else
        if(self:isJinBiChang()) then
            type = "Center"
            if(self:isGoldUnlimited()) then
                type = "CenterOnlyReady"
            end
            if(TableManager.LastChangeTableTime) then
                if(Time.realtimeSinceStartup < TableManager.LastChangeTableTime + 5 ) then
                    type = "ReplaceTableWait"
                    self:ResetReplaceTableWaitId()
                    self.ReplaceTableWaitId = self:subscibe_time_event(5, false, 1):OnUpdate( function(t)
                        t = t.surplusTimeRound
                        self.ButtonReplaceTableText.text = t .. "s"
                    end):OnComplete( function(t)
                        if(self.modelData.curTableData.roomInfo.mySeatInfo.isReady) then
                            self.JinBiChangStateSwitcher:SwitchState("Disable")
                        else
                            self.JinBiChangStateSwitcher:SwitchState("Center")
                        end
                    end).id
                end
            end
        else
            type = "Disable"
        end
    end
    self.JinBiChangStateSwitcher:SwitchState(type)
end

--1:进入房间准备阶段   2:游戏进行阶段   3:游戏结算阶段
function TableRunfastView:IsEnterRoomWaitReady()
    return self.modelData.curTableData.roomInfo.gamePhaseState == 1
end

function TableRunfastView:IsGameDoing()
    return self.modelData.curTableData.roomInfo.gamePhaseState == 2
end

function TableRunfastView:IsAccountWaitReady()
    return self.modelData.curTableData.roomInfo.gamePhaseState == 3
end

--防作弊准备阶段
function TableRunfastView:IsAnticheatWaitReady()
    return self:IsAnticheat() and (self:IsEnterRoomWaitReady() or self:IsAccountWaitReady())
end

--是否防作弊
function TableRunfastView:IsAnticheat()
    if(self:isJinBiChang()) then
        local RuleTable = self.modelData.curTableData.roomInfo.createRoomRule
        if(RuleTable) then
            return RuleTable.anticheat
        end
    end
    return nil
end

function TableRunfastView:CheckAnticheatUI()
    local IsAnticheatWaitReady = self:IsAnticheatWaitReady()
    ModuleCache.ComponentUtil.SafeSetActive(self.AnticheatMatchingRoot.gameObject,IsAnticheatWaitReady)
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonChat.gameObject,not IsAnticheatWaitReady)
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonMic.gameObject,not IsAnticheatWaitReady)
    if ModuleCache.GameManager.iosAppStoreIsCheck then
        self.buttonMic.gameObject:SetActive(false)
    end

    self:CheckAnticheatSwitcherState()
end

function TableRunfastView:CheckAnticheatSwitcherState()
    if(self:IsAnticheat()) then
        local roomInfo = self.modelData.curTableData.roomInfo
        local count = roomInfo.maxPlayerCount
        local playerCountLimit = 3
        if(count <= playerCountLimit) then
            local seatInfoList = roomInfo.seatInfoList
            local type = "Normal"
            local IsAnticheatWaitReady = self:IsAnticheatWaitReady()
            if(IsAnticheatWaitReady) then
                type = "Anticheat"
                ModuleCache.ComponentUtil.SafeSetActive(self.BtnLocation.gameObject,false)
            else
                if(#seatInfoList >= playerCountLimit) then
                    ModuleCache.ComponentUtil.SafeSetActive(self.BtnLocation.gameObject,false)
                end
            end


            for i = 1, #seatInfoList do
                local seatInfo = seatInfoList[i]
                if(seatInfo and seatInfo~= roomInfo.mySeatInfo) then
                    local seatHolder = self:GetSeatHolderBySeatInfo(seatInfo)
                    if(seatHolder) then
                        seatHolder.AvatarUIStateSwitcher:SwitchState(type)
                    end
                end
            end

            local seatHolderArray = self.seatHolderArray
            for i = 1, #seatHolderArray do
                if(i <= count) then
                    local seatHolder = seatHolderArray[i]
                    if(seatHolder) then
                        seatHolder.NotSeatRootUIStateSwitcher:SwitchState(type)
                    end
                end
            end
            --print("===============roomInfo.gamePhaseState",self.modelData.curTableData.roomInfo.gamePhaseState,type)
        end
    end
end





function TableRunfastView:HideAllWhoWinEffect()
    --print("====隐藏所有的:我赢了")
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        self:SetState_WhoWinEffect(seatInfoList[i],false)
    end
end

function TableRunfastView:SetState_WhoWinEffect(seatInfo,isShow)
    --print("====隐藏:我赢了")
    if(seatInfo) then
        local seatHolder = self:GetSeatHolderBySeatInfo(seatInfo)
        if(seatHolder) then
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.WhoWinEffectRoot,isShow)
        end
    end
end

function TableRunfastView:SetState_Announce(isShow)
    --print("====设置")
    ModuleCache.ComponentUtil.SafeSetActive(self.Announce.gameObject,isShow)
end

function TableRunfastView:SetComTip(IsShow,ShowStr,CountDownTime)
    print("==公共的提示文本")
    ModuleCache.ComponentUtil.SafeSetActive(self.ComTipRoot.gameObject,IsShow)
    if(IsShow) then
        self.ComTipText.text = ShowStr
        if(CountDownTime and CountDownTime > 0) then--这里是带了倒计时的提示文本
            self:Reset_ComTipTime()
            ModuleCache.ComponentUtil.SafeSetActive(self.ComTipTime.gameObject,true)
            self.EventId_ComTipTime = self:subscibe_time_event(CountDownTime, false, 0):OnUpdate(function(t)
                t = t.surplusTimeRound
                self.ComTipTime.text = t
            end):OnComplete(function(t)
                self:Reset_ComTipTime()
                ModuleCache.ComponentUtil.SafeSetActive(self.ComTipRoot.gameObject,false)
            end)
        end
    end
end

function TableRunfastView:Reset_ComTipTime()
    if(self.EventId_ComTipTime) then
        CSmartTimer:Kill(self.EventId_ComTipTime)
        self.EventId_ComTipTime = nil
    end
    ModuleCache.ComponentUtil.SafeSetActive(self.ComTipTime.gameObject,false)
end


function TableRunfastView:CheckTopRoomInfo()
    if(self:isJinBiChang()) then

    elseif(self:isMatchTable()) then
        self:SetRankInfo(true)
    else

    end
end


function TableRunfastView:SetState_WhoFirstPlayingRoot(seatInfo,isShow,autoHideTime)
    local seatHolder = self:GetSeatHolderBySeatInfo(seatInfo)
    if(seatHolder) then
        if(isShow) then
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.WhoFirstPlayingRoot,false)
            if(autoHideTime and autoHideTime > 0) then
                self:subscibe_time_event(autoHideTime, false, 0):OnComplete(function(t)
                    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.WhoFirstPlayingRoot,false)
                end)
            end
        else
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.WhoFirstPlayingRoot,false)
        end
    end
end

function TableRunfastView:SetState_WarningBubbleRoot(seatInfo,isShow,waitTimeAutoHide)
    --print("====设置报单节点")
    local seatHolder = self:GetSeatHolderBySeatInfo(seatInfo)
    if(seatHolder) then
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.WarningBubbleRoot,isShow)

        if(isShow) then
            if(waitTimeAutoHide and waitTimeAutoHide > 0) then
                self:subscibe_time_event(waitTimeAutoHide, false, 0):OnComplete(function(t)
                    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.WarningBubbleRoot,false)
                end)
            end
        end
    end
end
function TableRunfastView:HideAllWarningBubbleRoot(seatInfo,isShow)
    --print("====设置报单节点")
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        self:SetState_WarningBubbleRoot(seatInfoList[i],false)
    end
end



function TableRunfastView:SetState_PromotionInfoRoot(isShow)
    --print("====晋级")
    ModuleCache.ComponentUtil.SafeSetActive(self.PromotionInfoRoot.gameObject,isShow)
end
function TableRunfastView:SetPromotionInfoText(tableCount)
    --print("====晋级剩余桌数")
    if(tableCount and tableCount > 0) then
        self:SetState_PromotionInfoRoot(true)
        self.PromotionInfoText.text = string.format("剩余%s桌",tableCount)
    else
        self:SetState_PromotionInfoRoot(false)
    end
end

function TableRunfastView:SetState_handPokerCardsRoot(seatInfo, isShow)
    local seatHolder = self:GetSeatHolderBySeatInfo(seatInfo)
    if(seatHolder) then
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.handPokerCardsRoot,isShow)
    end
end


function TableRunfastView:SetState_PiaoFenRoot(seatInfo,isShow)
    --print("====设置飘分显示节点")
    local seatHolder = self:GetSeatHolderBySeatInfo(seatInfo)
    if(seatHolder) then
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.PiaoFenRoot,isShow)
    end
end
function TableRunfastView:HideAllPiaoFenRoot()
    --print("====隐藏所有的飘分节点")
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        self:SetState_PiaoFenRoot(seatInfoList[i],false)
    end
end
--seatInfo玩家,score分数,waitTimeAutoHide自动隐藏的时间,
function TableRunfastView:SetPiaoFenShow(seatInfo,score,isAnim,waitTimeAutoHide)
    --print("====飘分")
    local seatHolder = self:GetSeatHolderBySeatInfo(seatInfo)
    if(seatHolder) then
        --显示节点
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.PiaoFenRoot,true)
        seatHolder.PiaoFenAnimRoot.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(0,0,0)
        --切换加分还是减分
        if(score >= 0) then
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.PiaoFenWinText.gameObject,true)
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.PiaoFenLostText.gameObject,false)
            seatHolder.PiaoFenWinText.text = "+" .. score
        else
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.PiaoFenWinText.gameObject,false)
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.PiaoFenLostText.gameObject,true)
            seatHolder.PiaoFenLostText.text = score
        end
        --动画
        if(isAnim) then
            TableRunfastHelper:PlayMoveYAnim(seatHolder.PiaoFenAnimRoot,nil,50,0.5)
        end
        --检查飘分后自动隐藏
        waitTimeAutoHide = waitTimeAutoHide or 2
        if(waitTimeAutoHide and waitTimeAutoHide > 0) then
            self:subscibe_time_event(waitTimeAutoHide, false, 0):OnComplete(function(t)
                ModuleCache.ComponentUtil.SafeSetActive(seatHolder.PiaoFenRoot,false)
            end)
        end
    end
end
function TableRunfastView:Test_PiaoFenShow()
    --print("====隐藏所有的飘分节点")
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        self:SetPiaoFenShow(seatInfoList[i],500,true)
    end
end


function TableRunfastView:MySelfFaPaiAnim(FaPaiAnimEndCallBack)
    --print("======发牌动画")
    local mySeatInfo = self.modelData.curTableData.roomInfo.mySeatInfo
    local seatHolder = self:GetSeatHolderBySeatInfo(mySeatInfo)
    local pokerSlotTable = seatHolder.inhandCardsArray--牌的预设
    local inHandPokerList = mySeatInfo.inHandPokerList
    local cardCount = #mySeatInfo.inHandPokerList--手中牌的数量
    local intervalTime = 0.05 --每张牌的间隔时间
    local flyTime = 1         --每张牌飞过来所用时间
    local isUseOldAnim = true
    for i=1,#pokerSlotTable do
        if(i<=cardCount) then
            local cardHolder = pokerSlotTable[i]--牌槽
            TableRunfastHelper:setCardInfo(cardHolder, inHandPokerList[i])
            ModuleCache.ComponentUtil.SafeSetActive(cardHolder.face.gameObject,false)
            ModuleCache.ComponentUtil.SafeSetActive(cardHolder.back.gameObject,false)
            ModuleCache.ComponentUtil.SafeSetActive(cardHolder.cardRoot.gameObject,true)
            ModuleCache.ComponentUtil.SafeSetActive(cardHolder.cardRoot.transform.parent.transform.gameObject,true)
        end
    end

    self:subscibe_time_event(0.8, false, 0):OnComplete(function(t)
        for i=1,#pokerSlotTable do
            if(i<=cardCount) then
                local cardHolder = pokerSlotTable[i]--牌槽
                ModuleCache.ComponentUtil.SafeSetActive(cardHolder.back.gameObject,true)
                cardHolder.back.transform.position = self.FaPaiAnimOriginalPosRoot.transform.position
                local tempTime = intervalTime * i
                self:subscibe_time_event(tempTime, false, 0):OnComplete(function(t)
                    TableSound:PlaySound_FaPaiDongHua()
                    local sequence = self:create_sequence()
                    sequence:Append(cardHolder.back.transform:DOLocalMove(Vector3.zero,0.1, true)):OnComplete(function()
                        ModuleCache.ComponentUtil.SafeSetActive(cardHolder.face.gameObject,true)
                        ModuleCache.ComponentUtil.SafeSetActive(cardHolder.back.gameObject,false)
                    end)
                    if(i == cardCount) then
                        print("====发牌动画结束")
                        if(FaPaiAnimEndCallBack) then
                            FaPaiAnimEndCallBack()
                        end
                    end
                end)
            end
        end
    end)

end

function TableRunfastView:SetState_StartRoundAnimRoot(isShow,waitTimeAutoHide)
    --print("====设置状态:开局动画")
    ModuleCache.ComponentUtil.SafeSetActive(self.StartRoundAnimRoot,isShow)
    if(isShow) then
        self:subscibe_time_event(waitTimeAutoHide, false, 0):OnComplete(function(t)
            ModuleCache.ComponentUtil.SafeSetActive(self.StartRoundAnimRoot,false)
        end)
    end
end

function TableRunfastView:GetBaseScore()
    local roomInfo = self.modelData.curTableData.roomInfo
    if(self:isJinBiChang()) then
        return roomInfo.baseCoinScore
    elseif self:isMatchTable() then
        if(roomInfo.matchInfo and roomInfo.matchInfo.baseScore) then
            return roomInfo.matchInfo.baseScore
        end
    else
        if(roomInfo.createRoomRule) then
            return roomInfo.createRoomRule.rate or 1
        end
    end
    return 1
end

function TableRunfastView:SetRankInfo(isShow,NotifyData)
    --print("====刷新自己排行数据")
    ModuleCache.ComponentUtil.SafeSetActive(self.RankRoot,isShow)
    if(isShow) then
        local roomInfo = self.modelData.curTableData.roomInfo
        local roomMatchInfo = roomInfo.matchInfo
        local mySeatInfo = roomInfo.mySeatInfo
        if(NotifyData) then
            mySeatInfo.PlayerMatchInfo.rank = NotifyData.rank
        end

        self.RankState_CurRank.text = mySeatInfo.PlayerMatchInfo.rank
        self.RankState_Total.text = roomMatchInfo.playersCount
        self.RankState_Instructions.text = string.format("本轮低于%s分淘汰",roomMatchInfo.knockoutScore)
    end
end

function TableRunfastView:SetState_BtnLuckyBox(isShow)
    ModuleCache.ComponentUtil.SafeSetActive(self.BtnLuckyBox.gameObject,isShow and not ModuleCache.GameManager.iosAppStoreIsCheck)
end

function TableRunfastView:SetState_BtnFirstGiftBag(isShow)
    ModuleCache.ComponentUtil.SafeSetActive(self.BtnFirstGiftBag.gameObject,isShow and not ModuleCache.GameManager.iosAppStoreIsCheck)
end

function TableRunfastView:SetState_DoingMatchingRoot(isShow)
    ModuleCache.ComponentUtil.SafeSetActive(self.DoingMatchingRoot.gameObject,isShow)
end


function TableRunfastView:GetRuleTable()
    --print("==获取规则table")
    return self.modelData.curTableData.roomInfo.CurRuleTable
end

function TableRunfastView:GetRuleJsonString()
    --print("==获取规则Json")
    return self.modelData.curTableData.roomInfo.CurRuleJsonString
end

function TableRunfastView:SetState_BtnActivity(isShow)
    if ModuleCache.GameManager.iosAppStoreIsCheck then
        isShow = false
    end
    ModuleCache.ComponentUtil.SafeSetActive(self.goActivity, isShow)
end

function TableRunfastView:CheckStyleType(StyleType)
    local PokerStyleTypeKey = TableRunfastHelper.PokerStyleTypeKey
    if(not StyleType) then
        StyleType = PlayerPrefs.GetInt(PokerStyleTypeKey)
    end

    if(StyleType == 1) then
        self.cardAssetHolder = self.CardAssetHolder1
    elseif(StyleType == 2) then
        self.cardAssetHolder = self.CardAssetHolder2
    elseif(StyleType == 0) then
        self.cardAssetHolder = self.CardAssetHolder1
        PlayerPrefs.SetInt(PokerStyleTypeKey,1)
    end
end

function TableRunfastView:refresh_table_bg()
    local Key = "RoomSetting_TableBackground_Name_RUNFAST"
    local tableBgIndex = UnityEngine.PlayerPrefs.GetInt(Key)
    if(tableBgIndex == 0) then
        tableBgIndex = 1
        UnityEngine.PlayerPrefs.GetInt(Key, tableBgIndex)
    end

    local TableBg3DImageList = self.TableBg3DImageList
    for i = 1, #TableBg3DImageList do
        local TableBgImage = TableBg3DImageList[i]
        ModuleCache.ComponentUtil.SafeSetActive(TableBgImage.gameObject,i == tableBgIndex)
    end

    --local CurUseChangJingIndex = self:GetCurUseChingJingId()
    --local CurUseZhuoBuIndex = self:GetCurUseZhuoBuId()
    --if(CurUseChangJingIndex == 0 or CurUseZhuoBuIndex == 0) then
    --    CurUseChangJingIndex = 3
    --    CurUseZhuoBuIndex = 1
    --    self:SetCurUseChingJingId(CurUseChangJingIndex)
    --    self:SetCurUseZhuoBuId(CurUseZhuoBuIndex)
    --end
    ----print("refresh_table_bg==CurUseChangJingIndex="..CurUseChangJingIndex,"CurUseZhuoBuIndex="..CurUseZhuoBuIndex)
    --
    --ModuleCache.ComponentUtil.SafeSetActive(self.TableBg2DRoot,CurUseChangJingIndex == 2)
    --ModuleCache.ComponentUtil.SafeSetActive(self.TableBg3DRoot,CurUseChangJingIndex == 3)
    --
    --if(CurUseChangJingIndex == 2) then
    --    local TableBg2DImageList = self.TableBg2DImageList
    --    for i = 1, #TableBg2DImageList do
    --        local TableBgImage = TableBg2DImageList[i]
    --        ModuleCache.ComponentUtil.SafeSetActive(TableBgImage.gameObject,i == CurUseZhuoBuIndex)
    --    end
    --elseif(CurUseChangJingIndex == 3) then
    --    local TableBg3DImageList = self.TableBg3DImageList
    --    for i = 1, #TableBg3DImageList do
    --        local TableBgImage = TableBg3DImageList[i]
    --        ModuleCache.ComponentUtil.SafeSetActive(TableBgImage.gameObject,i == CurUseZhuoBuIndex)
    --    end
    --end
    --
    --self:CheckBtn2D3DState()
end

function TableRunfastView:InitFriendsCirclePreventCheatingState()
    --print("==是否亲友圈防作弊")
    if(not self.isPlayBacking) then
        local HallID = self.modelData.roleData.HallID
        local  cachKey = string.format("parlor/list/getParlorDetail?%s",HallID)
        local text = ModuleCache.PlayerPrefsManager.GetString(cachKey, "")
        local museumData
        if text ~= "" then
            --print("==1")
            local retData = ModuleCache.Json.decode(text)
            if(retData.success) then
                museumData = retData.data
                print_table(museumData)
            end
        else
            --print("==2")
        end

        if(HallID > 0 and museumData and museumData.preventionCheat == 1) then
            --print("==是亲友圈防作弊")
            self.IsFriendsCirclePreventCheating = true
        end
    end
end

function TableRunfastView:SwitchState_Currency(Type)
    Type = Type or "Point"
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i=1,#seatInfoList do
        local seatHolder = self:GetSeatHolderBySeatInfo(seatInfoList[i])
        seatHolder.CurrencyUIStateSwitcher:SwitchState(Type)
    end
end

function TableRunfastView:CheckBtn2D3DState()
    local CurUseChangJingIndex = self:GetCurUseChingJingId()
    local is2D = CurUseChangJingIndex == 2
    ModuleCache.ComponentUtil.SafeSetActive(self.BtnMenu2D.gameObject,not is2D)
    ModuleCache.ComponentUtil.SafeSetActive(self.BtnMenu3D.gameObject,is2D)
end

function TableRunfastView:GetCurUseChingJingId()
    local ChangJingKey = "RoomSetting_TableBackground_Name_RUNFAST_ChangJingId"
    local CurUseChangJingIndex = UnityEngine.PlayerPrefs.GetInt(ChangJingKey)
    return CurUseChangJingIndex
end

function TableRunfastView:SetCurUseChingJingId(CurUseChingJingId)
    local ChangJingKey = "RoomSetting_TableBackground_Name_RUNFAST_ChangJingId"
    UnityEngine.PlayerPrefs.SetInt(ChangJingKey, CurUseChingJingId)
end

function TableRunfastView:GetCurUseZhuoBuId()
    local ZhuoBuKey = "RoomSetting_TableBackground_Name_RUNFAST_ZhuoBuId"
    local CurUseZhuoBuIndex = UnityEngine.PlayerPrefs.GetInt(ZhuoBuKey)
    return CurUseZhuoBuIndex
end

function TableRunfastView:SetCurUseZhuoBuId(CurUseZhuoBuId)
    local ZhuoBuKey = "RoomSetting_TableBackground_Name_RUNFAST_ZhuoBuId"
    UnityEngine.PlayerPrefs.SetInt(ZhuoBuKey,CurUseZhuoBuId)
end

function TableRunfastView:GetSpecificHeadSprite()
    --print("==获取特定的头像")
     return self.HeadAssetHolder:FindSpriteByName("1538015536245微信-头像-1")
end

function TableRunfastView:GetMySeatInfoPlayerId(IsStr)
    --print("==获取自己座位上玩家的id")
    if(IsStr) then
        return self.modelData.curTableData.roomInfo.mySeatInfo.playerId
    else
        return tonumber(self.modelData.curTableData.roomInfo.mySeatInfo.playerId)
    end
end






return  TableRunfastView