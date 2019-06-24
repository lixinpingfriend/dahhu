local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --颍上杠后翻
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
                    {disable = false,json = "\"YouPao\":true",toggleType = 2,toggleTitle = "可压跑",toggleIsOn = false,clickTip="勾选后本局游戏激活压跑玩法"},
                    {disable = false,json = "\"WuFengPai\":true",toggleType = 2,toggleTitle = "无风牌",toggleIsOn = false,clickTip=[[勾选后本局游戏内将去掉'东南西北中发白']]},
                },
                {
                    {disable = false,json = "\"GangShangKaiHuaNum\":4",toggleType = 1,toggleTitle = "杠后翻4分",toggleIsOn = true},
                    {disable = false,json = "\"GangShangKaiHuaNum\":8",toggleType = 1,toggleTitle = "杠后翻8分",toggleIsOn = false},
                },
                {
                    {disable = false,json = "\"BuKeJiePao\":true",toggleType = 2,toggleTitle = "只能自摸",toggleIsOn = false},
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
        isShowPao = true,
        PaoTitles = "不跑|1跑|2跑",
        headTag = {
            serverJson = "Pao",
            localJson = "YouPao",
            zeroJson = "不跑",
            addJson = "跑",
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
②可额外下跑.
③麻将共136 张牌，包括，万，条，筒，风（东南西北中发白）.
④第一局由房主坐庄，之后谁胡牌谁坐庄；一炮多响时，谁放炮谁坐庄；流局下庄.
</size>
<size=32><color=#004f3c>二.胡牌规则</color></size>
<size=28>
①胡牌方式有两种，可自摸胡牌，也可以接炮胡.
②过胡惩罚：一圈内对方打出的牌能胡却没有胡，则在未经过自己时再次出现可接炮胡的牌时也都不可胡牌.
③杠随胡走：只有胡的玩家才进行杠分结算.
</size>
<size=32><color=#004f3c>三.分数计算</color></size>
<size=28>
①点炮，点炮者出分，自摸，三家出分.
②平胡接炮：放炮者出1分.
③自摸：每家出1分.
④明杠：放杠者出1分.
⑤暗杠：每家出1分.
⑥杠上花：每家出4分.
⑦杠后炮：放炮者出2分.
</size>]], --颍上杠后翻
}

return ConfigChild
