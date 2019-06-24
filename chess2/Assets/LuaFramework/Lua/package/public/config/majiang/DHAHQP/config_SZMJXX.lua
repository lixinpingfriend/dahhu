local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --萧县
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
            tag = {togglesTile = "底分:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"DiFen\":2",toggleType = 1,toggleTitle = "2分",toggleIsOn = true, ruleTitle = "勾选时，胡牌底分2分"},
                    {disable = false,json = "\"DiFen\":4",toggleType = 1,toggleTitle = "4分",toggleIsOn = false, ruleTitle = "勾选时，胡牌底分4分"},
                    {disable = false,json = "\"DiFen\":6",toggleType = 1,toggleTitle = "6分",toggleIsOn = false, ruleTitle = "勾选时，胡牌底分6分"},
                }
            }
        },
        {
            tag = {togglesTile = "模式:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"WanFaType\":0",toggleType = 1,toggleTitle = "平胡",toggleIsOn = true, clickTip = "勾选后无胡牌限制", clickSmallShow = "4_1", ruleTitle = "平胡模式"},
                    {disable = false,json = "\"WanFaType\":1",toggleType = 1,toggleTitle = "混夹",toggleIsOn = false, clickTip = "勾选后只能胡夹胡", ruleTitle = "夹胡模式"},
                    {disable = false,json = "\"WanFaType\":2",toggleType = 1,toggleTitle = "清夹",toggleIsOn = false, clickTip = "勾选后只能胡夹胡", ruleTitle = "清夹模式"},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"BuKeChi\":false",toggleType = 2,toggleTitle = "可吃牌",toggleIsOn = false, clickTip = "勾选后可以吃牌；未勾选时不能吃牌",smallShow="4_1",smallShowType = 1},
                    {disable = false,json = "\"KaHu\":1",toggleType = 2,toggleTitle = "掐张",toggleIsOn = false, clickTip = "勾选后掐张胡牌额外加分",smallShow="4_1",smallShowType = 1},
                    {disable = false,json = "\"DuanYao\":1",toggleType = 2,toggleTitle = "断幺",toggleIsOn = false, clickTip = "勾选后断幺胡牌额外加分",smallShow="4_1",smallShowType = 1},
                    {disable = false,json = "\"QiDui\":1",toggleType = 2,toggleTitle = "胡七对",toggleIsOn = false, clickTip = "勾选后胡七对额外加分",smallShow="4_1",smallShowType = 1},
                    {disable = false,json = "\"QingYiSe\":1",toggleType = 2,toggleTitle = "清一色",toggleIsOn = false, clickTip = "勾选后胡清一色额外加分",smallShow="4_1",smallShowType = 1},
                    {disable = false,json = "\"QueYiSe\":1",toggleType = 2,toggleTitle = "缺门",toggleIsOn = false, clickTip = "勾选后胡缺门额外加分",smallShow="4_1",smallShowType = 1},
                    {disable = false,json = "\"GangKaiFanBei\":true",toggleType = 2,toggleTitle = "杠开翻倍",toggleIsOn = false, clickTip = "勾选后杠上开花胡牌分翻倍"},
                    {disable = false,json = "\"KaiGangYingSanJia\":true",toggleType = 2,toggleTitle = "开杠赢三家",toggleIsOn = true, clickSmallShow = "4_2"},
                    {disable = false,json = "\"HuangZhuangHuangGang\":true",toggleType = 2,toggleTitle = "黄牌黄杠",toggleIsOn = true,smallShow="4_2",smallShowType = 1}
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
            zeroJson = "不追",
            notZeroJson = "追",
        },
        isShowPiao = true,
        PaoTitles = "不追|追",
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
1）可碰牌，可开杠，可吃牌;
2）不可以一炮多响;
3）可以接炮胡，也可以自摸胡牌;
4）坐庄:第一局由房主坐庄，之后谁胡牌谁坐庄;流局时，庄家连庄;
5）杠牌:
   ◆ 明杠:已经碰出去，自己摸到最后一张形成的杠;
   ◆ 暗杠:手牌中有3张相同的牌，自己摸到最后一张形成杠;
   ◆ 接杠:手牌中有3张相同的牌，杠其他玩家打出的最后一张
6）出分:
   ◆ 接炮胡:谁点炮谁出分;
   ◆ 自摸胡:一家自摸，三家出分;
7）特殊牌型:
   ◆ 掐张:即夹胡，1、3胡2是夹胡;
   ◆ 断幺:胡牌牌型内没有1、9、中发白;
   ◆ 缺门:条筒万缺少任意一门;
   ◆ 清一色:胡牌时结算，少两门且没有风牌;
   ◆ 七对:全是对子，没有碰杠、也没有刻子和顺子;
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）平胡玩法:无胡牌限制;
2）夹胡玩法:只能胡夹胡;
3）接炮胡:满足胡牌牌型即可;
4）自摸:满足胡牌牌型即可;
5）杠上炮:算平胡;
6）抢杠胡:算平胡;
7）天胡地胡:算平胡;
</size>
<size=32><color=#004f3c>四.计分规则</color></size>
<size=28>
1）平胡:1分;
2）掐张:1分;
3）断幺:1分;
4）缺门:1分;
5）清一色:1分;
6）七对:1分;
7）杠分:
   ◆ 暗杠:3分;
   ◆ 明杠:3分;
   ◆ 接杠:1分;
</size>]]
}

return ConfigChild
