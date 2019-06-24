local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --安徽跑得快
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":5",toggleType = 1,toggleTitle = "5局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":12",toggleType = 1,toggleTitle = "12局",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "底分:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"baseScore\":1",toggleType = 1,toggleTitle = "1分",toggleIsOn = true},
                    {disable = false,json = "\"baseScore\":2",toggleType = 1,toggleTitle = "2分",toggleIsOn = false},
                    {disable = false,json = "\"baseScore\":5",toggleType = 1,toggleTitle = "5分",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"most_great_servant_card_1v4\":true",toggleType = 1,toggleTitle = "1V4,狗腿8最大",toggleIsOn = true},
                    {disable = false,json = "\"most_great_servant_card_1v4\":false",toggleType = 1,toggleTitle = "1V4,狗腿8为普通8",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "牌数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"showCardsCount\":true",toggleType = 1,toggleTitle = "显示剩余牌数",toggleIsOn = false},
                    {disable = false,json = "\"showCardsCount\":false",toggleType = 1,toggleTitle = "不显示剩余牌数",toggleIsOn = true},
                },
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
                    {disable = false,json = "\"payType\":0",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"payType\":1",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false},
                    {disable = false,json = "\"payType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                },
            }
        },
        configJson = '{\"game_type\":0,\"playerCount\":5,\"HallID\":0,\"GameType\":0,\"last_five_as_triple_p2\":false,\"enableSequentialSingle\":false,\"enableBondCardScore\":true,',
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price_daigoutui(roundCount, playerCount, payType, bankerType)
        end,
    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一、发牌</color></size>
<size=28>
5个人完，1个地主，1个狗腿，三个农民；或1个地主，4个农民。
三副扑克，共162张牌，地主发38张，其余4人发31张
</size>
<size=32><color=#004f3c>二、玩法</color></size>
<size=28>
1）每局随机选取一个地主，设置一张红桃8，除地主之外的玩家抓到此牌则为狗腿
2）地主和狗腿组成一方，其他三人位另一方
3）地主抓到狗腿牌时，可选择叫地主或选择1V4；地主选择1V4，地主一方，其他4个玩家一方
4）叫狗腿：地主通过手中拥有的两张同花去点狗腿，从大到小的顺序。如一对红桃A，则另外一个拥有红桃A的玩家为地主叫的狗腿
5）任何一个玩家出完手上的牌，则和该玩家一方的玩家获胜
6）地主没有抓到炸弹时，不进行牌局，游戏结束；地主抓到狗腿牌但没有符合叫地主的牌，地主选择1V4或直接结束游戏
</size>
<size=32><color=#004f3c>三、游戏流程</color></size>
<size=28>
1）开局发牌后随机选取地主
2）地主抓到狗腿牌，地主选择明1打4、暗1打4或叫狗腿；如选择了1打4则进入到出牌阶段；如选择了叫狗腿，则重新进入到是否明牌阶段，再到出牌阶段
3）地主出完牌后，有下家选择是否明牌，然后再出牌，以此类推，只有第一轮有明牌选项
4）任何一个玩家出完所有牌，游戏结束，出完牌的一方胜利
</size>
<size=32><color=#004f3c>四、喜钱</color></size>
<size=28>
1）五同色炸：5张及以上的炸弹中有五张牌同色的牌型，奖励1倍底分
2）六同色炸：6张及以上的炸弹中有六张牌同色的牌型，奖励2倍底分
3）七张炸弹：三小王、三大王，奖励1倍底分
4）八张炸弹：奖励2倍底分，四张王时，两大两小只有1倍喜钱，三大一小或三小一大2倍喜钱
5）九张炸弹：奖励3倍底分
6）十张炸弹：五个王，奖励4倍底分
7）十一张炸弹：奖励5倍底分
8）十二张炸弹：六个王，奖励6倍底分
注：同色炸和张数炸弹喜钱可以叠加。如：7张炸弹，6张红色，则该炸有3倍积分；12张炸弹则是6+2+2=10倍积分喜钱
</size>
<size=32><color=#004f3c>五、计分规则</color></size>
<size=28>
1）三打二结算：
地主积分=底分*3*（明牌倍数）+自己喜钱分*4-其他玩家喜钱分
狗腿积分=底分*3*（明牌倍数）+自己喜钱分*4-其他玩家喜钱分
农民积分=底分*2*（明牌倍数）+自己喜钱分*4-其他玩家喜钱分
明牌倍数，2的n次方,N为明牌的人数,1人有喜牌，其他四人都要给喜钱
如：底分为2，三个人明牌，地主一个人有一个七张炸弹喜牌，且地主方胜利，则各位的得分为：地主进钱=2X3X8+1X3；狗腿进钱=2X3X8-1;农民出钱=2X2X8+1
2）地主1v4结算：
地主积分=底分*8*明牌倍数+自己喜钱分*4-其他玩家喜钱分，任何人明牌都算倍数
农民积分=底分*2*明牌倍数+自己喜钱分*4-其他玩家喜钱分，任何人明牌都算倍数
如：底分为2，三个人明牌，地主一个人有一个七张炸弹喜牌，且地主方胜利，则各位的得分为：地主进钱=2X8X8+1X4;农民出钱=2X2X8-1
</size>
<size=32><color=#004f3c>六、牌型</color></size>
<size=28>
1）单张：游戏中所有单牌任何情况都只能单张出;单张大小：大王>小王>2>A>K>Q>J>10>9>8>7>6>5>4>3
2）对子：两个相同牌一起出则为对子，如33/44这样的牌型（注：两张不同的王不是对子，是两个单张，两张相同的王是对子）
3）三张：三个同大小的牌一起出为三张，如999、JJJ这样的牌型（注：三张王，不同花色不是三张，三张同花色王是炸弹）
4）炸弹：四张或四张以上的相同大小牌一起组成的牌叫炸弹，如6666/88888/999999这样的牌型
                注：三小王或三大王都是炸弹，不同花的三张王不是炸弹；三小王是最大五张炸，三大王是最大六张炸。地主抓到狗腿牌并选择1V4，此时一张狗腿牌为牌局最大炸弹
5）连队：三个及三个以上的连续对子组成的牌型为连队，如：334455/55667788（注：AA2233/KKAA22/223344不能组成连队）
6）三带二：三张可以带一对，只能带对子，不能带两个单牌，如：33344
7）三顺：两个及两个以上的连续三张组成的牌型为三顺，如：333444/555666777(注：222不能和任何三张组三顺)
8）蝴蝶：在三顺的基础上，再带等比对子数量的牌型叫蝴蝶，如：3334445566/5556667778899JJ（注：蝴蝶牌型中，两个连续三张带的对子需要是连队，三个及以上的连续三张带的对子不需要连队）
9）明牌状态下，手上三张带一对，上家和自己是一方的人，有个五张的炸弹，且刚好能放跑自己，则能当做三张带一对出；如：手上99933，上家55555，此时五张五能做三带二出。单独做个选项，五个头
</size>
]],
}

return ConfigChild
