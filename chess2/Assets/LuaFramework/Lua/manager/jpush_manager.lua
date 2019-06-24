





local ModuleCache = ModuleCache
local UnityEngine = UnityEngine
local json = require("cjson")
local ModuleEventBase = require('core.mvvm.module_event_base')
local CSmartTimer = ModuleCache.SmartTimer.instance
local tostring = tostring
--- @class JpushManager
local manager = { }
local iosTagStyle = '{"tags":[%s]}'
local iosAStyle = '{"alias":"%s"}'
local last_settag_time
local last_settag_timer
manager.data = { }
manager.taglist = { }
manager.aliaslist = { }

function manager.init(userId)
    manager.data.platform = tostring(UnityEngine.Application.platform)
    ModuleCache.GameSDKInterface:JPushInit()
    manager.data.userId = userId
    manager.setTag()
    manager.setAlias()
    ModuleCache.WechatManager.onJPushRecvMessage = manager.onRecv
    print("jpush init ok")
end

function manager.setTag()
    if not last_settag_time then
        manager._setTag()
    else
        if os.time() - last_settag_time > 11 then  --大于10秒直接设置
            manager._setTag()
        else
            if last_settag_timer then   --取消上一个定时器
                CSmartTimer:Kill(last_settag_timer)
            end
            local intervaltime = 11 - (os.time() - last_settag_time)  --间隔时间
            last_settag_timer = CSmartTimer:Subscribe(intervaltime, false, 1):OnComplete(function(t)
                manager._setTag()
            end).id
        end
    end
end

function manager._setTag()
    last_settag_time = os.time()
    local tagStr = ''
    local plus = ""
    if manager.data.platform == 'IPhonePlayer' then
        plus = '"'
    end
    if manager.taglist then
        for k, v in ipairs(manager.taglist) do
            print("OOOOOOOOOOOOOOOOOOOOv=",v,tagStr)
            tagStr = tagStr .. plus .. v .. plus .. ','

        end
        manager.taglist = {}
    end

    --tagStr = tagStr .. plus .. ModuleCache.AppData.get_url_game_name() .. plus .. ','
    if ModuleCache.GameManager.developmentMode then
        tagStr = tagStr .. plus .. 'TAG_TEST' .. plus .. ','
    end
    if manager.data.platform == 'Android' then
        tagStr = tagStr .. plus .. 'TAG_ANDROID' .. plus
    end
    if manager.data.platform == 'IPhonePlayer' then
        tagStr = tagStr .. plus .. 'TAG_IOS' .. plus
        tagStr = string.format(iosTagStyle, tagStr)
    end
    print("Jpush SetTags: ", tagStr)
    -- print("ios style",string.format(iosTagStyle,tagStr))
    ModuleCache.GameSDKInterface:JPushSetTags(tagStr)
end

function manager.setAlias(userId)
    if userId then
        manager.data.userId = userId
    else
        userId = manager.data.userId
    end
    local aliasStr = ''
    aliasStr = aliasStr .. userId
    if manager.data.platform == 'IPhonePlayer' then
        aliasStr = string.format(iosAStyle, aliasStr)
    end
    print("Jpush SetAlias: ", aliasStr)
    -- print("ios style",string.format(iosAStyle,aliasStr))
    ModuleCache.GameSDKInterface:JPushSetAlias(aliasStr)
end

function manager.setTagWithPyq(pyqId)
    manager.taglist = { }
    local pyq = pyqId
    manager.taglist[1] = pyq
    manager.setTag()
    manager.taglist = { }
end

function manager.setTagWithFellowShip(list)
    print_table(list,"*****************************".. #list)
    manager.taglist = list
    manager.setTag()
    --manager.taglist = { }
end

function manager.onRecv(data)
    print("onJPushRecvMessage", data)
    local xxoo = ModuleCache.Json.decode(data)
    print(xxoo.type,"-----------jpush_manager-------onRecv--------")
    if xxoo.type == "custom_notify" then
        return
    end

    local isNeedProcess = true

    if ModuleCache.ModuleManager.module_is_active("public", "chessmuseum") then
        ModuleCache.ModuleManager.get_module("public","chessmuseum"):dispatch_module_event("jPush_manager","jPush_recv_msg",xxoo)
    end

    if xxoo.type == "broadcast_message" then
        local content = ModuleCache.Json.decode(xxoo.message).content
        ModuleCache.ModuleManager.show_public_module("textprompt"):add_system_announce(content)
    elseif xxoo.type== "match_entry_info_change" then
        ModuleEventBase:dispatch_package_event("match_entry_info_change", ModuleCache.Json.decode(xxoo.message))

    elseif xxoo.type== "match_start_info" then
        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button(
                "您报名的比赛已经开始！请从比赛场大厅进入比赛！"               )

    elseif xxoo.type== "match_start_info" then
        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button(
        "您报名的比赛已经开始！请从比赛场大厅进入比赛！"               )

    elseif xxoo.type == "user_Info_log_change" then
        local message = ModuleCache.Json.decode(xxoo.message)
        ModuleCache.LogManager.auto_upload_log_archive(message.status)
    elseif xxoo.type == "return_activity_amount" then
        --删除活动退款推送
        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button( xxoo.message or "", function()

        end)
    elseif xxoo.type == "parlor_activity_pay" then
        --创建活动推送
        if ModuleCache.ModuleManager.module_is_active("public", "museumactive") then
            ModuleCache.ModuleManager.get_module("public","museumactive"):dispatch_module_event("jPush_manager","jPush_parlor_activity_pay",xxoo)
        end

        if ModuleCache.ModuleManager.module_is_active("public", "shoppaytype") then
            ModuleCache.ModuleManager.get_module("public","shoppaytype"):dispatch_module_event("jPush_manager","jPush_parlor_activity_pay",xxoo)
        end
    elseif xxoo.type == "sys_message_info" then

        local isHallActivity = ModuleCache.ModuleManager.module_is_active("public", "hall")
        if isHallActivity then
            ModuleCache.ModuleManager.get_module("public", "hall"):get_mail_data(true)
        end
    elseif xxoo.type == "parlor_fellowship_invite" then
        --同意联谊邀请
        if ModuleCache.ModuleManager.module_is_active("public", "museumfellowship") then
            ModuleCache.ModuleManager.get_module("public","museumfellowship"):dispatch_module_event("jPush_manager","jPush_parlor_fellowship_invite",xxoo)
        end
    else
        isNeedProcess = false
    end
    
    if not isNeedProcess then
        return
    end

    local isLogin = ModuleCache.ModuleManager.module_is_active("public", "login")
    if not isLogin and xxoo.type == "room_message" then
        local content = ModuleCache.Json.decode(xxoo.message).content
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips_redpacket(content);
    end




end
return manager