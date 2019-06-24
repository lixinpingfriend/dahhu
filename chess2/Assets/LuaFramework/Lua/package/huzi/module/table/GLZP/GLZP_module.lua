local class = require("lib.middleclass")

local packageHead = "package.huzi.module."
local ModuleBase = require(packageHead .. "tablebase.tablebase_module")
local TableModule = class("huzi.TableModule", ModuleBase)
local TableUtilPaoHuZi  = require("package.huzi.module.tablebase.table_util")

TableModule.ChatConfig = {}
TableModule.ChatConfig.chatShotTextList = {
	[1] = "嫩子又断线了，网络嫩差！",
	[2] = "莫先走，决战到天亮！",
	[3] = "跟你合作真滴太愉快了！",
	[4] = "你牌打得算好了！",
	[5] = "没好意思各位，我有点事先闪了！",
	[6] = "速度点，速度点！",
	[7] = "帅哥，快点出牌！",
	[8] = "美女，快点出牌！",
	[9] = "你的牌算摸了！",
	[10] = "打牌打快点！",
	[11] = "好想吃大2哟~~",
	[12] = "你莫想了，你打什么我都胡！",
	[13] = "玩大胡，胡大胡！"
}

function TableModule:initialize(...)
    local viewPath = AppData.Game_Name .. "." .. AppData.Game_Name .. "_view"
    local modelPath = AppData.Game_Name .. "." .. AppData.Game_Name .. "_model"
    ModuleBase.initialize(self, viewPath, modelPath, ...)
end

--- 刷新局数
function TableModule:refresh_paiju(data)
	self.TableData.CurRound = data.CurRound
    TableUtilPaoHuZi.print("刷新手牌及状态")
    self:show_leave_btn(false)
    self:show_invite_btn(false)
    self.view:show_start_btn()
	self.view:refresh_round(data.CurRound)
	
	if self.PlayerNum == 4 and data.CurRound == 1 and self:has_actionWhat(17) then
		self.view:SirenYiWei()
	end
	for i = 1, self.PlayerNum do
        if self.playersView[i].seat.rootPosion then
            self.playersView[i].seat.root.transform.position = self.playersView[i].seat.rootPosion
        end
	end
	self.view.exNode.root:SetActive(false)
	ModuleBase.refresh_paiju(self, data)
end

function TableModule:ChangeRuleName(str)
	str = string.gsub(str, "10胡 ", "10胡起胡 ")
	str = string.gsub(str, "15胡 ", "15胡起胡 ")
	
	return self:GetPayStr() .. str
end

--提前开始初始化(部分模块需要重新初始化)
function TableModule:EarlyStartInit()
	--还原各节点位置
	for i=1, #self.playersView do
		self.playersView[i].seat.root.transform.position = self.playersView[i].seat.rootPosion
	end
	ModuleBase.EarlyStartInit(self)
end

return TableModule
