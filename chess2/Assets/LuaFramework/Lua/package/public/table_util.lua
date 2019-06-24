
TableUtil = { }

local TableUtil = TableUtil
local ModuleCache = ModuleCache
local TableManager = require("package.public.table_manager")
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local bit = require("bit")
local table = table
local string = string
local tostring = tostring
local tonumber = tonumber
local Color = Color

local modelData = require("package.public.model.model_data")

-- 将服务器的做座位索引转换为本地位置索引
function TableUtil.get_local_seat(seatIndex, mySeatIndex, seatCount, seatTable)
    local localSeat = 1
    if (not seatTable) then
        localSeat =(seatIndex + seatCount - mySeatIndex) % seatCount + 1
    else
        local index = seatTable[seatIndex + 1]
        localSeat =(index + seatCount - mySeatIndex) % seatCount + 1
    end
    if (seatCount == 3 and localSeat == 3) then
        localSeat = 4
    end
    if(seatCount == 2 and localSeat == 2) then
        localSeat = 3
    end
    return localSeat
end

-- 获取所有子物体
function TableUtil.get_all_child(parent, filterName)
    local childs = { }
    local index = 1
    local trans = parent.transform
    for i = 1, trans.childCount do
        local obj = trans:GetChild(i - 1).gameObject
        if (not filterName or(filterName and obj.name == filterName)) then
            childs[index] = obj
            index = index + 1
        end
    end
    return childs
end


-- 移到克隆池中
function TableUtil.move_clone(obj, cloneParent)
    obj.transform:SetParent(cloneParent.transform)
    ComponentUtil.SafeSetActive(obj, false)
end

-- 添加到对象池
function TableUtil.add_poor(obj, poorObjs, cloneParent)
    TableUtil.move_clone(obj, cloneParent)
    if not poorObjs then
        poorObjs = { }
    end
    if not poorObjs[obj.name] then
        poorObjs[obj.name] = { }
    end
    table.insert(poorObjs[obj.name], obj)
    return poorObjs
end

-- 从对象池取出
function TableUtil.poor(objName, parent, pos, poorObjs, clones, scale)
    local targetObj = nil
    if (not poorObjs) then
        poorObjs = { }
    end
    if poorObjs[objName] then
        if #poorObjs[objName] ~= 0 then
            targetObj = poorObjs[objName][1]
            targetObj.transform:SetParent(parent.transform)
            targetObj.transform.localPosition = pos
            targetObj.name = objName
            table.remove(poorObjs[objName], 1)
        else
            targetObj = TableUtil.clone(TableUtil.get_clone_obj(objName, clones), parent, pos)
        end
    else
        targetObj = TableUtil.clone(TableUtil.get_clone_obj(objName, clones), parent, pos)
    end
    ComponentUtil.SafeSetActive(targetObj, true)
    if (scale) then
        targetObj.transform.localScale = scale
    end
    return targetObj
end

-- 获取克隆物体
function TableUtil.get_clone_obj(objName, clones)
    for i = 1, #clones do
        if clones[i].name == objName then
            return clones[i]
        end
    end
    return nil
end

-- 克隆
function TableUtil.clone(obj, parent, pos)
    local target = ComponentUtil.InstantiateLocal(obj, parent, pos)
    target.name = obj.name
    ComponentUtil.SafeSetActive(target, true)
    return target
end

-- 设置牌颜色
function TableUtil.set_mj_color(mj, color)
    local childs = TableUtil.get_all_child(mj)
    for i = 1, #childs do
        local image = ModuleCache.ComponentManager.GetComponent(childs[i], ComponentTypeName.Image)
        if (image) then
            local c = Color.New(color.r, color.g, color.b, image.color.a) -- 保存原来的透明度
            image.color = c
        end
    end
end

