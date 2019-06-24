
TableUtilPaoHuZi = {}

local TableUtilPaoHuZi = TableUtilPaoHuZi
local ModuleCache = ModuleCache
local TableManager = require("package.public.table_manager")
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local CSmartTimer = ModuleCache.SmartTimer.instance
local GameObject = UnityEngine.GameObject
local ComponentUtil = ModuleCache.ComponentUtil
local bit = require("bit")
local Manager = require("package.public.module.function_manager")
local UnityEngine = UnityEngine
local isEditor = UnityEngine.Application.isEditor
local AppData = AppData




--- 设置帧率
--- @param draggingCard boolean 正在拖动手牌
--- @param playingAnim boolean 正在播放动画
function TableUtilPaoHuZi.set_frame_rate(draggingCard, playingAnim)
    TableUtilPaoHuZi.draggingCard = draggingCard
    TableUtilPaoHuZi.playingAnim = playingAnim
    
    local frame = AppData.tableTargetFrameRate
    
    if draggingCard or playingAnim then
        frame = 60
    end
    
    UnityEngine.Application.targetFrameRate = frame
end

function TableUtilPaoHuZi.get_local_seatByUserID(userid)
    return TableManager.phzTableData.seatUserIdGo[userid]
end

function TableUtilPaoHuZi.getNewPosSeatIndex(seatIndex)
    if TableUtilPaoHuZi.ZuoXingIndexTemp ~= DataPaoHuZi.ZuoXingIndex then
        TableUtilPaoHuZi.tables = {0, 1, 2, 3}
    end

    TableUtilPaoHuZi.ZuoXingIndexTemp = DataPaoHuZi.ZuoXingIndex

    if DataPaoHuZi.ZuoXingIndex ~= nil then
        if #TableUtilPaoHuZi.tables == 4 then
            table.remove(TableUtilPaoHuZi.tables, DataPaoHuZi.ZuoXingIndex + 1)
        end

        for i = 1, #TableUtilPaoHuZi.tables do
            if TableUtilPaoHuZi.tables[i] == seatIndex then
                return i - 1
            end
        end
    else
        return seatIndex
    end
end

-- 获取所有子物体
function TableUtilPaoHuZi.get_all_child(parent, filterName)
    local childs = {}
    local index = 1
    for i = 1, parent.transform.childCount do
        local obj = parent.transform:GetChild(i - 1).gameObject
        if (not filterName or (filterName and obj.name == filterName)) then
            childs[index] = obj
            index = index + 1
        end
    end
    return childs
end

-- 移到克隆池 中
function TableUtilPaoHuZi.move_clone(obj, cloneParent)
    obj.transform:SetParent(cloneParent.transform)
    ComponentUtil.SafeSetActive(obj, false)
end

-- 添加到对象池
function TableUtilPaoHuZi.add_poor(obj, poorObjs, cloneParent)
    TableUtilPaoHuZi.move_clone(obj, cloneParent)
    if not poorObjs then
        poorObjs = {}
    end
    if not poorObjs[obj.name] then
        poorObjs[obj.name] = {}
    end
    table.insert(poorObjs[obj.name], obj)
    return poorObjs
end




-- 克隆
function TableUtilPaoHuZi.clone(obj, parent, pos)
    local target = ComponentUtil.InstantiateLocal(obj, parent, pos)
    target.name = obj.name
    ComponentUtil.SafeSetActive(target, true)
    return target
end


