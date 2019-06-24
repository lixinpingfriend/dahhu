local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --利川
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":4",toggleType = 1,toggleTitle = "4局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":16",toggleType = 1,toggleTitle = "16局",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "人数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"PlayerNum\":4",toggleType = 1,toggleTitle = "4人玩法",toggleIsOn = true,addJson = "\"HasWan\":true"},
                    {disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "3人玩法",toggleIsOn = false,clickSmallShow = "1_1"},
                }
            }
        },
        {
            tag = {togglesTile = "底分:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"DiFen\":1",toggleType = 1,toggleTitle = "1分",toggleIsOn = true},
                    {disable = false,json = "\"DiFen\":2",toggleType = 1,toggleTitle = "2分",toggleIsOn = false},
                    {disable = false,json = "\"DiFen\":3",toggleType = 1,toggleTitle = "3分",toggleIsOn = false},
                    {disable = false,json = "\"DiFen\":5",toggleType = 1,toggleTitle = "5分",toggleIsOn = false},
                    {disable = false,json = "\"DiFen\":10",toggleType = 1,toggleTitle = "10分",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ErLaiBuDongZhang\":true",toggleType = 2,toggleTitle = "二癞不动张",toggleIsOn = true},
                    {disable = false,json = "\"RuanPiBuJiePao\":true",toggleType = 2,toggleTitle = "软屁胡不可接炮",toggleIsOn = false},
                    {disable = false,json = "\"TaiZhuang\":true",toggleType = 2,toggleTitle = "抬庄",toggleIsOn = true},
                    {disable = false,json = "\"HasWan\":true",toggleType = 2,toggleTitle = "带万字",toggleIsOn = false,smallShow = "1_1",smallShowType = 1},
                }
            }
        },
        {
            tag = { togglesTile = "少人:", rowNum = 3 ,},
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
        caculPrice = function (roundCount, PlayerNum, PayType, bankerType)
            return Config.caculate_price_ESLC(roundCount, PlayerNum, PayType, bankerType)
        end,

        IsOpenStartNow = true, ---打开提前开局按钮
        laigenTagTitle = "皮子",
        laiziTagTitle = "赖子",
        laiziTag = "3",

        laiziNoYellow = true,
        view = "tablelichuanmajiang_view",
        controller = "tablelichuanmajiang_controller",
        isShowTingDefValue = 2,
        table3dStyles = {1,2},
    },
}

ConfigChild.HowToPlayTexts =
{
    [[<size=32><color=#004f3c>一、基础规则</color></size>
<size=28>
1.1 基础信息
1）1-9万，1-9筒，1-9条，共108张牌
2）支持4人玩法和3人玩法
3）可吃、碰、杠，任意牌为将

1.2 杠牌规则
1）有明杠、暗杠
2）杠了之后没有剩余牌可补牌，不可以杠
3）只有在听牌的状态下，才可以杠牌

1.3 三倒面规则
1）吃、碰、杠三口之后，切吃、碰、杠的牌符合清一色或将一色的牌型，可以选择报【三倒面】
2）【三倒面】只有1次选择报的机会，报了【三倒面】之后，清一色只能胡清一色，将一色只能胡将一色
3）报了【三倒面】之后可以改张，可以继续吃、碰、杠，必须还得是满足能胡清一色或将一色
4）不报【三倒面】也可以胡清一色、将一色

1.4 抬庄规则
1）抬庄：庄家打出第1手牌，其他3位玩家打出一样的牌，算抬庄
2）每局只能抬庄1次
</size>
<size=32><color=#004f3c>二、庄家规则</color></size>
<size=28>
1）第1局随机坐庄，之后胡牌为庄
2）庄胡、黄庄则庄家连庄
</size>
<size=32><color=#004f3c>三、癞子规则</color></size>
<size=28>
1）开局翻牌堆最后1张牌（称为“皮”），此牌+1作为本局癞子
2）每局玩家只能抓到3张皮，3张皮不算杠
3）癞子在胡牌时可当任意牌使用
4）癞子可以打出，打出时视为癞子牌本身，可以被吃、碰、杠、胡
5）可以用癞子吃、碰、杠，用癞子吃、碰、杠时，癞子视为本身牌面
</size>
<size=32><color=#004f3c>四、胡牌规则</color></size>
<size=28>
4.1 胡牌基础信息
1）满足基本牌型或者特殊胡牌牌型，即可胡牌
2）可以接炮胡、自摸胡、抢杠胡
3）四癞只能自摸不能接炮
4）癞子单吊不可以接炮，不可以抢杠胡
5）没有一炮多响

4.2 胡牌牌型
1）四刻子，一对将
2）三刻子，一句话，一对将
3）两刻子，两句话，一对将
4）一刻子，三句话，一对将
5）四句话，一对将
6）七对：含豪华七对，有癞子可胡七对，癞子可做任意牌
7）将一色：手牌全是258，有癞子可胡将一色，癞子可做任意258
8）四癞子：手中有4个癞子胡牌

4.3 牌型介绍
1）软屁胡：手中有癞子，点炮胡牌
2）硬胡：手中无癞子，或癞子已经归位（即癞子牌作为本身使用），点炮胡牌
3）小雪：有吃、碰、明杠行为的自摸胡牌
4）大雪：门清自摸
5）清一色：同一色的牌
6）将一色：全是258牌面的牌，不需要满足基本胡牌牌型（癞子可做任意258）
7）碰碰胡：四刻子，一对将
8）小七对：七对牌，有癞子也可胡七对，癞子可做任意牌（豪华七对或更多也视为小七对）
9）杠上花：杠牌后自摸
10）四癞子：手中有4个癞子胡牌
</size>
<size=32><color=#004f3c>五、结算规则</color></size>
<size=28>
5.1 结算公式
1）胡分=底分*番型倍数+抬庄分
2）抬庄分为固定2分，荒庄不算抬庄分

5.2 底分
1）共有5个选项，1/2/3/5/10分

5.3 番型倍数
1）清一色：1番
2）大雪：1番
3）碰碰胡：1番
4）杠上炮：1番
5）杠上花：1番
6）抢杠胡：1番
7）将一色：1番
8）硬胡：1番
9）四癞子：1番

5.4 封顶规则
1）3番封顶

5.5 特殊接炮规则
1）清一色、将一色、七对、杠上炮，接炮收3家胡分，3家分数相同

5.6 包赔规则
1）三倒面、杠上炮、抢杠胡，这3中情况包赔，点炮者出全部胡分
</size>
]],
}

return ConfigChild
