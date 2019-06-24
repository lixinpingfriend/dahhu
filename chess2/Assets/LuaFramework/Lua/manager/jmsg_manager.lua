








local MsgTag= {}
MsgTag.groupTag = "group"
MsgTag.singleTag = "single"

--- @class JMsgManager
--- @field public msgTag MsgTag
local JMsgManager = {}



local require = require
local ModuleCache = ModuleCache
local Json        = require("cjson")
---@class msgreceiver :MsgReceiver
local MsgReceiver = require("manager.jmessage.msg_receiver")
---@class parambase : ParamBase
local ParamBase   = require("manager.jmessage.msg_param_base")
---@class paramimmg : ParamImg
local ParamImg    = require("manager.jmessage.msg_param_img")
---@class paramvoice : ParamVoice
local ParamVoice  = require("manager.jmessage.msg_param_voice")
---@class paramfile : ParamFile
local ParamFile   = require("manager.jmessage.msg_param_file")
JMsgManager.msgTag = MsgTag

JMsgManager.isLogin = false
--JMsgManager.isLockRecv = false
JMsgManager.loginData = {}
---@class grouprecv : MsgReceiver
JMsgManager.groupReceiver = MsgReceiver:new(JMsgManager.msgTag.groupTag)
---@class singlerecv : MsgReceiver
JMsgManager.singleReceiver = MsgReceiver:new(JMsgManager.msgTag.singleTag)


function JMsgManager.recvCallback(eventName, data)
    local fun = JMsgManager[eventName]
    if fun then
        fun(data)
    end
end

-----------------------------receiver start---------------------------------------------------
---@param func function
---@param tag MsgTag
---@param isOffline boolean
function JMsgManager.addEventListener(func,tag,isOffline)
    if type(func) ~= "function" then
        print("error: addEventListener target is not a function!")
        return
    end

    JMsgManager.addGroupEvent(func,tag,isOffline)
    JMsgManager.addSingleEvent(func,tag,isOffline)
end


function JMsgManager.addGroupEvent(func,tag,isOffline)

    if type(func) ~= "function" then
        print("error: addEventListener target is not a function!")
        return
    end

    JMsgManager.groupReceiver:addEventListener(func,tag,isOffline)
end

function JMsgManager.addSingleEvent(func,tag,isOffline)

    if type(func) ~= "function" then
        print("error: addEventListener target is not a function!")
        return
    end

    JMsgManager.singleReceiver:addEventListener(func,tag,isOffline)
end

---@param func function
---@param tag MsgTag
---@param isOffline boolean
function JMsgManager.removeEventListener(func,tag,isOffline)
    JMsgManager.removeGroupEvent(func,tag,isOffline)
    JMsgManager.removeSingleEvent(func,tag,isOffline)
end

function JMsgManager.removeGroupEvent(func,tag,isOffline)
    JMsgManager.groupReceiver:removeEventListener(func, tag,isOffline)
end

function JMsgManager.removeSingleEvent(func,tag,isOffline)
    JMsgManager.singleReceiver:removeEventListener(func, tag,isOffline)
end

function JMsgManager.removeAllListener(tag)
    JMsgManager.removeGroupAllEvent(tag)
    JMsgManager.removeSingleAllEvent(tag)
end
function JMsgManager.removeGroupAllEvent(tag)
    JMsgManager.groupReceiver:removeAllListener(tag)
end
function JMsgManager.removeSingleAllEvent(tag)
    JMsgManager.singleReceiver:removeAllListener(tag)
end

-----------------------------receiver end---------------------------------------------------
---
---
-----------------------------proto start---------------------------------------------------
function JMsgManager.login(username,password,callback)
    print("########JMsgManager.login###",username,password)
    local params         = {}
    params.username      = username
    params.password      = password
    JMsgManager._onLogin = callback

    --if ModuleCache.GameManager.deviceIsMobile then
    --    ModuleCache.ModuleManager.show_public_module("netprompt")
    --end

    JMsgManager.sendRequest("JMessageLoginRequest", params)
end

function JMsgManager.logOut()
    JMsgManager.isLogin = false
    local params         = {}
    params.username      = "u"
    params.password      = "p"

    JMsgManager.sendRequest("JMessageLogoutRequest", params)
end

local testGetTalkstr = "["
.."]";

