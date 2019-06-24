local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --极速
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":16",toggleType = 1,toggleTitle = "16局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":24",toggleType = 1,toggleTitle = "24局",toggleIsOn = false},
                },
            }
        },
        
        { 
            tag = {togglesTile = "牌数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"rule\":1",toggleType = 1,toggleTitle = "一副牌",toggleIsOn = true,clickBigShow = "2_1"},
                    {disable = false,json = "\"rule\":2",toggleType = 1,toggleTitle = "去2-6",toggleIsOn = false,clickBigShow = "2_2",clickTip = "去掉大小王和2~6点数的牌"},
                    {disable = false,json = "\"rule\":3",toggleType = 1,toggleTitle = "去2-8",toggleIsOn = false,clickBigShow = "2_3",clickTip = "去掉大小王和2~8点数的牌"},
                }
            }
        },
        { 
            tag = {togglesTile = "人数:",rowNum = 3,bigShow = "2_1"},
            list =
            {
                {
                    {disable = false,json = "\"playerCount\":6",toggleType = 1,toggleTitle = "2-6人",toggleIsOn = true},
                    {disable = true,json = "\"playerCount\":4",toggleType = 1,toggleTitle = "2-4人",toggleIsOn = false},
                    {disable = true,json = "\"playerCount\":3",toggleType = 1,toggleTitle = "2-3人",toggleIsOn = false},
                }
            }
        },
        { 
            tag = {togglesTile = "人数:",rowNum = 3,bigShow = "2_2"},
            list =
            {
                {
                    {disable = false,json = "\"playerCount\":6",toggleType = 1,toggleTitle = "2-6人(2副牌)",toggleIsOn = false,clickTip = "使用2副牌来游戏"},
                    {disable = false,json = "\"playerCount\":4",toggleType = 1,toggleTitle = "2-4人",toggleIsOn = true},
                    {disable = false,json = "\"playerCount\":3",toggleType = 1,toggleTitle = "2-3人",toggleIsOn = false},
                }
            }
        },
        { 
            tag = {togglesTile = "人数:",rowNum = 3,bigShow = "2_3"},
            list =
            {
                {
                    {disable = false,json = "\"playerCount\":6",toggleType = 1,toggleTitle = "2-6人(2副牌)",toggleIsOn = false,clickTip = "使用2副牌来游戏"},
                    {disable = false,json = "\"playerCount\":4",toggleType = 1,toggleTitle = "2-4人(2副牌)",toggleIsOn = false,clickTip = "使用2副牌来游戏"},
                    {disable = false,json = "\"playerCount\":3",toggleType = 1,toggleTitle = "2-3人",toggleIsOn = true},
                }
            }
        },
        { 
            tag = {togglesTile = "规则:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"valuetype\":0",toggleType = 1,toggleTitle = "A23最小",toggleIsOn = true},
                    {disable = false,json = "\"valuetype\":1",toggleType = 1,toggleTitle = "A23第二大",toggleIsOn = false},
                    {disable = false,json = "\"valuetype\":2",toggleType = 1,toggleTitle = "A23最大",toggleIsOn = false},
                }
            }
        },
        {
            tag = { togglesTile = "定位:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"NeedOpenGPS\":true", toggleType = 2, toggleTitle = "GPS检测", toggleIsOn = false },
                    { disable = false, json = "\"CheckIPAddress\":true", toggleType = 2, toggleTitle = "相同IP检测", toggleIsOn = false },
                }
            }
        },
        {
            tag = {togglesTile = "",rowNum = 4, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"payType\":0",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"payType\":1",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false,clickTip = "扣除钻石数以牌局结算人数为准"},
                    {disable = false,json = "\"payType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price4(roundCount, playerCount, payType, bankerType)
        end,
        configJson = "{\"HallID\":0,\"gameType\":0,\"GameType\":0,\"allowHalfEnter\":false,"
    },
}

ConfigChild.HowToPlayTexts =
{
 [[<size=32><color=#004f3c>一.人数</color></size>
<size=28>
1） 2~6人
</size>
<size=32><color=#004f3c>二.牌数</color></size>
<size=28>
1） 一副牌去除大小王共52张牌，每位玩家每局发8张牌；
2） 去牌模式根据建房选项去除点数为2~6或者2~8的牌；
</size>
<size=32><color=#004f3c>三.流程</color></size>
<size=28>
1） 给每位玩家发8张牌；
2） 玩家进入理牌阶段，将8张牌按照2、3、3的数量组合，放置到头
道、中道和尾道上；
3） 所有玩家理牌完成后，进入比牌阶段，所有玩家相互比较每一道
手牌；
</size>
<size=32><color=#004f3c>四.牌型</color></size>
<size=28>
1） 普通牌型：
   ◆ 杂牌：全部由单张组成；
   ◆ 对子：一对牌加上剩下的单张；
   ◆ 顺子：3张点数连续的单牌；
   ◆ 三条：三张点数一样的单牌；
   ◆ 同花顺：3张花色相同并且点数连续的单牌；
2） 特殊牌型：
   ◆ 三顺：头道、中道、尾道均是顺子；
   ◆ 三顺鸡：在三顺的基础上，尾道的花色相同；
   ◆ 三顺两鸡：在三顺的基础上，上中两道中其中一道和尾道的牌为
同一花色
   ◆ 三顺三鸡：在三顺的基础上，三道的牌都为同一花色；
   ◆ 八怪：没有对子和顺子的情况下，手牌是4组连续的牌组成，比
如：23、56、89、QK；
   ◆ 四对：八张手牌中，出现4个对子；
   ◆ 四条：八张手牌中，出现4个相同点数的牌；
   ◆ 双四条：八张手牌中，出现两组四个相同点数的牌；
   ◆ 杂龙：手牌牌面数字可以顺连的八张牌；
   ◆ 清龙：手牌牌面数字可以顺连并且为同一花色的八张牌；
</size>
<size=32><color=#004f3c>五.牌型大小</color></size>
<size=28>
1） 牌型大小：同花顺>三条>顺子>对子>杂牌；
2） 牌型相同时则由大到小比较点数，如单张两方先比较最大的单
牌，相同则比较第二大的单牌，若点数也相同则比较花色大小；
3） 花色大小：黑桃 > 红桃 > 梅花 > 方片；
4） 点数大小：A>K>Q>J>10>9>8>7>6>5>4>3>2;
5） 顺子大小：QKA>JQK>10JQ>……>345>234>A23
</size>
<size=32><color=#004f3c>六.积分算法</color></size>
<size=28>
1） 头道：散牌1分，对子是对几就得几分；
2） 中道：散牌1分，对子1分，顺子1分，三条6分，同花顺10分；
3） 尾道：散牌1分，对子1分，顺子1分，三条3分，同花顺5分；
4） 特殊牌可以选择免摆牌直接得分；
5） 特殊牌型与特殊牌型比牌，大牌得分需要减去小牌得分，相同得
分的牌型打平；
6） 特殊牌型：
   ◆ 三顺：3分
   ◆ 三顺鸡：8分
   ◆ 三顺两鸡：18分
   ◆ 三顺三鸡：38分
   ◆ 八怪：8分
   ◆ 四对：8分
   ◆ 四条：8分
   ◆ 双四条：16分
   ◆ 杂龙：16分
   ◆ 清龙：108分
</size>
]],
}

return ConfigChild
