




local BranchPackageName = AppData.BranchRunfastName
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local HistoryListModule = class("HistoryListModule", ModuleBase)
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine

function HistoryListModule:initialize(...)
	ModuleBase.initialize(self, "historyList_view", "historyList_model", ...)
	self.historyListView:initLoopScrollViewList({})
end

function HistoryListModule:on_show(data)

    if data.isNeedHide then
        self.view:showGold(false)
        data = data.data
    end
    self.historyListView:initLoopScrollViewList(data);
end
function HistoryListModule:showGold(isbool)
    --self.view:showGold(isbool)
end

function HistoryListModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj == self.historyListView.buttonClose.gameObject then
        ModuleCache.ModuleManager.destroy_package(BranchPackageName)
    elseif obj == self.historyListView.buttonCheckRoundVideo.gameObject then
        ModuleCache.ModuleManager.show_module("public", "playvideo")
    elseif obj.transform.parent.parent.parent.gameObject == self.historyListView.loopScrollView.gameObject then
        -- 查看历史记录每局详情
        self:getRoomList(self.historyListView:get_data(obj))
    end
end


function HistoryListModule:on_begin_drag(obj, arg)	
	if(obj.transform.parent.name == "Content")then
		self.dragObj = obj
	end	
end

function HistoryListModule:on_end_drag(obj, arg)
	if(obj.transform.parent.name == "Content")then
		if(self.dragObj == obj)then
			if(self.historyListView.lastScrollValue and self.historyListView.lastScrollValue < 0)then

			end
		end
	end	
end

function HistoryListModule:getRoomList(roomInfo)
    print("==api=" .. ModuleCache.GameManager.netAdress.httpCurApiUrl .. "gamehistory/roundlist/v3?")
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "gamehistory/roundlist/v3?",
        showModuleNetprompt = true,
        params =
        {
            uid = self.modelData.roleData.userID,
            roomid = roomInfo.id
        },
    }

    self:http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            -- OK
            local sendData =
            {
                roomInfo = roomInfo,
                data = retData.data,
            }
            -- print("====================sendData")
            -- print_table(sendData)
            ModuleCache.ModuleManager.show_module(BranchPackageName, "roomdetail", sendData)
        else

        end
	end,function(error)
		print("==error="..error.error)
	end)
end

return HistoryListModule