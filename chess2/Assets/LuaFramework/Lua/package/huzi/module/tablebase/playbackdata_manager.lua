




local class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")
local ModuleCache = ModuleCache
local Buffer = ModuleCache.net.Buffer

---@class PlaybackDataManager

local PlaybackDataManager = class("PlaybackDataManager", Model)

function PlaybackDataManager:initialize(...)
    if self.initFlag then
        return
    end

    Model.initialize(self, "huzi")
    self.modelData = require("package.public.model.model_data")
    self.initFlag = true
end

--- 播放回放
--- @param data GameState 牌桌回放数据
--- @param players 玩家数据
function PlaybackDataManager:play_back(data, players)
    self:initialize()
    self:get_play_back_info(data.recordId, function(gamestates, data)
        local index = 1
        for i = 1, #players do
            local userId = players[i].userId
            if (userId .. "" == self.modelData.roleData.userID) then
                index = i
            end
        end

        TableManager.phzTableData = {
            isPlayBack = true,
            SeatID = index - 1,
            RoomID = data.roomid,
            RoundCount = data.roundcount,
            videoData = data,
            modelData = self.modelData,
            gamestates = gamestates,
            players = players,
            Rule = data.gamerule,
        }

        ModuleCache.ModuleManager.destroy_package("public")
        ModuleCache.ModuleManager.destroy_package("public")
        ModuleCache.ModuleManager.show_module_only("huzi", "table")
    end)
end

--- 获取回放信息
--- @param playbackId number 战绩列表中的id
--- @param callback function 回调
function PlaybackDataManager:get_play_back_info(playbackId, callback)
    self:initialize()
    ModuleCache.ModuleManager.show_public_module("netprompt")
    local requestData = {
        params = {
            uid = self.modelData.roleData.userID,
            recordId = playbackId
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "gamehistory/playback?",
    }

    Util.http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        if (string.find(www.text, "ret") ~= nil and string.find(www.text, "{") ~= nil) then
            local retData = ModuleCache.Json.decode(www.text)
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
            ModuleCache.ModuleManager.hide_public_module("netprompt")
            return
        end
        local buffer = Buffer.Create(0)  --会在C#层自动回收
        local videoData = buffer:GetPlayBackInfo(www.bytes)
        if not videoData then
            print("回放数据非法")
            return
        end
        local videoTable = nil
        if videoData.rule then
            videoTable = {}
            videoTable.gamerule = videoData.rule
        else
            videoTable = self:unpack_msg_new("Msg_VideoCode", videoData.headData)
        end
        local gamestates = {}
        for i = 1, videoData.frames.Count do
            local retData, error = self:unpack_msg_new("Msg_Table_GameStateNTF", videoData.frames[i - 1].buffer)
            table.insert(gamestates, retData)
        end

        callback(gamestates, videoTable)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
    end, function(error)
        print(error.error)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
    end)
end

--- 根据分享的回放id播放回放
--- @param playBackId number 回放id
--- @param callback function 回调
function PlaybackDataManager:play_back_on_id(playBackId, callback)
    self:initialize()
    local requestData = {
        params = {
            uid = self.modelData.roleData.userID,
            shortRecordId = playBackId
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "gamehistory/getRecordId?",
    }

    Util.http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if (callback) then
            callback(retData)
        else
            if retData.ret and retData.ret == 0 then
                --OK
                local playMode = ModuleCache.PlayModeUtil.getInfoByIdAndLocation(ModuleCache.GameManager.curGameId, ModuleCache.GameManager.curLocation)
                self:play_back(retData.data, retData.data.players)

                print_table(retData.data)
            else
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("回放码错误！请填写正确的回放码")
            end
        end

    end, function(error)
        print(error.error)
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("回放码错误！请填写正确的回放码")
    end)
end

--- 解析回放数据
function PlaybackDataManager:unpack_msg_new(msgName, dataBuffer)
    self:initialize()
    local ret = self.netMsgApi:create_ret_data(msgName)
    ret:ParseFromString(dataBuffer)
    return ret
end

return PlaybackDataManager