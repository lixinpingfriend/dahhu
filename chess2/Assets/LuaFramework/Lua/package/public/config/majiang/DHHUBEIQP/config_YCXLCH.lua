local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --宜昌血流成河
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":3",toggleType = 1,toggleTitle = "3局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":6",toggleType = 1,toggleTitle = "6局",toggleIsOn = true},
                    --{disable = false,json = "\"roundCount\":16",toggleType = 1,toggleTitle = "16局",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "人数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"PlayerNum\":4",toggleType = 1,toggleTitle = "4人玩法",toggleIsOn = true},
                    --{disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "3人玩法",toggleIsOn = false},
                    --{disable = false,json = "\"PlayerNum\":2",toggleType = 1,toggleTitle = "2人玩法",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "漂分:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"Piao\":1",toggleType = 1,toggleTitle = "漂1",toggleIsOn = true},
                    {disable = false,json = "\"Piao\":2",toggleType = 1,toggleTitle = "漂2",toggleIsOn = false},
                    {disable = false,json = "\"Piao\":3",toggleType = 1,toggleTitle = "漂3",toggleIsOn = false},
                    {disable = false,json = "\"Piao\":4",toggleType = 1,toggleTitle = "漂4",toggleIsOn = false},
                    {disable = false,json = "\"Piao\":5",toggleType = 1,toggleTitle = "漂5",toggleIsOn = false},
                    {disable = false,json = "\"Piao\":0",toggleType = 1,toggleTitle = "不漂",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"HuanSanZhang\":true",toggleType = 2,toggleTitle = "换三张",toggleIsOn = true,clickTip = "勾选后有换三张流程"},
                    {disable = false,json = "\"QiSanZhang\":true",toggleType = 2,toggleTitle = "弃三张",toggleIsOn = true,clickTip = "勾选后有弃三张流程"},
                }
            }
        },
        {
            tag = { togglesTile = "少人:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"StartNow\":true", toggleType = 2, toggleTitle = "允许少人时提前开局", toggleIsOn = true },
                }
            }
        },
        {
            tag = { togglesTile = "定位:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"CheckIPAddress\":true", toggleType = 2, toggleTitle = "相同IP检测", toggleIsOn = false },
                    { disable = false, json = "SafeDistance", toggleType = 2, toggleTitle = "GPS检测", toggleIsOn = false ,dropDown = "50,100,300", dropDefault = 1,dropAddStr = "米"
                    ,addJson = "\"NeedOpenGPS\":true",clickTip = "距离小于X米的玩家不能加入房间"},
                }
            }
        },
        {
            tag = {togglesTile = "",rowNum = 4, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"PayType\":1",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"PayType\":0",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false},
                    {disable = false,json = "\"PayType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            local prices =
            {
                ["3"] = 
                {
                    ["12"] = 4,["13"] = 4,["14"] = 4,
                    ["02"] = 8,["03"] = 12,["04"] = 16,
                    ["22"] = 8,["23"] = 12,["24"] = 16,
                },
                ["6"] = 
                {
                    ["12"] = 8,["13"] = 8,["14"] = 8,
                    ["02"] = 16,["03"] = 24,["04"] = 32,
                    ["22"] = 16,["23"] = 24,["24"] = 32,
                },
                ["16"] = 
                {
                    ["12"] = 20,["13"] = 20,["14"] = 20,
                    ["02"] = 40,["03"] = 60,["04"] = 80,
                    ["22"] = 40,["23"] = 60,["24"] = 80,
                },
            }
            return prices[roundCount .. ""][payType .. "" .. playerCount]
        end,

        IsOpenStartNow = true, ---打开提前开局按钮

        isXueLiuCH = true,
        pnShowResult = true,
        wanfaCustomShow = true,
        view = "tableycxueliuchenghe_view",
        controller = "tableycxueliuchenghe_controller",
        use3dcontroller = true,
        table3dStyles = {1,2},
        isShowTingDefValue = 0,
        normalResultType = "gameresultxueliu",
    },
}


