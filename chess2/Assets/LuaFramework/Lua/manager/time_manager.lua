
local ModuleCache = ModuleCache
--local print = print
local UnityEngine = UnityEngine

---@class TimeManager
local TimeManager = {}
local Util = Util


---同步时间
function TimeManager:SynTime(callBack)
    print("123123213123123123")
    print("123123213123123123")
    print("123123213123123123")
    print("123123213123123123")
    print("123123213123123123")
    print("123123213123123123")
    print("123123213123123123")
    local requestData = {
        params =
        {
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "api/ping?2",
    }
    Util.http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.GameUtil.json_decode_to_table(www.text)
        if retData and retData.ret and retData.ret == 0 then
            -- OK
        else
            
        end
    end , function(error)
        print(error.error)
    end , nil)
end

---
function TimeManager:get_cur_time()
    
end


return TimeManager