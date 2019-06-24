
local ModuleCache = ModuleCache

local class = require("lib.middleclass")
local ModuleBase = require('core.mvvm.module_base')
local TableShareModule = class('TableShareModule', ModuleBase)
local Manager           = require("package.public.module.function_manager")



function TableShareModule:initialize(...)
	ModuleBase.initialize(self, 'table_share_view', nil, ...)

end

function TableShareModule:on_show(intentData)
	self.intentData = intentData
	if intentData.shareType == "ShareImage" then
		self:hide()
		self:share_image(intentData.ShareTypeOfChannel)
	elseif intentData.shareType == "ShareText" then
		self:hide()
		self:share_image(intentData.ShareTypeOfChannel)
	elseif intentData.shareType == "ShareRoomResult" then
		self.intentData.shareRoomResult = true
	else
		-- shareRoom
		if ModuleCache.ShareManager().can_share_to_xianliao() then
			self:set_tips()
		else
			self:event_invite_wechat()
			self:hide()
			return
		end
	end
	if self.intentData.openLiaoBei then
		self.view:set_liaobei_button_state(true)
	end
end

function TableShareModule:set_tips()
	local tips = Manager.FindObject(self.view.root, "Tips")	
	if self.intentData and self.intentData.shareData and self.intentData.shareData.just_open_wechat then
		ModuleCache.ComponentUtil.SafeSetActive(tips, true)
	else
		ModuleCache.ComponentUtil.SafeSetActive(tips, false)
	end
end


function TableShareModule:on_click(obj, arg)
	local objName = obj.name
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")

	if (objName == "ButtonClose") then
		self:hide()
	elseif objName == "ButtonInviteWeChat" then
		if self.intentData.shareRoomResult then
			self:share_room_result()
		else
			self:event_invite_wechat()
		end
	elseif objName == "ButtonInviteAlipay" then
		if self.intentData.shareRoomResult then
			self:share_room_result()
		else
			self:share_image("Alipay")
		end
	elseif objName == "ButtonInviteXianLiao" then
		self.intentData.shareData.ShareTypeOfChannel = "XianLiao"
		if self.intentData.shareRoomResult then
			self:share_room_result()
		else
			ModuleCache.ShareManager().shareRoomNum(self.intentData.shareData, false)
		end
	elseif objName == "ButtonInviteLiaoBei" then
		if not ModuleCache.ShareManager().can_share_to_liaobei(true) then
			return
		end
		self.intentData.shareData.ShareTypeOfChannel = "LiaoBei"
		if self.intentData.shareRoomResult then
			self:share_room_result()
		else
			ModuleCache.ShareManager().shareRoomNum(self.intentData.shareData, false)
		end
	end
end

function TableShareModule:share_room_info()

end

function TableShareModule:share_room_result()
	local shareTypeOfChannel = self.intentData.shareData.ShareTypeOfChannel
	if self.intentData.shareData.shareImage then
		ModuleCache.ShareManager().share_app_result_image(false, false, false, shareTypeOfChannel)
	else
		if shareTypeOfChannel == "XianLiao" then
			ModuleCache.ShareManager().shareImage(false, false, false, shareTypeOfChannel)
		elseif shareTypeOfChannel == "LiaoBei" then
			ModuleCache.ShareManager().shareImage(false, false, false, shareTypeOfChannel)
		else
			--微信
			ModuleCache.WechatManager.share_text(0, "", self.intentData.shareData.text)
		end
	end
end

function TableShareModule:event_invite_wechat( )
	self.intentData.shareData.ShareTypeOfChannel = "WeChat"
	if self.intentData.shareData.just_open_wechat then
		ModuleCache.SDKInterface().open_wexin_app()
	else
		ModuleCache.ShareManager().shareRoomNum(self.intentData.shareData, false)
	end
end


function TableShareModule:share_image(shareTypeOfChannel)
	self:hide()
	if not shareTypeOfChannel then
		ModuleCache.ShareManager().shareImage(false)
	else
		ModuleCache.ShareManager().shareImage(false, nil, nil, shareTypeOfChannel)
	end

end

return TableShareModule