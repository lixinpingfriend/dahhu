local BranchPackageName = AppData.BranchRunfastName
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local CurrentGameAccountModule = class("CurrentGameAccountModule", ModuleBase)

local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine

function CurrentGameAccountModule:initialize(...)
    ModuleBase.initialize(self, "currentgameaccount_view", "currentgameaccount_model", ...)
end

function CurrentGameAccountModule:on_show(data)
    self.CurrentGameAccountView:init(self.modelData);

    if(self.modelData.curTableData.roomInfo.curAccountData.isPBData) then
        ModuleCache.ComponentUtil.SafeSetActive(self.CurrentGameAccountView.buttonContinue.gameObject, false)
        ModuleCache.ComponentUtil.SafeSetActive(self.CurrentGameAccountView.GoldMatchBtnRoot.gameObject, false)
        ModuleCache.ComponentUtil.SafeSetActive(self.CurrentGameAccountView.PlayBackUIRoot, true) 
        ModuleCache.ComponentUtil.SafeSetActive(self.CurrentGameAccountView.labelStartTime.gameObject, false) 
        ModuleCache.ComponentUtil.SafeSetActive(self.CurrentGameAccountView.labelEndTime.gameObject, false) 
        return   
    end
    ModuleCache.ComponentUtil.SafeSetActive(self.CurrentGameAccountView.PlayBackUIRoot, false) 
    
    if(self.modelData.curTableData.roomInfo.curAccountData.is_free_room 
    and self.modelData.curTableData.roomInfo.curAccountData.is_summary_account) then
        self:GoToResult()    
    end
end

function CurrentGameAccountModule:on_module_event_bind( ... )
    self:subscibe_package_event("Event_CurrentGameAccountTimeDown", function(eventHead, eventData)
        self.CurrentGameAccountView:SetTimeDown(eventData)
    end)
end

function CurrentGameAccountModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj == self.CurrentGameAccountView.buttonContinue.gameObject then
        if self.modelData.curTableData.roomInfo.curAccountData.is_summary_account then --跳到大结算
            self:GoToResult()            
        else --继续游戏
            ModuleCache.ModuleManager.hide_module(BranchPackageName, "currentgameaccount")
            self:dispatch_module_event("currentgameaccount", "Event_CurrentGameAccount")
        end
    elseif obj == self.CurrentGameAccountView.PBBtnClose.gameObject then
        ModuleCache.ModuleManager.hide_module(BranchPackageName, "currentgameaccount")
        ModuleCache.ModuleManager.destroy_package(AppData.BranchRunfastName,"tablerunfast")
        ModuleCache.ModuleManager.show_module("public", "hall")
    elseif obj == self.CurrentGameAccountView.PB_ReplayBtn.gameObject then
        print("====PB_ReplayBtn 1")
        --ModuleCache.ModuleManager.hide_module(BranchPackageName, "currentgameaccount")
        self:dispatch_module_event("currentgameaccount", "Event_PB_ReplayBtn")
    elseif obj == self.CurrentGameAccountView.PB_StopBtn.gameObject then
        self:dispatch_module_event("currentgameaccount", "Event_PB_StopBtn")
    elseif obj == self.CurrentGameAccountView.PB_BackBtn.gameObject then
        self:dispatch_module_event("currentgameaccount", "Event_PB_BackBtn")
    elseif obj == self.CurrentGameAccountView.PB_PauseBtn.gameObject then
        self:dispatch_module_event("currentgameaccount", "Event_PB_PauseBtn")
    elseif obj == self.CurrentGameAccountView.PB_PlayBtn.gameObject then
        self:dispatch_module_event("currentgameaccount", "Event_PB_PlayBtn")
    elseif obj == self.CurrentGameAccountView.PB_ForwardBtn.gameObject then
        self:dispatch_module_event("currentgameaccount", "Event_PB_ForwardBtn")
    elseif obj == self.CurrentGameAccountView.ButtonBack.gameObject then
        print("====点击了返回")
        if(self.modelData.curTableData.roomInfo.curAccountData.IsChangeRoomWhileRestart) then
            print("======继续游戏换桌0")
            self:dispatch_module_event("currentgameaccount", "Event_ChangeTable")
            return
        end
        ModuleCache.ModuleManager.hide_module(BranchPackageName, "currentgameaccount")
    elseif obj == self.CurrentGameAccountView.ButtonReady.gameObject then
        print("====点击了准备")
        print("=======IsChangeRoomWhileRestart",tostring(self.modelData.curTableData.roomInfo.curAccountData.IsChangeRoomWhileRestart))
        --self.modelData.curTableData.roomInfo.curAccountData.IsChangeRoomWhileRestart = true
        if(self.modelData.curTableData.roomInfo.curAccountData.IsChangeRoomWhileRestart) then
            print("======继续游戏换桌0")
            self:dispatch_module_event("currentgameaccount", "Event_ChangeTable")
            return
        end
        ModuleCache.ModuleManager.hide_module(BranchPackageName, "currentgameaccount")
        self:dispatch_module_event("currentgameaccount", "Event_CurrentGameAccount")
    end
end




--跳到大结算
function CurrentGameAccountModule:GoToResult()
    local tableresultdata = { }
    tableresultdata.curAccountData = self.modelData.curTableData.roomInfo.curAccountData
    tableresultdata.roomInfo = self.modelData.curTableData.roomInfo
    ModuleCache.ModuleManager.show_module(BranchPackageName, "tableresult", tableresultdata)
    ModuleCache.ModuleManager.hide_module(BranchPackageName, "currentgameaccount")
end

return CurrentGameAccountModule