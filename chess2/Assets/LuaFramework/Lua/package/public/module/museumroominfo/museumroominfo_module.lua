






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local MuseumRoomInfoModule = class("museumroominfoModule", ModuleBase)


-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local WechatManager = ModuleCache.WechatManager
local Util = Util
local GameManager = ModuleCache.GameManager
local TableManager = TableManager

function MuseumRoomInfoModule:initialize(...)
    ModuleBase.initialize(self, "museumroominfo_view", nil, ...)

    self.data = nil;
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function MuseumRoomInfoModule:on_module_inited()

end


function MuseumRoomInfoModule:on_click(obj, arg)
    print(obj.name)
    self._shareAppDownloadLinkUrlToTimeline = false
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "BgClose" then
        ModuleCache.ModuleManager.hide_module("public", "museumroominfo")
    elseif obj.name == "ButtonJoinRoom" then
        ModuleCache.ModuleManager.hide_module("public", "museumroominfo")
        if self.data.data.roleFull == 0 then -- 房间人满了
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("房间已满。")
        else
            self.data:callback()
        end
    elseif obj.name == "ButtonDismiss" then
        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("您是否确定解散该房间？ （解散后该房间所有人都会被踢出房间）"), function()
            self:disbandRoom(self.data.data.roomId)
        end, nil)
    elseif obj.name == "ButtonShare" then
        self:inviteWeChatFriend()
    end
end

function MuseumRoomInfoModule:inviteWeChatFriend()
    self.shareData = { }
    self.shareData.userID = self.modelData.roleData.userID
    self.shareData.roomType = self.data.data.roomType
    self.shareData.type = 2
    self.shareData.parlorId = self.data.museumData.orginalParlorNum .. string.format("%06d",ModuleCache.GameManager.curGameId)
    if  not self.data.museumData.masterParlorId then
        self.shareData.roomId = self.data.data.roomId
    else
        self.shareData.roomId = self.data.museumData.orginalParlorNum
    end

    self.shareData.parlorBoxId = self.data.data.boxId
    self.shareData.launchRoundStatus = self.data.museumData.launchRoundStatus

    --TODO XLQ 亲友圈房间信息界面分享不需要显示几缺几
    --self.shareData.totalPlayer = self.data.museumData.playerCount
    --self.shareData.curPlayer = #self.data.data.players
    --self.shareData.totalGames = self.data.museumData.roundCount
    --self.shareData.comeIn = false   --等袁浩跟他们确认

    local playRule = TableUtil.convert_rule(self.data.data.boxData.playRule)

    local gameName = ""
    if playRule.gameName and playRule.gameName ~= "" then
        gameName = playRule.gameName
    else--有得rule里没有 playRule.gameName
        local wanfaType = Config.GetWanfaIdx(playRule.GameType)
        gameName = Config.get_create_name(wanfaType)
    end

    self.shareData.gameName_full = gameName
    --print("-------------self.shareData.gameName_full:",self.shareData.gameName_full)

    ModuleCache.ShareManager().shareAppDownload(self.shareData, false)
end

function MuseumRoomInfoModule:disbandRoom(roomId)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .."parlor/room/dismiss?",
        params = {
            uid = self.modelData.roleData.userID,
            parlorId = self.data.museumData.id,
            roomId =roomId
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        self:dispatch_module_event("museumroominfo_to_chessmuseum", "Event_Update_roomList",self.data.museumData.parlorNum)

        ModuleCache.ModuleManager.hide_module("public", "museumroominfo")
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)

end

function MuseumRoomInfoModule:on_show(data)
    self.data = data;
    print_table(data,"^^^^^^^^MuseumRoomInfoModule^^^^^^^^^^^^")

    self.view:init_view(self.data)
end

return MuseumRoomInfoModule



