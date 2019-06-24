local class = require("lib.middleclass")
local BaseCardCtrl = require('package.huzi.module.tablebase.cardctrl_view')
local QZZPCardCtrl = class("QZZPCardCtrl", BaseCardCtrl)


local Manager = require("package.public.module.function_manager")

QZZPCardCtrl.KetingType = {}
QZZPCardCtrl.KetingType.WangDiao = 1
QZZPCardCtrl.KetingType.WangChuang = 2
QZZPCardCtrl.KetingType.WangZha = 3

function QZZPCardCtrl:InitOtherButton()
    self.ctrl.WangChuang = Manager.GetButton(self.view, "Ctrl/WangChuang")
    self.ctrl.WangDiao = Manager.GetButton(self.view, "Ctrl/WangDiao")
    self.ctrl.WangZha = Manager.GetButton(self.view, "Ctrl/WangZha")

    self.ctrl.WangDiao.onClick:AddListener(handler(self,self.on_click_WangDiao))
    self.ctrl.WangChuang.onClick:AddListener(handler(self,self.on_click_WangChuang))
    self.ctrl.WangZha.onClick:AddListener(handler(self,self.on_click_WangZha))
	
	self.ctrl.btnsKeting = {}
	self.ctrl.btnsKeting[self.KetingType.WangDiao] = self.ctrl.WangDiao
	self.ctrl.btnsKeting[self.KetingType.WangChuang] = self.ctrl.WangChuang
	self.ctrl.btnsKeting[self.KetingType.WangZha] = self.ctrl.WangZha
end


function QZZPCardCtrl:show_btns_not_playBack(data)

    --处理吃碰胡过
    BaseCardCtrl.show_btns_not_playBack(self,data)      

	--王钓 王闯 王炸 按钮先隐藏
	local nCount = #self.ctrl.btnsKeting
	for i=1, nCount do
		self.ctrl.btnsKeting[i].gameObject:SetActive(false)
	end
	
	if data.ke_ting2 ~= nil then
		nCount = #data.ke_ting2
		for i=1, nCount do
			self.ctrl.btnsKeting[data.ke_ting2[i]].gameObject:SetActive(true)
		end
		if nCount > 0 then
			self:set_active(true)
			self.ctrl.obj:SetActive(true)
		end
	end
end

function QZZPCardCtrl:show_btns_playBack(data)

    --处理吃碰胡过
    BaseCardCtrl.show_btns_playBack(self,data)      

	local state = nil
	for i=1,#data.player do
		local localSeatID = self.module:get_local_seat(i-1)
		if localSeatID == 1 then
			state = data.player[i].state
		end
	end
	if state == nil then
		return
	end
	local nCount = #state
	for i=1, nCount do
		if state[i].id == 5 then		--可报
			for j=1, #state[i].ext do
				if self.ctrl.btnsKeting[state[i].ext[j]] ~= nil then
					self.ctrl.btnsKeting[state[i].ext[j]].gameObject:SetActive(true)
				end
			end
		end
	end
end

function QZZPCardCtrl:on_click_WangDiao()
	self.module.model:request_Ting(self.KetingType.WangDiao)
	self:set_active(false)
	self.ctrl.obj:SetActive(false)
end

function QZZPCardCtrl:on_click_WangChuang()
	self.module.model:request_Ting(self.KetingType.WangChuang)
	self:set_active(false)
	self.ctrl.obj:SetActive(false)
end

function QZZPCardCtrl:on_click_WangZha()
	self.module.model:request_Ting(self.KetingType.WangZha)
	self:set_active(false)
	self.ctrl.obj:SetActive(false)
end

return QZZPCardCtrl