-- 设置牌
function TableUtil.set_mj(pai, mj, mjType, spriteHolder)
    pai = tonumber(pai)
    local paiImage = GetComponentWithPath(mj, "Image", ComponentTypeName.Image)
    local paiSpriteHolder = GetComponentWithPath(mj, "Image", "SpriteHolder")
    --[[if(pai <= 34) then
        if(mjType and mjType ~= 0) then
            pai = 100*mjType + pai
        end
    end--]]
    local originPai = pai
    if(mjType and mjType ~= 0) then
        pai = 100*mjType + pai
    end
    if (paiImage) then
        local sprite = nil
        if(spriteHolder) then
            sprite = spriteHolder:FindSpriteByName(pai .. "")
        elseif paiSpriteHolder then
            sprite = paiSpriteHolder:FindSpriteByName(pai .. "")
        end
        if not sprite then
            if(spriteHolder) then
                sprite = spriteHolder:FindSpriteByName(originPai .. "")
            elseif paiSpriteHolder then
                sprite = paiSpriteHolder:FindSpriteByName(originPai .. "")
            end
        end
        paiImage.sprite = sprite
    end
end

-- 设置牌底
function TableUtil.set_mj_bg(pai, mj, mjType)
    local image = GetComponentWithPath(mj, "Image", ComponentTypeName.Image)
    local imageObj = nil
    if(image) then
        imageObj = image.gameObject
        ComponentUtil.SafeSetActive(imageObj, pai == 1)
    end
    local paiImage = GetComponentWithPath(mj, "Bg", ComponentTypeName.Image)
    local paiSpriteHolder = GetComponentWithPath(mj, "Bg", "SpriteHolder")
    if(mjType and mjType ~= 0) then
        pai = 100*mjType + pai
    end
    if (paiImage and paiSpriteHolder) then
        paiImage.sprite = paiSpriteHolder:FindSpriteByName(pai .. "")
    end
    local paiImage1 = GetComponentWithPath(mj, "BgFront", ComponentTypeName.Image)
    local paiSpriteHolder1 = GetComponentWithPath(mj, "BgFront", "SpriteHolder")
    if (paiImage1 and paiSpriteHolder1) then
        paiImage1.sprite = paiSpriteHolder1:FindSpriteByName(pai .. "")
    end
end

-- 设置牌底
function TableUtil.set_mj_bg_owner(pai, mj, mjType)
    local image = ModuleCache.ComponentManager.GetComponent(mj, ComponentTypeName.Image)
    local paiSpriteHolder = ModuleCache.ComponentManager.GetComponent(mj, "SpriteHolder")
    if(mjType and mjType ~= 0) then
        pai = 100*mjType + pai
    end
    if (image and paiSpriteHolder) then
        image.sprite = paiSpriteHolder:FindSpriteByName(pai .. "")
    end
end

function TableUtil.set_mj_white(mj, color)
    TableUtil.set_mj_color(mj, color or Color.white)
    local tag = GetComponentWithPath(mj, "Tag", ComponentTypeName.Transform)
    if(tag) then
        tag.gameObject:SetActive(false)
    end
end

function TableUtil.set_laizi_tag(mj, tagSpriteH, configData, gray)
    if(not configData.laiziNoYellow) then
        TableUtil.set_mj_color(mj, Color.yellow)
    else
        TableUtil.set_mj_color(mj, Color.white)
    end
    local tag = GetComponentWithPath(mj, "Tag", ComponentTypeName.Transform)
    if(tag) then
        if(gray) then
            if(not configData.laiziNoYellow) then
                TableUtil.set_mj_color(mj, Color.New(130/255,130/255,0/255,1))
            else
                TableUtil.set_mj_color(mj, Color.gray)
            end
        end
        local tagImage = GetComponentWithPath(mj, "Tag", ComponentTypeName.Image)
        tag.gameObject:SetActive(true)
        if configData.laiziTag then
            tagImage.sprite = tagSpriteH:FindSpriteByName(configData.laiziTag)
        else
            tagImage.sprite = tagSpriteH:FindSpriteByName("4")
        end
    end
end

