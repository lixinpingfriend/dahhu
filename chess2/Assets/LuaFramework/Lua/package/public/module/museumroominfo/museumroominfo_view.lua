
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local MuseumRoomInfoView = Class('museumroominfoView', View)

local ModuleCache = ModuleCache
local ViewUtil = ModuleCache.ViewUtil;
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local TableUtil = TableUtil

function MuseumRoomInfoView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/museumroominfo/public_museumroominfo.prefab", "Public_MuseumRoomInfo", 1)
    View.set_1080p(self)

    self.buttonShare = GetComponentWithPath(self.root, "Center/Child/bottom/ButtonShare", ComponentTypeName.Button)
    self.buttonDismiss = GetComponentWithPath(self.root, "Center/Child/bottom/ButtonDismiss", ComponentTypeName.Button)
    self.buttonJoinRoom = GetComponentWithPath(self.root, "Center/Child/bottom/ButtonJoinRoom", ComponentTypeName.Button)


    self.titleTex = GetComponentWithPath( self.root, "Background/DialogBg/Image/TextTitle",ComponentTypeName.Text)
    self.roomNumberTex = GetComponentWithPath( self.root, "Center/Child/panel/RoomNumber/text",ComponentTypeName.Text)
    self.roomTitleTex = GetComponentWithPath( self.root, "Center/Child/panel/RoomRound",ComponentTypeName.Text)
    self.roomRoundTex = GetComponentWithPath( self.root, "Center/Child/panel/RoomRound/text",ComponentTypeName.Text)
    self.roomTimeTex = GetComponentWithPath( self.root, "Center/Child/panel/RoomTime/text",ComponentTypeName.Text)
    self.roomWanFaTex = GetComponentWithPath( self.root, "Center/Child/panel/RoomWanFa/text",ComponentTypeName.Text)

    self.playerItems = {}
    for i =1, 6 do
        self.playerItems[i] =  GetComponentWithPath( self.root, "Center/Child/panel/Players/item ("..i..")",ComponentTypeName.Transform).gameObject
    end
end

function MuseumRoomInfoView:init_view(data)
    self.data = data
    local data = data.data

    local wanfaName = ""
    local ruleName = ""
    local renshu = 4

    local playRuleString = data.playRule
    if data.playRule and type(data.playRule) == "userdata" then
        playRuleString = data.boxData.playRule
    end


    local rule = ModuleCache.Json.decode(playRuleString)
    local _ruleTab = rule
    rule.PayType = -1
    rule = ModuleCache.Json.encode(rule)
    wanfaName,ruleName,renshu = TableUtil.get_rule_name(rule , false, data.boxData.gameId)

    self.roomWanFaTex.text = ruleName
    self.buttonDismiss.gameObject:SetActive(false)

    if tonumber(data.roomId) <100000 or tonumber(data.roomId) > 9999999 then
        self.roomNumberTex.text = "随机匹配"-- data.roomId.."(不可解散)"
    else
        self.roomNumberTex.text = data.roomId
        if self.data.museumData.playerRole == "OWNER" or self.data.museumData.playerRole == "ADMIN" then
            self.buttonDismiss.gameObject:SetActive(true)
        end
    end
    if _ruleTab.gameId == "DHLNQP_YKMJ" or _ruleTab.GameID == "DHLNQP_YKMJ" then -- 营口麻将显示圈数
        self.roomTitleTex.text = "圈数:"
    else
        self.roomTitleTex.text = "局数:"
    end

    self.roomRoundTex.text = data.curRound.."/"..data.roundCount
    self.titleTex.text =  self.data.museumData.curBoxData.wanfaName
    if data.playedSecs and type(data.playedSecs) ~= "userdata" then
        self.roomTimeTex.transform.parent.gameObject:SetActive(true)
        if  data.playedSecs ~= 0 then
            if data.playedSecs >= 3600*24 then-- XX天XX小时
                self.roomTimeTex.text =  string.format("%d天%d小时", data.playedSecs/86400, data.playedSecs%86400/3600)
            elseif data.playedSecs >= 3600 then--XX时XX分
                self.roomTimeTex.text =  string.format("%d小时%d分", data.playedSecs/3600, data.playedSecs%3600/60)
            else--XX分XX秒
                self.roomTimeTex.text =  string.format("%d分%d秒", data.playedSecs/60, data.playedSecs%60)
            end
        else
            self.roomTimeTex.text =  "未开始"
        end
    else
        self.roomTimeTex.transform.parent.gameObject:SetActive(false)
    end



    for i =1, #self.playerItems do
        if i <= #data.players then
            local head = GetComponentWithPath( self.playerItems[i], "mask/Head",ComponentTypeName.Image)
            local nick = GetComponentWithPath( self.playerItems[i], "mask/Image/Name",ComponentTypeName.Text)
            local score = GetComponentWithPath( self.playerItems[i], "score",ComponentTypeName.Text)
            local id = GetComponentWithPath( self.playerItems[i], "id",ComponentTypeName.Text)

            self:image_load_sprite(head, data.players[i].headImg)
            nick.text =  data.players[i].playerName
            id.text = data.players[i].userId

            if data.players[i].score and type(data.players[i].score) ~= "userdata" then
                if data.curRound == 0 then
                    score.text = "未开始"
                    score.color = Color.New(153/255, 80/255, 4/255, 1)
                else
                    local _score = tonumber(data.players[i].score)
                    if  math.floor(_score) < _score then
                        score.text = string.format("%0.1f",data.players[i].score)
                    else
                        score.text =  data.players[i].score
                    end

                    if tonumber(data.players[i].score) < 0 then
                        score.color = Color.New(42/255, 174/255, 1/255, 1)
                    else
                        score.color = Color.New(237/255, 47/255, 39/255, 1)
                        score.text = "+"..score.text
                    end
                end
            else
                score.text =""
            end
        end
        self.playerItems[i]:SetActive(i <= #data.players)
    end
end



return MuseumRoomInfoView