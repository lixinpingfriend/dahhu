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
            tag = {togglesTile = "规则:",rowNum = 2.5},
            list =
            {
                {
                    {disable = false,json = "\"flushRule\":1",toggleType = 1,toggleTitle = "同花色优先比花色",toggleIsOn = true},
                    {disable = false,json = "\"flushRule\":2",toggleType = 1,toggleTitle = "同花色优先比大小",toggleIsOn = false},
                },
                {
                    {disable = false,json = "\"straightRule\":1",toggleType = 1,toggleTitle = "A2345为第二大顺子",toggleIsOn = true},
                    {disable = false,json = "\"straightRule\":2",toggleType = 1,toggleTitle = "A2345为最小顺子",toggleIsOn = false},
                }
            }
        },
        { 
            tag = {togglesTile = "结算:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"balance\":1",toggleType = 1,toggleTitle = "单杀,通杀翻倍",toggleIsOn = true},
                    {disable = false,json = "\"balance\":2",toggleType = 1,toggleTitle = "单杀,通杀加底分",toggleIsOn = false},
                    {disable = false,json = "\"balance\":3",toggleType = 1,toggleTitle = "黑桃A翻倍",toggleIsOn = false},
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
            return Config.caculate_price_shi_san_zhang(roundCount, playerCount, payType, bankerType)
        end,
        configJson = "{\"HallID\":0,\"gameType\":0,\"GameType\":0,\"allowHalfEnter\":false,\"playerCount\":4,"
    },
}

ConfigChild.HowToPlayTexts =
{
 [[<size=32><color=#004f3c>一.人数</color></size>
<size=28>
1） 4人
</size>
<size=32><color=#004f3c>二.牌数</color></size>
<size=28>
1） 一副牌去除大小王共52张牌，每位玩家每局发13张牌；
</size>
<size=32><color=#004f3c>三.流程</color></size>
<size=28>
1） 给每位玩家发13张牌；
2） 玩家进入理牌阶段，将13张牌按照3、5、5的数量组合，放置到头
道、中道和尾道上；
3） 所有玩家理牌完成后，进入比牌阶段，所有玩家相互比较每一道
手牌；
</size>
<size=32><color=#004f3c>四.牌型</color></size>
<size=28>
1） 普通牌型：
   ◆ 散牌：全部由单牌组成；
   ◆ 对子：一对牌加上3张单牌；
   ◆ 两对：两个对子加1张单牌；
   ◆ 三条：三张一样点数的牌加2张单牌；
   ◆ 顺子：五张点数连续的单牌，从A2345到10JQKA；
   ◆ 同花：五张单牌为同一种花色；
   ◆ 葫芦：三条加对子；
   ◆ 四条：四张同样点数的牌加1张单牌；
   ◆ 同花顺：五张花色相同并且点数连续的单牌；
2） 特殊牌型：
   ◆ 十三张：十三张牌为从A-K；
   ◆ 三花茶：三道牌型均是同花牌型；
   ◆ 三顺子：三道牌型均是顺子牌型；
   ◆ 六对半：十三张牌中有6个对子；
3） 补充说明：头道只有3张牌，只计算单牌、对子和三条的牌型
（特殊牌型除外）。
</size>
<size=32><color=#004f3c>五.牌型大小</color></size>
<size=28>
1） 牌型大小：特殊牌型 > 普通牌型；同为特殊牌型时，十三张 > 
三花茶、三顺子和六对半。同为十三张为平手，同为三花茶/三顺子/
六对半时为平手；
2） 普通牌型中：同花顺 > 四条 > 葫芦 > 同花 > 顺子 > 
三条 > 两对 > 对子 > 散牌；
3） 同为同花顺、同花时，优先比花色，再比最大的一张牌大小；
4） 同为顺子时，优先比较大小，若大小相同，再比最大的一张牌的
花色；
5） 同为两对时，优先比最大的一对，若两对都相同，则比剩余单牌
大小，若单牌也相同，则比对大一对的花色；
6） 同为散牌时，优先比大牌，若大牌相同，则比第二大的牌，以此
类推。若单牌都相同，则比最大的单牌花色。
7） 花色大小：黑桃 > 红桃 > 梅花 > 方片；
8） 点数大小：A>K>Q>J>10>9>8>7>6>5>4>3>2;
9） 顺子大小：AKQJ10>KQJ109...A2345
</size>
<size=32><color=#004f3c>六.积分算法</color></size>
<size=28>
1） 头道：散牌1分，对子1分，三条3分；
2） 中道：散牌1分，对子1分，两对1分，三条1分，顺子1分，同花1
分，葫芦2分，四条4分，同花顺5分；
3） 尾道：散牌1分，对子1分，两对1分，三条1分，顺子1分，同花1
分，葫芦1分，四条4分，同花顺5分；
4） 特殊牌可以选择免摆牌直接得分；
5） 特殊牌型与特殊牌型比牌；
6） 特殊牌型：
   ◆ 十三张：13分
   ◆ 三花茶：3分
   ◆ 三顺子：3分
   ◆ 六对半：3分
7） 单杀：如果玩家三道牌均大于另一个玩家，即为单杀；
   ◆ 单杀加底分：当玩家单杀另一个玩家时，则额外赢取3分；
   ◆ 单杀翻倍：当玩家单杀另一个玩家时，则额外赢取针对该玩家
所赢分*2的分；
8） 通杀：玩家对其他三个玩家都造成单杀，则为通杀；
   ◆ 通杀只有在4个人玩的时候才会生效；
   ◆ 通杀加底分：当玩家造成通杀时，则额外赢取3分；
   ◆ 通杀翻倍：当玩家造成通杀时，则额外赢取单杀所赢分数*2的
分
数；
9） 特殊牌型不参与单杀和通杀的计算；
10）黑A翻倍：手牌中有黑桃A的玩家，不论输赢最后得分需要*2，输
赢给对应的玩家；
</size>
]],
}

return ConfigChild
