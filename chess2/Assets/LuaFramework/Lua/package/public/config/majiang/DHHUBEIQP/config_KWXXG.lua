local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --孝感
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":16",toggleType = 1,toggleTitle = "16局",toggleIsOn = false},
                },
            }
        },
        {
            tag = { togglesTile = "结算:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"settleType\":0", toggleType = 1, toggleTitle = "积分模式", toggleIsOn = true, refreshUI = true},
                    { disable = false, json = "\"settleType\":1", toggleType = 1, toggleTitle = "金币模式", toggleIsOn = false, goldSet = true, refreshUI = true, goldSetVal1 = 50, goldSetVal2 = 1500 },
                }
            }
        },
        {
            tag = {togglesTile = "人数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "3人玩法",toggleIsOn = true},
                    {disable = false,json = "\"PlayerNum\":2",toggleType = 1,toggleTitle = "2人玩法",toggleIsOn = false},
                }
            }
        },
        --{
        --    tag = {togglesTile = "游戏:",rowNum = 3},
        --    list =
        --    {
        --        {
        --            {disable = false,json = "",toggleType = 1,toggleTitle = "孝感8倍封顶,亮倒16倍封顶",toggleIsOn = true},
        --        }
        --    }
        --},
        {
            tag = {togglesTile = "选漂:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"YouPiao\":true",toggleType = 1,toggleTitle = "自由选漂",toggleIsOn = true,clickTip = "勾选后每局都可自由选漂分"},
                    {disable = false,json = "\"YouPiao\":false",toggleType = 1,toggleTitle = "固定选漂",toggleIsOn = false,clickTip = "勾选后只能首局选漂分"},
                }
            }
        },
        {
            tag = {togglesTile = "亮牌:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"AllLiang\":false",toggleType = 1,toggleTitle = "部分亮",toggleIsOn = true,clickTip = "勾选后只亮出胡口"},
                    {disable = false,json = "\"AllLiang\":true",toggleType = 1,toggleTitle = "全部亮",toggleIsOn = false,clickTip = "勾选后将可以选择全部亮倒"},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ZhaMa\":0",toggleType = 1,toggleTitle = "不买马",toggleIsOn = false,clickTip = "勾选后将不会买马"},
                    {disable = false,json = "\"ZhaMa\":1",toggleType = 1,toggleTitle = "亮倒自摸买马",toggleIsOn = true,clickSmallShow = "6_1",clickTip = "勾选后将只有亮倒且自摸才能买马"},
                    {disable = false,json = "\"ZhaMa\":2",toggleType = 1,toggleTitle = "自摸买马",toggleIsOn = false,clickSmallShow = "6_1",clickTip = "勾选后只要自摸就能买马"},
                },
                {
                    {disable = false,json = "\"ZiXuanMa\":true",toggleType = 1,toggleTitle = "自选买马",toggleIsOn = true,smallShow = "6_1",smallShowType = 1,clickTip = "勾选后将手动买马"},
                    {disable = false,json = "\"ZiXuanMa\":false",toggleType = 1,toggleTitle = "系统自动买马",toggleIsOn = false,smallShow = "6_1",smallShowType = 1,clickTip = "勾选后系统自动买马"},
                },
                {
                    {disable = false,json = "\"ShuKan\":true",toggleType = 2,toggleTitle = "数坎",toggleIsOn = true,clickTip = "勾选后将计算坎分"},
                    {disable = false,json = "\"Less12BuLiang\":true",toggleType = 2,toggleTitle = "少于12张不能亮",toggleIsOn = false,clickTip = "勾选后牌桌上少于12张时已听牌玩家将不能亮"},
                },
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
            tag = {togglesTile = "支付:",rowNum = 3, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"PayType\":1",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"PayType\":0",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false},
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price2_4(roundCount, playerCount, payType, bankerType)
        end,

        --IsOpenStartNow = true, ---打开提前开局按钮

        isKaWuXing = true,
        isTablePop = true,
        isShowPiao = true,
        PaoTitles = "不漂|漂1|漂2",
        headTag = {
            serverJson = "PiaoNum",
            zeroJson = "不漂",
            preJson = "漂",
        },
        goldResultType = "hubei",
        table3dStyles = {1,2},

    },
}


