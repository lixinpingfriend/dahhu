local BranchPackageName = AppData.BranchRunfastName
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local RecordPokerShopModule = class("RecordPokerShopModule", ModuleBase)

local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine

function RecordPokerShopModule:initialize(...)
    ModuleBase.initialize(self, "recordpokershop_view", nil, ...)
end

function RecordPokerShopModule:on_show(dataList)
    self.queryGamePacketItemList = dataList
    self.RecordPokerShopView:init_view(dataList)
end

function RecordPokerShopModule:on_module_event_bind( ... )
end

function RecordPokerShopModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj == self.RecordPokerShopView.BtnClose.gameObject then
        self:HideUI()
    else
        local itemId = obj.transform.parent.parent.name
        print("==itemId=",itemId)
        self:GoToBuyRecordPoker(itemId)
    end
end

function RecordPokerShopModule:HideUI( ... )
    ModuleCache.ModuleManager.destroy_module(BranchPackageName,"recordpokershop")
end

function RecordPokerShopModule:GoToBuyRecordPoker(itemId)
    local requestData = 
    {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "packetItem/buyItem?",
		showModuleNetprompt = true,
        params = 
        {
            uid = self.modelData.roleData.userID,
            itemId = itemId,
		}
	}

	self:http_get(requestData, function(wwwData)
		local retData = ModuleCache.Json.decode(wwwData.www.text)
		print_table(retData)
		if retData.ret == 0 then
            print("====购买成功")
            --弹框,刷新刷新玩家货币,
            ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button("购买成功!")
            self:dispatch_package_event("Event_Package_Refresh_Userinfo")
            self:HideUI()
        else
            print("====GoToBuyRecordPoker2")
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
		end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
		if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                print("====GoToBuyRecordPoker3")
				local retData = wwwErrorData.www.text
				retData = ModuleCache.Json.decode(retData)
				if retData.errMsg then
					retData = ModuleCache.Json.decode(retData.errMsg)
					ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
				end
			end
		end
	end)
end


return RecordPokerShopModule