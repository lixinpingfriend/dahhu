





local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
---@class SetPlayModeModule : Module
local SetPlayModeModule = require("lib.middleclass")("BullFight.SetPlayModeModule", ModuleBase)
local Config = require("package.public.config.config")
TableUtil = require("package.public.table_util")
local PlayModeUtil = ModuleCache.PlayModeUtil
local CSmartTimer = ModuleCache.SmartTimer.instance
local Sequence = DG.Tweening.DOTween.Sequence

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local AppData = AppData
local EaseLinear = DG.Tweening.Ease.Linear

local GameManager = ModuleCache.GameManager
local PlayerPrefs = UnityEngine.PlayerPrefs

function SetPlayModeModule:initialize(...)
	ModuleBase.initialize(self, "setplaymode_view", nil, ...)
    local list = require("list")
    -- 需要按照权重来播放,从1、2、3、4开始，还有触发的时间等等都要重新排序
    self._systemAnnounceContents = list:new()
end

-- 模块初始化完成回调，包含了view，loginModel初始化完成
function SetPlayModeModule:on_module_inited()

end



function SetPlayModeModule:on_show(data)

    self.view:setShow(false)
    ModuleCache.ModuleManager.hide_module("public",'setprovince')
    self.userID = PlayerPrefs.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_USERID, "0")
    self.view.showId = ModuleCache.GameManager.curGameId
    --self.museumOpen = false
    if data then
        if type(data) == "table" then
            if data.museumOpen then
                self.museumOpen = data.museumOpen
                self.provinceId = data.openProvince
                self.view.provinceId = data.openProvince
                self.sssss = nil
            else
                self.provinceId = data.id
                self.view.provinceId = data.id
                self.sssss = "ssssss"
            end

        else
            self.provinceId = data
            self.view.provinceId = data
            self.sssss = nil
        end

    else
        print("请先选则省份！",error)
    end
    self.view.used = ModuleCache.GameManager.get_used_playMode()
    if self.view.used then
        print_table(self.view.used)
    end

    --self.callback = data
    self.province = PlayModeUtil.getProvinceById(self.provinceId)
    self.playModeData = PlayModeUtil.getSortConfig(require(self.province.modName))

    if(ModuleCache.GameManager.iosAppStoreIsCheck)then   -- 过省版本屏蔽大量玩法
        for i=1,#self.playModeData do
            if(i == 1) then
                local playMode = self.playModeData[i].playModeList
                for j=1,#playMode do
                    if(j > 2) then
                        playMode[j].isOpen = false
                    end
                end
            else
                self.playModeData[i] = nil;
            end
        end
        self.view:initLeftScrollViewList(self.playModeData)
        return
    end

    if data then
        if ModuleCache.GameManager.curProvince ~= self.provinceId then
            self.view.showId = 0 -- 如果是从选择省份进来的，和当前省份ID不一样的话不显示在那个省份选择的标签
        end
    end
    self:getGameRecommend()

    ModuleCache.ComponentUtil.SafeSetActive(self.view.normolPanel, false)
end