function TableUtil.set_tag(mj, tagSpriteH, tagVal)
    local tag = GetComponentWithPath(mj, "Tag", ComponentTypeName.Transform)
    if(tag) then
        local tagImage = GetComponentWithPath(mj, "Tag", ComponentTypeName.Image)
        tag.gameObject:SetActive(true)
        local sprite =  tagSpriteH:FindSpriteByName(tostring(tagVal))
        tagImage.sprite = sprite
        tagImage.gameObject:SetActive(nil ~= sprite)
    end
end

-- 转换utf-8
function TableUtil.utf8_text(text, n)
    local vals = { 0x3f, 0x1f, 0x0f, 0x07, 0x03, 0x01 }
    local beginVal = string.byte(text, n)
    for i = 0, 5 do
        if (bit.rshift(beginVal, 8 -(6 - i)) == vals[i + 1]) then
            return string.sub(text, n, n +(6 - i) -1), n +(6 - i) -1
        end
    end
    return string.sub(text, n, n), n
end

-- 截取文本
function TableUtil.cut_text(widthText, content, controllWidth)
    local addStr = ""
    local newStr = ""
    local char = ""
    local index = 0
    if not content then
        return newStr
    end
    for j = 1, string.len(content) do
        if (j > index) then
            char, index = TableUtil.utf8_text(content, j)
            addStr = addStr .. char
            widthText.text = addStr
            if (widthText.preferredWidth > controllWidth) then
                newStr = newStr .. "\n" .. char
                addStr = char
            else
                newStr = newStr .. char
            end
            if (index == string.len(content)) then
                break
            end
        end
    end
    return newStr
end

-- 过滤用户名
function TableUtil.filter_player_name(name)
    if (true) then
        return name
    end
    local newName = ""
    local charNum = 0
    for ch in string.gmatch(name, "[\\0-\127\194-\244][\128-\191]*") do
        if (#ch ~= 1) then
            if (charNum + 2 > 8) then
                return newName .. ".."
            end
            charNum = charNum + 2
            newName = newName .. ch
        else
            if (charNum + 1 > 8) then
                return newName .. ".."
            end
            charNum = charNum + 1
            newName = newName .. ch
        end
    end
    return newName .. ".."
end

function TableUtil.get_chat_text(index)
    return Config.chatShotTextList[index]
end

-- 获取玩家信息
function TableUtil.get_player_info(playerId, url, callbackHead, callbackInfo)
    local playerInfo = { }
    local requestData = {
        params =
        {
            uid = playerId,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/info?",
        cacheDataImmediatelyCallback = true,
    }
    if playerId then
        requestData.cacheDataKey = string.format("user/info?uid=%s", playerId or "0")
    end

    Util.http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.GameUtil.json_decode_to_table(www.text)
        if retData and retData.ret and retData.ret == 0 then
            -- OK
            TableUtil.set_player_info(retData.data, playerInfo, callbackHead, callbackInfo)
        else

        end
    end , function(error)
        print(error.error)
    end , function(cacheDataText)
        local retData = ModuleCache.Json.decode(cacheDataText)
        if retData.ret and retData.ret == 0 then
            -- OK
            TableUtil.set_player_info(retData.data, playerInfo, callbackHead, callbackInfo)
        else

        end
    end )
end

-- 填写玩家信息
function TableUtil.set_player_info(playerData, playerInfo, callbackHead, callbackInfo)
    playerInfo.playerId = playerData.userId
    playerInfo.playerName = playerData.nickname
    playerInfo.headUrl = playerData.headImg
    playerInfo.gender = playerData.gender
    playerInfo.ip = playerData.ip
    playerInfo.isRedName = playerData.isRedName
    playerInfo.gold = playerData.gold
    if (playerInfo.playerId ~= 0) then
        if (callbackInfo) then
            callbackInfo(playerInfo)
        end
        if (callbackHead) then
            TableUtil.start_download_head_icon(playerInfo, callbackHead)
        end
    else
        return
    end
end

-- 下载头像
function TableUtil.start_download_head_icon(playerInfo, callbackHead,useDefaultHead)
    if useDefaultHead then
        playerInfo.headImage = modelData.defaultHead
        if (callbackHead) then
            callbackHead(playerInfo)
        end
        return
    end

    if (not playerInfo.headUrl or playerInfo.headUrl == nil or playerInfo.headUrl == "") then
        playerInfo.headImage = nil
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
    end )
