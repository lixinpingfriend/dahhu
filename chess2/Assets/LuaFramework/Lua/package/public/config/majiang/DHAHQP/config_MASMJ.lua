local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --含山
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
                    {disable = false,json = "\"ShuiFangChongShuiChuFen\":true",toggleType = 2,toggleTitle = "谁放冲谁出分",toggleIsOn = false,clickTip="勾选后放冲胡牌时只由放冲的人出分，不勾选则所有人都出分。"},
                    {disable = false,json = "\"DaiQiDui\":true",toggleType = 2,toggleTitle = "带七对",toggleIsOn = false,clickTip="勾选后本局可胡七小对且加对应分数，不勾选则不能胡七小对。"},
                    {disable = false,json = "\"DaiShiSanBuKao\":true",toggleType = 2,toggleTitle = "带十三不靠",toggleIsOn = false,clickTip="勾选后本局可胡十三不靠且加对应分数，不勾选则不能胡十三不靠。"},
                }
            }
        },
        { 
            tag = {togglesTile = "配子:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"DaiPeiZi\":true",toggleType = 1,toggleTitle = "带配子",toggleIsOn = true,clickBigShow = "4_1",clickTip="本局游戏有配子"},
                    {disable = false,json = "\"DaiPeiZi\":false",toggleType = 1,toggleTitle = "不带配子",toggleIsOn = false,clickTip="本局游戏不带配子"},
                }
            }
        },
        { 
            tag = {togglesTile = "见配:",rowNum = 3,bigShow = "4_1"},
            list =
            {
                {
                    {disable = false,json = "\"JianPeiBuGeiCheng\":true",toggleType = 1,toggleTitle = "见配不给成",toggleIsOn = true,clickTip="本局游戏有配子时不能接炮胡。"},
                    {disable = false,json = "\"JianPeiBuGeiCheng\":false",toggleType = 1,toggleTitle = "见配给成",toggleIsOn = false,clickTip="本局游戏有配子是可以接炮胡。"},
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
        laiziTagTitle = "配子",
        laiziTag = "7",
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,

    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1）麻将共136张牌，包括：万、条、筒、风（东南西北中发白）;
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）可碰牌，可开杠，但不能吃牌;
2）不可以一炮多响;
3）可以接炮胡，也可以自摸胡牌;
4）坐庄规则：庄家胡牌则连庄，流局或闲家胡牌时，逆时针轮
 庄;
5）配子:
 ◆ 发牌后随机翻一张牌。这张牌的上一个数，就是配子;
 ◆ 配子可以当任何牌来用，但不可充当某张牌去碰杠，配子不可
以碰杠配子，可以当普通牌打出;
6）白皮:
 ◆ 白板可以替代配子牌使用;
 ◆ 白皮只能替代配子牌成为顺子，不可以替代配子牌去碰杠，白
皮本身可以碰杠，也可以当普通牌打出;
7）杠牌:
 ◆ 明杠:手牌中有3张相同的牌，杠其他玩家打出的最后一张;已经
碰出去，自己摸到最后一张形成的杠;
 ◆ 暗杠:手牌中有3张相同的牌，自己摸到最后一张形成杠;
8）出分:一家自摸或接炮时，三家出分;
9）特殊牌型:
 ◆ 压档:即卡胡、边胡；无配子时，单吊也算压档;有配子时，单吊
不算压档;
 ◆ 风:胡牌时有风牌，没有一种额外加分;
 ◆ 杠上开花:开杠时，抓牌后胡牌;
 ◆ 抢杠胡:抢回头杠，即补杠，已经碰过之后摸到最后一张开杠胡
牌;
 ◆ 断幺:胡牌时无1、9和风牌;
 ◆ 无配子:无配子情况下胡牌;
 ◆ 不动手:即接炮门清，没有碰和明杠，可以有暗杠，且胡点炮才
算不动手，自摸不算;
 ◆ 万事:即自摸门清，没有碰和明杠，可以有暗杠，且自摸才算万
事，点炮不算;
 ◆ 缺一门:胡牌时，筒万条里必须缺一门;
 ◆ 幺九头:胡牌时，幺或九做一对将;
 ◆ 四合:有4张一样的牌且未开杠，3张做刻子或碰，剩余一张做顺
子;
 ◆ 混一色:胡牌时，只有筒万条其中一门且必须有风牌;
 ◆ 对对胡:胡牌时，全是刻子或碰杠，没有顺子;
 ◆ 一条龙:胡牌时，有同一花色1到9的顺子;
 ◆ 清一色:胡牌时，全是筒万条其中一种颜色;
 ◆ 全求人:全碰或杠，剩余一张单吊;点炮才算，自摸不算;
 ◆ 配子赞:听牌为配子单吊，胡任意牌;
 ◆ 配子赞配子:听牌为配子单吊，摸配子胡;
 ◆ 配子夹:听牌为一对配子，胡任意牌;
 ◆ 配子夹配子:听牌为一对配子，摸配子胡;
 ◆ 四配子:胡牌时，有四个配子;
 ◆ 风一色:胡牌时，全是风牌，不可乱风;
 ◆ 七对:全是对子，没有碰杠、也没有刻子和顺子;
 ◆ 十三不靠:即手中14张牌都是间隔大于2且没有相同的牌;
 ◆ 报听:起牌时为听牌可报听，报听后不可改张;
 ◆ 天胡:庄家第一轮接炮胡或自摸;
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）自摸:满足胡牌牌型即可;
2）接炮:不可接炮胡;
3）其它牌型：满足胡牌牌型即可;
</size>
<size=32><color=#004f3c>四.计分规则</color></size>
<size=28>	
1）明杠:5分;
2）暗杠:10分;
3）庄分:
 ◆ 平胡:5分;
 ◆ 压档:10分;
 ◆ 自摸平胡:15分;
 ◆ 自摸压档:20分;
4）平胡:2分;
5）自摸:2分;
6）压档:2分;
7）风:2分;
8）杠上开花:5分;
9）抢杠胡:5分;
10）断幺:5分;
11）无配子:5分;
12）不动手:2分;
13）万事:5分;
14）缺一门:5分;
15）幺九头:2分;
16）四合:5分;
17）混一色:30分;
18）对对胡:30分;
19）一条龙:30分;
20）清一色:60分;
21）全求人:90分;
22）配子赞:30分;
23）配子赞配子:60分;
24）配子夹:60分;
25）配子夹配子:120分;
26）四配子:60分;
27）风一色:120分;
28）七对:60分;
29）十三不靠:50分;
30）报听:
 ◆ 接炮:30分;
 ◆ 自摸:60分;
31）天胡:
 ◆ 接炮:30分;
 ◆ 自摸:60分;
</size>
]]
}

return ConfigChild