function JMsgManager.getGroupTalk(callback, getNum)
    if  JMsgManager.loginData.curGroupId == nil then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("未获取聊天群组ID!")
        return
    end

    if getNum and type(getNum) == "number" then
    else
        getNum = 50
        print("getGroupTalk get num set 50!")
    end

    local params = {}
    params.groupId = JMsgManager.loginData.curGroupId
    params.maxFind = getNum

    JMsgManager._onGetGroupTalk = callback

    if not ModuleCache.GameManager.deviceIsMobile then
        JMsgManager.JMessageGetGroupTalkResponse(testGetTalkstr)
        return
    end

    JMsgManager.sendRequest("JMessageGetGroupTalkRequest", params)
end

function JMsgManager.JMessageGetGroupTalkResponse(data)
    local messageArray = Json.decode(data)
    print("----------JMessageGetGroupTalkResponse--------------")
    print_table(messageArray)
    print("messageArray.leng = "..#messageArray)
    if JMsgManager._onGetGroupTalk and type(JMsgManager._onGetGroupTalk) == "function" then
        JMsgManager._onGetGroupTalk(messageArray)
    end
    JMsgManager._onGetGroupTalk = nil
end


function JMsgManager.sendGroupTextMsg(text,msgType,voiceLength, roleData, callback,time)
    -- 注销，数据被清空
    if not roleData or not roleData.userId then
        return
    end

    if JMsgManager.loginData == nil or JMsgManager.loginData.curGroupId == nil then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("发送消息前请先登录并获取亲友圈聊天群组ID!")
        return
    end
    JMsgManager._onSendGroup = callback
    local params = ParamBase:new()
    params.imUser      = JMsgManager.loginData.username
    params.headImg     = roleData.headImg
    params.gender      = roleData.gender
    params.nickname    = roleData.nickname
    params.isRedName    = roleData.isRedName
    params.userId      = roleData.userId
    params.content     = text
    params.msgType     = msgType    -- 1文字  2语音
    params.voiceLength = voiceLength    --语音长度
    params.id          = roleData.userId .. os.date("%Y-%m-%d %H:%M:%S")    --消息id
    params.isOnwer     = JMsgManager.loginData.museumData.ownerUid == roleData.userId
    params.identifier  = Util.identifier
    params.platform    = Util.platform
    params.messageCreateSeconds        = time--os.date("%Y-%m-%d %H:%M:%S")
    params.groupId     = JMsgManager.loginData.curGroupId
    print(params.imUser,params.groupId,"-------sendGroupTextMsg------------")
    if not ModuleCache.GameManager.deviceIsMobile then
        params.result  = "0"
        params.success = "true"
        params.desc    = ""
        JMsgManager.JMessageGroupCustomMsgResponse(Json.encode(params))
        return
    end

    --ModuleCache.ModuleManager.show_public_module("netprompt")

    JMsgManager.sendRequest("JMessageGroupCustomMsgRequest", params)

end

function JMsgManager.sendSingleTextMsg(text, roleData,targetUser,callback)

    --if JMsgManager.loginData == nil or JMsgManager.loginData.curGroupId == nil then
    --    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("发送消息前请先登录并获取亲友圈聊天群组ID!")
    --    return
    --end
    JMsgManager._onSendSingle = callback

    local params       = ParamBase:new()
    params.imUser      = JMsgManager.loginData.username
    params.headImg     = roleData.headImg
    params.gender      = roleData.gender
    params.nickname    = roleData.nickname
    params.userId      = roleData.userId
    params.content     = text
    params.identifier  = Util.identifier
    params.platform    = Util.platform
    params.time        = os.date("%Y-%m-%d %H:%M:%S")
    params.username    = targetUser

    if not ModuleCache.GameManager.deviceIsMobile then
        params.result  = "0"
        params.success = "true"
        params.desc    = ""
        JMsgManager.JMessageSingleCustomMsgResponse(Json.encode(params))
        return
    end

    --ModuleCache.ModuleManager.show_public_module("netprompt")

    JMsgManager.sendRequest("JMessageSingleCustomMsgRequest", params)

end


function JMsgManager.JMessageLoginResponse(data)
    ModuleCache.ModuleManager.hide_public_module("netprompt")
    local params   = Json.decode(data)

    if params.result == 0 or params.result == "0" then
        JMsgManager.isLogin = true
    end

    if JMsgManager._onLogin and type(JMsgManager._onLogin) == "function" then
        JMsgManager._onLogin(params)
    end

    JMsgManager._onLogin = nil
end

function JMsgManager.JMessageGroupCustomMsgResponse(data)
    ModuleCache.ModuleManager.hide_public_module("netprompt")
    local params   = Json.decode(data)

    print_table(params,"------------JMessageGroupCustomMsgResponse---------------")
    if JMsgManager._onSendGroup and type(JMsgManager._onSendGroup) == "function" then
        JMsgManager._onSendGroup(params)
    end

    JMsgManager._onSendGroup = nil
end

function JMsgManager.JMessageSingleCustomMsgResponse(data)
    ModuleCache.ModuleManager.hide_public_module("netprompt")
    local params   = Json.decode(data)
    print_table(params,"------------JMessageSingleCustomMsgResponse---------------")
    if JMsgManager._onSendSingle and type(JMsgManager._onSendSingle) == "function" then
        JMsgManager._onSendSingle(params)
    end

    JMsgManager._onSendSingle = nil
end

function JMsgManager.JMessageRecvGroupMsgResponse(data)
    local params = Json.decode(data)

    JMsgManager.groupReceiver:doAction(params,JMsgManager.msgTag.groupTag,false)
end

function JMsgManager.JMessageRecvSingleMsgResponse(data)
    local params = Json.decode(data)

    JMsgManager.singleReceiver:doAction(params,JMsgManager.msgTag.singleTag,false)
end

function JMsgManager.JMessageGroupOfflineMsgResponse(data)
    --local params = Json.decode(data)
    --if params.result == 0 or params.result == "0" then
    --    JMsgManager.getGroupTalk(data)
    --end
    print("------------- jmessage 收到 离线消息 ----------------")
    JMsgManager.groupReceiver:doAction(data, JMsgManager.msgTag.groupTag, true)
    JMsgManager.singleReceiver:doAction(data, JMsgManager.msgTag.singleTag, true)
end

function JMsgManager.JMessageLoginStateChangeResponse(data)
    if not JMsgManager.isLogin then
        return
    end

    local params = Json.decode(data)
    if params.offType == 70 or params.offType == "70" then
        JMsgManager.login(JMsgManager.loginData.username, JMsgManager.loginData.password, function(loginParams)

            if loginParams.result == 0 or loginParams.result == "0" then
                print("jmessage 当前聊天用户掉线自动重连成功！")
            else

                JMsgManager.isLogin = false
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("已与聊天频道断开连接！")
                print("jmessage 当前聊天用户掉线并且自动重连失败！")
            end
        end)
    else
        JMsgManager.isLogin = false
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("已与聊天频道断开连接！")
        print("jmessage 掉线了 : "..params.desc)
    end
end

function JMsgManager.TestRecvText()
    local testTxt = "{\"content\":\"这是一条测试数据！\",\"groupId\":\"10354184\",\"platform\":\"Android\",\"time\":\"2018-01-03 11:00:58\",\"headImg\":\"http://www.th7.cn/d/file/p/2016/09/12/f7ef1bbfe2db9d1913e8e8c22ffc7619.jpg\",\"nickname\":\"569\",\"userId\":\"569\",\"gender\":\"1\",\"isOnwer\":\"false\",\"identifier\":\"com.sincebestgames.dahuqipaiyouxi\",\"imUser\":\"user_test_569\",\"extras\":{}}"
    JMsgManager.groupReceiver:doAction(Json.decode(testTxt))
    JMsgManager.singleReceiver:doAction(Json.decode(testTxt))
end

-----------------------------proto end---------------------------------------------------

function JMsgManager.sendRequest(protoName,params)
    -- 有个奇怪的地方，用tojson生成的json字符串到了真机上出问题，改用字符串拼接
    --local request        = {}
    --request.protoName    = protoName
    --request.protoParams  = Json.encode(params)
    local protoParams    = Json.encode(params)
    local requestStr     = "{"
    requestStr           = requestStr.."\"protoName\":\""..protoName.."\","
    requestStr           = requestStr.."\"protoParams\":"
    requestStr           = requestStr..protoParams
    requestStr           = requestStr.."}"
    --local start,over     = string.find(requestStr, )
    --requestStr           = string.sub(requestStr, 1, over)
    --requestStr           = requestStr..request.protoParams.."}"
    print("requestStr = "..requestStr)
    ModuleCache.GameSDKInterface:SendRequestToPhone(requestStr)
end

function JMsgManager.setLoginData(username, password)
    JMsgManager.loginData.username = username
    JMsgManager.loginData.password = password
end

function JMsgManager.setCurChatRoom(groupId, museumData)
    JMsgManager.loginData.curGroupId = groupId
    JMsgManager.loginData.museumData = museumData
end

function JMsgManager.clean()
    JMsgManager.logOut()
    JMsgManager.loginData = {}
    JMsgManager.removeAllListener()
end

return JMsgManager