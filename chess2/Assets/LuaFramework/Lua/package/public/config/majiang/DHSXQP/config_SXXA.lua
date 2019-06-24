local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --西安
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
                    {disable = false,json = "\"DianPaoHu\":false",toggleType = 1,toggleTitle = "普通平胡",toggleIsOn = true},
                    {disable = false,json = "\"DianPaoHu\":true",toggleType = 1,toggleTitle = "点炮胡",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "可选:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"BuKePeng\":true",toggleType = 2,toggleTitle = "不碰牌",toggleIsOn = false},
                    {disable = false,json = "\"YouLaiZi\":true",toggleType = 2,toggleTitle = "红中癞子",toggleIsOn = false},
                    {disable = false,json = "\"YouFengPai\":true",toggleType = 2,toggleTitle = "带风牌",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "炮子:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"PaoFen\":0",toggleType = 1,toggleTitle = "0炮",toggleIsOn = false},
                    {disable = false,json = "\"PaoFen\":1",toggleType = 1,toggleTitle = "1炮",toggleIsOn = false},
                    {disable = false,json = "\"PaoFen\":2",toggleType = 1,toggleTitle = "2炮",toggleIsOn = false},
                    {disable = false,json = "\"PaoFen\":3",toggleType = 1,toggleTitle = "3炮",toggleIsOn = false},
                    {disable = false,json = "\"PaoFen\":4",toggleType = 1,toggleTitle = "4炮",toggleIsOn = false},
                    {disable = false,json = "\"PaoFen\":10",toggleType = 1,toggleTitle = "自由炮",toggleIsOn = true},
                }
            }
        },
        {
            tag = {togglesTile = "荒庄:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"LiuJuType\":0",toggleType = 1,toggleTitle = "抓完荒庄",toggleIsOn = true},
                    {disable = false,json = "\"LiuJuType\":1",toggleType = 1,toggleTitle = "硬十对",toggleIsOn = false},
                    {disable = false,json = "\"LiuJuType\":2",toggleType = 1,toggleTitle = "1杠七2杠八",toggleIsOn = false},
                },
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
        isTablePop = true,
        isShowPao = true,
        PaoTitles = "0炮|1炮|2炮|3炮|4炮",
        headTag = {
            serverJson = "Pao",
            zeroJson = "0炮",
            addJson = "炮",
        },
    },
}

ConfigChild.HowToPlayTexts =
{
[[  <size=32><color=#004f3c>一.基础规则</color></size>
  <size=28>
  1）红中麻将为四人麻将，红中为赖子，可以代替任何牌进行胡牌；
  2）红中麻将可以碰杠，不能吃；
  3）牌局中杠牌立即结算，与胡不胡牌不相关，可也设置成黄庄时黄杠；
  4）万条筒1~9各4张，红中4张，共112张；
  5）首局有房主坐庄，之后谁胡谁庄，如果本局臭庄（黄庄），则最后
     摸牌的玩家下局坐庄，一炮多响的情况下由放炮玩家下局坐庄；
  </size>
  <size=32><color=#004f3c>二.胡牌规则</color></size>
  <size=28>
  1）胡牌方式有两种，可自摸胡牌，也可以接炮胡；
  2）可抢杠胡；
  3）过胡惩罚：一圈内对方打出的牌能胡却没有胡，则在未经过自己时再
     次出现可接炮胡的牌时也都不可胡牌；
  </size>
  <size=32><color=#004f3c>三.分数计算</color></size>
  <size=28>
  1）放杠：
     ◆ 四人玩法：3分；
     ◆ 三人玩法：2分；
  2）明杠：
     ◆ 四人玩法：1分；
     ◆ 三人玩法：1分；
  3）暗杠：
     ◆ 四人玩法：2分；
     ◆ 三人玩法：2分；
  4）接炮：2分；
  5）自摸：2分；
  6）抢杠胡：2分；由杠牌玩家出分；
  7）门清：1分；
  8）无红中：1分；
  9）七小对：4分；
  10）清一色：5分；
  11）清一色七小对：7分；
  12）天胡：2分；
  13）地胡：1分；
  14）臭庄（黄庄）的情况下不会计算杠分；
  15）扎2、4、6码：扎中1、5、9、红中算中码，每中1个则额外加1分；
  </size>]],
}

return ConfigChild
