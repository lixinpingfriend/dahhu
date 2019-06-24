local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --宿松
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
                    {disable = false,json = "\"QiangZhiPiaoHua\":true",toggleType = 2,toggleTitle = "强飘",toggleIsOn = true,clickTip="勾选后若游戏中发牌后，手中没有一张花牌则强制飘花。"},
                    {disable = false,json = "\"ZiDongHuPai\":true",toggleType = 2,toggleTitle = "必胡",toggleIsOn = true,clickTip="勾选后游戏中若满足胡牌条件则自动胡牌。"},
                }
            }
        },
        {
            tag = {togglesTile = "尊分:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"ZunFen\":0",toggleType = 1,toggleTitle = "不出尊",toggleIsOn = true},
                    {disable = false,json = "\"ZunFen\":1",toggleType = 1,toggleTitle = "1分",toggleIsOn = false},
                    {disable = false,json = "\"ZunFen\":2",toggleType = 1,toggleTitle = "2分",toggleIsOn = false},
                    {disable = false,json = "\"ZunFen\":5",toggleType = 1,toggleTitle = "5分",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "底分:",rowNum = 5},
            list =
            {
                {
                    {disable = false,json = "\"DiFen\":1",toggleType = 1,toggleTitle = "1分",toggleIsOn = true},
                    {disable = false,json = "\"DiFen\":2",toggleType = 1,toggleTitle = "2分",toggleIsOn = false},
                    {disable = false,json = "\"DiFen\":3",toggleType = 1,toggleTitle = "3分",toggleIsOn = false},
                    {disable = false,json = "\"DiFen\":4",toggleType = 1,toggleTitle = "4分",toggleIsOn = false},
                    {disable = false,json = "\"DiFen\":5",toggleType = 1,toggleTitle = "5分",toggleIsOn = false},
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
        isSuSong = true,
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price2(roundCount, playerCount, payType, bankerType)
        end,
        headTag = {
            serverJson = "PiaoNum",
            zeroJson = "0尊",
            addJson = "尊",
        },
        view = "tablesusong_view",
        controller = "tablesusong_controller",
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
③麻将共144张牌，包括，万，条，筒，风（东南西北中发白）.
  花（梅兰竹菊，春夏秋冬）.
</size>
<size=32><color=#004f3c>二.胡牌规则</color></size>
<size=28>
①胡牌方式有两种，可自摸胡牌，也可以接炮胡.
②过胡惩罚：一圈内对方打出的牌能胡却没有胡，则在未经过自己时再次
  出现可接炮胡的牌时也都不可胡牌.
③自摸胡牌没有补花限制，必须补花之后才能接炮胡牌.
④三西，存在三口关系的2人胡牌时输赢翻倍，别人放炮也同样出分.
</size>
<size=32><color=#004f3c>三.分数计算</color></size>
<size=28>
①点炮，点炮者出分，自摸，三家出分.
②小胡：+1分.
③大胡：+2分.
④大大胡：+3分.
⑤一索：+4分.
⑥花奖：每人出1个大胡分.
</size>]],
}

return ConfigChild