---设置牌
---@param cardObj UnityEngine.GameObject
---@param value number
---@param color UnityEngine.Color
---@param name String
function TableUtilPaoHuZi.set_card(cardObj, value, color, name,status)
    if cardObj then
        local img = Manager.GetImage(cardObj, "Image")
        local spriteHolder = nil
        name = TableUtilPaoHuZi.get_real_spriteHolder(name)
        if name == nil then
            spriteHolder = Manager.GetComponentWithPath(cardObj, "Image", "SpriteHolder")
        else
            TableUtilPaoHuZi.spriteHolderDC = TableUtilPaoHuZi.spriteHolderDC or {}
            if TableUtilPaoHuZi.spriteHolderDC[name] == nil then
                print(name,value)
                TableUtilPaoHuZi.spriteHolderDC[name] = TableUtilPaoHuZi.CloneGameObject.transform:Find(name).gameObject:GetComponent("SpriteHolder")
                print(TableUtilPaoHuZi.spriteHolderDC[name].gameObject.name,value)
            end
            
            if value > 0 and value <= 20 then
                if value % 2 == 0 then
                    value = value / 2 + 10
                else
                    value = (value + 1) / 2
                end
            end
            spriteHolder = TableUtilPaoHuZi.spriteHolderDC[name]
        end
        
        if img and spriteHolder then
            img.sprite = spriteHolder:FindSpriteByName(tostring(value))
            img.color = not color and Color.New(1, 1, 1, 1) or color
        else
            for i=1,10 do
                print(i)
            end
        end

        if status == 1 then
            local Bg = Manager.FindObject(cardObj, "bg")
            if Bg then
                Bg:SetActive(true)
            end
        else

        end
    end
end

function TableUtilPaoHuZi.getcardSprite(value, name)
    name = TableUtilPaoHuZi.get_real_spriteHolder(name)
    TableUtilPaoHuZi.spriteHolderDC = TableUtilPaoHuZi.spriteHolderDC or {}
    if TableUtilPaoHuZi.spriteHolderDC[name] == nil then
        print(name)
        TableUtilPaoHuZi.spriteHolderDC[name] =
            TableUtilPaoHuZi.CloneGameObject.transform:Find(name).gameObject:GetComponent("SpriteHolder")
        print(TableUtilPaoHuZi.spriteHolderDC[name].name)
    end

    if value > 0 and value <= 20 then
        if value % 2 == 0 then
            value = value / 2 + 10
        else
            value = (value + 1) / 2
        end
    end

  
    spriteHolder = TableUtilPaoHuZi.spriteHolderDC[name]

    return spriteHolder:FindSpriteByName(tostring(value))
end

function TableUtilPaoHuZi.get_real_spriteHolder(name)
    if name == nil then
        return name
    end

    local str = ""
    if DataPaoHuZi.ZP_ZPPaiLei == 2 then
        str = "1"
    end

    if DataPaoHuZi.ZP_ZPPaiLei == 3 then
        str = "2"
    end

    return string.gsub(name, "ZiPai", "ZiPai" .. str) 
end




--- 打印跑胡子日志
function TableUtilPaoHuZi.print(...)
    if isEditor then
--        print("<color=#00FF2CFF>========跑胡子Log========</color>", ...)
    end
end

--- 添加一个Sequence事件
--- @param seq DG.Tweening.Sequence
function TableUtilPaoHuZi.add_sequence(seq)
    if not TableUtilPaoHuZi.sequenceList then
        TableUtilPaoHuZi.sequenceList = {}
    end
    table.insert(TableUtilPaoHuZi.sequenceList, seq)
end



function TableUtilPaoHuZi.get_chat_text(index)
    -- require 暂放这  因为  作为 全局变量 会报错
    local Config1 = Config
    if AppData.Game_Name == "GLZP" then
        Config1 = require("package.paohuzi.module.tablebase.config")
    end
    return Config1.chatShotTextList[index]
end

-- 获取玩家信息
function TableUtilPaoHuZi.get_player_info(playerId, url, callbackHead, callbackInfo)
    local playerInfo = {}
    local requestData = {
        params =
        {
            uid = playerId,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/info?",
        cacheDataImmediatelyCallback = true,
    }
    if playerId then
        requestData.cacheDataKey = "user/info?uid=" .. (playerId or "0")
    end
    
    Util.http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            -- OK
            TableUtilPaoHuZi.set_player_info(retData.data, playerInfo, callbackHead, callbackInfo)
        else
            
            end
    end, function(error)
        print(error.error)
    end, function(cacheDataText)
        local retData = ModuleCache.Json.decode(cacheDataText)
        if retData.ret and retData.ret == 0 then
            -- OK
            TableUtilPaoHuZi.set_player_info(retData.data, playerInfo, callbackHead, callbackInfo)
        else
            
            end
    end)
end

