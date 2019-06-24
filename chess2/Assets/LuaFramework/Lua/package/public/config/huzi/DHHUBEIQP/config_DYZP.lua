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
                    {disable = false,json = "\"roundCount\":12",toggleType = 1,toggleTitle = "12局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":18",toggleType = 1,toggleTitle = "18局",toggleIsOn = false},
                },
            }
        },

        {
            tag = {togglesTile = "人数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"PlayerNum\":2",toggleType = 1,toggleTitle = "2人",toggleIsOn = false},
                    {disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "3人",toggleIsOn = true},
                },
            }
        },

        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"DianPaoBaoPei\":false",toggleType = 1,toggleTitle = "大冶玩法",toggleIsOn = true},
                    {disable = false,json = "\"DianPaoBaoPei\":true",toggleType = 1,toggleTitle = "点炮包赔",toggleIsOn = false},
                }
            }
		},
		{
            tag = {togglesTile = "底分:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"DiFen\":5",toggleType = 1,toggleTitle = "0.5",toggleIsOn = false,addJson="\"Ratio\":0.1"},
                    {disable = false,json = "\"DiFen\":10",toggleType = 1,toggleTitle = "1",toggleIsOn = true,addJson="\"Ratio\":0.1"},
                    {disable = false,json = "\"DiFen\":20",toggleType = 1,toggleTitle = "2",toggleIsOn = false,addJson="\"Ratio\":0.1"},
                    {disable = false,json = "\"DiFen\":30",toggleType = 1,toggleTitle = "3",toggleIsOn = false,addJson="\"Ratio\":0.1"},
					{disable = false,json = "\"DiFen\":50",toggleType = 1,toggleTitle = "5",toggleIsOn = false,addJson="\"Ratio\":0.1"},
					{disable = false,json = "\"DiFen\":100",toggleType = 1,toggleTitle = "10",toggleIsOn = false,addJson="\"Ratio\":0.1"},
                }
            }
        },
        {

            tag = { togglesTile = "节奏:", rowNum = 3 },
            list =
            {
                {
                    {disable = false,json = "\"JieZouType\":1",toggleType = 1,toggleTitle = "慢",toggleIsOn = true},
                    {disable = false,json = "\"JieZouType\":2",toggleType = 1,toggleTitle = "快",toggleIsOn = false},
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
            tag = {togglesTile = "",rowNum = 4, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"PayType\":1",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"PayType\":0",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false,clickTip = "扣除钻石数以牌局结算人数为准"},
                    {disable = false,json = "\"PayType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                },
            }
        },
        caculPrice = function(roundCount, playerNum, payType, bankerType)
            return Config.caculate_price9(roundCount, playerNum, payType, bankerType)
        end,
        addJson = "\"PlayerNum11\":3,\"LiPai\":1,\"ShowTable\":1,"
    },
}

