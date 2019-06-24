
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local CurGameFreeModule = class("curGameFreeModule", ModuleBase)
local DialogManager = require("manager.auto_dialog_manager");
local PlayerPrefsManager = ModuleCache.PlayerPrefsManager

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager

function CurGameFreeModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "curgamefree_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function CurGameFreeModule:on_module_inited()

end

-- 绑定module层的交互事件
function CurGameFreeModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function CurGameFreeModule:on_model_event_bind()


end

function CurGameFreeModule:on_show()
    self.view:hide()

    self:get_freeByGameId()
end

function CurGameFreeModule:on_click(obj, arg)

    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "ButtonBack" then
        -- 打开优先级高的弹框
        DialogManager.openPriorityDialog();

        ModuleCache.ModuleManager.destroy_module("public", "curgamefree")
        return
    end
end


-- 获取当前游戏是否限免
function CurGameFreeModule:get_freeByGameId()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "public/getFreeByGameId?",
        params = {
            uid = self.modelData.roleData.userID,
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        if retData.ret == 0 then
            local gameName = AppData.get_url_game_name()

            local lastTime = PlayerPrefsManager.GetString("CURFreeGame_"..gameName ,"" )
            local curTime = os.date("%Y-%m-%d", os.time())

            if retData.data.free and lastTime ~= curTime then  --TODO XLQ 判断是否 同一天
                self.view:show()
                PlayerPrefsManager.SetString("CURFreeGame_"..gameName ,os.date("%Y-%m-%d", os.time() ) )

                if retData.data.imgUrl and retData.data.imgUrl ~= "" then
                    self:image_load_sprite(self.view.bgSprite, retData.data.imgUrl)
                end
            else
                -- 打开优先级高的弹框
                DialogManager.openPriorityDialog();
            end
            self.modelData.curGameFree = retData.data.free
            self.modelData.curFree_gameName = gameName
        else
            -- 打开优先级高的弹框
            DialogManager.openPriorityDialog();
        end
    end, function(errorData)
        -- 打开优先级高的弹框
        DialogManager.openPriorityDialog();
        print(errorData.error)
    end)
end


return CurGameFreeModule



