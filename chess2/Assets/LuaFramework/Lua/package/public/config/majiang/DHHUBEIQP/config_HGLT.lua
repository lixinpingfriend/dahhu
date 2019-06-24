local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --罗田
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
            tag = {togglesTile = "封顶:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"FengDing\":1",toggleType = 1,toggleTitle = "20/25",toggleIsOn = true},
                    {disable = false,json = "\"FengDing\":2",toggleType = 1,toggleTitle = "30/40",toggleIsOn = false},
                    {disable = false,json = "\"FengDing\":3",toggleType = 1,toggleTitle = "50/70",toggleIsOn = false,clickBigShow="1_1"},
                    {disable = false,json = "\"FengDing\":4",toggleType = 1,toggleTitle = "80/100",toggleIsOn = false,clickBigShow="1_2"},
                    {disable = false,json = "\"FengDing\":5",toggleType = 1,toggleTitle = "100/150",toggleIsOn = false,clickBigShow="1_3"},
                }
            }
        },
        {
            tag = {togglesTile = "起胡:",rowNum = 4,bigShow="1_1",bigShowType = 1},
            list =
            {
                {
                    {disable = false,json = "\"QiHu\":8",toggleType = 2,toggleTitle = "8分起胡",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "起胡:",rowNum = 4,bigShow="1_2",bigShowType = 1},
            list =
            {
                {
                    {disable = false,json = "\"QiHu\":12",toggleType = 2,toggleTitle = "12分起胡",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "起胡:",rowNum = 4,bigShow="1_3",bigShowType = 1},
            list =
            {
                {
                    {disable = false,json = "\"QiHu\":16",toggleType = 2,toggleTitle = "16分起胡",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"KaiKouFan\":true",toggleType = 1,toggleTitle = "开口番",toggleIsOn = false},
                    {disable = false,json = "\"QiXiaoDui\":true",toggleType = 1,toggleTitle = "七对门清",toggleIsOn = true},
                },
                {
                    {disable = false,json = "\"FengBao\":true",toggleType = 2,toggleTitle = "风豹",toggleIsOn = false},
                }
            }
        },
        --[[{
            tag = { togglesTile = "少人:", rowNum = 3 ,},
            list = {
                {
                    { disable = false, json = "\"StartNow\":true", toggleType = 2, toggleTitle = "允许少人时提前开局", toggleIsOn = true },
                }
            }
        },--]]
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
        caculPrice = function (roundCount, PlayerNum, PayType, bankerType)
            return Config.caculate_price_HGTL(roundCount, PlayerNum, PayType, bankerType)
        end,

        --IsOpenStartNow = true, ---打开提前开局按钮

        laiziTagTitle = "宝牌",
        laigenTagTitle = "痞子",
        laiziTag = "4",

        view = "tableluotianmajiang_view",
        controller = "tablexishuimajiang_controller",
        --resultBeiShuScale = 10,  ---结算时候显示得分数除以这个数
        table3dStyles = {1,2},

    },
}

ConfigChild.HowToPlayTexts =
{
    [[<size=32><color=#004f3c>一、游戏规则</color></size>
<size=28>
1.1 基础信息
1）1-9万，1-9筒，1-9条，东南西北中发白，共136张牌
2）支持4人玩法
3）可吃、碰、杠
4）没有过碰限制
5）有过胡，若第2次可胡牌的分数比第1次高，则可以胡

1.2 杠牌规则
1）有明杠、暗杠
2）红中、痞子为固定杠，单张可杠，打出即为杠
3）手上有红中和痞杠不能胡牌
4）当红中为痞子时，白板为固定杠牌
5）当红中为癞子时，发财为固定痞子牌

1.3 痞子规则
1）每局开始时打骰子，按骰子点数较小的点数，从牌堆最后开始往前数进行翻牌，翻出来的牌即为痞子牌
2）痞子不可被吃/碰/杠
3）红中为固定痞子，只有当翻出痞子牌是北风时，红中为癞子，发财为固定痞子牌
4）持有痞子牌时，不能胡牌
5）当翻到红中为痞子时，白板为固定痞子牌

1.4 癞子规则
1）痞子牌面+1为癞子
2）若痞子牌翻到风牌，按【东>南>西>北>中>发>白>东】顺序判断癞子
3）癞子为万能牌，可代替任意牌，但不可与其他牌组合进行吃/碰/杠
4）癞子可独立作为杠牌，打出即为杠牌
5）胡牌时若有癞子，按癞子所能配成的最大牌型进行计算
6）手中有2个或以上癞子，不能胡小胡，可以胡大胡、杠开和海底捞
</size>
<size=32><color=#004f3c>二、庄家规则</color></size>
<size=28>
1）首局房主为庄，之后胡牌为庄
2）流局则逆时针轮庄
3）最后留5墩牌流局
</size>
<size=32><color=#004f3c>三、胡牌规则</color></size>
<size=28>
3.1 基础名词
1）顺子：同花色的3张相连的牌，例如234条/万/筒
2）刻子：3张相同的牌，例如3张东风
3）将牌：牌面258为将牌

3.2 基础胡牌牌型
1）4刻子，1对将
2）3刻子，1顺子，1对将
3）2刻子，2顺子，1对将
4）1刻子，3顺子，1对将
5）4顺子，1对将

3.3 大胡牌型
1）碰碰胡：常规碰碰胡，手牌可落地
2）清一色：常规清一色，手牌可落地
3）风一色：常规风一色，手牌可落地
4）将一色：常规将一色，手牌可落地

3.4 胡牌规则
1）可自摸，可接炮
2）有杠上开花

3.5 【开口】选项限制
1）勾选【开口番】选项，必须开口才能胡牌
2）勾选【七对门清】选项，不开口也可胡牌
3）小胡不开口只能自摸

3.6 多癞子限制
1）未开口，小胡自摸不管几个癞子都可以胡
2）开口，小胡2个癞子或以上不能自摸和接炮，可以杠上开花
3）大胡不受癞子数量限制
</size>
<size=32><color=#004f3c>四、结算规则</color></size>
<size=28>
4.1 算分公式
1）胡牌分=底分*牌型倍数*2的n次方，n=番数之和
2）番数需要计算输家和赢家的杠番总和
3）开口番只算1次

4.2 牌型倍数
1）平胡：自摸和点炮都是1倍
2）大胡接炮：2倍
3）大胡自摸：开口4倍，未开口3倍

4.3 番数
1）开口：1番，开口只计算输家的开口，暗杠不算开口
2）硬胡：1番
3）红中杠：1番
4）痞子杠：1番
5）癞子杠：2番
6）明杠：1番
7）暗杠：2番
8）大胡接炮：1番
9）杠上开花：1番

4.4 七对牌型特殊规则
1）七对接炮按小胡倍数计算，1倍，豪华七对加1番
2）七对自摸按大胡倍数计算，3倍，豪华七对加1番

4.5 门清牌型特殊规则
1）软门清自摸按小胡算倍数，1倍
2）硬门清自摸按大胡算倍数，3倍，硬门清不再计算硬胡番数
3）门清不管几个癞子都可以胡牌

4.6 承包规则
1）A玩家同花色的牌已吃/碰/杠2次，若B再次打出同花色的牌让A进行第3次吃/碰/杠，则A胡牌为清一色或将一色时，B承包

4.7 出分规则
1）小胡放炮，放炮玩家出分
2）自摸3家出分
3）大胡3家出分
4）七对点炮3家都要出分

4.8 结算分数规则
1）在【20/25】、【30/40】封顶选项下，按实际分数进行结算，是多少分就是多少分
2）在【50/70】、【80/100】封顶选项下，所得分数向上取10的倍数，例如玩家获得14分，则结算为出20分
</size>
<size=32><color=#004f3c>五、封顶规则</color></size>
<size=28>
5.1 封顶说明
1）输家所出分数达到或超过指定选项下的分数，只需要出该选项的封顶分
2）金顶：如果3个输家都达到或超过封顶的分数，则都按金顶收分

5.2 封顶设置
1）20/25：底分1分，1家封顶则该玩家输20分，3家封顶则每家输25
2）30/40：底分1分，1家封顶则该玩家输30分，3家封顶则每家输40
3）50/70：底分2分，1家封顶则该玩家输50分，3家封顶则每家输70
4）80/100：底分2分，1家封顶则该玩家输80分，3家封顶则每家输100
</size>
]],
}

return ConfigChild