ConfigChild.GoldRule = {
    {disable = false,json = "PlayerNum:3",toggleType = 1,toggleTitle = "3人玩法",toggleIsOn = true},
    {disable = false,json = "PlayerNum:2",toggleType = 1,toggleTitle = "2人玩法",toggleIsOn = false},
    {disable = false,json = "YouPiao:true",toggleType = 1,toggleTitle = "自由选漂",toggleIsOn = true,clickTip = "勾选后每局都可自由选漂分"},
    {disable = false,json = "YouPiao:false",toggleType = 1,toggleTitle = "固定选漂",toggleIsOn = false,clickTip = "勾选后只能首局选漂分"},
    {disable = false,json = "AllLiang:false",toggleType = 1,toggleTitle = "部分亮",toggleIsOn = true,clickTip = "勾选后只亮出胡口"},
    {disable = false,json = "AllLiang:true",toggleType = 1,toggleTitle = "全部亮",toggleIsOn = false,clickTip = "勾选后将可以选择全部亮倒"},
    {disable = false,json = "AllPinDao:true",toggleType = 1,toggleTitle = "全频道",toggleIsOn = true,clickTip = "勾选后将是全频道规则"},
    {disable = false,json = "AllPinDao:false",toggleType = 1,toggleTitle = "半频道",toggleIsOn = false,clickTip = "勾选后将是半频道规则"},
    {disable = false,json = "ZhaMa:0",toggleType = 1,toggleTitle = "不买马",toggleIsOn = false,clickTip = "勾选后将不会买马"},
    {disable = false,json = "ZhaMa:1",toggleType = 1,toggleTitle = "亮倒自摸买马",toggleIsOn = true,clickSmallShow = "6_1",clickTip = "勾选后将只有亮倒且自摸才能买马"},
    {disable = false,json = "ZhaMa:2",toggleType = 1,toggleTitle = "自摸买马",toggleIsOn = false,clickSmallShow = "6_1",clickTip = "勾选后只要自摸就能买马"},
    {disable = false,json = "ZiXuanMa:true",toggleType = 1,toggleTitle = "自选买马",toggleIsOn = true,smallShow = "6_1",smallShowType = 1,clickTip = "勾选后将手动买马"},
    {disable = false,json = "ZiXuanMa:false",toggleType = 1,toggleTitle = "系统自动买马",toggleIsOn = false,smallShow = "6_1",smallShowType = 1,clickTip = "勾选后系统自动买马"},
    {disable = false,json = "ShuKan:true",toggleType = 2,toggleTitle = "数坎",toggleIsOn = true,clickTip = "勾选后将计算坎分"},
    {disable = false,json = "Less12BuLiang:true",toggleType = 2,toggleTitle = "少于12张不能亮",toggleIsOn = false,clickTip = "勾选后牌桌上少于12张时已听牌玩家将不能亮"},


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
    [[自由选漂,亮倒自摸可买马,自选买马]]
}

