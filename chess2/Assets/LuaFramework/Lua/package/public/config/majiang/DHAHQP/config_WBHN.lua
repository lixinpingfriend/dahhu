local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --淮南
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "",toggleType = 1,toggleTitle = "4局",toggleIsOn = false},
                    {disable = false,json = "",toggleType = 1,toggleTitle = "8局",toggleIsOn = true},
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
                    {disable = false,json = "\"DianPaoShiFouJiaBianDiao\":false",toggleType = 1,toggleTitle = "点炮无需夹边吊",toggleIsOn = true},
                    {disable = false,json = "\"DianPaoShiFouJiaBianDiao\":true",toggleType = 1,toggleTitle = "点炮只需夹边吊",toggleIsOn = false},
                },
                {
                    {disable = false,json = "\"ZiMoSuanFan\":true",toggleType = 1,toggleTitle = "自摸算番",toggleIsOn = false},
                    {disable = false,json = "\"ZiMoSuanFan\":false",toggleType = 1,toggleTitle = "自摸加底",toggleIsOn = true},
                },
                {
                    {disable = false,json = "\"ZhuangType\":1",toggleType = 1,toggleTitle = "胡牌当庄",toggleIsOn = true,clickTip = "首局房主当庄后，谁胡谁当庄。"},
                    {disable = false,json = "\"ZhuangType\":2",toggleType = 1,toggleTitle = "轮庄",toggleIsOn = false,clickTip = "或首局房主当庄后，将逆时针轮庄。"},
                },
                {
                    {disable = false,json = "\"GangPaoSuanFan\":false",toggleType = 2,toggleTitle = "杠炮算番",toggleIsOn = false},
                    {disable = false,json = "\"YouPiao\":true",toggleType = 2,toggleTitle = "下嘴",toggleIsOn = false},
                    {disable = false,json = "\"FengPai\":true",toggleType = 2,toggleTitle = "带风牌",toggleIsOn = true},
                    {disable = false,json = "\"ZhongFaBai\":true",toggleType = 2,toggleTitle = "带中发白",toggleIsOn = true},
                },

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
[[<size=32><color=#004f3c>一.基础规则</color></size>
<size=28>
①可碰牌，可开杠，但不能吃牌.
②可以一炮多响.
③麻将共136 张牌，包括，万，条，筒，风（东南西北中发白）.
④第一局由房主坐庄，之后谁胡牌谁坐庄；一炮多响时，谁放炮谁坐庄；流局下庄.
</size>
<size=32><color=#004f3c>二.胡牌规则</color></size>
<size=28>
①胡牌方式有两种，可自摸胡牌，也可以接炮胡.
②过胡惩罚：一圈内对方打出的牌能胡却没有胡，则在未经过自己时再次出现可接炮胡的牌时也都不可胡牌.
③抢杠胡、杠上炮、杠上开花、一炮多响、七小对等，只要满足胡牌牌型即可胡牌且都无特殊加分.
④杠随胡走：只有胡的玩家才进行杠分结算.
</size>
<size=32><color=#004f3c>三.分数计算</color></size>
<size=28>
①点炮，点炮者出分，自摸，三家出分.
②平胡接炮：放炮者出1分.
③自摸：每家出1分.
④明杠：放杠者出1分.
⑤暗杠：每家出2分.
⑥下嘴：1嘴1分.
</size>]],--淮南
}

return ConfigChild
