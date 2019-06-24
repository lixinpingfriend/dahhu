local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --霍邱
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
                    {disable = false,json = "\"PlayerNum\":2",toggleType = 1,toggleTitle = "2人玩法",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"UseBaoZi\":true",toggleType = 2,toggleTitle = "豹子",toggleIsOn = true,clickTip = "勾选后本局游戏激活豹子玩法，闲家起手听牌可以叫听称为豹子。"},
                    {disable = false,json = "\"QiangGangHuBeiShu\":true",toggleType = 2,toggleTitle = "抢杠胡4倍",toggleIsOn = true,clickTip = "勾选后本局抢杠胡的分数为胡牌者总分的4倍，不勾选则以普通胡牌计算。"},
                    {disable = false,json = "\"GangShangKaiHuaBeiShu\":true",toggleType = 2,toggleTitle = "杠开4倍",toggleIsOn = true,clickTip = "勾选后本局杠上开花的分数为总分的4倍，不勾选则以普通胡牌计算"},
                    {disable = false,json = "\"ShuiFangPaoChuFen\":true",toggleType = 2,toggleTitle = "谁放炮谁出分",toggleIsOn = true,clickTip = "勾选后本局游戏放炮胡牌时只由放炮的人出分，不勾选则放炮胡牌时未胡牌的人都需要出分。"},
                    {disable = false,json = "\"BuKeChi\":true",toggleType = 2,toggleTitle = "不可吃牌",toggleIsOn = false,clickTip = "勾选后本局游戏不能进行吃牌操作，不勾选则可以吃牌。"},
                    {disable = false,json = "\"ZanZhuang\":true",toggleType = 2,toggleTitle = "占庄",toggleIsOn = false,clickTip = "勾选后本局游戏激活占庄玩法，庄家胡牌则占庄加一，下一局所有人输赢分多加一分。"},
                    {disable = false,json = "\"BaoPei\":true",toggleType = 2,toggleTitle = "吃牌吐牌包牌",toggleIsOn = true,clickTip = "勾选后规则为，吃牌时，如果手里有345，吃2出5如果，5被接炮，放炮的人包三家。其他顺子以此类推。不勾选则没有这个规则。"},
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
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            local prices =
            {
                ["4"] = 
                {
                    ["12"] = 8,["13"] = 5,["14"] = 4,
                    ["02"] = 15,["03"] = 15,["04"] = 15
                },
                ["8"] = 
                {
                    ["12"] = 15,["13"] = 10,["14"] = 8,
                    ["02"] = 30,["03"] = 30,["04"] = 30
                },
                ["16"] = 
                {
                    ["12"] = 30,["13"] = 20,["14"] = 15,
                    ["02"] = 60,["03"] = 60,["04"] = 60
                },
            }
            return prices[roundCount .. ""][payType .. "" .. playerCount]
        end,
        IsOpenStartNow = true, ---打开提前开局按钮
        layout3dTypes = { 2,1 }, ---游戏内可使用的3D麻将布局,如果不设置，则默认为Type1布局
        totalResultshareTypeToggleDefState = 1,

    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.基础规则</color></size>
<size=28>
①可以吃碰,明杠,暗杠.
②可自摸，可接炮，可一炮多响.
③麻将共136 张牌, 包括, 万, 筒, 条, 风（东南西北中发白）.
</size>
<size=32><color=#004f3c>二.胡牌规则</color></size>
<size=28>
①胡牌方式有俩种,可以自摸胡牌,也可以接炮胡.
②开杠时,其他玩家可以胡玩家杠的这个牌,叫抢杠胡.
③开杠完成以后,重新摸一张牌,该玩家胡这张牌,叫杠上开花.
④杠分是胡牌后计算,荒庄杠也荒掉,不算分.
</size>
<size=32><color=#004f3c>三.分数计算</color></size>
<size=28>
①底分：+1分.
②明杠：+1分.
③暗杠：+2分.
④天胡：+4分.
⑤豹子：（闲家）+2分;(若豹子放炮其他玩家,豹子玩家输给胡牌着牌型总分X4倍,其余人1分).
⑥清一色：+5分.
⑦混一色：+3分.
⑧对对胡：+4分.
⑨全幺九：+15分.
⑩四归一：+1分.
⑪冲天：+2分.
⑫自摸：胡牌者牌型分X2倍.
⑬接炮：放炮者出胡牌者牌型分X2倍，其余人正常出分.
⑭杠上花：胡牌者牌型分X4倍.
⑮抢杠胡：胡牌者牌型分X4倍.
</size>
<size=32><color=#004f3c>四.占庄玩法说明</color></size>
<size=28>
①庄家胡牌后开始占庄.
②占庄1次，则本局不论谁胡牌底分都多加1分。占庄2次，则底分+2，以此类推.
③非庄家胡牌后，占庄结束.
</size>]],--霍邱
}

return ConfigChild
