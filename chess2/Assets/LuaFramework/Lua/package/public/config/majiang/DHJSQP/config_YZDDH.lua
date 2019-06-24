local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --扬州麻将
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "",toggleType = 1,toggleTitle = "4局",toggleIsOn = false},
                    {disable = false,json = "",toggleType = 1,toggleTitle = "8局",toggleIsOn = true},
                    {disable = false,json = "",toggleType = 1,toggleTitle = "16局",toggleIsOn = false},
                },
            }
        },
        { 
            tag = {togglesTile = "人数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"PlayerNum\":4",toggleType = 1,toggleTitle = "4人玩法",toggleIsOn = true},
                    {disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "3人玩法",toggleIsOn = false},
                }
            }
        },
        { 
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"JinYuanZi\":true",toggleType = 1,toggleTitle = "进园子",toggleIsOn = false},
                    {disable = false,json = "\"JinYuanZi\":false",toggleType = 1,toggleTitle = "紧淌",toggleIsOn = true},
                },
                {
                    {disable = false,json = "\"YouLaiZi\":true",toggleType = 2,toggleTitle = "带配子",toggleIsOn = true,clickSmallShow = "3_3"},
                    {disable = false,json = "\"BuKeJiePao\":false",toggleType = 2,toggleTitle = "配子可点炮",toggleIsOn = false,smallShow = "3_3",smallShowType = 1},
                },
                {
                    {disable = false,json = "\"QiXiaoDui\":true",toggleType = 2,toggleTitle = "带七对",toggleIsOn = false},
                    {disable = false,json = "\"YiTiaoLong\":true",toggleType = 2,toggleTitle = "一条龙",toggleIsOn = false},
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
            return Config.caculate_price2_2(roundCount, playerCount, payType, bankerType)
        end,
        laiziTagTitle = "配子",
        laiziTag = "7",
    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.基础规则</color></size>
<size=28>
1)麻将共136张牌,包括:万,条,筒,风(东南西北中发白);
2)可碰,可杠,不可吃;
3)可自摸,可接炮,可以一炮多响.
</size>
<size=32><color=#004f3c>二.庄家规则</color></size>
<size=28>
1)第1局游戏房主为庄;
2)庄胡则连庄,其他情况下轮庄;
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1)满足牌型即可胡牌,无特殊规则限制;
2)带配子模式下,开房时可由选项控制手里有配子时能否接炮胡;
3)可以一炮多响;
4)可以抢杠胡,算胡牌者自摸;
</size>
<size=32><color=#004f3c>四.计分规则</color></size>
<size=28>
1)底分:2分
2)总分=底分*牌型总倍数
3)杠分:杠了就有,明杠每人1分,暗杠每人2分,接杠时放杠的输2分.
4)屁胡:1倍;
5)对对胡:2倍;
6)混一色·:2倍;
7)清一色:4倍;
8)一条龙:2倍;
9)七小对:4倍;
10)风清:紧淌模式下16倍,进园子模式下自摸赢走牌局所有人的分数.
  接炮赢走放炮者分数;
</size>
]] --扬州麻将
}

return ConfigChild