ConfigChild.GoldRule = {
    {disable = false,json = "ZiMoJiaDi:true",toggleType = 1,toggleTitle = "自摸加底",toggleIsOn = true,clickTip = "自摸胡牌时加1倍底分"},
    {disable = false,json = "ZiMoJiaDi:false",toggleType = 1,toggleTitle = "自摸加番",toggleIsOn = false,clickTip = "自摸胡牌时加1番"},
    {disable = false,json = "DianGangHua:true",toggleType = 1,toggleTitle = "算点炮",toggleIsOn = true,clickTip = "点杠杠上花胡牌只有点杠玩家出分"},
    {disable = false,json = "DianGangHua:false",toggleType = 1,toggleTitle = "算自摸",toggleIsOn = false,clickTip = "点杠杠上花胡牌算自摸三家都要出分"},
    {disable = false,json = "HuanSanZhang:true",toggleType = 2,toggleTitle = "换三张",toggleIsOn = true,clickTip = "勾选后有换三张流程"},
    {disable = false,json = "MenQingZhongZhang:true",toggleType = 2,toggleTitle = "门清中张",toggleIsOn = false,clickTip = "勾选后有门清中张算分"},
    {disable = false,json = "TianDiHu:true",toggleType = 2,toggleTitle = "天地胡",toggleIsOn = false,clickTip = "勾选后有天胡地胡算分"},
    {disable = false,json = "DaiYaoJiuJiang:true",toggleType = 2,toggleTitle = "带幺九将对",toggleIsOn = false,clickTip = "勾选后有幺九和将对算分"},
    {disable = false,json = "FengDing:2",toggleType = 1,toggleTitle = "2番封顶",toggleIsOn = false},
    {disable = false,json = "FengDing:3",toggleType = 1,toggleTitle = "3番封顶",toggleIsOn = true},
    {disable = false,json = "FengDing:4",toggleType = 1,toggleTitle = "4番封顶",toggleIsOn = false},


}

function ConfigChild:PlayRule(playRule)
    if playRule and type(playRule) == "table" then
        local desc = ""
        for i, j in pairs(playRule) do
            --hasKing false
            local v = tostring(j)
            local json = i .. ":" .. v
            local tem = ""
            for n = 1, #ConfigChild.GoldRule do
                if json == ConfigChild.GoldRule[n].json then
                    tem = ConfigChild.GoldRule[n].toggleTitle
                end
            end
            if tem ~= "" then
                desc = desc .. "，" .. tem
            end
        end
        if desc ~= "" then
            desc =string.sub(desc,4)
        end
        return desc
    else
        return ""
    end
end

ConfigChild.PlayRuleText = {
    [[血流换三张,4番封顶]]
}

ConfigChild.HowToPlayGoldTexts =
{
    [[<size=32><color=#004f3c>一.麻将数量</color></size>
    <size=28>
    1）麻将共108张牌，包括：万、条、筒
    </size>
    
    <size=32><color=#004f3c>二.基础规则</color></size>
    <size=28>
    1）可碰，可杠，不可吃
    2）过碰惩罚：有过碰惩罚
    3）必须缺门才能胡牌，开局无定缺
    4）有一炮多响
    5) 坐庄规则：第一局房主坐庄；上一局最先胡牌的人为庄家，若此时是一炮多响则点炮玩家为庄家；若无任何人胡牌则逆时针轮庄
    </size>
    
    <size=32><color=#004f3c>三.胡牌规则</color></size>
    <size=28>
    1）可以自摸胡，也可以接炮胡
    2）可抢杠胡
    3）不可天胡
    4) 一圈内对方打出的牌能胡却没有胡，则在未经过自己时再次出现可接炮胡的牌时也都不可以胡牌
    5）刮风下雨
               a)刮风（明杠）
               b)下雨（暗杠）
    6) 查大叫:当牌局结束，检查牌局内未胡牌玩家听牌状态
    7) 捉花猪:牌局结束时，手中有3门牌时，与查叫互斥，优先级高于查叫
    </size>
    
    <size=32><color=#004f3c>四.计分规则</color></size>
    <size=28>
    1）明杠：1番
    2）补杠：每人1番
    3）暗杠：每人2番
    4）基本胡：1番
    5）对对胡：3番
    6）清一色：6番
    7）清一色对对胡：9番
    8）门清：1番
    9）一个漂: 2番
    </size>]]
}


ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1）麻将共108张牌，包括：万、条、筒
</size>

<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）可碰，可杠，不可吃
2）过碰惩罚：有过碰惩罚
3）必须缺门才能胡牌，开局无定缺
4）有一炮多响
5) 坐庄规则：第一局房主坐庄；上一局最先胡牌的人为庄家，若此时是一炮多响则点炮玩家为庄家；若无任何人胡牌则逆时针轮庄
</size>

<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）可以自摸胡，也可以接炮胡
2）可抢杠胡
3）不可天胡
4) 一圈内对方打出的牌能胡却没有胡，则在未经过自己时再次出现可接炮胡的牌时也都不可以胡牌
5）刮风下雨
           a)刮风（明杠）
           b)下雨（暗杠）
6) 查大叫:当牌局结束，检查牌局内未胡牌玩家听牌状态
7) 捉花猪:牌局结束时，手中有3门牌时，与查叫互斥，优先级高于查叫
</size>

<size=32><color=#004f3c>四.计分规则</color></size>
<size=28>
1）明杠：1番
2）补杠：每人1番
3）暗杠：每人2番
4）基本胡：1番
5）对对胡：3番
6）清一色：6番
7）清一色对对胡：9番
8）门清：1番
9）一个漂: 2番
</size>]]
}

return ConfigChild
