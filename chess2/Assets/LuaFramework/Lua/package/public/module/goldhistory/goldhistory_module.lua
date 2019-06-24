
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local GoldHistoryModule = class("Public.GoldHistoryModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager

function GoldHistoryModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "goldhistory_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function GoldHistoryModule:on_module_inited()

end

-- 绑定module层的交互事件
function GoldHistoryModule:on_module_event_bind()

end

-- 绑定Model层事件，模块内交互
function GoldHistoryModule:on_model_event_bind()


end

function GoldHistoryModule:on_show(data)
    self.curPage = 2
    if data then
        self.curPage = 1
        self.roomData = data
    else
        self.view:showCenter(true)
    end
    self:showUI()
end

function GoldHistoryModule:showUI()
    self.playMode = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId)
    if self.curPage == 1 then
        self:showRoom()
    else
        if self.view.rankData then
            self:showRank()
        else
            self:get_rank_data()
        end
    end
end

function GoldHistoryModule:showRoom()
    self.view:showUI(self.curPage)
    local postData = {}
    postData.data = self.roomData
    postData.isNeedHide = true
    self.roomModule = ModuleCache.ModuleManager.show_module(self.playMode.package, "historylist", postData)
end

function GoldHistoryModule:showRank()
    --print("show rank")
    if self.roomModule then
        self.roomModule:showGold(true)
        ModuleCache.ModuleManager.destroy_module(self.playMode.package, "historylist")
    end
    self.view:showUI(self.curPage)
end

function GoldHistoryModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == self.view.btnClose.name then
        ModuleCache.ModuleManager.destroy_module("public", "goldhistory")
        --if self.roomModule then
        --	self.roomModule:showGold(true)
        --end
        ModuleCache.ModuleManager.destroy_module(self.playMode.package, "historylist")
        --self.view:showCenter(false)
    elseif obj.name == self.view.btnRoom.name then
        if self.curPage ~= 1 then
            self.curPage = 1
            self:showUI()
        end
    elseif obj.name == self.view.btnRank.name then
        if self.curPage ~= 2 then
            self.curPage = 2
            self:showUI()
        end
    elseif obj.name == "LookMatch" then
        ModuleCache.ModuleManager.show_module("public", "playvideo")
    end
end

function GoldHistoryModule:get_rank_data()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "gamehistory/queryGoldRoundList?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            pageNum = 1,
            pageSize = 50,
        }
    }

    Util.http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            self.view.rankData = retData.data.list
            self:showRank()
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
        end

    end, function(wwwErrorData)
        print(wwwErrorData.error)
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
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

function GoldHistoryModule:sortData(dataList)

end




return GoldHistoryModule



