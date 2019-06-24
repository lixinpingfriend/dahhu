local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --阜南三门胡
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
            tag = {togglesTile = "选项:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"BuKeJiePao\":false",toggleType = 2,toggleTitle = "可接炮胡",toggleIsOn = false,clickTip="勾选后本局游戏可以接炮胡。"},
                    {disable = false,json = "\"DaiYaoDaiGang\":true",toggleType = 2,toggleTitle = "带幺带杠",toggleIsOn = false,clickTip="勾选后本局游戏激活带幺带杠算分规则。"},
                    {disable = false,json = "\"JiaBianDiao\":true",toggleType = 2,toggleTitle = "胡牌必须夹边吊",toggleIsOn = false,clickTip="勾选后本局游戏听牌只能听夹边吊的牌型。"},
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
        totalResultshareTypeToggleDefState = 1,

    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.基础规则</color></size>
<size=28>
①可以碰，明杠，暗杠，不可以吃.
②不可以一炮多响.
③坐庄规则:第一局房主坐庄，之后谁胡谁庄，流局下一手坐庄.
④条、万、筒、东南西北中发白总计136张牌.
</size>
<size=32><color=#004f3c>二.胡牌规则</color></size>
<size=28>
①只能自摸胡牌，不能接炮胡.
②过胡惩罚:一圈内对方打出的牌能胡却没有胡，则在未经过自己时再
次出现可接炮胡的牌时也都不可胡牌.
③杠计分:单局结束时计算，每个人的杠独立计算，流局时杠作废.
④只要满足牌型都可胡牌.
</size>
<size=32><color=#004f3c>三.分数计算</color></size>
<size=28>
①自摸:三家出分.
②平胡:+1分.
③明杠:+1分.
④暗杠:+1分.
</size>]], -- 阜南三门胡
}

return ConfigChild