end

function TableUtil.only_download_head_icon(targetImage, url)
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
    end )
end

-- 下载座位详细信息
function TableUtil.download_seat_detail_info(userId, callbackHead, callbackInfo)
    if (not TableManager.curTableData) then
        return
    end

    userId = userId or 0
    local playerInfo = TableUtil.get_user_info(userId .. "")
    if (not playerInfo) then
        TableUtil.get_player_info(userId, ModuleCache.GameManager.netAdress.httpCurApiUrl, function(info)
            TableUtil.update_user_info(info)
            if (callbackHead) then
                callbackHead(info)
            end
        end , function(info)
            TableUtil.update_user_info(info)
            if (callbackInfo) then
                callbackInfo(info)
            end
        end )
    else
        if (callbackInfo) then
            callbackInfo(playerInfo)
        end
        if (callbackHead) then
            if (not playerInfo.headImage) then
                TableUtil.start_download_head_icon(playerInfo, function(info)
                    TableUtil.update_user_info(info)
                    callbackHead(info)
                end )
            else
                callbackHead(playerInfo)
            end
        end
    end
end

-- 更新座位玩家信息
function TableUtil.update_user_info(info)
    if (not TableManager.curTableData) then
        return
    end
    if (not TableManager.curTableData.userInfos) then
        TableManager.curTableData.userInfos = { }
    end
    TableManager.curTableData.userInfos[info.playerId .. ""] =
    {
        playerId = info.playerId,
        playerName = info.playerName,
        gender = info.gender,
        ip = info.ip,
        headUrl = info.headUrl,
        isRedName = info.isRedName
    }
    if (info.headImage) then
        TableManager.curTableData.userInfos[info.playerId .. ""].headImage = info.headImage
    end
end

-- 获取座位玩家信息
function TableUtil.get_user_info(userId)
    if (not userId or userId == "0") then
        return nil
    end
    if (TableManager.curTableData and TableManager.curTableData.userInfos and TableManager.curTableData.userInfos[userId]) then
        return TableManager.curTableData.userInfos[userId]
    end
    return nil
end

function TableUtil.color_text(color, text)
    return string.format("<color=#%s>%s</color>", color, text)
end

-- 转换规则
function TableUtil.convert_rule(rule)
    local ruleInfo = ModuleCache.Json.decode(rule)
    return ruleInfo
end

