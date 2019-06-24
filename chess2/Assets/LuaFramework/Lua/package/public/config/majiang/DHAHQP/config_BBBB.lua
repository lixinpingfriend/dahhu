




local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --蚌埠
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
            tag = {togglesTile = "花牌:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ZfbHuaPai\":true",toggleType = 2,toggleTitle = "中发白花牌",toggleIsOn = true},
                    --{disable = false,json = "\"YouHuaPai\":true",toggleType = 2,toggleTitle = "春夏秋冬梅兰竹菊花牌",toggleIsOn = true},
                }
            }
        },
        {
            tag = {togglesTile = "听牌:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"Null\":0",toggleType = 1,toggleTitle = "无听牌",toggleIsOn = true},
                    {disable = false,json = "\"TingPaiJiaDi\":2",toggleType = 1,toggleTitle = "听牌加2底",toggleIsOn = false,addJson = "\"isMidTing\":true"},
                    {disable = false,json = "\"TingPaiJiaDi\":4",toggleType = 1,toggleTitle = "听牌加4底",toggleIsOn = false,addJson = "\"isMidTing\":true"},
                },
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"QiXiaoDui\":true",toggleType = 2,toggleTitle = "七小对",toggleIsOn = false},
                    {disable = false,json = "\"OnlyZimo\":true",toggleType = 2,toggleTitle = "只能自摸",toggleIsOn = false,clickSmallShow="2_1",clickBigShow = "6_1",},
                    {disable = false,json = "\"KeQiangGang\":true",toggleType = 2,toggleTitle = "可抢杠",toggleIsOn = false,smallShow="2_1",smallShowType = 1,clickSmallShow="3_1",
                        clickBigShow = "5_1",},
                    {disable = false,json = "\"GangHouPao\":true",toggleType = 2,toggleTitle = "杠后炮",toggleIsOn = false,smallShow="2_1",smallShowType = 1,clickSmallShow="4_1",
                        clickBigShow = "5_1",},
                },
                {
                    {disable = false,json = "\"GhpJiaFen\":true",toggleType = 2,toggleTitle = "杠后翻翻倍",toggleIsOn = true,smallShow="4_1",smallShowType = 1,clickTip = "补花自摸、杠上炮、杠上花翻倍"},
                },
            }
        },
        {
            tag = {togglesTile = "",rowNum = 3,bigShow="5_1",bigShowType = 1 },
            list =
            {
                {
                    {disable = false,json = "\"YiPaoDuoXiang\":true",toggleType = 2,toggleTitle = "一炮多响",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "",rowNum = 3,bigShow="6_1",bigShowType = 2 },
            list =
            {
                {
                    {disable = false,json = "\"GhpJiaFen\":true",toggleType = 2,toggleTitle = "杠后翻翻倍",toggleIsOn = true, clickTip = "补花自摸、杠上炮、杠上花翻倍"},
                    {disable = false,json = "\"YiPaoDuoXiang\":true",toggleType = 2,toggleTitle = "一炮多响",toggleIsOn = false},
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
            return Config.caculate_price_AHQP_BBBB(roundCount, playerCount, payType, bankerType)
        end,
        addJson = "\"JiaBianDiao\":true,",
        isMidTing = true,
        tingLocalJson = "isMidTing",
        view = "tablebengbumajiang_view",
        controller = "tablebengbumajiang_controller",
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,

    },
}

ConfigChild.HowToPlayTexts =
{
    [[<size=32><color=#004f3c>一、基础规则</color></size>
<size=28>
1）1-9万，1-9筒，1-9条，东南西北中发白各4张，共136张牌
2）有花牌，春夏秋冬梅兰竹菊，东风固定为花牌
3）支持4人玩法和3人玩法
4）可碰、杠，不可吃牌
5）支持一炮多响
6）有杠上花、杠后炮、抢杠胡
7）在【听牌加2底】、【听牌加4底】选项下有听牌流程
</size>
<size=32><color=#004f3c>二、庄家规则</color></size>
<size=28>
1）第1局游戏房主为庄
2）庄胡、黄庄则庄家连庄
3）闲家胡牌，则庄家的下家当庄
</size>
<size=32><color=#004f3c>三、算分规则</color></size>
<size=28>
3.1 算分公式
1）计分=胡牌分+自摸分+庄分+牌型分+杠分+花牌分
2）胡牌分=1分
3）自摸分=1分
4）庄分=1分

3.2 牌型分
1）夹边吊=1分
2）听牌=1分
3）杠后炮=1分

3.3 花牌分
1）花牌=1分/张
2）胡牌时有几张花牌算几分，只计算自己的花牌

3.4 杠分
1）暗杠=2分
2）明杠=1分
3）只有胡牌的玩家才计算杠分

3.5 特殊规则
1）抢杠胡算自摸，被抢杠的玩家出3家的分
2）杠上开花算普通自摸
3）杠后炮为点炮，勾选【杠后翻翻倍】后得分翻倍
4）听牌分解释：在勾选了【听牌加底】选项后，才有听牌流程，不勾选则没有听牌流程
</size>
]]
}

return ConfigChild
