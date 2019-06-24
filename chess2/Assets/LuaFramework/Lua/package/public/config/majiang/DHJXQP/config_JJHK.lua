local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --九江湖口
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
                    {disable = false,json = "\"KeHu\":true",toggleType = 2,toggleTitle = "4炮可胡",toggleIsOn = true,clickTip = "勾选后胡牌需要满足4炮以上的条件，不勾选则无限制。"},
                    {disable = false,json = "\"DieJia\":true",toggleType = 2,toggleTitle = "豪华与潇洒叠加",toggleIsOn = false,clickTip = "勾选后豪华分与潇洒分将叠加。"},
                }
            }
        },
        {
            tag = {togglesTile = "加买:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"JiaMai\":0",toggleType = 1,toggleTitle = "不加买",toggleIsOn = true,},
                    {disable = false,json = "\"JiaMai\":5",toggleType = 1,toggleTitle = "加买5",toggleIsOn = false,},
                    {disable = false,json = "\"JiaMai\":10",toggleType = 1,toggleTitle = "加买10",toggleIsOn = false,},
                    {disable = false,json = "\"JiaMai\":20",toggleType = 1,toggleTitle = "加买20",toggleIsOn = false,},
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
            return Config.caculate_price_jjhk(roundCount, playerCount, payType, bankerType)
        end,
        isJJHK = true,
        isTablePop = true,
        headTag = {
            serverJson = "PiaoNum",
            localJson =  "Piao",
            zeroJson = "不买",
            preJson = "买",
        },
        isShowPiao = true,
        PaoTitles = "不买|买",
    },
}

ConfigChild.HowToPlayTexts =
{
    [[<size=32><color=#004f3c>一.基础规则</color></size>
<size=28>
1）可以碰，明杠，暗杠，不可以吃.
2）可以一炮多响.
3）麻将共120张牌，包括，万，条，筒，字（中发白）.
4）首局房主坐庄，之后谁胡谁庄，一炮多响、一杠多抢时，第一胡牌人坐庄.
</size>
<size=32><color=#004f3c>二.胡牌规则</color></size>
<size=28>
1）胡牌方式有两种，可自摸胡牌，也可以接炮胡.
2）过胡惩罚：过胡落地张
3）杠随胡走：只有胡牌的杠才算杠分
4）补花：发财算花牌，一张一炮，一个人补齐四张发财，则算10炮.
</size>
<size=32><color=#004f3c>三.计分规则</color></size>
<size=28>
1）点炮，点炮者出分，自摸，三家出分.
2）胡牌：+1炮.
3）自摸：+1炮.
4）单张：+3炮.
5）门清：+1炮.
6）天胡：+10炮.
7）地胡：+10炮.
8）碰碰胡：+15炮.
9）门清碰碰胡：+25炮.
10）清一色：+20炮.
11）凑一色：+15炮.
12）七对：+20炮.
13）豪华七对：+30炮.
14）双豪华七对：+40炮.
15）三豪华七对：+50炮.
16）潇洒：+10炮.
17）潇洒滚N滚：+N*10炮.
18）七仙女：+100炮.
19）一条龙：+15炮.
20）全求人：+10炮.
21）杠开：+10炮.
22）杠上流泪：+10炮.
23）抢杠胡：+10炮.
24）海底捞月：+10炮.
25）海底放炮：+10炮.
26）红旗飘飘：+10炮.
27）3红中：+1或+2炮.
28）3白板：+1或+2炮.
29）一条龙：+3分.
30）普通明杠：+1炮.
31）普通暗杠：+2炮.
32）白板、红中明杠：+3炮.
33）白板、红中暗杠：+4炮.
</size>]]
}

return ConfigChild
