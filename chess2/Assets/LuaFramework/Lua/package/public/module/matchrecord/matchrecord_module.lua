
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local MatchRecordModule = class("Public.matchRecordModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager

function MatchRecordModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "matchrecord_view", "matchrecord_model", ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function MatchRecordModule:on_module_inited()

end

-- 绑定module层的交互事件
function MatchRecordModule:on_module_event_bind()
end

-- 绑定loginModel层事件，模块内交互
function MatchRecordModule:on_model_event_bind()


end

function MatchRecordModule:on_show(data)
    self.view:hide()
    self.view:show(true)
    self:get_record_list()
end

function MatchRecordModule:on_click(obj, arg)
    print("点击", obj.name, obj.transform.parent.name)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "BtnClose" then
        ModuleCache.ModuleManager.hide_module("public", "matchrecord")
        return

    end
end


function MatchRecordModule:get_record_list()
    local addStr = "match/getMatchResults?"
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        --showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            gameId = AppData.get_app_and_game_name(),
            pageNum = 1,
            pageSize = 50
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            self.view:record_list(retData.data)

        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end )
end


return MatchRecordModule



