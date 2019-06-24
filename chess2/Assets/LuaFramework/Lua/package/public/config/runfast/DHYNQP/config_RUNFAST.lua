local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --经典玩法
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":10",toggleType = 1,toggleTitle = "10局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":15",toggleType = 1,toggleTitle = "15局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":20",toggleType = 1,toggleTitle = "20局",toggleIsOn = false},
                },
            }
        },
         {
             tag = {togglesTile = "人数:",rowNum = 3},
             list =
             {
                 {
                    {disable = false,json = "\"playerCount\":4",toggleType = 1,toggleTitle = "4人",toggleIsOn = false,clickSmallShow="2_1"},
                    {disable = false,json = "\"playerCount\":3",toggleType = 1,toggleTitle = "3人",toggleIsOn = true},
                    {disable = false,json = "\"playerCount\":2",toggleType = 1,toggleTitle = "2人",toggleIsOn = false,clickSmallShow="2_3",clickBigShow = "2_3"},
                 }
             }
         },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"notify_card_cnt\":false",toggleType = 1,toggleTitle = "不显示牌数",toggleIsOn = true},
                    {disable = false,json = "\"notify_card_cnt\":true",toggleType = 1,toggleTitle = "显示牌数",toggleIsOn = false},
                },
                {
                    {disable = false,json = "\"allow_pass\":false",toggleType = 1,toggleTitle = "有牌必压",toggleIsOn = true},
                    {disable = false,json = "\"allow_pass\":true",toggleType = 1,toggleTitle = "可不要",toggleIsOn = false},
                },
                {
                    {disable = false,json = "\"init_card_cnt\":16",toggleType = 1,toggleTitle = "16张牌",toggleIsOn = true,smallShow="2_1",smallShowType = 2},
                    {disable = false,json = "\"init_card_cnt\":15",toggleType = 1,toggleTitle = "15张牌",toggleIsOn = false,smallShow="2_1",smallShowType = 2},
                },
                {
                    {disable = false,json = "\"init_card_cnt\":13",toggleType = 1,toggleTitle = "13张牌",toggleIsOn = true,smallShow="2_1",smallShowType = 1},
                },
                {
                    {disable = false,json = "\"allow_4plus3\":true",toggleType = 2,toggleTitle = "允许4带3",toggleIsOn = false},
                    {disable = false,json = "\"tailed_tripple\":true",toggleType = 2,toggleTitle = "最后3张甩尾",toggleIsOn = false,clickTip = "最后一手如果自己手中剩余三带一或三张可压死别人出的三带二"},
                },
                {
                    {disable = false,json = "\"red10_double\":true",toggleType = 2,toggleTitle = "红桃10翻倍",toggleIsOn = false,clickTip = "有红桃10的玩家输赢结算翻倍，炸弹不翻倍"},
                    {disable = false,json = "\"pay_all\":true",toggleType = 2,toggleTitle = "放走包赔",toggleIsOn = false,smallShow="2_3",smallShowType = 2},
                },
            }
        },
        {
            tag = {togglesTile = "首发:",rowNum = 3,bigShow="2_3",bigShowType = 2},
            list =
            {
                {
                    {disable = false,json = "\"every_round_black3_first\":true",toggleType = 1,toggleTitle = "黑桃3先出",toggleIsOn = false},
                    {disable = false,json = "\"every_round_black3_first\":false",toggleType = 1,toggleTitle = "赢家先出(第1局黑桃3先出)",toggleIsOn = true},
                },
                {
                    {disable = false,json = "\"first_must_black3\":true",toggleType = 1,toggleTitle = "必出黑桃3",toggleIsOn = false,clickTip = "赢家先出时，第1局必出"},
                    {disable = false,json = "\"first_must_black3\":false",toggleType = 1,toggleTitle = "可不出黑桃3",toggleIsOn = true},
                },
            }
        },
        {
            tag = { togglesTile = "定位:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"CheckIPAddress\":true", toggleType = 2, toggleTitle = "相同IP检测", toggleIsOn = true },
                    { disable = false, json = "SafeDistance", toggleType = 2, toggleTitle = "GPS检测", toggleIsOn = true ,dropDown = "50,100,300", dropDefault = 2,dropAddStr = "米",addJson = "\"NeedOpenGPS\":true",clickTip = "距离小于X米的玩家不能加入房间"},
                }
            }
        },
        {
            tag = {togglesTile = "",rowNum = 4, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"payType\":0",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"payType\":1",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false},
                    {disable = false,json = "\"payType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            local PayPriceList =
            {
                ["10"] = 10, ["15"] = 15, ["20"] = 20,
            }
            local unitPrice = PayPriceList[tostring(roundCount)]
            return Config.caculate_price6(roundCount, playerCount, payType, bankerType,unitPrice)
        end,
        configJson = "{\"game_type\":2,\"HallID\":0,\"GameType\":2,\"wanfa\":\"common\","
    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一、基本规则</color></size>
<size=28><color=#7c5608>
1）参与人数:2人、3人或4人.
2）首发：第一局有黑桃三的玩家首发，之后谁赢谁首发.
3）输赢条件：第一个出完手中所有牌的玩家本局获胜，每局只有1个赢家.
4）使用牌数：
 ◆ 16张玩法：使用48张牌,扣除(两张王牌,3个2,1个A).
 ◆ 15张玩法：使用45张牌,扣除(两张王牌,3个2,3个A,一个K).
 ◆ 13张玩法（四人）：使用52张牌,扣除(两张王牌).
5）出牌规则：
 ◆ 3人和4人模式下第1局黑桃3先出，依照选择的规则判定第一手
 牌是否必须包含黑桃3.
 ◆ 2人模式下若没有黑桃3则红桃3先出，没有继续判定直到方块A.
 ◆ 游戏者逆时针轮流出牌，如果一轮之中其他游戏者都"要不起"，
则最后一次出牌者继续出牌.
 ◆ 有牌必出模式下，如果手牌中有要的起的牌则必须出牌。非此
模式可以选择不要. 
 ◆ 下家报单时,如果要出单张，那么必须出最大的单张，其余的牌
则不能选中.
◆ 放走包赔:下家爆单上家可不出最大牌,如因没出最大牌放走下家,
则赔所有人.
</color></size>
<size=32><color=#004f3c>二、牌型介绍</color></size>
<size=28><color=#7c5608>
1）单张:可以是手中的任意一张牌.
2）对子:两张牌点相同的牌,两张牌的花色可以不同.
3）连对:两对或两对以上相连的牌,如:5566.
4）三带二:三张牌点相同的牌,带二张杂牌,如:55566、55567;另外带的杂牌可以是任意牌.
5）飞机带翅膀,两个或两个以上相连的三同张牌,如:5556667788,QQQKKK8899.另外带的杂牌可以是任意牌.
6）顺子,五张或五张以上牌点连续的牌.例如:3456789,10JQKA等.
7）炸弹,四张或四张以上牌点相同的牌,如:6666、8888
</color></size>
<size=32><color=#004f3c>三、牌型规则</color></size>
<size=28><color=#7c5608>
1）点数大小规则:2 > A > K > Q > J > 10 > 9 > 8 > 7 > 6 > 5 > 4 > 3
2）顺子从最小从3开始，到A结束，则最小的顺子是34567，最大的顺子是10、J、Q、K、A.
3）单张、对子、三同张、连对、连三同张、顺子等牌型,直接根据牌点确定大小,但要求出牌的数量必须相同;例：上家出5张顺子，那么下家出的顺子也必须是5张并且最大的那张要大于上家最大的那张.
4）炸弹大于以上所有牌型,炸弹之间按点数比大小.
3）除炸弹外其余牌型不能互压,同种牌型比较点数大小,相同牌型出牌数量也必须一致.
</color></size>
<size=32><color=#004f3c>四、分数计算</color></size>
<size=28><color=#7c5608>
1）当玩家胜利时，根据输家手中剩余牌数计分，1张牌1分，剩余1张牌不计分.
2）如果玩家在该局游戏中一张牌都没有出，则需要翻倍扣分，例：16张玩法，A玩家张牌都没有出，则需要在结算时扣除16*2=32分.
3）胜利者赢得所有输家的分数.
4）炸弹现结:如果炸弹打出后,其他两家都要不起,则立即每人扣10分给出炸弹的玩家.
</color></size>
]],
}

return ConfigChild
