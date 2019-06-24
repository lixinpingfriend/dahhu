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
                    {disable = false,json = "\"PlayerNum\":2",toggleType = 1,toggleTitle = "2人玩法",toggleIsOn = false},
                }
            }
        },
        { 
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"BuKeJiePao\":false",toggleType = 2,toggleTitle = "可接炮",toggleIsOn = false,clickTip = "勾选后可以接炮胡"},
                    {disable = false,json = "\"YouLaiZi\":true",toggleType = 2,toggleTitle = "红中",toggleIsOn = true,clickTip = "勾选时带红中"},
                    {disable = false,json = "\"QiangGangQuanBao\":true",toggleType = 2,toggleTitle = "抢杠全包",toggleIsOn = true,clickTip = "勾选后被抢杠胡玩家包三家分"},
                    {disable = false,json = "\"HuangZhuangHuangGang\":true",toggleType = 2,toggleTitle = "黄庄黄杠",toggleIsOn = true,clickTip = "勾选后黄庄的情况下不计算杠分"},
                    {disable = false,json = "\"QiXiaoDui\":true",toggleType = 2,toggleTitle = "可胡七对",toggleIsOn = true,clickTip = "勾选后允许七对子胡牌"},
                    {disable = false,json = "\"BuKeChi\":true",toggleType = 2,toggleTitle = "不可吃牌",toggleIsOn = true,clickTip = "勾选后不允许吃牌"},
                    {disable = false,json = "\"SiHongZhong\":true",toggleType = 2,toggleTitle = "4红中胡牌",toggleIsOn = true,clickTip = "勾选后有4个红中可以直接胡牌"},
                    {disable = false,json = "\"QiangGangWuHongZhong\":true",toggleType = 2,toggleTitle = "抢杠胡无红中",toggleIsOn = false,clickTip = "勾选后没有红中不可以抢杠胡"},
                    {disable = false,json = "\"ZhiNengPengYiDui\":true",toggleType = 2,toggleTitle = "只能对一对",toggleIsOn = false,clickTip = "勾选后只能碰一次"},
                    {disable = false,json = "\"QingYiSe\":true",toggleType = 2,toggleTitle = "清一色加分",toggleIsOn = false,clickTip = "勾选后胡清一色有加分"},
                    {disable = false,json = "\"MenQing\":true",toggleType = 2,toggleTitle = "门清加分",toggleIsOn = false,clickTip = "勾选后胡门清有加分"},
                    {disable = false,json = "\"GangBaoQuanBao\":true",toggleType = 2,toggleTitle = "杠爆全包",toggleIsOn = false,clickTip = "勾选后杠上开花的放杠玩家包三家分"},
                }
            }
        },
        { 
            tag = {togglesTile = "扎码:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ZhaMa\":0",toggleType = 1,toggleTitle = "不扎码",toggleIsOn = false,clickSmallShow = "4_1",clickTip = "勾选后没有扎码"},
                    {disable = false, json = "ZhaMa", toggleType = 1, toggleTitle = "扎", toggleIsOn = true, dropDown = "2,4,6", dropDefault = 0, dropAddStr = "码",clickTip = "勾选后有扎码" },
                    {disable = false,json = "\"ZhaMa\":1",toggleType = 1,toggleTitle = "一码全中",toggleIsOn = false,clickSmallShow = "4_1",clickTip = "勾选后只扎一个马，点数多少额外加多少分"},
                },
                {
                    {disable = false,json = "\"HongZhongSuanMa\":true",toggleType = 2,toggleTitle = "红中算码",toggleIsOn = true,smallShow = "4_1",smallShowType = 2,clickTip = "勾选后翻开红中算中码"},
                    {disable = false,json = "\"GangKaiJiaMa\":true",toggleType = 2,toggleTitle = "杠开加码",toggleIsOn = false,smallShow = "4_1",smallShowType = 2,clickTip = "勾选后杠上开花扎码数量翻倍"},
                },
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
  </size>]]
}

return ConfigChild
