local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --安庆
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
                    {disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "3人玩法",toggleIsOn = false,},
                    {disable = false,json = "\"PlayerNum\":2",toggleType = 1,toggleTitle = "2人玩法",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = true,json = "\"BaoPai\":true",toggleType = 2,toggleTitle = "包牌不可接炮",toggleIsOn = true,clickTip="勾选后，存在包牌关系的两人只能自摸胡牌，不能接炮胡。"},
                    {disable = false,json = "\"QingYiSe\":true",toggleType = 2,toggleTitle = "清一色加分",toggleIsOn = false,clickTip="勾选后胡清一色牌型时将获得对应的牌型分。"},
                    {disable = false,json = "\"RandomSeat\":true",toggleType = 2,toggleTitle = "随机座位",toggleIsOn = false,clickTip="勾选后本局游戏第一局开始前将随机更换座位，不勾选则按照进入房间的顺序排座。"},
                }
            }
        },
        {
            tag = {togglesTile = "底花:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ZongJiaFen\":1",toggleType = 1,toggleTitle = "1底1花",toggleIsOn = true, addJson = "\"ZongFanBei\":1"},
                    {disable = false,json = "\"ZongJiaFen\":2",toggleType = 1,toggleTitle = "2底1花",toggleIsOn = false, addJson = "\"ZongFanBei\":1"},
                    {disable = false,json = "\"ZongJiaFen\":3",toggleType = 1,toggleTitle = "3底1花",toggleIsOn = false, addJson = "\"ZongFanBei\":1"},
                    {disable = false,json = "\"ZongJiaFen\":4",toggleType = 1,toggleTitle = "4底1花",toggleIsOn = false, addJson = "\"ZongFanBei\":1"},
                    {disable = false,json = "\"ZongJiaFen\":5",toggleType = 1,toggleTitle = "5底1花",toggleIsOn = false, addJson = "\"ZongFanBei\":1"},
                    {disable = false,json = "\"ZongJiaFen\":10",toggleType = 1,toggleTitle = "10底1花",toggleIsOn = false, addJson = "\"ZongFanBei\":1"},
                    {disable = false,json = "\"ZongJiaFen\":2",toggleType = 1,toggleTitle = "2底2花",toggleIsOn = false, addJson = "\"ZongFanBei\":2"},
                    {disable = false,json = "\"ZongJiaFen\":5",toggleType = 1,toggleTitle = "5底5花",toggleIsOn = false, addJson = "\"ZongFanBei\":5"},
                    {disable = false,json = "\"ZongJiaFen\":10",toggleType = 1,toggleTitle = "10底5花",toggleIsOn = false, addJson = "\"ZongFanBei\":5"},
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
  其中东风，红中，发财，白板是花牌.
</size>
<size=32><color=#004f3c>二.胡牌规则</color></size>
<size=28>
①胡牌方式有两种，可自摸胡牌，也可以接炮胡.
②过胡惩罚：一圈内对方打出的牌能胡却没有胡，则在未经过自己时
  再次出现可接炮胡的牌时也都不可胡牌.
③存在包牌关系的两个人，都只能自摸胡牌，不能接炮.
</size>
<size=32><color=#004f3c>三.分数计算</color></size>
<size=28>
①点炮，点炮者出分，自摸，三家出分.
②平胡：+1分.
③抢杠胡：+3分.
④天胡接炮：+5分.
⑤天胡自摸：+10分.
⑥大吊车：接炮+10分，自摸+20.
⑦小吊车：接炮+5分，自摸+10分.
⑧单调胡：+2分.
⑨碰碰胡：接炮+5，自摸+10分.
⑩门清：+2分.
⑪卡胡：+2分.
⑫边胡：+2分.
⑬对倒胡：+2分.
⑭杠上开花：+2 分，可累加.
⑮无花果：+5分.
⑯十三烂：+5分.
⑰七星归位：+5分.
⑱风碰：+1分，可叠加.
⑲普通杠（简条万）结算时候，明杠+2 ，暗杠+3.
⑳风牌杠（南风西风北风）结算时候，明杠+3 ,暗杠+4.
</size>]],
}

return ConfigChild
