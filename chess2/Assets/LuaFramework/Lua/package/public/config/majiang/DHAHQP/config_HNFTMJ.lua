local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --凤台麻将
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
                    {disable = false,json = "\"XianZhuang\":true",toggleType = 2,toggleTitle = "庄分",toggleIsOn = true,clickTip = "勾选后庄家将多输赢1分庄分"},
                    {disable = false,json = "\"Piao\":true",toggleType = 2,toggleTitle = "下嘴",toggleIsOn = false},
                    {disable = false,json = "\"ZiMoJiaBei\":false",toggleType = 1,toggleTitle = "自摸+2",toggleIsOn = true,clickTip = "选中后自摸胡牌+2分"},
                    {disable = false,json = "\"ZiMoJiaBei\":true",toggleType = 1,toggleTitle = "自摸算番",toggleIsOn = false,clickTip = "选中后自摸胡牌分数翻倍"},
                    {disable = false,json = "\"GangShangPaoFanBei\":true",toggleType = 2,toggleTitle = "杠炮算番",toggleIsOn = false,clickTip = "勾选后，胡杠上炮的玩家胡牌分翻倍"},
                    {disable = false,json = "\"ZhongFaBai\":true",toggleType = 2,toggleTitle = "带中发白",toggleIsOn = true},
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
        isTablePop = true,
        isShowPiao = true,
        PaoTitles = "不下|1嘴|2嘴",
        headTag = {
            serverJson = "PiaoNum",
            zeroJson = "0嘴",
            addJson = "嘴",
            localJson = "YouPiao",
        },
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,

    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1）麻将共120张牌，包括：万、条、筒，及中发白。
</size>

<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）可碰牌，可开杠，不能吃牌;
2）胡牌方式：可接炮，可自摸;
3）坐庄:首局房主坐庄，庄家胡牌连庄，其他情况下轮庄;
4）出分:一家点炮时，点炮者出分;一家自摸时，剩余玩家都要出分;
5）过胡惩罚:一圈内对方打出的牌能胡却没有胡，则在未经过自己时再次
           出现可接炮胡的牌时也都不可以胡牌;
6）可以一炮多响;
7）杠计分：杠随胡走，不胡不计杠分，流局黄杠。
</size>

<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）自摸:满足胡牌牌型即可;
2）接炮:满足胡牌牌型即可;
3）杠上开花:满足牌型即可;
4）杠上炮:满足牌型即可;
5）抢杠胡:满足牌型即可;
</size>
<size=32><color=#004f3c>四.计分规则</color></size>
<size=28>
1）点炮胡:底分1分+点炮1分=2分;
2）自摸胡:底分1分+自摸2分=3分;
3）庄分:输赢1分;
4）杠分;明杠+1分，暗杠+2分;
5) 杠上开花：总牌分*2倍;
6）卡胡：+1分;
</size>]], --凤台麻将
}

return ConfigChild
