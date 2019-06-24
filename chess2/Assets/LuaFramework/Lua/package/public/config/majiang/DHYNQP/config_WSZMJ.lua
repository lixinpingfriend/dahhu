local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --砚山麻将
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
            tag = { togglesTile = "惩炮:", rowNum = 3},
            list =
            {
                {
                    { disable = false, json = "\"ChengPao\":1", toggleType = 1, toggleTitle = "1胡惩炮", toggleIsOn = false,clickTip = "选中后接炮胡牌时，放炮的人额外多输1分"},
                    { disable = false, json = "\"ChengPao\":2", toggleType = 1, toggleTitle = "翻倍惩炮", toggleIsOn = true,clickTip = "选中后接炮胡牌时，放炮的人底分翻倍"},
                    { disable = false, json = "\"ChengPao\":0", toggleType = 1, toggleTitle = "不惩炮", toggleIsOn = false,clickTip = "选中后接炮胡牌时，放炮的人与其他人输分相同"},
                }
            }
        },
        {
            tag = { togglesTile = "烂牌:", rowNum = 3},
            list =
            {
                {
                    --{ disable = false, json = "\"LanPaiType\":0", toggleType = 1, toggleTitle = "正规烂", toggleIsOn = false,clickTip = "牌局只能胡正规烂。正规烂有将没有将都可以胡"},
                    --{ disable = false, json = "\"LanPaiType\":1", toggleType = 1, toggleTitle = "软烂带将", toggleIsOn = false,clickTip = "牌局可以胡正规烂也可以胡软烂，正规烂有将没有将都可以胡，软烂有将没有将都可以胡"},
                    { disable = false, json = "\"LanPaiType\":2", toggleType = 1, toggleTitle = "软烂不带将", toggleIsOn = true,clickTip = "牌局可以胡正规烂也可以胡软烂，正规烂有将没有将都可以胡，软烂必须没有将才可以胡"},
                }
            }
        },
        {
            tag = { togglesTile = "流局:", rowNum = 3},
            list =
            {
                {
                    { disable = false, json = "\"LiuDunNum\":34", toggleType = 1, toggleTitle = "34张流局", toggleIsOn = false,clickTip = "选中后剩余牌数为34张时流局"},
                    { disable = false, json = "\"LiuDunNum\":20", toggleType = 1, toggleTitle = "20张流局", toggleIsOn = true,clickTip = "选中后剩余牌局为20张时流局"},
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
            return Config.caculate_price2(roundCount, playerCount, payType, bankerType)
        end,
        IsOpenStartNow = true, ---打开提前开局按钮
    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1）麻将共136张牌，包括:万、条、筒、风（东南西北中发白）;
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）可吃牌，可碰牌，可开杠;
2）可自摸，可接炮，可一炮多响;
3）坐庄:第一局房主为庄，之后谁胡谁庄，一炮多响情况下，放炮的为庄，流局庄家继续坐庄;
4）过碰惩罚:一圈内对方打出的牌能碰却没有碰，则在未经过自己时再
 次出现该牌时也都不可以碰;
6) 过胡惩罚:一圈内对方打出的牌能胡却没有胡，则自己未进牌前不可
 接炮，除非胡的番数大于过胡时的番数;
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）自摸:满足胡牌牌型即可;
2）接炮:满足胡牌牌型即可;
3）抢杠胡:其他玩家补杠是，听这张牌的人可以胡牌;
</size>
<size=32><color=#004f3c>四.牌型番数</color></size>
<size=28>
1）平胡=1番;
2）大七对=1番;
3）小七对=2番;
4）四归一七对=4番;
5）八归一七对=8番;
6）清一色=4番;
7）字一色=4番;
8）烂牌=1番;
9）七星=2番;
10）幺牌=1番;
11）天胡=12番;
12）地胡=8番;
13）海底捞鱼=4番;
14）杠上花=4番;
</size>
<size=32><color=#004f3c>五.计分规则</color></size>
<size=28>
1）自摸、放炮均三家出分;
2）底分=1分，自摸底分翻倍;
3）胡牌分=底分*番数+杠分;
4）明杠=每人1分;
5）暗杠=每人2分;
</size>]]
}

return ConfigChild