ConfigChild.HowToPlayTexts =
{

[[<size=28><color=#004f3c>一.基本规则</color></size>
1）游戏人数为3名玩家；
2）首局房主坐庄，之后谁胡谁坐庄，流局则上局庄家连庄；
3）每局都先从庄家位置逆时针发牌；
4）翻将：抓牌前翻最底下一张牌（这张牌不能胡）如果翻的大伍的话，
    那碰大陆就是6胡，碰小六就是3胡。坎大陆12胡，坎小六6胡，
    开朝大陆18胡，小六9胡，天拢大陆24胡，天拢小六12胡。
5）庄家发21张，闲家发20张，底牌剩18张；

<size=28><color=#004f3c>二.游戏元素</color></size>
字牌的牌面都是中国汉字的数字，总共80张牌，由如下几种牌组成：
1）小写的“一”、“二”、“三”、“四”、“五”、“六”、“七”、
    “八”、“九”、“十”，各4张，共40张；
2）大写的“壹”、“贰”、“叁”、“肆”、“伍”、“陆”、“柒”、
    “捌”、“玖”、“拾”各4张，共40张；
3）牌的颜色：字牌的颜色分红黑两种，“二”、“七”、“十”
    和“贰”、“柒”、“拾”为红色，其余为黑色。

<size=28><color=#004f3c>三.牌型介绍</color></size>
1）天拢：手中4个相同牌，不能拆散与其它牌组合；
2）坎：手中3个相同的牌，一坎牌不能拆散与其它牌组合；
3）对：手中2个相同的牌为1对；
4）一句话：手中牌组合成相连的三张，比如2、3、4称为一句话，
    2、7、10组合也称为一句话；
5）绞牌：当1对大牌与1张相同的小牌，或者1对小牌与1张相同的
    大牌组合时，称为绞牌；如1对小六与1张大陆。

<size=28><color=#004f3c>四.玩法规则</color></size>
1）开朝：自己手中有一坎，桌面又出现第四张牌，则强制开朝，必须将牌
    由手上放到桌上，碰的牌不能开朝，开第二朝的时候可以选择出牌或
    不出，不出则后面再开朝的牌都不能出牌；第二朝出牌了之后的一个
    开朝（即开第三朝）也必须出牌，第四个及之后的开朝不能出牌。
    （没有提牌，自己抓到也是开朝）
2）碰牌：当别人打或摸的牌自己手中有一对，则可碰，碰牌后将牌放到桌
    上明示给其他人；
3）过张：当有机会吃、碰的牌而自己不吃、碰，则之后的这张牌也不能
    吃、碰。胡牌的时候若是过张了，必须变动手牌才能再胡这张牌；
4）吃牌：上家出的或者自己摸的牌，明示后没有人碰牌或者开朝，则自
    己与自己手中的牌组合成1句话，或者绞牌，放到桌上，称为吃牌；
5）摆牌：当吃的牌手中还有时，必须将手中的这张牌根据某种组合，也放
    到桌面；
6）放炮：打出来的牌被其它玩家胡牌。（选择大冶玩法放炮是两家都输，
    选择点炮包赔点炮者一人输）

<size=28><color=#004f3c>五.特殊规则</color></size>
1）自摸：自摸加一个底分；
2）单倍：胡了牌以后，满十胡，手中的牌有一坎，就是单倍，算5分；
3）双倍：胡牌后，超过20胡息就是双倍，算6分；
4）八倍：满30胡息就是八倍，算12分；
5）飘胡：满10胡息，手中没有坎，算双倍；
6）台胡：满20胡息，手中有坎，算双倍；
7）三朝：胡牌时，开了三朝且第二朝选择出牌，算八倍；
8）飘台：满20胡息手中没有坎，算八倍；
9）十红：手中刚好10张红牌，算八倍；
10）厂双：手中10张以上红牌且有坎，没满20胡，算双倍；
11）厂飘：手中有10张以上红牌没有坎算八倍；
12）厂台：手中有10张以上红牌且有坎，20胡，算八倍；
13）节节亮：每一梯牌都有红牌，算八倍；
14）一个眼：手中只有一张红字，算八倍；
15）一块匾：手中一梯红字且有胡息，算八倍；
16）全荤：每一梯牌都有胡息，算八倍；
17）全黑：手中没有红字，算八倍；
18）天胡：抓完牌有人直接胡底牌（任何一方）算八倍，庄家胡加一个底。
    庄家天拢这张牌也优先胡，不算庄家放炮；
19）地胡：闲家胡庄家打的第一张牌，算八倍。

<size=28><color=#004f3c>六.计分规则</color></size>
累计胡息达到10胡息才能胡牌，胡息数会受到翻将影响。
            牌型	    大字	    小字
            天拢	    12胡	    9胡
            开朝	    9胡	        6胡
            坎	        6胡	        3胡
            碰	        3胡	        1胡
            贰柒拾	    6胡	        3胡
            壹贰叁	    6胡	        3胡
]],
}

return ConfigChild
