
local class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")
-- ==========================================================================
local json = require("cjson")

local ModuleCache = ModuleCache

---@class RankModel : Model
local RankModel = class("rankModel", Model)

function RankModel:initialize(...)
    Model.initialize(self, ...)
end

-- 请求获取好友排行协议
function RankModel:getFriendRank()

    local requestData = {
        showModuleNetprompt = true,
        params =
        {
            uid = self.modelData.roleData.userID,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "gold/getGoldRanks?",
        cacheDataKey = "gold/getGoldRanks?" .. self.modelData.roleData.userID
    }

    local onResponse = function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then

            local rankList = retData.data;

            for key, rank in ipairs(rankList) do

                -- 是否显示排行榜图标
                local isShowRankIcon = false;
                -- 是否为玩家
                local isPlayer = false;
                if rank.rank <= 3 then
                    isShowRankIcon = true;
                end

                if tonumber(rank.userId) == tonumber(self.modelData.roleData.userID) then
                    isPlayer = true;
                end
                rank.isPlayer = isPlayer;
                -- 是否显示排行榜图标
                rank.isShowRankIcon = isShowRankIcon;
            end

            Model.dispatch_event(self, "Event_HistoryList_GetRankInit", rankList);
        else

        end
    end

    local onError = function(data)
        print(data.error);
    end

    self:http_get(requestData, onResponse, onError);
end

return RankModel;