-- 填写玩家信息
function TableUtilPaoHuZi.set_player_info(playerData, playerInfo, callbackHead, callbackInfo)
    playerInfo.playerId = playerData.userId
    playerInfo.playerName = playerData.nickname
    playerInfo.headUrl = playerData.headImg
    playerInfo.gender = playerData.gender
    playerInfo.ip = playerData.ip
    if (playerInfo.playerId ~= 0) then
        if (callbackInfo) then
            callbackInfo(playerInfo)
        end
        if (callbackHead) then
            TableUtilPaoHuZi.start_download_head_icon(playerInfo, callbackHead)
        end
    else
        return
    end
end

-- 下载头像
function TableUtilPaoHuZi.start_download_head_icon(playerInfo, callbackHead)
    if (not playerInfo.headUrl or playerInfo.headUrl == nil) then
        playerInfo.headImage = nil1
        if (callbackHead) then
            callbackHead(playerInfo)
        end
        return
    end
    ModuleCache.TextureCacheManager.loadTexFromCacheOrDownload(playerInfo.headUrl, function(err, sprite)
        if (err) then
            -- print('down load '.. playerInfo.headUrl .. 'failed:')
            if (callbackHead) then
                callbackHead(playerInfo)
            end
        else
            playerInfo.headImage = sprite
            if (callbackHead) then
                callbackHead(playerInfo)
            end
        end
    end)
end

function TableUtilPaoHuZi.only_download_head_icon(targetImage, url)
    if (not url or url == "") then
        targetImage.sprite = nil
        return
    end
    ModuleCache.TextureCacheManager.loadTexFromCacheOrDownload(url, function(err, sprite)
        if (err) then
            -- print('down load '.. url .. 'failed:')
            else
            targetImage.sprite = sprite
        -- ModuleCache.CustomerUtil.AttachTexture2Image(targetImage, tex)
        end
    end)
end


-- 下载座位详细信息
function TableUtilPaoHuZi.download_seat_detail_info(userId, callbackHead, callbackInfo)
    if (not TableManager.phzTableData) then
        return
    end

    userId = tostring(userId)

    TableUtilPaoHuZi.UserInfoTable = TableUtilPaoHuZi.UserInfoTable or {}


    local RoomID = TableUtilPaoHuZi.RoomID
    if RoomID ~= TableManager.phzTableData.RoomID then
        TableUtilPaoHuZi.UserInfoTable = {}
    end
    TableUtilPaoHuZi.RoomID = TableManager.phzTableData.RoomID
    

    TableUtilPaoHuZi.UserInfoTable[userId] = TableUtilPaoHuZi.UserInfoTable[userId] or {}

    if TableUtilPaoHuZi.UserInfoTable[userId].head and TableUtilPaoHuZi.UserInfoTable[userId].info and callbackHead and callbackInfo then
        callbackHead(TableUtilPaoHuZi.UserInfoTable[userId].head)
        callbackInfo(TableUtilPaoHuZi.UserInfoTable[userId].info)
        return
    end


    if TableUtilPaoHuZi.UserInfoTable[userId].head and TableUtilPaoHuZi.UserInfoTable[userId].info and callbackInfo then
        callbackInfo(TableUtilPaoHuZi.UserInfoTable[userId].info)
        return
    end

    if TableUtilPaoHuZi.UserInfoTable[userId].head and TableUtilPaoHuZi.UserInfoTable[userId].info and callbackHead then
        callbackHead(TableUtilPaoHuZi.UserInfoTable[userId].info)
        return
    end

    

    
    TableUtilPaoHuZi.get_player_info(userId, ModuleCache.GameManager.netAdress.httpCurApiUrl, function(info)
        TableUtilPaoHuZi.update_user_info(info)
        if (callbackHead) then

            TableUtilPaoHuZi.UserInfoTable[userId].head = info
            callbackHead(info)
        end
    end, function(info)
        TableUtilPaoHuZi.update_user_info(info)
        if (callbackInfo) then
            TableUtilPaoHuZi.UserInfoTable[userId].info = info
            callbackInfo(info)
        end
    end)



end

