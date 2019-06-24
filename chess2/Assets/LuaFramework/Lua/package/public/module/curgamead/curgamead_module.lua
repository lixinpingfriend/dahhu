
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
---@class CurGameAd : Module
local CurGameAdModule = class("CurGameAdModule", ModuleBase)
local DialogManager = require("manager.auto_dialog_manager")
local PlayerPrefsManager = ModuleCache.PlayerPrefsManager

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
---@type JumpManager
local JumpManager = require('package.public.jump_manager')

function CurGameAdModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "CurGameAd_view", nil, ...)
    self.click_ad_data_table = {}
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function CurGameAdModule:on_module_inited()
end

-- 绑定module层的交互事件
function CurGameAdModule:on_module_event_bind()
end

-- 绑定loginModel层事件，模块内交互
function CurGameAdModule:on_model_event_bind()
end

function CurGameAdModule:on_show()
    self.view:hide()
    self.click_ad_data_table = {}
    self:get_freeByGameId()
end

function CurGameAdModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "ButtonBack" then
        self:on_click_back()
    else
        self:on_click_ad(obj, arg)
    end
end

function CurGameAdModule:on_click_back()
    self.ShowIndex = self.ShowIndex or 0
    self.ShowIndex = self.ShowIndex + 1
    self.retData_dataLen = self.retData_dataLen or 0

    for i = 1, 3 do
        self.view.bgSpriteTable[i].gameObject:SetActive(false)
    end

    if self.ShowIndex >= self.retData_dataLen then
        DialogManager.openPriorityDialog()

        ModuleCache.ModuleManager.destroy_module("public", "curgamead")
    else
        self.view.bgSpriteTable[self.ShowIndex + 1].gameObject:SetActive(true)
    end
end

function CurGameAdModule:on_click_ad(obj, arg)
    local data = self.click_ad_data_table[obj]
    if(data)then
        local url = data.url
        if(url and url ~= '')then
            data._from = 'Ad'
            JumpManager:ad_jump(url, data, function()
                self:on_click_back()
            end)
        end
    end
end


-- 是否弹出广告
function CurGameAdModule:get_freeByGameId()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "public/appAd?",
        params = {
            uid = self.modelData.roleData.userID
        }
    }
    self:http_get(
        requestData,
        function(wwwData)
            local retData = ModuleCache.Json.decode(wwwData.www.text)
            if retData.ret == 0 then
                local gameName = AppData.get_url_game_name()
                --local lastTime = PlayerPrefsManager.GetString("CURFreeGame_" .. self.modelData.roleData.userID, "")
                --local curTime = os.date("%Y-%m-%d", os.time())
                --self.retData_dataLen = #retData.data
                --
                --if self.retData_dataLen > 3 then
                --    self.retData_dataLen = 3
                --end
                self.modelData.CurGameAd = retData.data.free
                self.modelData.curFree_gameName = gameName
                print_table(retData.data)

                if #retData.data > 0  then --TODO XLQ 判断是否 同一天 and lastTime ~= curTime
                    self:showInfo(retData)
                else
                    -- 打开优先级高的弹框
                    DialogManager.openPriorityDialog()
                end

            else
                -- 打开优先级高的弹框
                DialogManager.openPriorityDialog()
            end
        end,
        function(errorData)
            -- 打开优先级高的弹框
            DialogManager.openPriorityDialog()
            print(errorData.error)
        end
    )
end

function CurGameAdModule:showInfo(retData)
    self:start_lua_coroutine(
        function()
            local downCount = 0
            local bool = true
            self.retData_dataLen = 0
            for i, v in ipairs(retData.data) do
                local vs = v
                local isShow = false
                if vs.isShow == 0 then
                    isShow = PlayerPrefsManager.GetInt("GameAD_Once"  ..  self.modelData.curFree_gameName,0) == 0
                    if isShow then
                        PlayerPrefsManager.SetInt("GameAD_Once"  ..  self.modelData.curFree_gameName,1)
                    end
                elseif vs.isShow == 1 then
                    local lastTime = PlayerPrefsManager.GetString("GameAD_" .. self.modelData.curFree_gameName, "")
                    local curTime = os.date("%Y-%m-%d", os.time())
                    if  lastTime ~= curTime then
                        isShow = true
                        PlayerPrefsManager.SetString("GameAD_"  ..  self.modelData.curFree_gameName, os.date("%Y-%m-%d", os.time()))
                    end
                elseif vs.isShow == 2 then
                    isShow = true
                end
                if isShow then
                    self.retData_dataLen = self.retData_dataLen + 1
                    local image = self.view.bgSpriteTable[self.retData_dataLen]
                    if image then
                        self:image_load_sprite(image, vs.content, function()
                                image:SetNativeSize()
                                local sizeDelta = ModuleCache.ComponentManager.GetComponent(image.gameObject, ModuleCache.ComponentTypeName.RectTransform).sizeDelta
                                local closeButtonRectTransform = ModuleCache.ComponentManager.GetComponentWithPath(image.gameObject, "ButtonBack", ModuleCache.ComponentTypeName.RectTransform)
                                closeButtonRectTransform.anchoredPosition = Vector2(math.min(sizeDelta.x / 2, 800), math.min(sizeDelta.y / 2, 450))
                                downCount = downCount + 1
                            end,
                            function()
                                bool = false
                            end
                        )
                    end
                    self.click_ad_data_table[image.gameObject] = vs
                end
            end


            
          
            for i = 1, 60 do
                coroutine.wait(0.1)
                if downCount == self.retData_dataLen then
                    break
                end
                if not bool or i == 100 then
                    DialogManager.openPriorityDialog()
                    ModuleCache.ModuleManager.destroy_module("public", "curgamead")
                    return
                end
            end

            --for i = 1, 3 do
            --    self.view.bgSpriteTable[i]:SetNativeSize()
            --    local sizeDelta = ModuleCache.ComponentManager.GetComponent(self.view.bgSpriteTable[i].gameObject, ComponentTypeName.RectTransform).sizeDelta
            --    local closeButton = ModuleCache.ComponentManager.GetComponentWithPath(self.view.bgSpriteTable[i].gameObject, "ButtonBack", ComponentTypeName.RectTransform)
            --    print(closeButton.localPosition.x, closeButton.localPosition.y)
            --end


            --PlayerPrefsManager.SetString("CURFreeGame_"  .. self.modelData.roleData.userID, os.date("%Y-%m-%d", os.time()))
            if self.retData_dataLen > 0 then
                self.view:show()
            end

        end
    )
end


return CurGameAdModule
