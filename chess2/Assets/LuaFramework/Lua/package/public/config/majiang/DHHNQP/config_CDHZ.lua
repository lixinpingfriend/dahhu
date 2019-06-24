local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --红中
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
            tag = {togglesTile = "胡牌:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"BuKeJiePao\":true",toggleType = 1,toggleTitle = "自摸胡",toggleIsOn = false,clickTip="牌局内无法接炮胡牌，只能自摸胡牌。"},
                    {disable = false,json = "\"BuKeJiePao\":false",toggleType = 1,toggleTitle = "可接炮",toggleIsOn = true,clickTip="牌局内即可自摸胡牌也可以接炮胡牌。"},
                }
            }
        },
        { 
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"YouLaiZi\":true",toggleType = 2,toggleTitle = "红中",toggleIsOn = true,clickTip="牌局内无法接炮胡牌，只能自摸胡牌。"},
                    {disable = false,json = "\"ZhiNengPengYiDui\":true",toggleType = 2,toggleTitle = "只能对一对",toggleIsOn = false,clickTip="勾选后每局每个玩家只能碰1次，不勾选则碰牌无限制。"},
                    {disable = false,json = "\"BuKeChi\":true",toggleType = 2,toggleTitle = "不可吃牌",toggleIsOn = true,clickTip="勾选后牌局内将不能进行吃牌，不勾选则可吃牌。"},
                    {disable = false,json = "\"SiHongZhong\":true",toggleType = 2,toggleTitle = "4红中胡牌",toggleIsOn = true,clickTip="勾选后当摸到4个红中的时候可以直接胡牌，不勾选则没有此规则。"},
                    {disable = false,json = "\"YouQiangGangHu\":true",toggleType = 2,toggleTitle = "可抢杠胡",toggleIsOn = true,clickSmallShow = "1_1"},
                    {disable = false,json = "\"QiangGangHuBuZhuaNiao\":false",toggleType = 2,toggleTitle = "抢杠胡扎码",toggleIsOn = true,clickTip="抢杠胡时也有扎码。",smallShow="1_1",smallShowType = 1},
                }
            }
        },
        { 
            tag = {togglesTile = "扎码:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"ZhaMa\":3",toggleType = 1,toggleTitle = "扎2码",toggleIsOn = true,clickTip="胡牌后摸2张牌，如果数字为159或者红中，则算中码，每中一码多1分。",clickSmallShow = "1_2"},
                    {disable = false,json = "\"ZhaMa\":4",toggleType = 1,toggleTitle = "扎4码",toggleIsOn = false,clickTip="胡牌后摸4张牌，如果数字为159或者红中，则算中码，每中一码多1分。",clickSmallShow = "1_2"},
                    {disable = false,json = "\"ZhaMa\":5",toggleType = 1,toggleTitle = "扎6码",toggleIsOn = false,clickTip="胡牌后摸6张牌，如果数字为159或者红中，则算中码，每中一码多1分。",clickSmallShow = "1_2"},
                    {disable = false,json = "\"ZhaMa\":2",toggleType = 1,toggleTitle = "一码全中",toggleIsOn = false,clickTip="胡牌后摸1张牌，数值为几则加积分，如果摸到红中则加10分。"},
                    {disable = false,json = "\"ZhaMa\":10",toggleType = 1,toggleTitle = "摸几扎几",toggleIsOn = false,clickTip="胡牌数字是几扎几个码，例如胡牌1筒，则扎1个码；红中扎10个码。"},
                },
                {
                    {disable = false,json = "\"YouWuHongZhongJiaMa\":true",toggleType = 2,toggleTitle = "无红中加码",toggleIsOn = true,smallShow = "1_2",smallShowType = 1},
                }
            }
        },
        IsOpenStartNow = true, ---打开提前开局按钮
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
            return Config.caculate_price2_3(roundCount, playerCount, payType, bankerType)
        end,
    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.基础规则</color></size>
  <size=28>
  1）王麻将为四人麻将，红中为赖子，可以代替任何牌进行胡牌；
  2）王麻将可以碰杠，不能吃；
  3）牌局中杠牌立即结算，与胡不胡牌不相关，可也设置成黄庄时黄
     杠；
  4）万条筒1~9各4张，红中4张，共112张；
  5）首局有房主坐庄，之后谁胡谁庄，如果本局臭庄（黄庄），则最
     后
     摸牌的玩家下局坐庄，一炮多响的情况下由放炮玩家下局坐庄；
  </size>
  <size=32><color=#004f3c>二.胡牌规则</color></size>
  <size=28>
  1）胡牌方式有两种，可自摸胡牌，也可以接炮胡；
  2）可抢杠胡；
  3）过胡惩罚：一圈内对方打出的牌能胡却没有胡，则在未经过自己
     时再次出现可接炮胡的牌时也都不可胡牌；
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
  6）抢杠胡：6分；由杠牌玩家出分；
  7）无红中：1分；
  8）清一色：5分；
  9）天胡：2分；
  10）地胡：1分；
  11）臭庄（黄庄）的情况下不会计算杠分；
  12）扎2、4、6码：扎中1、5、9、红中算中码，1个码2分；若胡牌
      时没有红中则额外多抓1个码；
  </size>]]
}

return ConfigChild