-- 更新座位玩家信息
function TableUtilPaoHuZi.update_user_info(info)
    if (not TableManager.phzTableData) then
        return
    end
    if (not TableManager.phzTableData.userInfos) then
        TableManager.phzTableData.userInfos = {}
    end
    TableManager.phzTableData.userInfos[info.playerId .. ""] =
        {
            playerId = info.playerId,
            playerName = info.playerName,
            gender = info.gender,
            ip = info.ip,
            headUrl = info.headUrl
        }
    if (info.headImage) then
        TableManager.phzTableData.userInfos[info.playerId .. ""].headImage = info.headImage
    end
end

-- 获取座位玩家信息
function TableUtilPaoHuZi.get_user_info(userId)
    if (not userId or userId == "0") then
        return nil
    end
    if (TableManager.phzTableData and TableManager.phzTableData.userInfos and TableManager.phzTableData.userInfos[userId]) then
        return TableManager.phzTableData.userInfos[userId]
    end
    return nil
end

function TableUtilPaoHuZi.color_text(color, text)
    return string.format("<color=#%s>%s</color>", color, text)
end

-- 转换规则
function TableUtilPaoHuZi.convert_rule(rule)
    local ruleInfo = ModuleCache.Json.decode(rule)
    if AppData.Game_Name == 'LDZP' or AppData.Game_Name == 'XXZP' then
        if not ruleInfo.JieSuanHuXi then
            ruleInfo.JieSuanHuXi  = 100
        end
    end

    
    return ruleInfo
end

function TableUtilPaoHuZi.get_rule_name(rule, customPay)
    local ruleName = ""
    local wanfaName = ""
    local renshu = 4
    local wanfaTable = ""
    local ruleInfo = TableUtilPaoHuZi.convert_rule(rule)
    local ruleJson = ModuleCache.Json.encode(ruleInfo)
    
    local localConfig =ModuleCache.PlayModeUtil.getGameRuleConfig()-- require(string.format("package.public.config.%s.config_%s", AppData.App_Name, AppData.Game_Name))
    
    --比鸡掼蛋用的是gameType，跑得快用的是game_type，斗牛用的是bankerType，而麻将用的是GameType，蛋疼！
    local gameType = ruleInfo.GameType
    if AppData.Game_Name == "BIJI" or AppData.Game_Name == "GUANDAN" then
        gameType = ruleInfo.gameType
    end
    if AppData.Game_Name == "RUNFAST" then
        gameType = ruleInfo.game_type
    end
    if AppData.Game_Name == "BULLFIGHT" then
        if ruleInfo.bankerType ~= nil then
            gameType = ruleInfo.bankerType
        else
            gameType = 3 --炸金牛
        end
    end
    local wanfa, wanfaName = Config.GetWanfaIdx(gameType)
    local createTable = localConfig.createRoomTable[wanfa]
    print("-------------------gameType:", gameType, wanfa, wanfaName, ModuleCache.GameManager.curGameId)
    for i = 2, #createTable do
        local list = createTable[i].list
        for j = 1, #list do
            local groupData = list[j]
            for k = 1, #groupData do
                local toggleData = groupData[k]
                
                local addName = (toggleData.ruleTitle or toggleData.toggleTitle)
				if toggleData.json and (string.find(rule, toggleData.json) ~= nil and string.find(ruleName, addName) == nil) then
					if string.find(addName, "支付") == nil then
						ruleName = ruleName .. addName .. " "
					end
                    if string.find(toggleData.json, "DianPaoBaoPei") then
                        wanfaTable = addName
                    end
                end
            end
        end
    end
    renshu = ruleInfo.PlayerNum or ruleInfo.playerCount
    return wanfaName, ruleName, renshu, wanfaTable
end

function TableUtilPaoHuZi.GetSingleResultModule()
	local singleResultModule
	local strPath = "package.huzi.module.table." .. AppData.Game_Name ..  "." .. AppData.Game_Name .. "_singleresult"
	local status,err = pcall(function ()
		singleResultModule = require(strPath)
	end) 
	if status then
		return singleResultModule
	else 
		return require("package.huzi.module.singleresult.singleresultBase_module")
	end
end








return TableUtilPaoHuZi
