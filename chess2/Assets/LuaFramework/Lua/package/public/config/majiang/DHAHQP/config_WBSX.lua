local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --淮南寿县
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
                    {disable = false,json = "\"BuKeJiePao\":true",toggleType = 2,toggleTitle = "只能自摸",toggleIsOn = false,clickSmallShow = "1_1"},
                    {disable = false,json = "\"ShuiFangPaoChuFen\":true",toggleType = 2,toggleTitle = "谁放炮谁出分",toggleIsOn = false,smallShow = "1_1", smallShowType = 2,
                        clickTip="勾选后本局游戏放炮胡牌时只由放炮的人出分，不勾选则放炮胡牌时未胡牌的人都需要出分。"},
                    {disable = false,json = "\"GangShangKaiHua\":true",toggleType = 2,toggleTitle = "杠开加分",toggleIsOn = false,clickTip="勾选后本局游戏杠上开花胡牌时额外加分，不勾选则算普通自摸胡牌。"},
                    {disable = false,json = "\"YouPao\":true",toggleType = 2,toggleTitle = "压跑",toggleIsOn = true,clickTip="勾选后本局游戏激活压跑玩法"},
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
        isShowPao = true,
        PaoTitles = "不跑|1跑|2跑|3跑",
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
②无一炮多响.
③麻将共计112张牌，包含：万、条、筒、红中.
</size>
<size=32><color=#004f3c>二.胡牌规则</color></size>
<size=28>
①胡牌方式有两种，可自摸胡牌，也可以接炮胡.
②过胡惩罚：一圈内对方打出的牌能胡却没有胡，则在未经过自己时再次出现可接炮胡的牌时也都不可胡牌.
</size>
<size=32><color=#004f3c>三.分数计算</color></size>
<size=28>
①常规模式下，自摸放炮，都是三家出分.自摸分数是接炮分数得2倍。
②平胡：+1分.
③明杠：放杠者出1分.
⑤暗杠：每家出2分.
⑤边胡：+1分.
⑥卡胡：+1分.
⑦杠上开花：+1分.
⑧红中幺九将：+1分.
⑨庄家：输赢多1分，连庄几次输赢多几分.
</size>]], --淮南寿县
}

return ConfigChild
