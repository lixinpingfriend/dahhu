local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --阜阳临泉
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
                    {disable = false,json = "\"YouPiao\":true",toggleType = 2,toggleTitle = "可压小鸡",toggleIsOn = false,clickTip="勾选后本局游戏激活压小鸡玩法"},
                    {disable = false,json = "\"YouPao\":true",toggleType = 2,toggleTitle = "可压跑",toggleIsOn = false,clickTip="勾选后本局游戏激活压跑玩法"},
                    {disable = false,json = "\"YouFengPai\":false",toggleType = 2,toggleTitle = "不带风",toggleIsOn = false,clickTip=[[勾选后本局游戏内将去掉'东南西北中发白']]},
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
        isTablePop2 = true,
        isFYLQ = true,
        headTag = {
            serverJson = "PiaoNum",
            localJson = "YouPiao",
            zeroJson = "0鸡",
            addJson = "鸡",
            serverJson2 = "Pao",
            localJson2 = "YouPao",
            zeroJson2 = "0跑",
            addJson2 = "跑",
        },
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,

    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.基础规则</color></size>
<size=28>
①可以碰，明杠，暗杠，但不能吃牌.
②可压跑和压小鸡.
③麻将共136 张牌，包括，万，条，筒，风（东南西北中发白）.
④第一局由房主坐庄，之后谁胡牌谁坐庄；一炮多响时，谁放炮谁坐庄；流局下庄.
</size>
<size=32><color=#004f3c>二.胡牌规则</color></size>
<size=28>
①胡牌方式有两种，可自摸胡牌，也可以接炮胡.
②过胡惩罚：一圈内对方打出的牌能胡却没有胡，则在未经过自己时再次出现可接炮胡的牌时也都不可胡牌.
③抢杠胡、杠上炮、杠上开花、一炮多响、七小对等，只要满足胡牌牌型即可胡牌且都无特殊加分.
</size>
<size=32><color=#004f3c>三.分数计算</color></size>
<size=28>
①点炮，点炮者出分，自摸，三家出分.
②平胡：+1分.
③明杠：+1，由放杠者出分.
④暗杠：+1分，其他三人都要出分.
</size>]], -- 阜阳临泉
}

return ConfigChild
