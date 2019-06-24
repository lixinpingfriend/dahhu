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
            tag = {togglesTile = "结算:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"balance\":4",toggleType = 1,toggleTitle = "打枪翻倍",toggleIsOn = true},
                    {disable = false,json = "\"balance\":5",toggleType = 1,toggleTitle = "黑A翻倍",toggleIsOn = false},
                    {disable = false,json = "\"balance\":6",toggleType = 1,toggleTitle = "打枪+黑A翻倍",toggleIsOn = false},
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
1）  2-4人
</size>
<size=32><color=#004f3c>二.牌数</color></size>
<size=28>
一副牌去除大小王共52张牌，每位玩家每局发13张牌；
</size>
<size=32><color=#004f3c>三.流程</color></size>
<size=28>
1）  给每位玩家发13张牌；
2）  玩家进入理牌阶段，将13张牌按照3、5、5的数量组合，放置到头
道、中道和尾道上；
3）  所有玩家理牌完成后，进入比牌阶段，所有玩家相互比较每一道
手牌；
</size>
<size=32><color=#004f3c>四.牌型</color></size>
<size=28>
1）  普通牌型：
      
◆  单张：全部由单牌组成；
◆  对子：一对牌加上3张单牌；   
◆  两对：两个对子加1张单牌；
◆  三条：三张一样点数的牌加2张单牌；
◆  顺子：五张点数连续的单牌，从A2345到10JQKA；
◆  同花：五张单牌为同一种花色；
◆  葫芦：三条加对子；
◆  铁支：四张同样点数的牌加1张单牌；
◆  同花顺：五张花色相同并且点数连续的单牌。

2）  特殊牌型：
      
◆  清一色龙：手牌为A~K，并且花色相同；  
◆  一条龙：手牌为A~K；  
◆  四套三条：4组相同3张牌+任意1张杂牌，例如222333444555+7； 
◆  全红一点黑：12张红牌（红桃方块）+1张黑牌（黑桃梅花）；
◆  全黑一点红：12张黑牌（黑桃梅花）+1张红牌（红桃方块）；
◆  全红：13张红牌（红桃方块）；
◆  全黑：13张黑牌（梅花黑桃）；
◆  五对三条：5组对子+3张相同的牌，例如2233445566+777；
◆  全小：13张牌全是数字2~10；
◆  全大：13张牌全是6~K；
◆  半小：13张牌全是A~10；
◆  半大：13张牌全是6~A；
◆  六对半：十三张牌中有6个对子；
◆  三花茶：三道牌均为同花牌型；
◆  三顺子：三道牌均为顺子牌型。

3）  补充说明：头道只有3张牌，只计算单牌、对子和三条的牌型
（特殊牌型除外）。
</size>
<size=32><color=#004f3c>五.牌型大小</color></size>
<size=28>
1）  牌型大小：
◆特殊牌型  >  普通牌型；
◆同为特殊牌型时，清一色龙>全红=全黑>一条龙>全红一点黑=全黑一点红>五对三条>四套三条=六对半=全大=全小>三顺子=三同花=半大=半小。

2）  普通牌型中：
同花顺  >  铁支  >  葫芦  >  同花  >  顺子  >  
三条  >  两对  >  对子  >  单张。
3）同为同花顺/顺子时：先按照单张从大到小对比点数，点数一样则从大到小对比花色。
4）同为顺子时，优先比较大小，若大小相同，再比最大的一张牌的
花色。
5）  同为两对时，优先比最大的一对，若两对都相同，则比剩余单牌
大小，若单牌也相同，则比对大一对的花色。
6）  同为单张时，优先比大牌，若大牌相同，则比第二大的牌，以此
类推；若单牌都相同，则比最大的单牌花色。
7）  花色大小：黑桃  >  红桃  >  梅花  >  方片。
8）  点数大小：A>K>Q>J>10>9>8>7>6>5>4>3>2。
9）  顺子大小：AKQJ10>KQJ109...A2345 
</size>
<size=32><color=#004f3c>六.积分算法</color></size>
<size=28>
1）  头道：散牌1分，对子1分，三条3分；
2）  中道：散牌1分，对子1分，两对1分，三条1分，顺子1分，同花1
分，葫芦2分，铁支8分，同花顺10分；
3）  尾道：散牌1分，对子1分，两对1分，三条1分，顺子1分，同花1
分，葫芦1分，铁支4分，同花顺5分；
4）  特殊牌可以选择免摆牌直接得分；
5）  特殊牌型与特殊牌型比牌；
6）  特殊牌型得分：    
◆  清一色龙：52；     
◆  全黑：20；     
◆  全红：20；    
◆  一条龙：13；
◆  全黑一点红：10；
◆  全红一点黑：10；
◆  五对三条：9；
◆  四套三条：6；
◆  六对半：6；
◆  全大：6；
◆  全小：6；
◆  半小：3；
◆  半大：3；
◆  三花茶：3；
◆  三顺子：3。
7）  打枪：如果玩家三道牌均大于另一个玩家，即为打枪；   
◆  打枪翻倍：当玩家打枪另一个玩家时，则额外赢取针对该玩家
所赢分*2的分；
8）  全垒打：玩家对其他三个玩家都造成单杀，则为全垒打；  
◆  全垒打只有在4个人玩的时候才会生效；  
◆  全垒打翻倍：当玩家造成全垒打时，额外赢取所赢分数*2的分数；
9）  特殊牌型不参与打枪和全垒打的计算；
10）黑A翻倍：手牌中有黑桃A的玩家，不论输赢最后比牌分需要*2，输
赢给对应的玩家；
</size>
]],
}

return ConfigChild
