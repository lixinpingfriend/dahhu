local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --无为
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
                    {disable = false,json = "\"WuTongKaiGuan\":true",toggleType = 2,toggleTitle = "五同玩法",toggleIsOn = true,clickTip="勾选后胡牌时将进行五同牌型的分数判定，不勾选则不计算五同分数。"},
                    {disable = false,json = "\"LaoXiaoWanFa\":true",toggleType = 2,toggleTitle = "老小玩法",toggleIsOn = true,clickTip="勾选后胡牌时将进行十老、十小、全老、全小的分数判定，不勾选则不计算老小分数。"},
                    {disable = false,json = "\"ShuiFangPaoChuFen\":true",toggleType = 2,toggleTitle = "谁放炮谁出分",toggleIsOn = false},
                }
            }
        },
        { 
            tag = {togglesTile = "起番:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"QiFanDuiZiShu\":3",toggleType = 1,toggleTitle = "三对起番",toggleIsOn = true,clickTip="胡牌时若有三对以及三对以上则分数翻倍。"},
                    {disable = false,json = "\"QiFanDuiZiShu\":4",toggleType = 1,toggleTitle = "四对起番",toggleIsOn = false,clickTip="胡牌时若有四对以及四对以上则分数翻倍。"},
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
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,

    },
    { --南陵
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "",toggleType = 1,toggleTitle = "4局",toggleIsOn = false},
                    {disable = false,json = "",toggleType = 1,toggleTitle = "8局",toggleIsOn = true},
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
                    {disable = false,json = "\"PlayerNum\":2",toggleType = 1,toggleTitle = "2人玩法",toggleIsOn = false},
                }
            }
        },
        { 
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = true,json = "\"QueYiSeKeTing\":true",toggleType = 2,toggleTitle = "缺一门",toggleIsOn = true,clickTip="勾选后必须缺一门才能胡牌，不勾选则无限制。"},
                    {disable = false,json = "\"OnlyHunQing\":true",toggleType = 2,toggleTitle = "只胡清混",toggleIsOn = false,clickTip="开启时，只能胡清一色、混一色；关闭时，不需清一色、混一色也可以胡"},
                    {disable = false,json = "\"DaXingZi\":true",toggleType = 2,toggleTitle = "打星子",toggleIsOn = true,clickTip="勾选后胡牌时将计算打星子的分数，不勾选则打星子不加分。"},
                    {disable = false,json = "\"FengYiSe\":true",toggleType = 2,toggleTitle = "风一色",toggleIsOn = true,clickTip="勾选后胡牌时满足风一色的条件则加对应的分数，不勾选则只能胡但不加分。"},
                    {disable = false,json = "\"DaiDingJiu\":true",toggleType = 2,toggleTitle = "带顶九",toggleIsOn = true,clickTip="开启时，可以胡软顶九、硬顶九、清一色顶九；关闭时，不可以胡软顶九、硬顶九、清一色顶九"},
                    {disable = false,json = "\"HaiLao\":true",toggleType = 2,toggleTitle = "海底捞",toggleIsOn = false,clickTip="勾选后胡牌时满足海底捞的条件加对应的分数，不勾选则只能胡但不加分。"},
                    {disable = false,json = "\"KaWuTong\":true",toggleType = 2,toggleTitle = "卡五筒",toggleIsOn = false,clickTip="勾选后卡胡五筒有额外加分。"},
                    {disable = false,json = "\"LunZhuang\":true",toggleType = 2,toggleTitle = "轮庄",toggleIsOn = false,clickTip="勾选后庄家胡牌继续坐庄，其他情况轮庄。不勾选则谁胡谁庄。"},
                },
                {
                    {disable = false,json = "\"KaXingZi\":true",toggleType = 1,toggleTitle = "卡星子",toggleIsOn = true,clickTip="勾选后卡胡星子本身有额外加分。"},
                    {disable = false,json = "\"KaBianXingZi\":true",toggleType = 1,toggleTitle = "卡边星子",toggleIsOn = false,clickTip="勾选后卡胡星子本身有额外加分。"},
                },
            }
        },
        { 
            tag = {togglesTile = "庄分:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ZhuangJiaFen\":5",toggleType = 1,toggleTitle = "5分",toggleIsOn = true},
                    {disable = false,json = "\"ZhuangJiaFen\":10",toggleType = 1,toggleTitle = "10分",toggleIsOn = false},
                    {disable = false,json = "\"ZhuangJiaFen\":15",toggleType = 1,toggleTitle = "15分",toggleIsOn = false},
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
            return Config.caculate_price1(roundCount, playerCount, payType, bankerType)
        end,
        isNanLing = true,
        laiziTagTitle = "星子",
        laiziTag = "6",
        view = "tablenanling_view",
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,

    },
    { --繁昌
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
                    {disable = true,json = "\"QueYiSeKeTing\":true",toggleType = 2,toggleTitle = "缺一门",toggleIsOn = true,clickTip="勾选后必须缺一门才能胡牌，不勾选则无限制。"},
                    {disable = false,json = "\"OnlyHunQing\":true",toggleType = 2,toggleTitle = "只胡清混",toggleIsOn = false,clickTip="开启时，只能胡清一色、混一色；关闭时，不需清一色、混一色也可以胡"},
                    {disable = false,json = "\"DaXingZi\":true",toggleType = 2,toggleTitle = "打星子",toggleIsOn = true,clickTip="勾选后胡牌时将计算打星子的分数，不勾选则打星子不加分。"},
                    {disable = false,json = "\"FengYiSe\":true",toggleType = 2,toggleTitle = "风一色",toggleIsOn = true,clickTip="勾选后胡牌时满足风一色的条件则加对应的分数，不勾选则只能胡但不加分。"},
                    {disable = false,json = "\"DaiDingJiu\":true",toggleType = 2,toggleTitle = "带顶九",toggleIsOn = true,clickTip="开启时，可以胡软顶九、硬顶九、清一色顶九；关闭时，不可以胡软顶九、硬顶九、清一色顶九"},
                    {disable = false,json = "\"HaiLao\":true",toggleType = 2,toggleTitle = "海底捞",toggleIsOn = false,clickTip="勾选后胡牌时满足海底捞的条件加对应的分数，不勾选则只能胡但不加分。"},
                }
            }
        },
        {
            tag = {togglesTile = "庄分:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ZhuangJiaFen\":5",toggleType = 1,toggleTitle = "5分",toggleIsOn = true},
                    {disable = false,json = "\"ZhuangJiaFen\":10",toggleType = 1,toggleTitle = "10分",toggleIsOn = false},
                    {disable = false,json = "\"ZhuangJiaFen\":15",toggleType = 1,toggleTitle = "15分",toggleIsOn = false},
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
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,

    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.麻将数量</color></size>
  <size=28>
  1）麻将共计112张牌，包含：万、条、筒、红中；
  </size>
  <size=32><color=#004f3c>二.基础规则</color></size>
  <size=28>
  1）可碰牌，可开杠，但不能吃牌；
  2）不可以一炮多响；
  3）坐庄：第一局由房主坐庄，之后谁胡牌谁坐庄；流局时，下一局庄
     家的下家坐庄；
  4）对子：手中对子达到3对或4对时，牌型分翻番；手中豹子算为2对子
     ，碰牌为1对子，明杠为3对子，暗杠为4对子；
  5）杠牌：
     ◆ 喜牌明杠：摸到了已碰的红中牌时，可以进行杠牌；
     ◆ 喜牌暗杠：摸到了4张红中牌时，可进行杠牌；
  6）出分：一家放炮，三家出分；
  7）特殊牌型：
     ◆ 压档：卡胡、边胡；
     ◆ 一条龙：筒、万、条有1到9的顺子；
     ◆ 缺一色：胡牌时结算，只少一门算缺一色，有风牌也算缺一色；
     ◆ 混一色：胡牌时结算，少两门且必须有风牌；
     ◆ 清一色：胡牌时结算，少两门且没有风牌；
     ◆ 十老：不限花色，手牌中5到9数字的牌数量≥10；
     ◆ 十小：不限花色，手牌中1到5数字的牌数量≥10；
     ◆ 全老：不限花色，手牌中全是5到9数字的牌；
     ◆ 全校：不限花色，手牌中全是1到5数字的牌；
     ◆ 不动手：没有碰和明杠，暗杠算门清；
     ◆ 对对胡：手牌中全是碰；
     ◆ 杠上开花：杠后自摸胡牌；
     ◆ 天胡：起手摸第一张胡牌；
     ◆ 五同：手牌中同一数字不限花色达到5张，达到6张时算六同，以
        此类推；
     ◆ 八支：手牌中同一花色不限数字达到8张，达到9张时算九支，以
        此类推；
  </size>
  <size=32><color=#004f3c>三.胡牌规则</color></size>
  <size=28>
  1）自摸：满足胡牌牌型即可；
  2）接炮：满足胡牌牌型即可；
  3）杠上开花：满足牌型即可；
  4）杠上炮：算平胡；
  5）抢杠胡：算平胡；
  6）天胡地胡：额外算分；
  </size>
  <size=32><color=#004f3c>四.计分规则</color></size>
  <size=28>
  1）平胡：1分；
  2）连庄分：1；
  3）喜牌明杠：每家5分；
  4）喜牌暗杠：每家10分；
  5）对子起番：牌型分x2；
  6）压档：1分；
  7）一条龙：1；
  8）缺一色：1；
  9）混一色：5；
  10）清一色：10；
  11）十老：1；
  12）十小：1；
  13）全老：5；
  14）全小：5；
  15）不动手：1；
  16）对对胡：5；
  17）杠上开花：5；
  18）天胡：5；
  19）五同：1，每加一同，分数加1；
  20）八支：1，每加一支，分数加1；
  </size>]],--无为