function TableUtil.get_rule_name(rule,  isMuseumRoom, appAndGameName) --isMuseumRoom 亲友圈
    if isMuseumRoom then -- 亲友圈
        rule =  ModuleCache.Json.decode(rule)
        --TODO XLQ 亲友圈分享，和规则。。，不需要显示支付方式
        rule.PayType = -1
        rule = ModuleCache.Json.encode(rule)
    end

    local ruleName = ""
    local renshu = 4
    local ruleInfo = TableUtil.convert_rule(rule)
    local localConfig = ModuleCache.PlayModeUtil.getGameRuleConfig(appAndGameName)--require(string.format("package.public.config.%s.config_%s",AppData.App_Name,AppData.Game_Name))
    --print("============",localConfig,AppData.get_app_and_game_name())
    local gameType = ruleInfo.GameType or ruleInfo.gameType or ruleInfo.game_type or ruleInfo.bankerType or 3

    local wanfa, wanfaName = Config.GetWanfaIdx(gameType, appAndGameName)
    local createTable = localConfig.createRoomTable[wanfa]
    print("-------------------gameType:", gameType, wanfa, wanfaName, ModuleCache.GameManager.curGameId)
    local payTypeName = ""
    if(#createTable > 1) then
        for i = 2, #createTable do
            local list = createTable[i].list
            for j = 1, #list do
                local groupData = list[j]
                for k = 1, #groupData do
                    local toggleData = groupData[k]

                    local addName =(toggleData.ruleTitle or toggleData.toggleTitle)
                    local isOn, onIndex = TableUtil.check_toggle_on(toggleData, rule)
                    if (TableUtil.check_toggle_on(toggleData, rule) and not string.find(ruleName, addName)) then
                        if(toggleData.dropDown and toggleData.json ~= "payType" and toggleData.json ~= "PayType") then
                            local splitTitles = nil
                            if(toggleData.dropDownTitles) then
                                splitTitles = string.split(toggleData.dropDownTitles, ",")
                                ruleName = ruleName .. addName .. " " .. splitTitles[onIndex] .. " "
                            else
                                ruleName = ruleName .. addName .. " " .. ruleInfo[toggleData.json] .. (toggleData.dropAddStr or "倍") .. " "
                            end
                        elseif(not string.find(toggleData.json, "payType") and not string.find(toggleData.json, "PayType")) then
                            ruleName = ruleName .. addName .. " "
                        else
                            payTypeName = addName .. " "
                        end
                    end
                end
            end
        end
    end
    if(payTypeName ~= "") then
        ruleName = payTypeName .. ruleName
    end
    if(ruleInfo.roundCount and AppData.isPokerGame() and ruleInfo.roundCount > 0) then
        ruleName = ruleInfo.roundCount .. "局 " .. ruleName
    end
    renshu = ruleInfo.PlayerNum or ruleInfo.playerCount
    --print("=========fffffff==========",wanfaName, ruleName, renshu)
    return wanfaName, ruleName, renshu
end

function TableUtil.get_rule_name_paohuzi(rule) --isMuseumRoom 亲友圈)
    local ruleInfo = ModuleCache.Json.decode(rule)

    local str = ""

    if ruleInfo.DiFen then
        str = str .. '底分' .. ruleInfo.DiFen/1000 .. ' '
    end

    str = str .. "15胡起胡 "

    if ruleInfo.roundCount then
        str = str .. ruleInfo.roundCount.."胡息结算 "
    end


    if ruleInfo.FengDing then
        str = str .. '封顶' .. ruleInfo.FengDing .. '胡息 '
    end


    if ruleInfo.DaTuo == 0 then
        str = str .. '不打坨 '
    elseif ruleInfo.DaTuo == 1 then
        str = str .. '打坨 '
    end

    if ruleInfo.JiePaoFengDing == 0 and AppData.Game_Name == "LDZP" then
        str = str .. '接炮不封顶 '
    elseif ruleInfo.JiePaoFengDing == 100 and AppData.Game_Name == "LDZP" then
        str = str .. '接炮100封顶 '
    end

    if ruleInfo.CheckIPAddress == true then
        str = str .. 'GPS检测开启 '
    end

    if ruleInfo.NeedOpenGPS == true then
        str = str .. '相同IP检测 '
    end

    if ruleInfo.SeatRule == 1 then
        str = str .. '不换位 '
    elseif ruleInfo.SeatRule == 2 then
        str = str .. '每局换位 '
    end

    return str
end

