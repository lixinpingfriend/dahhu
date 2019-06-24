local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --大冶字牌
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":10",toggleType = 1,toggleTitle = "10局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":20",toggleType = 1,toggleTitle = "20局",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "起胡:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"HuPaiRule\":10",toggleType = 1,toggleTitle = "10胡",toggleIsOn = true},
                    {disable = false,json = "\"HuPaiRule\":15",toggleType = 1,toggleTitle = "15胡",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "胡子:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"SettleRule\":5",toggleType = 1,toggleTitle = "5胡1子",toggleIsOn = false},
                    {disable = false,json = "\"SettleRule\":3",toggleType = 1,toggleTitle = "3胡1子",toggleIsOn = true},
                }
            }
        },
        {
            tag = {togglesTile = "自摸:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ZiMoRule\":1",toggleType = 1,toggleTitle = "自摸加1",toggleIsOn = true},
                    {disable = false,json = "\"ZiMoRule\":2",toggleType = 1,toggleTitle = "自摸翻倍",toggleIsOn = false},
                }
            }
        },
    
        {
            tag = {togglesTile = "换位:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"SeatRule\":1",toggleType = 1,toggleTitle = "不换位",toggleIsOn = true},
                    {disable = false,json = "\"SeatRule\":2",toggleType = 1,toggleTitle = "每局换位",toggleIsOn = false},
                }
            }
        },

        
        {
            tag = {togglesTile = "点炮:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"DianPaoType\":0",toggleType = 1,toggleTitle = "不接炮",toggleIsOn = false},
                    {disable = false,json = "\"DianPaoType\":1",toggleType = 1,toggleTitle = "点炮2倍",toggleIsOn = true},
                    {disable = false,json = "\"DianPaoType\":2",toggleType = 1,toggleTitle = "点炮4倍",toggleIsOn = false},
                }
            }
        },
        
        {
            tag = {togglesTile = "翻醒:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ChongXingRule\":true",toggleType = 1,toggleTitle = "翻重醒",toggleIsOn = true},
                    {disable = false,json = "\"ChongXingRule\":false",toggleType = 1,toggleTitle = "不翻重醒",toggleIsOn = false},
                },
                {
                    {disable = false,json = "\"ShangXingRule\":true",toggleType = 2,toggleTitle = "上醒",toggleIsOn = true},
                    {disable = false,json = "\"BenXingRule\":true",toggleType = 2,toggleTitle = "中醒",toggleIsOn = false},
                    {disable = false,json = "\"XiaXingRule\":true",toggleType = 2,toggleTitle = "下醒",toggleIsOn = true},
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
            tag = {togglesTile = "语音:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ShiShiYuYin\":true",toggleType = 2,toggleTitle = "开启实时语音",toggleIsOn = false},
                }
            }
        },

        {
            tag = {togglesTile = "",rowNum = 3, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"PayType\":1",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"PayType\":0",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false,clickTip = "扣除钻石数以牌局结算人数为准"},
                 
                },
            }
        },
        
        caculPrice = function(roundCount, playerNum, payType, bankerType)
            return Config.caculate_price_guilin(roundCount, playerNum, payType, bankerType)
        end,
        addJson = "\"PlayerNum\":3,\"ShiShiYuYin11\":3,\"LiPai\":2," 
    },

    { --大冶字牌
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":10",toggleType = 1,toggleTitle = "10局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":20",toggleType = 1,toggleTitle = "20局",toggleIsOn = false},
                    
                },
            }
        },
        {
            tag = {togglesTile = "起胡:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"HuPaiRule\":10",toggleType = 1,toggleTitle = "10胡",toggleIsOn = true},
                    {disable = false,json = "\"HuPaiRule\":15",toggleType = 1,toggleTitle = "15胡",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "胡子:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"SettleRule\":5",toggleType = 1,toggleTitle = "5胡1子",toggleIsOn = false},
                    {disable = false,json = "\"SettleRule\":3",toggleType = 1,toggleTitle = "3胡1子",toggleIsOn = true},
                }
            }
        },
        {
            tag = {togglesTile = "自摸:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ZiMoRule\":1",toggleType = 1,toggleTitle = "自摸加1",toggleIsOn = true},
                    {disable = false,json = "\"ZiMoRule\":2",toggleType = 1,toggleTitle = "自摸翻倍",toggleIsOn = false},
                }
            }
        },
        

        
        {
            tag = {togglesTile = "点炮:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"DianPaoType\":0",toggleType = 1,toggleTitle = "不接炮",toggleIsOn = false},
                    {disable = false,json = "\"DianPaoType\":1",toggleType = 1,toggleTitle = "点炮2倍",toggleIsOn = true},
                    {disable = false,json = "\"DianPaoType\":2",toggleType = 1,toggleTitle = "点炮4倍",toggleIsOn = false},
                }
            }
        },
        
        {
            tag = {togglesTile = "翻醒:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ChongXingRule\":true",toggleType = 1,toggleTitle = "翻重醒",toggleIsOn = true},
                    {disable = false,json = "\"ChongXingRule\":false",toggleType = 1,toggleTitle = "不翻重醒",toggleIsOn = false},
                },
                {
                    {disable = false,json = "\"ShangXingRule\":true",toggleType = 2,toggleTitle = "上醒",toggleIsOn = true},
                    {disable = false,json = "\"BenXingRule\":true",toggleType = 2,toggleTitle = "中醒",toggleIsOn = false},
                    {disable = false,json = "\"XiaXingRule\":true",toggleType = 2,toggleTitle = "下醒",toggleIsOn = true},

                    {disable = false,json = "\"GenXing\":true",toggleType = 2,toggleTitle = "跟醒",toggleIsOn = false},
                    {disable = false,json = "\"KanZhuangJiaPai\":true",toggleType = 2,toggleTitle = "醒家可看庄家牌",toggleIsOn = true},
                },
                
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
            tag = {togglesTile = "语音:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ShiShiYuYin\":true",toggleType = 2,toggleTitle = "开启实时语音",toggleIsOn = false},
                }
            }
        },

        {
            tag = {togglesTile = "",rowNum = 3, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"PayType\":1",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"PayType\":0",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false,clickTip = "扣除钻石数以牌局结算人数为准"},
                 
                },
            }
        },
        
        caculPrice = function(roundCount, playerNum, payType, bankerType)
            return Config.caculate_price_guilin(roundCount, 4, payType, bankerType)
        end,
        addJson = "\"PlayerNum\":4,\"ShiShiYuYin\":3,\"LiPai\":2,\"JieSuanDaoJiShi\":true,"
    },
}