[[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1）麻将共计136张牌，包含:万、条、筒、风（东南西北中发白）;
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）可碰牌，可开杠，但不能吃牌;
2）不可以一炮多响;
3）不可以接炮胡，只能自摸胡牌;
4）坐庄:第一局由房主坐庄，之后谁胡牌谁坐庄;流局时，下家庄;
5）星子:
   ◆ 发牌后随机翻一张牌。这张牌的上一个数，就是星子;
   ◆ 星子可以当任何牌来用，但不可充当某张牌去碰杠，星子可以碰杠
      星子，也可以当普通牌打出（打出无分）;
6）杠牌:
   ◆ 明杠:手牌中有3张相同的牌，杠其他玩家打出的最后一张;已经
      碰出去，自己摸到最后一张形成的杠;
   ◆ 暗杠:手牌中有3张相同的牌，自己摸到最后一张形成杠;
7）庄分:庄家胡牌时，可额外得分;闲家胡牌时，庄家需额外出分;
8）出分:一家自摸，三家出分;
9）特殊牌型:
   ◆ 杠上开花:杠后自摸胡牌;
   ◆ 软顶九:同一花色有1到9的顺子，可以有星子，但星子不可以充
      1和9;
   ◆ 硬顶九:同一花色有1到9的顺子，不可以有星子;
   ◆ 清一色顶九:同时有清一色和顶九的牌型;
   ◆ 混一色:胡牌时结算，少两门且必须有风牌，可以有星子;
   ◆ 清一色:胡牌时结算，少两门且没有风牌，可以有星子;
   ◆ 风一色:胡牌时结算，全是风牌，没有条、筒、万，但可以有星
      子;
   ◆ 软独一支:即卡胡和边胡胡到了星子牌;
   ◆ 硬独一支:即卡胡和边胡胡到了原牌;
   ◆ 跑风:单吊星子，即其余牌都已经成型，单独一张星子，抓任何
      牌都胡牌;
   ◆ 星子归位:胡牌时，星子牌当本身用，胡牌前手中必须无星子，
      听牌听的是星子本身;
   ◆ 四核:有4张相同的牌没有开杠，且手牌中至少剩余一张;
   ◆ 双四核:2个四核算双四核;
   ◆ 三四核:3个四核算三四核;
   ◆ 星子胡:胡牌前手中无星子，摸到星子胡牌;
   ◆ 无百搭:胡牌时手中没有星子;
   ◆ 海捞:牌堆只剩最后4张牌时摸牌胡牌;
   ◆ 九支:手牌中条筒万任意一个花色不限数字有9张时算九支，可以
      有星子;
   ◆ 打一星子:开局第一张牌打星子牌，即算打一星子;
   ◆ 打二星子:开局第一张已经打了星子牌，第二张接着打星子，即
      算打二星子;
   ◆ 打三星子:开局第三张打星子牌，且前2张打的都是星子牌，即算
      打三星子;
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）自摸:必须缺一门，即万、条、筒必须缺一种花色;
2）特殊规则:胡牌除缺一门之外，必须包含以下牌型之一才能胡牌:顶九
   、清一色、混一色、独一支、九支、跑风、打星子（至少打1星子）、
   风一色、星子归位;
3）接炮:不可接炮胡;
4）杠上开花:满足牌型即可;
5）杠上炮:算平胡;
6）抢杠胡:算平胡;
7）天胡地胡:算平胡;
</size>
<size=32><color=#004f3c>四.计分规则</color></size>
<size=28>
1）平胡（开牌）:2分;
2）庄分:可选择5分、10分、15分;
3）明杠:无分;
4）暗杠:无分;
5）杠上开花:1分;
6）软顶九:10分;
7）硬顶九:20分;
8）清一色顶九:100分;
9）混一色:10分;
10）清一色:20分;
11）风一色:100分;
12）硬独一支:20分;
13）软独一支:10分;
14）跑分:3分;
15）星子归位:1分;
16）四核:1分;
17）双四核:2分;
18）三四核:3分;
19）星子胡:1分;
20）无百搭:1分;
21）海捞:1分;
22）九支:2分;
23）打一星子:15分;
24）打二星子:45分;
25）打三星子:100分;
</size>]],--南陵
[[<size=32><color=#004f3c>一.麻将数量</color></size>
  <size=28>
  1）麻将共计112张牌，包含：万、条、筒、红中；
  </size>
  <size=32><color=#004f3c>二.基础规则</color></size>
  <size=28>
  1）可碰牌，可开杠，但不能吃牌；
  2）不可以一炮多响；
  3）坐庄：第一局由房主坐庄，之后谁胡牌谁坐庄；流局时，下一局庄
     家的下家坐庄；
  4）对子：手中对子达到3对或4对时，牌型分翻番；手中豹子算为2对子
     ，碰牌为1对子，明杠为3对子，暗杠为4对子；
  5）杠牌：
     ◆ 喜牌明杠：摸到了已碰的红中牌时，可以进行杠牌；
     ◆ 喜牌暗杠：摸到了4张红中牌时，可进行杠牌；
  6）出分：一家放炮，三家出分；
  7）特殊牌型：
     ◆ 压档：卡胡、边胡；
     ◆ 一条龙：筒、万、条有1到9的顺子；
     ◆ 缺一色：胡牌时结算，只少一门算缺一色，有风牌也算缺一色；
     ◆ 混一色：胡牌时结算，少两门且必须有风牌；
     ◆ 清一色：胡牌时结算，少两门且没有风牌；
     ◆ 十老：不限花色，手牌中5到9数字的牌数量≥10；
     ◆ 十小：不限花色，手牌中1到5数字的牌数量≥10；
     ◆ 全老：不限花色，手牌中全是5到9数字的牌；
     ◆ 全校：不限花色，手牌中全是1到5数字的牌；
     ◆ 不动手：没有碰和明杠，暗杠算门清；
     ◆ 对对胡：手牌中全是碰；
     ◆ 杠上开花：杠后自摸胡牌；
     ◆ 天胡：起手摸第一张胡牌；
     ◆ 五同：手牌中同一数字不限花色达到5张，达到6张时算六同，以
        此类推；
     ◆ 八支：手牌中同一花色不限数字达到8张，达到9张时算九支，以
        此类推；
  </size>
  <size=32><color=#004f3c>三.胡牌规则</color></size>
  <size=28>
  1）自摸：满足胡牌牌型即可；
  2）接炮：满足胡牌牌型即可；
  3）杠上开花：满足牌型即可；
  4）杠上炮：算平胡；
  5）抢杠胡：算平胡；
  6）天胡地胡：额外算分；
  </size>
  <size=32><color=#004f3c>四.计分规则</color></size>
  <size=28>
  1）平胡：1分；
  2）连庄分：1；
  3）喜牌明杠：每家5分；
  4）喜牌暗杠：每家10分；
  5）对子起番：牌型分x2；
  6）压档：1分；
  7）一条龙：1；
  8）缺一色：1；
  9）混一色：5；
  10）清一色：10；
  11）十老：1；
  12）十小：1；
  13）全老：5；
  14）全小：5；
  15）不动手：1；
  16）对对胡：5；
  17）杠上开花：5；
  18）天胡：5；
  19）五同：1，每加一同，分数加1；
  20）八支：1，每加一支，分数加1；
  </size>]],--繁昌
}

return ConfigChild
