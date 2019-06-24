local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --梧州麻将
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":4",toggleType = 1,toggleTitle = "4局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":16",toggleType = 1,toggleTitle = "16局",toggleIsOn = false},
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
            tag = {togglesTile = "买马:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ZhaMa\":0",toggleType = 1,toggleTitle = "不买",toggleIsOn = true, clickSmallShow = "3_1"},
                    { disable = false, json = "ZhaMa", toggleType = 1, toggleTitle = "买", toggleIsOn = false, dropDown = "2,4,6,8,10", dropDefault = 2, dropAddStr = "马"},
                    {disable = false,json = "\"LiuMaPai\":true",toggleType = 2,toggleTitle = "留够马牌",toggleIsOn = false, smallShow = "3_1",smallShowType = 2,clickTip = "勾选后，牌局最后必须保证剩余的牌够翻马"},
                }
            }
        },
        {
            tag = { togglesTile = "玩法:", rowNum = 3},
            list =
            {
                {
                    { disable = false, json = "\"YouFengPai\":false", toggleType = 2, toggleTitle = "不带风", toggleIsOn = false,clickTip = "勾选后没有东南西北中发白"},
                    { disable = false, json = "\"BuKeChi\":false", toggleType = 2, toggleTitle = "可上牌", toggleIsOn = false,clickTip = "勾选后可以吃牌"},
                    { disable = false, json = "\"BuKeJiePao\":false", toggleType = 2, toggleTitle = "可吃胡", toggleIsOn = false,clickTip = "勾选后可以接炮胡"},
                    { disable = false, json = "\"QiangGangQuanBao\":true", toggleType = 2, toggleTitle = "抢杠全包", toggleIsOn = true,clickTip = "勾选后被抢杠胡的玩家包3家"},
                    { disable = false, json = "\"GangBaoQuanBao\":true", toggleType = 2, toggleTitle = "杠爆全包", toggleIsOn = true,clickTip = "勾选后直杠杠上花胡牌，放杠的玩家包三家"},
                    --{ disable = false, json = "\"RandomSeat\":true", toggleType = 2, toggleTitle = "随机座位", toggleIsOn = false,clickTip = "勾选后开局时通过摸东南西北重新定座位"},
                },
            }
        },
        {
            tag = { togglesTile = "鬼牌:", rowNum = 3},
            list =
            {
                {
                    { disable = false, json = "\"GuiPai\":3", toggleType = 1, toggleTitle = "白板做鬼", toggleIsOn = true,clickTip = "勾选后，白板是鬼牌"},
                    { disable = false, json = "\"GuiPai\":1", toggleType = 1, toggleTitle = "翻1鬼", toggleIsOn = false,clickTip = "勾选后，翻1张鬼牌"},
                    { disable = false, json = "\"GuiPai\":2", toggleType = 1, toggleTitle = "翻2鬼", toggleIsOn = false,clickTip = "勾选后，翻2张鬼牌"},
                    { disable = false, json = "\"GuiPai\":0", toggleType = 1, toggleTitle = "无鬼", toggleIsOn = false,clickTip = "勾选后，没有鬼牌"},
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
            tag = {togglesTile = "",rowNum = 4, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"PayType\":1",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"PayType\":0",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false},
                    {disable = false,json = "\"PayType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price2_5(roundCount, playerCount, payType, bankerType)
        end,
        laiziTagTitle = "鬼牌",
        laiziTag = "8",
        isWuZhou = true,
    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1）麻将共136张牌，包括:万、条、筒、风（东南西北中发白）;
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）可碰牌，可开杠，不可上牌;
2）可自摸，不可吃胡，可以杠上炮和抢杠胡;
3）坐庄规则:第一局房主为庄，之后谁胡谁庄；一炮多响情况下，第一胡
   牌顺位为庄;流局庄家连庄;
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）自摸:满足胡牌牌型即可;
2）吃胡:不可胡;
3）大胡牌型:
 ◆ 碰碰胡:胡牌时，手牌中没有顺子;
 ◆ 清一色:胡牌时结算，少两门且没有风牌才算清一色;
 ◆ 十三幺:19条19万19筒东南西北中发白，额外再加任何一个19或者风
    牌;
 ◆ 混一色:胡牌时结算，少两门且必须有风牌才算混一色;
</size>
<size=32><color=#004f3c>四.中码规则</color></size>
<size=28>
1）胡牌后进行奖马，胡牌者中马后赢取额外奖马分
 ◆ 庄家的马牌对应为1，5，9，东风
 ◆ 庄家下家的马牌对应为2，6，南风，红中
 ◆ 庄家对家的马牌对应为3，7，西风，发财
 ◆ 庄家上家的马牌对应为4，8，北风，白板
2）在结算计分时，只计算胡牌玩家的马，其他家的马不算，一炮多响时
   ，只计算第一胡牌顺位的马;
3）马跟底分：胡牌底分为几分，每个马就为几分;
</size>
<size=32><color=#004f3c>五.鬼牌</color></size>
<size=28>
1）白板做鬼:白板当作鬼牌，可以当成任意牌使用;
2）翻1鬼:翻一张牌后，那张牌后面的牌当作鬼牌;
3）翻2鬼:翻一张牌后，那张牌后面的两张牌当作鬼牌;
</size>
<size=32><color=#004f3c>六.计分规则</color></size>
<size=28>
1）直杠:3分;
2）暗杠:每人2分;
3）明杠:每人1分;
4）过手杠:0分;
5）小胡:1分;
6）大胡:2分;
</size>]],--梧州麻将
}

return ConfigChild