ConfigChild.HowToPlayTexts =
{

[[
<size=32><color=#004f3c>一.基本规则</color></size>

1.游戏人数2名或3名玩家；
2.首局房主坐庄，之后谁胡谁坐庄，流局则上局庄家连庄；
3.每局都先从庄家位置逆时针发牌；
4.庄家发21张，闲家发20张，底牌剩19张；
5.发给庄家的最后一张牌需要亮牌，该牌不能被吃和碰。				

<size=32><color=#004f3c>二.游戏元素</color></size>

字牌的牌面都是中国汉字的数字，总共80张牌，由如下几种牌组成：
1.小写的“一”、“二”、“三”、“四”、“五”、“六”、“七”、“八”、“九”、“十”，各4张，共40张；
2.大写的“壹”、“贰”、“叁”、“肆”、“伍”、“陆”、“柒”、“捌”、“玖”、“拾”各4张，共40张；
3.牌的颜色：字牌的颜色分红黑两种，“二”、“七”、“十”和“贰”、“柒”、“拾”为红色，其余为黑色。

<size=32><color=#004f3c>三.牌型介绍</color></size>

1.一句话：手中的牌依据规则组合成相连的三张，比如小三、四、五，称为一句话；
2.一坎牌：手中3个相同的牌，一坎牌不能拆散与其它牌组合；
3.一对牌：手中2个相同的牌为1对；
4.一提牌：4张相同的牌为一提（不可拆散与其它牌组合）；
5.绞牌：当1对大牌与1张相同的小牌，或者1对小牌与1张相同的大牌组合时，成为绞牌。如1对小九与1张大玖。

<size=32><color=#004f3c>四. 玩法规则</color></size>

1.碰牌：当别人打或摸的牌自己手中有一对，则可碰，碰牌后将牌放到桌上明示给其他人；
2.吃牌：上家出的或者自己摸的牌，明示后没有人碰牌或者跑牌，则自己与自己手中的牌组合成一坒牌，放到桌上，称为吃牌；
3.过张：当有机会吃碰时，自己却没有吃碰的牌，称为过张，之后再不能吃碰该牌；但可以胡；
4.扫：抓牌时，如果所抓的牌正好是手中的一对牌，则必须将牌由手上放到桌面上；
5.过扫：忍牌之后，又扫牌，称为过扫，过扫的牌摆在桌上，第一张翻开；
6.开招：当别人打的牌或者摸的牌，自己手上正好有一坎，或者是已经扫的牌，称为开招；
当自己或别人从垛牌上摸的牌正好是自己碰过的牌，称为开招，开招的牌必须将牌放在桌面上；当开第二招，则显示“重招”，不用打牌出去；
7.扫穿：起牌后，手中4张相同的牌，称为扫穿；如果摸底牌时，摸到的底牌正好是手中一坎牌或扫牌一样，称为扫穿，扫穿的牌必须将牌放在桌面上；当玩家开招和扫穿超过一次时，如：开招了小二，然后又扫穿了小三，则不需要再打牌出去；如果玩家起手两组扫穿时，进一张牌就听牌时，不用再打牌。		
8.组牌优先顺序为：扫穿或扫＞胡牌＞开招或碰＞吃，可胡任何人手中打出的牌；吃牌的时候，先是自己吃，自己不吃才到下家吃；每进一张牌，必须打出一张牌，开招或扫穿超过或等于2之后不需要打牌；游戏中不能忍扫. 忍开招. 忍扫穿；扫. 扫穿不示众（三张或四张）；
9.起手两笼牌，听牌后不需要再打牌出去；
10.桂林字牌不允许过胡，提示胡牌时，碰和吃的提示不显示。

<size=32><color=#004f3c>五. 玩法名堂</color></size>	

1.平胡:所胡之牌是别人从垛子上摸出的即为平胡；
2.自摸：所胡那张牌是自己从垛牌上摸上来的，2番或加1子；
3.放炮（放炮必胡）：所胡那张牌是别人从手上打出来的，放炮者出两家分数；
4.天胡：庄家所胡牌为亮张牌（最后起上来那张牌），2番或加1子；
5.地胡：庄家打出的第一张牌放炮，2番或加一子；注；放炮的一家出双倍；
6.三笼五坎：玩家起手抓到三组扫穿或起手抓五坎（含扫穿）即为胡牌，2番或加1子；
7.上醒（可选）：玩家赢牌后，从剩余的牌中摸出一张牌，这张牌的上一张就是上醒，例如翻出一张小三，那么小四就是上醒，大肆不算；
8.本醒（可选）：玩家赢牌后，从剩余的牌中摸出一张牌，这张牌就是本醒，例如翻出一张小四，那么小四就是本醒，大肆不算；
9.下醒（可选）：玩家赢牌后，从剩余的牌中摸出一张牌，这张牌的下一张就是下醒，例如翻出一张大伍，那么大陆就是下醒，小六不算；
10.真四醒；玩家赢牌后，从剩余的牌中摸出一张牌，这张牌的上中下醒如自己手中有四张一样的即可再翻。例如翻出一张小四这张牌的上中下，有四张小5，还可继续翻牌；	
11.海底胡，翻醒牌为胡的那张牌；例如胡小四，翻醒牌即为小四；海底胡不连翻。

<size=32><color=#004f3c>六．计分规则</color></size>

可胡过张，也可胡自己碰的. 开舵的牌，不能胡任何人扫. 过扫或扫穿的牌；
胡数计算：
碰：（大写字）计3胡 ，（小写字）计1胡
坎、扫、过扫、：（大写字）计6胡，（小写字）计3胡
开舵：（大写字）计9胡，（小写字）计6胡
扫穿：（大写字）计12胡，（小写字）计9胡
壹贰叁 ：计6胡
一二三：计3胡
贰柒拾：计6胡
二七十：计3胡

<size=32><color=#004f3c>七. 结算规则</color></size>

1.10胡起胡，3胡1子，10-12胡为1子，13-15胡为2子，16-18胡为3子，以此类推；
2.15胡起胡，5胡1子，10-14胡为1子，15-19胡为2子，20-24胡为3子，以此类推；
3.计分规则：基本单位为子，赢家积分=（胡息子数＋翻醒数）*番数*2。
]],


[[
<size=32><color=#004f3c>一.基本规则</color></size>

1.游戏人数4名玩家；
2.首局房主坐庄，之后谁胡谁坐庄，流局则上局庄家连庄；
3.每局都先从庄家位置逆时针发牌；
4.庄家发21张，闲家发20张，底牌剩19张；
5.发给庄家的最后一张牌需要亮牌，该牌不能被吃和碰。				

<size=32><color=#004f3c>二.游戏元素</color></size>

字牌的牌面都是中国汉字的数字，总共80张牌，由如下几种牌组成：
1.小写的“一”、“二”、“三”、“四”、“五”、“六”、“七”、“八”、“九”、“十”，各4张，共40张；
2.大写的“壹”、“贰”、“叁”、“肆”、“伍”、“陆”、“柒”、“捌”、“玖”、“拾”各4张，共40张；
3.牌的颜色：字牌的颜色分红黑两种，“二”、“七”、“十”和“贰”、“柒”、“拾”为红色，其余为黑色。

<size=32><color=#004f3c>三.牌型介绍</color></size>

1.一句话：手中的牌依据规则组合成相连的三张，比如小三、四、五，称为一句话；
2.一坎牌：手中3个相同的牌，一坎牌不能拆散与其它牌组合；
3.一对牌：手中2个相同的牌为1对；
4.一提牌：4张相同的牌为一提（不可拆散与其它牌组合）；
5.绞牌：当1对大牌与1张相同的小牌，或者1对小牌与1张相同的大牌组合时，成为绞牌。如1对小九与1张大玖。

<size=32><color=#004f3c>四. 玩法规则</color></size>

1.碰牌：当别人打或摸的牌自己手中有一对，则可碰，碰牌后将牌放到桌上明示给其他人；
2.吃牌：上家出的或者自己摸的牌，明示后没有人碰牌或者跑牌，则自己与自己手中的牌组合成一坒牌，放到桌上，称为吃牌；
3.过张：当有机会吃碰时，自己却没有吃碰的牌，称为过张，之后再不能吃碰该牌；但可以胡；
4.扫：抓牌时，如果所抓的牌正好是手中的一对牌，则必须将牌由手上放到桌面上；
5.过扫：忍牌之后，又扫牌，称为过扫，过扫的牌摆在桌上，第一张翻开；
6.开招：当别人打的牌或者摸的牌，自己手上正好有一坎，或者是已经扫的牌，称为开招；
当自己或别人从垛牌上摸的牌正好是自己碰过的牌，称为开招，开招的牌必须将牌放在桌面上；当开第二招，则显示“重招”，不用打牌出去；
7.扫穿：起牌后，手中4张相同的牌，称为扫穿；如果摸底牌时，摸到的底牌正好是手中一坎牌或扫牌一样，称为扫穿，扫穿的牌必须将牌放在桌面上；当玩家开招和扫穿超过一次时，如：开招了小二，然后又扫穿了小三，则不需要再打牌出去；如果玩家起手两组扫穿时，进一张牌就听牌时，不用再打牌。		
8.组牌优先顺序为：扫穿或扫＞胡牌＞开招或碰＞吃，可胡任何人手中打出的牌；吃牌的时候，先是自己吃，自己不吃才到下家吃；每进一张牌，必须打出一张牌，开招或扫穿超过或等于2之后不需要打牌；游戏中不能忍扫. 忍开招. 忍扫穿；扫. 扫穿不示众（三张或四张）；
9.起手两笼牌，听牌后不需要再打牌出去；
10.桂林字牌不允许过胡，提示胡牌时，碰和吃的提示不显示。

<size=32><color=#004f3c>五. 玩法名堂</color></size>	

1.平胡:所胡之牌是别人从垛子上摸出的即为平胡；
2.自摸：所胡那张牌是自己从垛牌上摸上来的，2番或加1子；
3.放炮（放炮必胡）：所胡那张牌是别人从手上打出来的，放炮者出两家分数；
4.天胡：庄家所胡牌为亮张牌（最后起上来那张牌），2番或加1子；
5.地胡：庄家打出的第一张牌放炮，2番或加一子；注；放炮的一家出双倍；
6.三笼五坎：玩家起手抓到三组扫穿或起手抓五坎（含扫穿）即为胡牌，2番或加1子；
7.上醒（可选）：玩家赢牌后，从剩余的牌中摸出一张牌，这张牌的上一张就是上醒，例如翻出一张小三，那么小四就是上醒，大肆不算；
8.本醒（可选）：玩家赢牌后，从剩余的牌中摸出一张牌，这张牌就是本醒，例如翻出一张小四，那么小四就是本醒，大肆不算；
9.下醒（可选）：玩家赢牌后，从剩余的牌中摸出一张牌，这张牌的下一张就是下醒，例如翻出一张大伍，那么大陆就是下醒，小六不算；
10.真四醒；玩家赢牌后，从剩余的牌中摸出一张牌，这张牌的上中下醒如自己手中有四张一样的即可再翻。例如翻出一张小四这张牌的上中下，有四张小5，还可继续翻牌；	
11.海底胡，翻醒牌为胡的那张牌；例如胡小四，翻醒牌即为小四；海底胡不连翻。

<size=32><color=#004f3c>六．计分规则</color></size>

可胡过张，也可胡自己碰的. 开舵的牌，不能胡任何人扫. 过扫或扫穿的牌；
胡数计算：
碰：（大写字）计3胡 ，（小写字）计1胡
坎、扫、过扫、：（大写字）计6胡，（小写字）计3胡
开舵：（大写字）计9胡，（小写字）计6胡
扫穿：（大写字）计12胡，（小写字）计9胡
壹贰叁 ：计6胡
一二三：计3胡
贰柒拾：计6胡
二七十：计3胡

<size=32><color=#004f3c>七. 结算规则</color></size>

1.10胡起胡，3胡1子，10-12胡为1子，13-15胡为2子，16-18胡为3子，以此类推；
2.15胡起胡，5胡1子，10-14胡为1子，15-19胡为2子，20-24胡为3子，以此类推；
3.计分规则：基本单位为子，赢家积分=（胡息子数＋翻醒数）*番数*2。
]],
}

return ConfigChild
