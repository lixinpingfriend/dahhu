local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --庐江麻将
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
        isDingQue = true,
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,

    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1）麻将共116张牌，包括：万、条、筒，及4个红中
</size>

<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）可碰牌，可开杠，不能吃牌
2）胡牌需要缺一门，且同一门必须满足8只以上
3）坐庄:庄家胡牌时连庄，其他情况下轮庄;
4）出分:一家点炮时，点炮者出分;一家自摸时，剩余三家都要出分;
5）过胡惩罚:一圈内对方打出的牌能胡却没有胡，则在未经过自己时再次
           出现可接炮胡的牌时也都不可以胡牌;
6）不可胡牌型:七小对牌型不可胡牌;
7）不可以一炮多响;
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
1）平胡:1分;
2）混一色:2分;
3）明杠:1分;
4）暗杠:2分;
5) 清一色：10分;
6）对对胡：2分,即碰碰胡;
7）压当：1分，卡、边、单调胡，统称压当;
8）不求人：1分，即门清;
9）顶九：2分，胡牌时同一门组合出123456789的牌型;
10）断幺：2分，胡牌时没有19跟风牌;
11）幺九头：2分，胡牌时牌型中有1或9，风牌不算;
12）八支:8张起算1分，每多一张加1分;
13）豹子：每有一个加1分，手中刻才算;
14）五同：5张相同的数字起算1分，每多一张加1分;
15）明四合：1分，落地碰加手中的顺组合成111,123;
16）暗四合：2分，手中刻和手中顺组成111,123;
17）杠上开花：10分;
</size>]]
}

return ConfigChild
