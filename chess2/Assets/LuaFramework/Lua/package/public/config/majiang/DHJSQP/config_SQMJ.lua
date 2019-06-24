local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --泗洪麻将
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
            tag = { togglesTile = "玩法:", rowNum = 3 },
            list =
            {
                {
                    { disable = false, json = "\"YiPaoDuoXiang\":false", toggleType = 1, toggleTitle = "不带一炮多响", toggleIsOn = true ,clickTip="勾选后将不允许一炮多响"},
                    { disable = false, json = "\"YiPaoDuoXiang\":true", toggleType = 1, toggleTitle = "可一炮多响", toggleIsOn = false ,clickTip="勾选后将允许一炮多响"},
                },
                {
                    { disable = false, json = "\"DianZiTing\":false", toggleType = 1, toggleTitle = "报听", toggleIsOn = true ,clickTip="勾选后叫听自摸分数翻倍"},
                    { disable = false, json = "\"DianZiTing\":true", toggleType = 1, toggleTitle = "点子听", toggleIsOn = false ,clickTip="勾选后叫听后胡牌，胡的牌数字即是分数，风牌即是10分"},
                }
            },
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
            return Config.caculate_price2(roundCount, playerCount, payType, bankerType)
        end,
        isSiHong = true,
        view = "tablesihong_view"
    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.基础规则</color></size>
<size=28>
1）可以碰，明杠，暗杠，不可以吃.
2）可以一炮多响.
3）麻将共136张牌，包括，万，条，筒，风（东南西北中发白）.
</size>
<size=32><color=#004f3c>二.胡牌规则</color></size>
<size=28>
1）胡牌方式有两种，可自摸胡牌，也可以接炮胡.
2）过胡惩罚：一圈内对方打出的牌能胡却没有胡，则在未经过自己时再次
出现可接炮胡的牌时也都不可胡牌.
3）带叫听：只有胡一张时可叫听.叫听后胡牌可以获得额外奖励分
4）杠随胡走：只有胡牌的杠才算杠分
</size>
<size=32><color=#004f3c>三.计分规则</color></size>
<size=28>
1）点炮，点炮者出分，自摸，三家出分.
2）平胡：+1分.
3）自摸：+1分.
4）缺一门：+1分.
5）幺鸡：+1分.
6）七对：+2分.
7）九支：+2分.
8）清一色：+2分.
9）混一色：+1分.
10）对对胡：+1分.
11）一条龙：+3分.
12）五个头：+X分 相同数字牌张数（有几张就几分）.
13）臭张：+X分 叫听后胡牌的那张已落地张数（有几张就几分）.
14）叫听：牌型分*2（叫听后自摸胡牌*2）.
</size>]]
}

return ConfigChild
