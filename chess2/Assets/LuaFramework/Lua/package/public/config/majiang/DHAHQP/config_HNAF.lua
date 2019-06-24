local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --安丰麻将
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
                    {disable = false,json = "\"BianSanQi\":true",toggleType = 2,toggleTitle = "边三七",toggleIsOn = true,clickTip = ""},
                    {disable = false,json = "\"DuYi\":true",toggleType = 2,toggleTitle = "独一",toggleIsOn = true,clickTip = ""},
                    {disable = false,json = "\"HongZhongYaoJiu\":true",toggleType = 2,toggleTitle = "红中幺九将",toggleIsOn = true,clickTip = ""},
                    {disable = false,json = "\"QueMen\":true",toggleType = 2,toggleTitle = "缺门",toggleIsOn = true,clickTip = ""},
                    {disable = false,json = "\"KanZi\":true",toggleType = 2,toggleTitle = "坎子",toggleIsOn = true,clickTip = ""},
                    {disable = false,json = "\"LinMen\":true",toggleType = 2,toggleTitle = "临门",toggleIsOn = true,clickTip = ""},
                    {disable = false,json = "\"ZaiShou\":true",toggleType = 2,toggleTitle = "在手",toggleIsOn = true,clickTip = ""},
                    {disable = false,json = "\"YiBanDa\":true",toggleType = 2,toggleTitle = "一般大",toggleIsOn = false,clickTip = ""},
                    {disable = false,json = "\"YiBanGao\":true",toggleType = 2,toggleTitle = "一般高",toggleIsOn = false,clickTip = ""},
                    {disable = false,json = "\"ZhongXin\":true",toggleType = 2,toggleTitle = "中心",toggleIsOn = false,clickTip = ""},
                    {disable = false,json = "\"PengPengHu\":true",toggleType = 2,toggleTitle = "对对胡",toggleIsOn = false,clickTip = ""},
                    {disable = false,json = "\"ZhangZhi\":true",toggleType = 2,toggleTitle = "7/11张，9/11支",toggleIsOn = false,clickTip = ""},
                }
            }
        },
        {
            tag = {togglesTile = "牌型:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"TianHu\":true",toggleType = 2,toggleTitle = "天胡",toggleIsOn = false,clickTip = ""},
                    {disable = false,json = "\"QingYiSe\":true",toggleType = 2,toggleTitle = "清一色",toggleIsOn = false,clickTip = ""},
                    {disable = false,json = "\"HunYiSe\":true",toggleType = 2,toggleTitle = "混一色",toggleIsOn = false,clickTip = ""},
                    {disable = false,json = "\"YiTiaoLong\":true",toggleType = 2,toggleTitle = "一条龙",toggleIsOn = false,clickTip = ""},
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
        addJson = "\"Piao\":true,",
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price_HNAF(roundCount, playerCount, payType, bankerType)
        end,
        isTablePop = true,
        headTag = {
            serverJson = "PiaoNum",
            localJson =  "Piao",
            zeroJson = "",
            addJson = "嘴",
        },
        isShowPiao = true,
        PaoTitles = "不跑|跑1嘴|跑2嘴",
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,

    },
}

ConfigChild.HowToPlayTexts =
{
    [[<size=32><color=#004f3c>一、基础规则</color></size>
<size=28>
1）万、条、筒（1-9各4张）+红中（4张），共112张
2）支持4人玩法和3人玩法
3）可碰、杠，不可吃牌
4）可点炮，可自摸
5）有过胡，过胡后下一次摸牌后才可以胡牌
6）杠上炮、抢杠胡算普通点炮，杠上开花算普通自摸
</size>
<size=32><color=#004f3c>二、庄家规则</color></size>
<size=28>
1）第1局游戏房主为庄
2）第2局开始胡牌为庄，庄胡则连庄
3）流局庄家继续坐庄
4）一炮多响，下一局放炮者坐庄
</size>
<size=32><color=#004f3c>三、牌型说明</color></size>
<size=28>
1）天胡：庄家起手胡牌
2）临门：胡上家的牌，逆时针，自摸也算临门
3）缺门：缺了1门花色，红中不影响
4）在手：没有碰牌/明杠/暗杠
5）坎子：同色3张一样的牌，万/条/筒/红中
6）独一：胡中间的1张牌，比如2、4胡3，也叫夹子
7）红中幺九将：1/9/红中做将
8）7/11张：147、258、369这样的数字，不管什么花色，达到7张算1嘴，达到11张算2嘴
9）9/11支：同色的牌达到9张算1嘴，达到11张算2嘴
10）一般大：任意5个一样大的数字，比如2个3万+2个3筒+1个3条；4个红中也算一般大
11）一般高：同色的牌，手里有2副牌面为123的牌，不限花色
12）边37：手里有12，胡3，叫边3,；有89，胡7，叫边7
13）中心：手里有相同花色的456顺子，有这个顺子就是2嘴
14）清一色：同色牌，不能包含红中
15）混一色：同色牌，含红中
16）龙：清一色牌型，必须包含123456789
17）对对胡：4个坎子，一副对子
</size>
<size=32><color=#004f3c>四、算分规则</color></size>
<size=28>
4.1 算分公式
1）计分=（底分+庄分+牌型分+跑嘴分）*自摸倍数+杠开分
2）自摸倍数=2，杠开分=1
3）底分=1

4.2 庄分说明
  庄分=庄家坐庄的次数，例如第1次坐庄，则庄分=1，第2次坐庄，则庄分=2，以此类推

4.3 牌型分
1）1嘴=1分
2）天胡：按手牌最大的数字算嘴，比如最大是8筒，则为8嘴
3）临门：1嘴
4）缺门：1嘴
5）在手：1嘴
6）坎子：1嘴
7）独一：1嘴
8）红中幺九将：1嘴
9）7/11张：7张算1嘴，11张算2嘴
10）9/11支：9支算1嘴，11支算2嘴
11）一般大：1嘴
12）一般高：1嘴
13）边37:1嘴
14）混一色：2嘴
15）对对胡：2嘴
16）清一色：4嘴
17）一条龙：4嘴

4.4 跑嘴分说明
1）选项设置为：不跑/跑1嘴/跑2嘴
2）1嘴=1分
3）计分时需要统计输赢双方的跑嘴分，例如A和B分别跑1嘴和跑2嘴，则A点炮给B，B进跑嘴分3分
</size>
]],
}

return ConfigChild
