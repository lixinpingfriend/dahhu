
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local BiSaiModule = class("Public.BiSaiModule", ModuleBase)

local GameSDKInterface = ModuleCache.GameSDKInterface
local TableManager = TableManager
-- 常用模块引用
local ModuleCache = ModuleCache
local CSmartTimer = ModuleCache.SmartTimer.instance
local MatchingManager = require("package.public.matching_manager")

function BiSaiModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "bisai_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function BiSaiModule:on_module_inited()

end

function BiSaiModule:set_view_values()

end

function BiSaiModule:on_show(data)
    ModuleCache.GameManager.change_game_by_gameName(ModuleCache.AppData.getDefautMatchGameName(), true)
    ModuleCache.JpushManager().setTag()
    ModuleCache.ModuleManager.show_module("public", "mail", "tips");
    self:hide_view()
    if data == "tips" then
        self:get_user_matching_list(function(data)
            local kaisai
            for _, v in pairs(data) do
                if tonumber(v.matchStartModel) ~= 1 and v.stageStatus == 2 then
                    kaisai = true
                elseif v.isUserEntry and tonumber(v.matchStartModel) ~= 1 then
                    print("有报名还未开始的比赛")
                    CSmartTimer:Subscribe(v.startTimeSecond - v.serviceTimeSecond, false, 1):OnComplete(function(t)
                        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button(
                                "您报名的比赛已经开始！请从比赛场大厅进入比赛！")
                        --震动
                        ModuleCache.GameSDKInterface:ShakePhone(500)
                    end)
                end
            end
            print("是否有已经开始的比赛：", #data)
            if kaisai then
                self:dispatch_package_event("Event_Have_Match_Start")
            end
        end)

    else
        self.autoEnter = false
        self.view:refreshPlayerInfo(self.modelData.roleData)
        --print_table(data, "比赛场数据")
        if type(data) == "table" and data.isSigned then
            self:show_view()
            self:getmatchbyid(data.id, data.stageId, function(info)

                if tonumber(info.matchStartModel) == 1 then
                    self.clickdata = info
                    self:enterMatch(data.stageId)
                else
                    self.id = info.matchType
                    self.view:tagDeal(self.id)
                    self.havebaoming = true
                    self:get_bisai_list(self.id)
                    self.clickdata = info
                    self:reconnect_baoming(info)
                end


            end)
        else
            self:show_view(true)
            self.id = 1
            if type(data) == "table" and data.id then
                self.id = data.id
            end
            self.view:tagDeal(self.id)
            self:get_bisai_list(self.id)
            self.view:signUpView(false, true)
            self.havebaoming = false

        end

    end
    self:dispatch_package_event("Event_Package_RefreshUserInfo")
end

function BiSaiModule:on_click(obj, arg)
    print("点击", obj.name, obj.transform.parent.name)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "ImageBack" then
        self:close_deal()
        ModuleCache.ModuleManager.hide_module("public", "bisai")
        self:dispatch_package_event("Event_Show_Hall_Anim")
    elseif obj.name == "Gold" then
        ModuleCache.ModuleManager.show_module("public", "shop", 5)
    elseif obj.name == "Gem" then
        ModuleCache.ModuleManager.show_module("public", "shop", { showpage = 2, isUsedDefault = true })
    elseif obj.name == "BtnRecord" then
        ModuleCache.ModuleManager.show_module("public", "matchrecord")
    elseif obj.name == "BtnMail" then
        ModuleCache.ModuleManager.show_module("public", "mail")
    elseif obj.transform.parent.name == "Content" then
        self.clickid = tonumber(obj.name)
        self.clickdata = self.matchData[self.clickid]
        print_table(self.clickdata, "比赛数据")
        if tonumber(self.clickdata.stageStatus) == 2 then
            self.autoEnter = true
            TableManager:matching_enter(self.modelData.roleData.userID, self.modelData.roleData.password, self.clickdata.matchId, self.clickdata.stageNum, "wait")
            --self:subscibe_time_event(5, false, 1):OnComplete(function()
            --    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("网络连接失败")
            --    ModuleCache.GameManager.logout()
            --end)
        else
            self:request_baoming_data(self.clickdata)
        end

    elseif obj.name == "BaoMing2" then
        self.clickid = tonumber(obj.transform.parent.parent.name)
        self.clickdata = self.matchData[self.clickid]
        self:yuyue(self.clickdata)
    elseif obj.name == "BtnExit" then
        self.exitClick = "Exit"
        self:sureExit()
    elseif obj.name == "BtnClose" then
        self.exitClick = "Close"
        if (TableManager.loginClientConnected) then
            TableManager:request_matching_exit(self.clickdata.matchId, self.clickdata.stageNum)  --data.matchId, data.stageNum
        else
            self.view:signUpView(false)
        end
    elseif obj.name == "BtnWant" then
        self:request_baoming(self.clickdata)
    elseif obj.transform.parent.name == "Bottom" then
        self.id = tonumber(obj.name)
        if self.id > 2 then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("敬请期待")
        else
            self.view:tagDeal(self.id)
            self:get_bisai_list(self.id)
        end

    elseif obj.name == "BtnEnterMatch" then
        if self.matchRoomData then
            if (TableManager.loginClientConnected) then
                TableManager:disconnect_login_server()
            end
            self.haveEnter = true
            self.modelData.tableCommonData.tableType = 2
            TableManager:join_room({roomId = self.matchRoomData.RoomID}, true)
        end

    end
end

-- 绑定module层的交互事件
function BiSaiModule:on_module_event_bind()
    self:subscibe_package_event("Event_Package_Refresh_Userinfo", function(eventHead, eventData)
        print("===刷新金币===",self.isHide)
        if self.isHide then
            return
        end

        self.view:refreshPlayerInfo(eventData)
    end)
    self:subscibe_package_event("Event_Package_Refresh_MatchList", function(eventHead, eventData)
        if self.isHide then
            return
        end
        self:get_bisai_list(self.id)
    end)
    self:subscibe_package_event("Event_Matching_Exit", function(eventHead, eventData)
        if self.isHide then
            return
        end
        TableManager:disconnect_login_server()
        self.view:signUpView(false)
        ModuleCache.ModuleManager.show_module("public", "mail", "tips");
    end)
    self:subscibe_package_event("Event_QuiMatch", function(eventHead, eventData)
        if self.isHide then
            return
        end
        self:get_bisai_list(self.id)
    end)
    -- 刷新小红点提示
    self:subscibe_package_event("Event_Package_RefreshTips", function(eventHead, eventData)
        print("收到邮件小红点", self.isHide, eventData)
        if self.isHide then
            return
        end
        self.view:redTips(eventData);
    end)
    self:subscibe_package_event("match_entry_info_change", function(eventHead, eventData)
        --print("收到比赛场人数改变推送", eventData, type(eventData), eventData.matchId, eventData.stageNum, eventData.preEntryNum, eventData.currentEntryNum)
        if self.isHide then
            return
        end
        print("收到比赛场人数改变推送", eventData, type(eventData), eventData.matchId, eventData.stageNum, eventData.preEntryNum, eventData.currentEntryNum)
        local id, matchdata = self:matchid2Clickid(eventData)
        self.view:viewList(self.matchData)
        print("匹配obj id", id, self.clickid)
        if id > 0 and tonumber(self.clickid) == tonumber(id) then
            self.view:refreshSignupNum(eventData.currentEntryNum)
        end
    end)


    --报名成功
    self:subscibe_package_event("Event_Matching_SignUp", function(eventHead, eventData)
        print("报名成功", self.clickid)
        self.havebaoming = true
        self.matchData[self.clickid].isUserEntry = true
        self.matchData[self.clickid].stageNum = eventData.StageID
        if not self.matchTimeEvent then
            self.matchTimeEvent = {}
        end
        print_table(self.matchData, "报名成功比赛数据")
        if tonumber(self.clickdata.matchStartModel) == 1 then
            --人满开赛
            self.view:signUpView(false)
            self:enterMatch(eventData.StageID)
        else
            local tid = CSmartTimer:Subscribe(self.matchData[self.clickid].startTimeSecond - self.matchData[self.clickid].serviceTimeSecond, false, 1):OnComplete(function(t)
                ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button(
                        "您报名的比赛已经开始啦！请从比赛场入口进入比赛吧！")
                --震动
                ModuleCache.GameSDKInterface:ShakePhone(500)
            end)                   .id
            self.matchTimeEvent[tonumber(eventData.MatchID)] = tid
            if self.view then
                self:subscibe_time_event(1.2, false, 0):OnComplete(function(t)
                    self:get_bisai_list(self.id, function(data)
                        for i = 1, #data do

                            if data[i].matchId == self.clickdata.matchId and data[i].stageStatus == 1 then

                                self.view:refreshSignupNum(data[i].currentEntryNum)


                            end
                        end
                    end)
                end)
                self.view:baoming_success()
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("报名成功")
            end
        end

        self:dispatch_package_event("Event_Package_RefreshUserInfo")
    end)
    --刷新界面
    self:subscibe_package_event("Event_Refresh_Matching", function(eventHead, eventData)
        if self.view and not self.isHide then
            --print("刷新比赛列表", eventData)
            self:subscibe_time_event(1.2, false, 0):OnComplete(function(t)
                self:get_bisai_list(self.id)
            end)
            if not eventData then
                if (TableManager.loginClientConnected) then
                    TableManager:disconnect_login_server()
                end
                self.view:signUpView(false)
            end
        end
    end)
    --Event_Refresh_Matching
    --退赛成功
    self:subscibe_package_event("Event_Matching_Withdraw", function(eventHead, eventData)
        if self.isHide then
            return
        end
        if eventData.error == 0 then
            if self.matchTimeEvent and self.matchTimeEvent[tonumber(eventData.MatchID)] then
                print("清除定时器")
                CSmartTimer:Kill(self.matchTimeEvent[tonumber(eventData.MatchID)])
            end
            self:tuisai_deal()
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("退赛成功,报名费已通过邮件退还。")
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(eventData.ErrorInfo)
        end

    end)

    --事件
    self:subscibe_package_event("Event_Matching_Notify_MatchDynamic", function(eventHead, eventData)
        --eventData.EventArgs
        --print("收到事件消息", eventData.EventArgs, eventData.CurLoopNo)
        if not self.isHide then
            local ev = ModuleCache.Json.decode(eventData.EventArgs)

            if ev.MatchState == -1 then
                --比赛取消
            elseif ev.Type == "match_info" and ev.MatchState == 0 then
                --刷新界面显示人数
                if self.view then
                    --self.view:refreshSignupNum(ev.SignupUserCnt)
                end
            elseif ev.Type == "loop_start" and ev.MatchState == 1 and eventData.CurLoopNo then
                --比赛开始事件
            end

        end
    end)
    ----匹配动态信息
    self:subscibe_package_event("Event_Matching_Notify_RoomInfo", function(eventHead, eventData)
        if self.isHide then
            return
        end
        self:get_bisai_list(self.id)
        self.view:match_start()
        self.matchRoomData = eventData
        if self.autoEnter then
            self.modelData.tableCommonData.tableType = 2
            TableManager:join_room(self.matchRoomData.RoomID, nil, nil, true)
            --TableManager:proce_enterMatchingRoom(self.matchRoomData.Host, self.matchRoomData.Port, self.matchRoomData.RoomID, self.matchRoomData.UserID, self.matchRoomData.Password, self.matchRoomData.PlayRule, 2)

        end
    end)
end

function BiSaiModule:enterMatch(StageID)
    ModuleCache.ModuleManager.show_public_module("tablematch",
            { matchtype = 2,

              type = "sign",
              matchinfo = {
                  MatchID = self.clickdata.matchId,
                  StageID = StageID,
                  UserCnt = self.clickdata.currentEntryNum,
                  Score = 0 } })
    self.isHide = true
    ModuleCache.ModuleManager.hide_module("public", "bisai")
end

function BiSaiModule:tuisai_deal()
    print("退赛成功")
    self.havebaoming = false
    if (TableManager.loginClientConnected) then
        TableManager:disconnect_login_server()
    end
    if self.view then
        self:subscibe_time_event(1.2, false, 0):OnComplete(function(t)
            self:get_bisai_list(self.id)
        end)
        if self.exitClick == "Close" then
            self.view:signUpView(false)
        else
            self.view:tuisai_success()
        end

    end
    self:dispatch_package_event("Event_Package_RefreshUserInfo")
end

function BiSaiModule:on_update()
    if self.isHide then
        return
    end
    if (self.havebaoming) then
        if ((not self.lastPingTime) or (self.lastPingTime + 3 < Time.realtimeSinceStartup)) then
            self.lastPingTime = Time.realtimeSinceStartup
            if (TableManager.loginClientConnected) then
                TableManager:request_ping()
            end
            --if self.id and self.view then
            --    self:get_bisai_list(self.id)
            --end

        end

        if TableManager.loginClientConnected and self.modelData.loginClient and self.modelData.loginClient.clientConnected and (self.modelData.loginClient.lastReceivePackTime + 15 < Time.realtimeSinceStartup) then
            TableManager:heartbeat_timeout_reconnect_login_server()
        end
    end
    if (self.id and self.view and ((self.lastUpdateTime and self.lastUpdateTime + 30 < Time.realtimeSinceStartup) or not self.lastUpdateTime)) then
        print("更新比赛列表")
        self.lastUpdateTime = Time.realtimeSinceStartup

        if self.id and self.view then
            self:get_bisai_list(self.id)
        end

    end
end

function BiSaiModule:matchid2Clickid(data)
    local index = 0
    if not self.matchData then
        return 0
    end
    for i = 1, #self.matchData do
        if self.matchData[i].matchId == data.matchId then
            --and self.matchData[i].stageNum == stageNum
            index = i
            self.matchData[index].currentEntryNum = data.currentEntryNum
        end
    end
    return index, self.matchData[index]
end

function BiSaiModule:reconnet_match(id,stagenum)
    if (TableManager.loginClientConnected) then
        TableManager:disconnect_login_server()
    end
    TableManager:matching_enter(self.modelData.roleData.userID,
            self.modelData.roleData.password, id,stagenum)
end

function BiSaiModule:sureExit()
    ModuleCache.ModuleManager.show_public_module("alertdialog"):show_other_confirm_cancel(
            "您报名的比赛即将开始，真的要狠心离开吗？",
            function()
                --退赛
                if (TableManager.loginClientConnected) then
                    TableManager:request_matching_withdraw(self.clickdata.matchId, self.clickdata.stageNum, self.modelData.roleData.userID)
                else
                    TableManager:matching_enter(self.modelData.roleData.userID,self.modelData.roleData.password, self.clickdata.matchId, self.clickdata.stageNum)
                end

            end, nil, true, "退赛", "取消")
end

function BiSaiModule:request_baoming(data)
    local type = data.entryConditions[1].compareType
    local can = true
    if type == 2 then
        can = false
    end
    for i = 1, #data.entryConditions do
        local num = 0
        if data.entryConditions[i].entryFeeType == 1 then
            num = self.modelData.roleData.cards
        elseif data.entryConditions[i].entryFeeType == 5 then
            num = self.modelData.roleData.gold
        end
        if type == 1 then
            if num < data.entryConditions[i].entryFeeNum then
                can = false
            end
        else
            if num >= data.entryConditions[i].entryFeeNum then
                can = true
            end
        end
    end
    if can then
        TableManager:matching_signup(self.modelData.roleData.userID, self.modelData.roleData.password, data.matchId)
        --TableManager:start_enter_gold_matching(self.modelData.roleData.userID, self.modelData.roleData.password,
        --        nil, data.matchId)
    else
        if data.entryConditions[1].entryFeeType == 1 then
            ModuleCache.ModuleManager.show_public_module("alertdialog"):show_other_confirm_cancel(
                    "报名费不足，是否去充值？",
                    function()
                        ModuleCache.ModuleManager.show_module("public", "shop", 2)

                    end, nil, true, "充值", "取消", "钻石不足")
        else
            ModuleCache.ModuleManager.show_public_module("alertdialog"):show_other_confirm_cancel(
                    "报名费不足，是否去充值？",
                    function()
                        ModuleCache.ModuleManager.show_module("public", "shop", 1)

                    end, nil, true, "充值", "取消", "金币不足")
        end

    end


end

function BiSaiModule:request_baoming_data(data)
    print_table(data, "=======比赛数据")
    if data.isUserEntry then
        TableManager:matching_enter(self.modelData.roleData.userID, self.modelData.roleData.password, data.matchId, data.stageNum)
    end
    data.serviceTimeSecond = data.serviceTimeSecond + os.time() - self.localGetDataTimeStamp  --服务器时间戳加上过去的真实时间
    self.view:baoming(data, 2)
    self:get_maxrank(data.matchId)
    self.view:signUpView(true)
end

function BiSaiModule:reconnect_baoming(info)
    --判断报名条件
    --可以报名
    self.view:baoming(info, 1)
    self:get_maxrank(info.matchId)
    self.view:signUpView(true, true)

end

function BiSaiModule:yuyue(info)
    --可以预约
    ModuleCache.ModuleManager.show_public_module("alertdialog"):show_other_confirm_cancel(
            "<color=red>" .. info.matchName .. "</color>比赛将于\n" .. info.entryStartTime .. "\n开启报名，是否预约？",
            function()
                self:reservation(info.matchId, info.stageNum, info.entryStartTimeSecond, info.matchName, info.serviceTimeSecond)

            end, nil, true, "确定", "取消")
end


--获取比赛列表
function BiSaiModule:get_bisai_list(id, fun)
    local addStr = "match/getMatchs?"
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        showModuleNetprompt = false,
        params = {
            uid = self.modelData.roleData.userID,
            matchType = id,
            gameId = AppData.get_app_and_game_name()
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            self.localGetDataTimeStamp = os.time()
            self.matchData = retData.data
            self.view:viewList(retData.data)
            self:refreshSignup(self.matchData)
            if fun then
                fun(retData.data)
            end
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end

function BiSaiModule:refreshSignup(matchData)
    if self.clickdata then
        for _, v in pairs(matchData) do
            if v.matchId == self.clickdata.matchId then
                self.view:refreshSignupNum(v.currentEntryNum)
            end
        end
    end

end

--获取比赛列表
function BiSaiModule:get_user_matching_list(fun)
    local addStr = "match/getUserMatchingList?"  --POST /match/getUserMatchingList
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        showModuleNetprompt = false,
        params = {
            uid = self.modelData.roleData.userID,
            gameId = AppData.get_app_and_game_name()
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            if fun then
                fun(retData.data)
            end
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end

function BiSaiModule:getInBisai()
end



--获取最高排名 GET /match/getUserMatchMaxRank  int
function BiSaiModule:get_maxrank(id)
    local addStr = "match/getUserMatchMaxRank?"
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        showModuleNetprompt = false,
        params = {
            uid = self.modelData.roleData.userID,
            matchId = id
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            self.view:maxRank(retData.data)
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end

--预约 GET /match/preEntry  bool
function BiSaiModule:reservation(id, stage, time, name, servertime)
    local addStr = "match/preEntry?"
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        --showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            matchId = id,
            stageNum = stage
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("预约成功！")
            self:get_bisai_list(self.id)
            local t = time - servertime
            --设置闹钟
            GameSDKInterface:SetAlarm(time * 1000, "您预约的" .. name .. "开始报名了")
            CSmartTimer:Subscribe(t, false, 1):OnComplete(function(t)
                ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button(
                        "您预约的<color=red>" .. name .. "</color>比赛已经开始报名啦！名额有限，快去报名吧！")
                --震动
                ModuleCache.GameSDKInterface:ShakePhone(500)
            end)
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end
--领奖 GET /match/receivesAward  bool
function BiSaiModule:receive_award(id)
    local addStr = "match/receivesAward?"
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        showModuleNetprompt = false,
        params = {
            uid = self.modelData.roleData.userID,
            resultId = id
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then

        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end

function BiSaiModule:getmatchbyid(id, stagenum, fun)
    local addStr = "match/getById?"
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        showModuleNetprompt = false,
        params = {
            uid = self.modelData.roleData.userID,
            matchId = id
        }
    }
    if stagenum then
        requestData.params.stageNum = stagenum
    end
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            fun(retData.data)
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end

function BiSaiModule:on_destroy()
    --self:close_deal()
end

function BiSaiModule:close_deal()
    if self.modelData.hallData.normalGameName then
        ModuleCache.GameManager.change_game_by_gameName(self.modelData.hallData.normalGameName)
        ModuleCache.JpushManager().setTag()
        self.modelData.hallData.normalGameName = nil
    end
end

return BiSaiModule