function SetPlayModeModule:showUI()
    if self.sssss then
        self.view:setShow(true)
        self.recommendData = self:sortData(self.recommendData)
        ModuleCache.ComponentUtil.SafeSetActive(self.view.normolTitle, #self.recommendData > 0)
        self.view:initLeftScrollViewList(self.playModeData)
        return
    end


    if #self.recommendData > 0 then
        self.view:initLeftScrollViewList(self.playModeData, #self.recommendData > 0)
    else
        self.recommendData = self:sortData(self.recommendData)
        self.view:initLeftScrollViewList(self.playModeData, #self.recommendData > 0)

    end

    ModuleCache.ComponentUtil.SafeSetActive(self.view.normolTitle, #self.recommendData > 0)

    self.view:setShow(true)
end


function SetPlayModeModule:sortData(data)
    local newData = {}
    local index = 1
    if self.view.used and  #self.view.used > 0 then
        --for i = 1, #self.view.used do
            local isbool = true
            for j = 1, #newData do
                if tostring(newData[j].province.id) == tostring(self.view.used[1].provinceId) and tostring(newData[j].playMode.gameId) == tostring(self.view.used[1].gameId) then
                    isbool = false
                    break
                end
            end

            if isbool then
                local provinceConf = ModuleCache.PlayModeUtil.getProvinceById(self.view.used[1].provinceId)
                local playModeConf  = PlayModeUtil.getDeepCopyTable(require(provinceConf.modName))
                local list = {}
                list.province = provinceConf
                list.playMode = PlayModeUtil.getInfoByGameId(self.view.used[1].gameId,playModeConf)
                list.type = 10086
                newData[index] = list
                index = index + 1
            end
        --end
    end

    for i = 1,#data do
        local isbool = true
        if self.view.used then
            for j = 1, #self.view.used do
                if tostring(data[i].province.id) == tostring(self.view.used[j].provinceId) and tostring(data[i].playMode.gameId) == tostring(self.view.used[j].gameId) then
                    isbool = false
                    break
                end
            end
        end
        if isbool then
            newData[index] = data[i]
            index = index + 1
        end
    end
    return newData
end

function SetPlayModeModule:createRecommendData(retData)
    local data = {}
    local index = 1
    --print("----------------- start ---------------------")
    --print_table(retData)
    for i = 1, #retData do
        local provinceConf = ModuleCache.PlayModeUtil.getProvinceByAppName(retData[i].province)
        local playModeConf  = PlayModeUtil.getDeepCopyTable(require(provinceConf.modName))
        local gameName = string.split(retData[i].gameId, "_")[2]
        local list = {}
        list.province = provinceConf
        list.playMode = PlayModeUtil.getInfoByGameName(gameName,playModeConf)
        list.type = retData[i].type
        if(gameName == list.playMode.gameName)then
            data[index] = list
            index = index + 1;
        end
    end

    return data
end


function SetPlayModeModule:getGameRecommend()
    print("--- get recommend-----")
    local province = PlayModeUtil.getProvinceById(self.provinceId)

    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "public/getGameRecommend?",
        params = {
            uid = self.userID,
            province = province.appName
        },
    }

    local processData = function(text)
        if text ~= "" then
            local retData = ModuleCache.Json.decode(text)
            print_table(retData)
            if retData.ret == 0 then
                self.recommendData = self:createRecommendData(retData.data)
                if #self.recommendData > 0 then
                    self.recommendData = self:sortData(self.recommendData)
                end
                self:showUI()
            end
        end
    end

    self:http_get(requestData, function(wwwData)
        processData(wwwData.www.text)
    end,function(wwwErrorData)
        print(wwwErrorData.error)
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                local retData = wwwErrorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                    self.recommendData = {}
                    self:showUI()
                end
            end
        end
    end)
end


function SetPlayModeModule:on_click( obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	local _cmd = obj.name
	print(_cmd)
    if(_cmd == "ImageClose")then
        ModuleCache.ModuleManager.hide_module("public",'setplaymode')
        ModuleCache.ModuleManager.hide_module("public",'setprovince')
    elseif _cmd == self.view.btnSug.name then
        ModuleCache.ModuleManager.hide_module("public",'setplaymode');
    elseif _cmd == self.view.btnMore.name then
        --print("22222")
        if self.view.showIndex ~= 2 then
            self.view:initLeftScrollViewList(self.playModeData, #self.recommendData > 0)
        end
    elseif _cmd == "btnCurrent" then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("选择的是当前玩法，无需切换！")
    elseif(_cmd == 'provinceBtn') then
        --ModuleCache.ModuleManager.hide_module("public",'setplaymode')
        ModuleCache.ModuleManager.show_module("public",'setprovince')
    elseif _cmd == "BtnCopyEx" then
        if self.wct and self.wct.content then
            ModuleCache.GameSDKInterface:CopyToClipboard(self.wct.content)
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("已复制到剪切板！")
        end
    elseif(string.find( _cmd,"toggle") ~= nil)then
        self.view:initRightScrollViewList(tonumber(string.sub(_cmd,7,string.len(_cmd))))
    elseif(string.find(_cmd,"btnPlayMode")) then
        local data = self.view:getPlayMode(tonumber(string.sub(_cmd,12,string.len(_cmd))))

        local playMode = data
        if data.province then
            --print("data.province")
            self.provinceId = data.province.id
            playMode = data.playMode

        end

        playMode.provinceId = self.provinceId

        self.view:unSelectPlayMode(obj)

        if not self.museumOpen then
            self:setPlayMode(playMode,obj)
        else
            ModuleCache.GameManager.select_province_id_not_record(self.provinceId)
            ModuleCache.GameManager.select_game_id_not_record(playMode.gameId)
            --ModuleCache.GameManager.curLocation = playMode.location
            self:dispatch_package_event("Event_Package_selectWanfaDone",playMode)
            ModuleCache.ModuleManager.hide_module("public",'setplaymode')
        end
        print_table(playMode,"当前选择的playMode")
    end
end

function SetPlayModeModule:setPlayMode(playMode, obj)

    if(self.provinceId == ModuleCache.GameManager.curProvince and playMode.gameId == ModuleCache.GameManager.curGameId)then
        ModuleCache.GameManager.select_game_id(playMode.gameId)
        ModuleCache.JpushManager().setTag()
    else
        local lastAppName, needRenameAppName = AppData.get_app_name()
        if not needRenameAppName then
            lastAppName = ""
        end

        ModuleCache.GameManager.select_province_id(self.provinceId)
        ModuleCache.GameManager.select_game_id(playMode.gameId)
        ModuleCache.GameManager.curLocation = playMode.location
        ModuleCache.JpushManager().setTag()

        local curAppName, needRenameAppName = AppData.get_app_name()
        if not needRenameAppName then
            curAppName = ""
        end

        if curAppName ~= lastAppName then
            ModuleCache.GameManager.logout(true)
            return
        end
    end

    ModuleCache.PackageManager.update_package_version(playMode.package, function()
        -- 更新完所有资源再去检测是否有apk、ipa需要更新
        ModuleCache.ModuleManager.hide_module("public",'setplaymode')
        ModuleCache.ModuleManager.hide_module("public", "operate");

        self:dispatch_package_event("Event_Set_Play_Mode", playMode)
        if not ModuleCache.ModuleManager.module_is_active("public", "hall") then
            ModuleCache.ModuleManager.show_module("public", "hall")
        end
        ModuleCache.GameManager.set_used_playMode(ModuleCache.GameManager.curProvince, ModuleCache.GameManager.curGameId)
    end)
end

function SetPlayModeModule:doCallback(isNeedCallBack,isSameId)
    if(self.callback ~= nil and type(self.callback == "function")) then
        self.callback(isNeedCallBack,isSameId)
    end
end



function SetPlayModeModule:on_hide()
    self.museumOpen = false
end

function SetPlayModeModule:on_destroy()
    self.museumOpen = false
end



return SetPlayModeModule