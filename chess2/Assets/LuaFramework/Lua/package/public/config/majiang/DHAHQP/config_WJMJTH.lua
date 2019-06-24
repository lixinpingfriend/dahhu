local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --太湖
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
            tag = {togglesTile = "底花:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"ZongJiaFen\":0",toggleType = 1,toggleTitle = "无底花",toggleIsOn = true},
                    {disable = false,json = "\"ZongJiaFen\":5",toggleType = 1,toggleTitle = "5花",toggleIsOn = false},
                    {disable = false,json = "\"ZongJiaFen\":10",toggleType = 1,toggleTitle = "10花",toggleIsOn = false},
                    {disable = false,json = "\"ZongJiaFen\":20",toggleType = 1,toggleTitle = "20花",toggleIsOn = false},
                }
            }
        },
        {
           tag = {togglesTile = "玩法:",rowNum = 3},
           list =
           {
               {
                   {disable = false,json = "\"GangKai\":4",toggleType = 1,toggleTitle = "杠开+4",toggleIsOn = true,clickTip = "勾选后，杠上开花+4分，连续杠开时累加"},
                   {disable = false,json = "\"GangKai\":8",toggleType = 1,toggleTitle = "杠开+8",toggleIsOn = false,clickTip = "勾选后，杠上开花+8分，连续杠开时累加"},
               },
               {
                   {disable = false,json = "\"AnGangBuLiang\":true",toggleType = 2,toggleTitle = "暗杠不亮",toggleIsOn = false,clickTip = "勾选后暗杠仅自己可见"},
                   {disable = false,json = "\"ChiSanKou\":true",toggleType = 2,toggleTitle = "吃三口",toggleIsOn = true,clickTip = "勾选后激活三口关系的玩家只能自摸胡，若其中一人胡牌，则另外一方输给胡牌方3倍的分数"},
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
②过胡惩罚：一圈内对方打出的牌能胡却没有胡，则在未经过自己时再次
  出现可接炮胡的牌时也都不可胡牌.
</size>
<size=32><color=#004f3c>三.分数计算</color></size>
<size=28>
①点炮，点炮者出分，自摸，三家出分.
②平胡：+2分.
③自摸：+2分.
④无花果：+2分.
⑤杠上开花：+4分.
⑥七小对：接炮+5分，自摸+10分.
⑦豪华七小对：接炮+10分，自摸+20分.
⑧清一色：接炮+5分，自摸+10分.
⑨碰碰胡：接炮+5分，自摸+10分.
⑩大吊车：接炮+5分，自摸+10分.
⑪普通明杠：＋5分.
⑫普通暗杠：＋10分.
⑬风字明杠：＋6分.
⑭风字暗杠：＋10分.
</size>]],
}

return ConfigChild
