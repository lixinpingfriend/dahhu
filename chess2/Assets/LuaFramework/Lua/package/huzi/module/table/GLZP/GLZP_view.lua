local class = require("lib.middleclass")
local ViewBase = require('package.huzi.module.tablebase.tablebase_view')
local TableView = class("huzi.TableView", ViewBase)
local coroutine = require("coroutine")
local Manager = require("package.public.module.function_manager")
local TableUtilPaoHuZi = require("package.huzi.module.tablebase.table_util")

TableView.bgName = {}
TableView.bgName[1] = "1"
TableView.bgName[2] = "3"
TableView.bgName[3] = "2"

TableView.nZiPaiPaiLei = 3
TableView.nDefaultSortType = 2		--桂林字牌 默认对子排序

function TableView:InitEx()
	local bundle = ModuleCache.AssetBundleManager:LoadAssetBundle("huzi/module/table/subgameex/huziex_glzp.prefab");
	local asset = bundle:GetAsset("HuZiEx_GLZP", false)
	self.exNode = {}
	self.exNode.root = ModuleCache.ComponentUtil.InstantiateLocal(asset, self.root.gameObject)
	self.exNode.root.name = "HuZiEx_GLZP"
	self.exNode.root:SetActive(false)
	self.exNode.bg1 = Manager.FindObject(self.exNode.root, "bg") 
	self.exNode.bg2 = Manager.FindObject(self.exNode.root, "bg (1)") 

	self.exNode.player = {}
	for i=1, 4 do
		self.exNode.player[i] = {}
		local node = Manager.FindObject(self.root, "HuZiEx_GLZP/" .. i)
		local nodePai = Manager.FindObject(self.root, "HuZiEx_GLZP/" .. i .. "/paiPos")
		self.exNode.player[i].position = node.transform.position
		self.exNode.player[i].paiPos = nodePai.transform.position
	end

	self.CenterPos = Manager.FindObject(self.root, "HuZiEx_GLZP/centerPos").transform.position
end



function TableView:SirenYiWei()
    local data = self.module.Msg_Table_GameStateNTF

	--隐藏准备
    for i = 1, self.PlayerNum do
        self.playersView[i].seat.ready.gameObject:SetActive(false)
	end
	
	--隐藏背景
	self.exNode.bg1:SetActive(false)
	self.exNode.bg2:SetActive(false)

    -- 四个人翻一张牌...  从牌堆移动到出张的位置。  然后翻为最终的牌...
    for i = 1, #data.player do
        local p1 = (i-1 + 4 - TableManager.phzTableData.SeatID) % 4 + 1
        self.playersView[p1]:show_chuzhangZuoZing(data.player[i].fan_pai)
    end
   
    coroutine.wait(4)
	self.exNode.root:SetActive(false)
    for localSetID = 1, 4 do
        local id = self.playersView[localSetID].playerInfo.playerId .. ''
        for j = 1, #data.player do
            if id == tostring(data.player[j].UserID) then
                local p = self.module:get_local_seat(j - 1)
				local pos = self.playersView[p].seat.rootPosion
       
                if pos then
                    self.playersView[localSetID].seat.root.gameObject.transform:DOMove(pos, 1)
                end
            end
        end
        
    end
    
    coroutine.wait(1)

    for i = 1, self.PlayerNum do
        self.playersView[i].seat.objHuxi.gameObject.transform.localScale = Vector3.New(1, 1, 1)
        self.playersView[i].seat.huxi.gameObject.transform.localScale = Vector3.New(1, 1, 1)
        self.playersView[i].seat.objClock.gameObject.transform.localScale = Vector3.New(1, 1, 1)
        self.playersView[i].seat.banker.gameObject.transform.localScale = Vector3.New(0.667, 0.667, 1)
        self.playersView[i].seat.ready.gameObject.transform.localScale = Vector3.New(1, 1, 1)

        if self.playersView[i].seat.rootPosion then
            self.playersView[i].seat.root.transform.position = self.playersView[i].seat.rootPosion
        end
    end
	self:refresh_user_state(self.model.Msg_Table_UserStateNTF)
end

function TableView:refresh_user_state(data)
	--不在游戏中 则把头像等放到中间
	if TableManager.phzTableData.isPlayBack then
		return
	end
	if self.playerNum == 4 and not self.module:is_in_game() then
		local gameState = self.model.Msg_Table_GameStateNTFNew
		if gameState == nil then
			for i = 1, 4 do
				self.playersView[i].seat.root.transform.position = self.exNode.player[i].position
				local pos = self.playersView[i].seat.root.transform.localPosition
				pos.y = pos.y - 68.42
				self.playersView[i].seat.root.transform.localPosition = pos
			end
			self.exNode.root:SetActive(true)
		end
	end

	ViewBase.refresh_user_state(self,data)
end


function TableView:show_start_btn()
	local rectTran = self.centerBtnHolder:GetComponent("RectTransform")
	if self.PlayerNum < 4 then
		rectTran.anchoredPosition = Vector2(0, -50)
	else
		rectTran.anchoredPosition = Vector2(0, -252)
	end
	
	ViewBase.show_start_btn(self)
end

function TableView:set_wanfa()
	ViewBase.set_wanfa(self)
	self.txtWanFa.text = "桂林字牌"

	local ruleName = self.ruleName
	ruleName = string.gsub(ruleName, "允许少人时提前开局 ", "")
	ruleName = string.gsub(ruleName, "相同IP检测 ", "")
	ruleName = string.gsub(ruleName, "GPS检测 ", "")
	ruleName = string.gsub(ruleName, "开启实时语音 ", "")
	
	self.txtWanFaShow.text = ruleName
end

return TableView