ConfigChild.HowToPlayGoldTexts =
{
    [[

<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1）麻将共84张牌，包括：条、筒，及中发白
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）可碰牌，可开杠，不能吃牌，3人一桌;
2）胡牌方式：可接炮，可自摸
3）出分:一家点炮时，点炮者出分;一家自摸时，剩余玩家都要出分;
4）过胡惩罚:一圈内对方打出的牌能胡却没有胡，则在未经过自己时再次
      出现可接炮胡的牌时也都不可以胡牌;
5）过杠惩罚:明杠必须马上杠，放弃杠后则不能再杠了;
6）可以一炮多响;
7）数坎：手上三个一样的、杠都算一坎，一坎一分，可累加;
8）少于12张不能亮：牌桌上数量少于12张时听牌玩家不能亮倒;
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）自摸:满足胡牌牌型即可;
2）接炮:满足胡牌牌型即可;
3）杠上开花:满足牌型即可;
4）杠上炮:满足牌型即可;
5）抢杠胡:满足牌型即可;
</size>
<size=32><color=#004f3c>四.计分规则</color></size>
<size=28>
1）小胡（屁胡）:1番（屁胡只能自摸，不能接炮，2番以上才能接炮）;
2）碰碰胡:2番;
3）明四归一:2番;
4）暗四归一:4番;
5)  海底捞月：2番;
6）七对：4番;
7）龙七对：8番；
8）二龙七对：16番;
9）三龙七对：32番;
10）大三元：8番;
11）小三元：4番;
12）杠上开花:2番;
13）杠上炮：2番;
14）抢杠胡：杠牌者赔胡牌者2倍胡牌分;
15）清一色：4番;
16）手抓一：4番;
17）卡五星：2番;
18）亮倒：2番;
19）杠分：明杠+1倍底分;暗杠+2倍底分;点杠+2底分;
20）漂分：输赢下注分;
21）买马分：中马点数即为几倍底分（中发白为10倍底分）;
</size>]]
}

ConfigChild.HowToPlayTexts =
{
    [[<size=32><color=#004f3c>一.麻将数量</color></size>
    <size=28>
    1）麻将共84张牌，包括：条、筒，及中发白
    </size>

    <size=32><color=#004f3c>二.基础规则</color></size>
    <size=28>
    1）可碰牌，可开杠，不能吃牌，2-3人一桌;
    2）胡牌方式：可接炮，可自摸
    3）坐庄:首局房主坐庄，谁胡谁当庄，流局不流庄，一炮多响点炮者当庄;
    4）出分:一家点炮时，点炮者出分;一家自摸时，剩余玩家都要出分;
    5）过胡惩罚:一圈内对方打出的牌能胡却没有胡，则在未经过自己时再次
               出现可接炮胡的牌时也都不可以胡牌;
    6）过杠惩罚:明杠必须马上杠，放弃杠后则不能再杠了;
    7）可以一炮多响;
    8）数坎：手上三个一样的、杠都算一坎，一坎一分，可累加;
    9）少于12张不能亮：牌桌上数量少于12张时听牌玩家不能亮倒;
    </size>

    <size=32><color=#004f3c>三.胡牌规则</color></size>
    <size=28>
    1）自摸:满足胡牌牌型即可;
    2）接炮:满足胡牌牌型即可;
    3）杠上开花:满足牌型即可;
    4）杠上炮:满足牌型即可;
    5）抢杠胡:满足牌型即可;
    </size>
    <size=32><color=#004f3c>四.计分规则</color></size>
    <size=28>
    1）小胡（屁胡）:底分1分*1番（屁胡只能自摸，不能接炮，*2番以上才能接炮）;
    2）碰碰胡:*2番;
    3）明四归一:*2番;
    4）暗四归一:*4番;
    5) 海底捞月：*2番;
    6）七对：*4番;
    7）龙七对：*8番；
    8）二龙七对：*16番;
    9）三龙七对：*32番;
    10）大三元：*8番;
    11）小三元：*4番;
    12）杠上开花:*2番;
    13）杠上炮：*2番;
    14）抢杠胡：杠牌者赔胡牌者2倍胡牌分;
    15）清一色：*4番;
    16）手抓一：*4番;
    17）卡五星：*2番;
    18）亮倒：*2番;
    19）杠分：明杠+1;暗杠+2;点杠+2;
    20）漂分：输赢下注分;
    21）买马分：中马点数即为分数（中发白为10分）;
    </size>]]
}

return ConfigChild
