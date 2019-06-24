local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --砀山麻将
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
                    {disable = false,json = "\"BuKeChi\":false",toggleType = 2,toggleTitle = "可吃牌",toggleIsOn = false,clickTip = "勾选后可以吃牌"},
                    {disable = false,json = "\"QiXiaoDui\":true",toggleType = 2,toggleTitle = "可胡七对",toggleIsOn = true,clickTip = "勾选后可以胡七对"},
                    {disable = false,json = "\"JiaZhu\":true",toggleType = 2,toggleTitle = "可下码",toggleIsOn = false,clickTip = "勾选后有下码"},
                    {disable = false,json = "\"YiPaoDuoXiang\":true",toggleType = 2,toggleTitle = "一炮多响",toggleIsOn = false,clickTip = "勾选后可以一炮多响"},
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
        headTag = {
            serverJson = "PiaoNum",
            localJson = "JiaZhu",
            zeroJson = "不下",
            notZeroJson = "下码",
        },
        isShowPiao = true,
        PaoTitles = "不下码|下码",
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,

    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1）麻将共120张牌，包括：万、条、筒、风（中发白）;
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）可碰牌，可开杠，不可吃牌;
2）不可以一炮多响;
3）可以接炮胡，也可以自摸胡牌;
4）坐庄:第一局由房主坐庄，之后谁胡牌谁坐庄;流局时，庄家连庄;
5）杠牌:
   ◆ 补杠:已经碰出去，自己摸到最后一张形成的杠，胡牌玩家不算杠
      分;
   ◆ 暗杠:手牌中有3张相同的牌，自己摸到最后一张形成杠，胡牌玩家
      不算暗杠分;
   ◆ 明杠:手牌中有3张相同的牌，杠其他玩家打出的最后一张，胡牌玩
      家不算放杠分;
6）出分:
   ◆ 接炮胡:谁点炮谁出分;
   ◆ 自摸胡:一家自摸，三家出分;
8）特殊牌型:
   ◆ 夹张:1、3胡2是夹张;
   ◆ 边张:12胡3或89胡7是边张;
   ◆ 只剩一张:吃碰杠4次，只剩一张牌，单吊听将;
   ◆ 杠上开花:杠后补牌并胡牌;
   ◆ 七对:全是对子，没有碰杠、也没有刻子和顺子;
   ◆ 天胡:庄家起手自摸胡牌;
   ◆ 地胡:庄家打第一张牌，闲家接炮胡牌;
   ◆ 抢杠胡:抢杠胡只能抢补杠;
   ◆ 海底捞月:摸最后一张胡牌;
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）自摸:满足胡牌牌型即可;
2）接炮:满足胡牌牌型即可;
</size>
<size=32><color=#004f3c>四.计分规则</color></size>
<size=28>
1）自摸:底分*1;	
2）接炮:底分*1;
3）天胡:底分*1;
4）地胡:底分*1;
5）七对:底分*2;
6）抢杠胡:底分*1;
7）只剩一张:底分*1;
8）海底捞月:底分*2;
9）夹张:底分*1;
10）边张:底分*1;
11）杠后开花:底分*1;
</size>]]
}

return ConfigChild