function TableUtil.get_rule_name_gold_room(rule,  isMuseumRoom) --isMuseumRoom 亲友圈
    local ruleName = ""
    local renshu = 4
    local ruleInfo = TableUtil.convert_rule(rule)
    local localConfig = ModuleCache.PlayModeUtil.getGameRuleConfig()--require(string.format("package.public.config.%s.config_%s",AppData.App_Name,AppData.Game_Name))
    local gameType = ruleInfo.GameType or ruleInfo.gameType or ruleInfo.game_type or ruleInfo.bankerType or 3
    local wanfa, wanfaName = Config.GetWanfaIdx(gameType)
    local createTable = localConfig.createRoomTable[wanfa]
    local payTypeName = ""
    if(#createTable > 1) then
        for i = 2, #createTable do
            local list = createTable[i].list
            local tag =  createTable[i].tag
            for j = 1, #list do
                local groupData = list[j]
                for k = 1, #groupData do
                    local toggleData = groupData[k]
                    local addName = toggleData.toggleTitle

                    if gameType == "lamj_liuan" and  string.find(toggleData.json, "ZhuangFen") then  --六安麻将特殊处理，显示titel
                        addName = tag.togglesTile..toggleData.toggleTitle
                    elseif gameType == "czmj_qylz"and  string.find(toggleData.json, "PaiXingFen") then  --池州青阳辣子特殊处理
                        addName = tag.togglesTile..toggleData.toggleTitle
                    elseif gameType == "whmj_nanling"and  string.find(toggleData.json, "ZhuangJiaFen") then  --芜湖南陵麻将特殊处理
                        addName = tag.togglesTile..toggleData.toggleTitle
                    end


                    local isOn, onIndex = TableUtil.check_toggle_on(toggleData, rule)
                    if (TableUtil.check_toggle_on(toggleData, rule) and not string.find(ruleName, addName)) then
                        if(toggleData.dropDown
                                and toggleData.json ~= "payType"
                                and toggleData.json ~= "PayType"
                                and toggleData.json ~= "PlayerNum"
                                and toggleData.json ~= "DiFen"
                                and toggleData.json ~= "StartNow") then
                            local splitTitles = nil
                            if(toggleData.dropDownTitles) then
                                splitTitles = string.split(toggleData.dropDownTitles, ",")
                                ruleName = ruleName .. addName .. " " .. splitTitles[onIndex] .. " "
                            else
                                ruleName = ruleName .. addName .. " " .. ruleInfo[toggleData.json] .. (toggleData.dropAddStr or "倍") .. " "
                            end
                        elseif(not string.find(toggleData.json, "payType")
                                and not string.find(toggleData.json, "PayType")
                                and not string.find(toggleData.json, "PlayerNum")
                                and not string.find(toggleData.json, "DiFen")
                                and not string.find(toggleData.json, "StartNow")) then
                            ruleName = ruleName .. addName .. " "
                        end
                    end
                end
            end
        end
    end
    if(ruleInfo.roundCount and AppData.isPokerGame() and ruleInfo.roundCount > 0) then
        ruleName = ruleInfo.roundCount .. "局 " .. ruleName
    end
    renshu = ruleInfo.PlayerNum or ruleInfo.playerCount
    return wanfaName, ruleName, renshu
end

function TableUtil.get_rule_name_onegameresult(rule,isMuseumRoom,appAndGameName)
    if isMuseumRoom then -- 亲友圈
        rule =  ModuleCache.Json.decode(rule)
        --TODO XLQ 亲友圈分享，和规则。。，不需要显示支付方式
        rule.PayType = -1
        rule = ModuleCache.Json.encode(rule)
    end
    local ruleName = ""
    local renshu = 4
    local ruleInfo = TableUtil.convert_rule(rule)
    local localConfig = ModuleCache.PlayModeUtil.getGameRuleConfig(appAndGameName)
    local gameType = ruleInfo.GameType or ruleInfo.gameType or ruleInfo.game_type or ruleInfo.bankerType or 3
    local wanfa, wanfaName = Config.GetWanfaIdx(gameType, appAndGameName)
    local createTable = localConfig.createRoomTable[wanfa]
    local payTypeName = ""
    if(#createTable > 1) then
        for i = 2, #createTable do
            local list = createTable[i].list
            for j = 1, #list do
                local groupData = list[j]
                for k = 1, #groupData do
                    local toggleData = groupData[k]
                    local addName =(toggleData.ruleTitle or toggleData.toggleTitle)
                    local isOn, onIndex = TableUtil.check_toggle_on(toggleData, rule)
                    if (TableUtil.check_toggle_on(toggleData, rule) 
                        and not string.find(ruleName, addName) 
                        and addName ~= "允许少人时提前开局"
                        and addName ~= "相同IP检测"
                        and addName ~= "GPS检测"
                        and (not string.find(toggleData.json,"PlayerNum"))
                        and (not string.find(toggleData.json,"roundCount"))) then
                        if(toggleData.dropDown and toggleData.json ~= "payType" and toggleData.json ~= "PayType") then
                            local splitTitles = nil
                            if(toggleData.dropDownTitles) then
                                splitTitles = string.split(toggleData.dropDownTitles, ",")
                                ruleName = ruleName .. addName .. " " .. splitTitles[onIndex] .. " "
                            else
                                ruleName = ruleName .. addName .. " " .. ruleInfo[toggleData.json] .. (toggleData.dropAddStr or "倍") .. " "
                            end
                        elseif(not string.find(toggleData.json, "payType") and not string.find(toggleData.json, "PayType")) then
                            ruleName = ruleName .. addName .. " "
                        else
                            payTypeName = addName .. " "
                        end
                    end
                end
            end
        end
    end
    if(payTypeName ~= "") then
        ruleName = payTypeName .. ruleName
    end
    if(ruleInfo.roundCount and AppData.isPokerGame() and ruleInfo.roundCount > 0) then
        ruleName = ruleInfo.roundCount .. "局 " .. ruleName
    end
    renshu = ruleInfo.PlayerNum or ruleInfo.playerCount
    --print("=========fffffff==========",wanfaName, ruleName, renshu)
    return wanfaName, ruleName, renshu
end

-- 麻将逆序排列 解决层级问题
function TableUtil.invert_mj_pos(childs, offset, mjs, invert, isParent, mjScale, spriteHolder)
    local newIndexs = { }
    local childAllPos = { }
    if (not offset) then
        offset = #childs
    end
    if (not invert) then
        for i = 1, #childs do
            TableUtil.set_mj(mjs[i], childs[i], mjScale, spriteHolder)
            table.insert(newIndexs, i)
        end
        return newIndexs
    end
    for i = 1, offset do
        if (not isParent) then
            table.insert(childAllPos, childs[i].transform.anchoredPosition)
        else
            table.insert(childAllPos, childs[i].transform.parent.anchoredPosition)
        end
    end
    for i = 1, offset do
        local invertIndex = offset - i + 1
        if (not isParent) then
            childs[i].transform.anchoredPosition = childAllPos[invertIndex]
        else
            childs[i].transform.parent.anchoredPosition = childAllPos[invertIndex]
        end
        if (mjs) then
            TableUtil.set_mj(mjs[invertIndex], childs[i], mjScale, spriteHolder)
        end
        table.insert(newIndexs, invertIndex)
    end
    return newIndexs
end

-- 麻将逆序排列 解决层级问题
function TableUtil.invert_mj_pos_hand(childs)
    for i = 2, #childs do
        childs[i].transform:SetAsFirstSibling()
    end
end

function TableUtil.copy_data(data)
    local copyData = { }
    for i, v in pairs(data) do
        copyData[i] = v
    end
    return copyData
end

-- 计算距离
function TableUtil.caculate_distance(latitude1, longitude1, latitude2, longitude2)
    -- print(longitude1,latitude1,longitude2,latitude2)
    if (longitude1 and latitude1 and longitude2 and latitude2) then
        local var2 = 0.01745329251994329
        local var4 = longitude1
        local var6 = latitude1
        local var8 = longitude2
        local var10 = latitude2
        var4 = var4 * 0.01745329251994329
        var6 = var6 * 0.01745329251994329
        var8 = var8 * 0.01745329251994329
        var10 = var10 * 0.01745329251994329
        local var12 = math.sin(var4)
        local var14 = math.sin(var6)
        local var16 = math.cos(var4)
        local var18 = math.cos(var6)
        local var20 = math.sin(var8)
        local var22 = math.sin(var10)
        local var24 = math.cos(var8)
        local var26 = math.cos(var10)
        local var28 = { }
        local var29 = { }
        var28[1] = var18 * var16
        var28[2] = var18 * var12
        var28[3] = var14
        var29[1] = var26 * var24
        var29[2] = var26 * var20
        var29[3] = var22
        local var30 = math.sqrt((var28[1] - var29[1]) *(var28[1] - var29[1]) +(var28[2] - var29[2]) *(var28[2] - var29[2]) +(var28[3] - var29[3]) *(var28[3] - var29[3]))
        return(math.asin(var30 / 2.0) * 1.27420015798544E7)
    else
        print("非法坐标值")
        return -1
    end
end


function TableUtil.hide_childs(parent, filterName)
    local childs = TableUtil.get_all_child(parent, filterName)
    for i = 1, #childs do
        ComponentUtil.SafeSetActive(childs[i], false)
    end
end

function TableUtil.get_or_clone(index, objName, parent, pos, poorObjs, clones, notFilter)
    local childs = nil
    if (notFilter) then
        childs = TableUtil.get_all_child(parent)
    else
        childs = TableUtil.get_all_child(parent, objName)
    end
    local obj
    if (index <= #childs) then
        obj = childs[index]
    else
        obj = TableUtil.poor(objName, parent, pos, poorObjs, clones)
    end
    ComponentUtil.SafeSetActive(obj, true)
    obj.transform.localPosition = pos
    return obj
end

function TableUtil.have_table_index(tableData, element)
    for i = 1, #tableData do
        if(element == tableData[i]) then
            return true
        end
    end
    return false
end

function TableUtil.remove_table_index(tableData, element)
    for i = #tableData, 1, -1 do
        if(element == tableData[i]) then
            table.remove(tableData, i)
            break
        end
    end
end

function TableUtil.check_toggle_on(toggleData, rule)
    local ruleTable = ModuleCache.Json.decode(rule)
    if(not string.find(toggleData.json, ":")) then
        if(toggleData.dropDown) then
            local dropVals = string.split(toggleData.dropDown, ",")
            for i = 1, #dropVals do
                if(tostring(ruleTable[toggleData.json]) == dropVals[i]) then
                    return true, i
                end
            end
        end
    else
        local splitStrs = string.split(toggleData.json, ":")
        local key = string.sub(splitStrs[1],2,#splitStrs[1] - 1)
        local isOn = (tostring(ruleTable[key]) == splitStrs[2])
        if(toggleData.addJson) then
            local addJsonStrs = string.split(toggleData.addJson, ",")
            local addIsOn = true
            for i = 1, #addJsonStrs do
                local addJson = addJsonStrs[i]
                splitStrs = string.split(addJson, ":")
                key = string.sub(splitStrs[1],2,#splitStrs[1] - 1)
                addIsOn = addIsOn and (tostring(ruleTable[key]) == splitStrs[2])
            end
            return isOn and addIsOn, 1
        end
        return isOn, 1
    end
    return false, 1
end

function TableUtil.GetStringNum(num)
	if num == nil or type(num) ~= "number" then
		return ""
	end
	local str = tostring(num)
	if num >= 10^8 then
		local number = math.floor(num / 10^6)  
		str = string.format("%.2f", number/10^2).."亿"
	elseif num >= 10^6 then
		local number = math.floor(num / 10^2)  
		str = string.format("%.0f", number/10^2).."万"
	elseif num >= 10^4 then
		local number = math.floor(num / 10^2)  
		str = string.format("%.1f", number/10^2).."万"
	end
	return str
end

--获取Table的元素数量
function TableUtil.GetTableItemCount(t)
	if t == nil or type(t) ~= "table" then
		return 0
	end
	local nCount = 0
	for k,v in pairs(t) do
		if v ~= nil then
			nCount = nCount + 1
		end
	end
	return nCount
end

--深度拷贝
function TableUtil.deepcopy(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end

    return _copy(object)
end

return TableUtil