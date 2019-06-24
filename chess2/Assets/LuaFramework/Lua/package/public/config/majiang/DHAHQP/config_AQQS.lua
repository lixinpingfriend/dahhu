local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --潜山
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
                    {disable = true,json = "\"BaoPai\":true",toggleType = 2,toggleTitle = "宝牌",toggleIsOn = true},
                    {disable = true,json = "\"HongZhongPei\":true",toggleType = 2,toggleTitle = "红中配",toggleIsOn = true},
                    {disable = false,json = "\"AutoBuHua\":true",toggleType = 2,toggleTitle = "自动补花",toggleIsOn = false},
                    {disable = false,json = "\"JiaZhu\":true",toggleType = 2,toggleTitle = "带加注",toggleIsOn = false},
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
                    {disable = false,json = "\"PayType\":1",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = false},
                    {disable = false,json = "\"PayType\":0",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = true},
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price2(roundCount, playerCount, payType, bankerType)
        end,
        isTablePop = true,
        isShowPiao = true,
        PaoTitles = "不加注|加1注|加2注",
        headTag = {
            serverJson = "PiaoNum",
            localJson =  "JiaZhu",
            zeroJson = "0注",
            addJson = "注",
        },
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,

    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.基础规则</color></size>
<size=28>
①可以吃碰，明杠，暗杠.
②可以一炮多响.
③麻将共136张牌，包括，万，条，筒，风（东南西北中发白）.
④有宝牌，宝牌为万能牌.
</size>
<size=32><color=#004f3c>二.胡牌规则</color></size>
<size=28>
①胡牌方式有两种，可自摸胡牌，也可以接炮胡.
②过胡惩罚：一圈内对方打出的牌能胡却没有胡，则在未经过自己时再次
  出现可接炮胡的牌时也都不可胡牌.
③有宝牌时只能自摸不能接炮胡.
</size>
<size=32><color=#004f3c>三.分数计算</color></size>
<size=28>
①平胡：+1分.
②十三烂：+2分.
③宝吊头：+2分.
④混一色：+2分.
⑤碰碰胡:+2分.
⑥抢杠胡：+2分.
⑦七小对：+4分.
⑧清一色：+4分.
⑨杠上开花：+4分.
⑩明杠：普通杠+1，风字杠+2.
⑪暗杠：普通杠+2，风字杠+3.
⑫风碰、红中碰：+1分.
</size>]],
}

return ConfigChild
