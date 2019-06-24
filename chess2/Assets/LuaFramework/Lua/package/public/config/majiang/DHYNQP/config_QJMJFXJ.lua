local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --飞小鸡
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":4",toggleType = 1,toggleTitle = "4局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":12",toggleType = 1,toggleTitle = "12局",toggleIsOn = false},
                },
            }
        },
        { 
            tag = {togglesTile = "人数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"PlayerNum\":4",toggleType = 1,toggleTitle = "4人玩法",toggleIsOn = true,clickBigShow = "1_3"},
                    {disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "3人玩法",toggleIsOn = false,clickSmallShow = "1_2"},
                }
            }
        },
        {
            tag = { togglesTile = "玩法:", rowNum = 3},
            list =
            {
                {
                    { disable = false, json = "\"LaiZiType\":0", toggleType = 1, toggleTitle = "不飞", toggleIsOn = false,clickTip="选中后本局游戏没有癞子."},
                    { disable = false, json = "\"LaiZiType\":1", toggleType = 1, toggleTitle = "飞小鸡", toggleIsOn = true,clickTip="选中后本局游戏中幺鸡（一条）可当做癞子牌使用."},
                    { disable = false, json = "\"LaiZiType\":2", toggleType = 1, toggleTitle = "飞白板", toggleIsOn = false,clickTip="选中后本局游戏中白板可当做癞子牌使用."},
                },
                {
                    { disable = false, json = "\"BuKeChi\":false", toggleType = 1, toggleTitle = "可吃", toggleIsOn = true,clickTip="选中后本局游戏可吃牌."},
                    { disable = false, json = "\"BuKeChi\":true", toggleType = 1, toggleTitle = "不可吃", toggleIsOn = false,clickTip="选中后本局游戏不能吃牌."},
                },
                {
                    {disable = false,json = "\"QuWanZi\":true",toggleType = 2,toggleTitle = "无万字",toggleIsOn = true,smallShow = "1_2",smallShowType = 1},
                    {disable = false,json = "\"DianJi\":true",toggleType = 2,toggleTitle = "点鸡",toggleIsOn = false},
                },
            }
        },
        {
            tag = { togglesTile = "少人:", rowNum = 3 ,bigShow = "1_3",bigShowType = 2},
            list = {
                {
                    { disable = false, json = "\"StartNow\":true", toggleType = 2, toggleTitle = "允许少人时提前开局", toggleIsOn = true,},
                }
            }
        },
        {
            tag = { togglesTile = "少人:", rowNum = 3, bigShow = "1_3",bigShowType = 1,xTotalOffset = 1000},
            list = {
                {
                    { disable = false, json = "\"StartNow\":true", toggleType = 2, toggleTitle = "允许少人时提前开局", toggleIsOn = true,},
                    {disable = false,json = "\"QuWanZi\":true",toggleType = 2,toggleTitle = "无万字",toggleIsOn = true},
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
            return Config.caculate_price2_1(roundCount, playerCount, payType, bankerType)
        end,
        isFeiXiaoJi = true,
        laiziTagTitle = "癞子",
        laiziTag = "3",
        view = "tablefeixiaoji_view",
        controller = "tablefeixiaoji_controller",
        IsOpenStartNow = true, ---打开提前开局按钮
        defGuoHu = 0,
        isShowTingDefValue = 0,
    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1)麻将共136张牌,包括:万,条,筒,风（东南西北中发白);
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1)可吃牌(开房时可配置),可碰牌,可开杠;
2)可自摸,可接炮,可一炮多响;
3)坐庄:第一局房主为庄,之后谁胡谁庄,一炮多响情况下,第一个胡牌
顺位为庄,流局庄家继续坐庄;
4)过碰惩罚:一圈内对方打出的牌能碰却没有碰,则在未经过自己时再
 次出现该牌时也都不可以碰;
6)过胡惩罚:一圈内对方打出的牌能胡却没有胡,则自己未进牌前不可
 接炮;
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1)自摸:满足胡牌牌型即可;
2)接炮:满足胡牌牌型即可;
3)抢杠胡:其他玩家补杠时,听这张牌的人可以胡牌;算胡牌方自摸,
被抢杠的包3家的分数;
</size>
<size=32><color=#004f3c>四.牌型番数</color></size>
<size=28>
1)平胡=1分;
2)杠上花=1番;
3)5梅花=2番;
4)杠上炮=1番;
5)双杠=1番;
6)门清=1番;
7)全求人=1番;
8)混一色=1番;
9)清一色=2番;
10)字一色=2番;
11)小七对=2番;
12)龙爪背=3番;
13)大对子=1番;
14)大三元=2番;
15)5星烂牌=1番;
16)6星烂牌=1番;
17)7星烂牌=2番;
</size>
<size=32><color=#004f3c>五.特殊牌型</color></size>
<size=28>
1)四癞子,无落地张时,一旦手牌中有4个癞子,可直接胡牌;
2)十风,从第一张牌开始,连续打出10张风牌,可直接胡牌;
3)十三幺,从第一张开始,连续打出13张幺九或者风牌,可直接胡牌;
4)无癞子,胡牌时无癞子额外加1番;
</size>
<size=32><color=#004f3c>六.计分规则</color></size>
<size=28>
1)自摸三家出分;
2)接炮,放炮者出分;
3)胡牌分=底分翻番,1番2,2番4,4番8,牌型无论怎么叠加最大3番;
</size>]]
}

return ConfigChild
