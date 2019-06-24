local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --九华山平胡
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":12",toggleType = 1,toggleTitle = "12局",toggleIsOn = false},
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
                    {disable = false,json = "\"PlayerNum\":2",toggleType = 1,toggleTitle = "2人玩法",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "倍数:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"BeiShu\":1",toggleType = 1,toggleTitle = "1倍",toggleIsOn = true},
                    {disable = false,json = "\"BeiShu\":2",toggleType = 1,toggleTitle = "2倍",toggleIsOn = false},
                    {disable = false,json = "\"BeiShu\":5",toggleType = 1,toggleTitle = "5倍",toggleIsOn = false},
                    {disable = false,json = "\"BeiShu\":10",toggleType = 1,toggleTitle = "10倍",toggleIsOn = false},
                }
            }
        },
        { 
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"QiDui\":true",toggleType = 2,toggleTitle = "七对加分",toggleIsOn = true},
                    {disable = false,json = "\"PaoZi\":true",toggleType = 2,toggleTitle = "跑子",toggleIsOn = true},
                    {disable = false,json = "\"HongZhongPei\":true",toggleType = 2,toggleTitle = "红中配",toggleIsOn = true},
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
                    { disable = false, json = "\"NeedOpenGPS\":true", toggleType = 2, toggleTitle = "GPS检测", toggleIsOn = false
                    ,input = { type = 1,defValue = "100",AddText = "米",json = "SafeDistance",maxLen = 3,followingTogglerState = true },clickTip = "距离小于X米的玩家不能加入房间"  },
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
            local prices =
            {
                ["8"] = 
                {
                    ["12"] = 8,["13"] = 8,["14"] = 8,
                    ["02"] = 16,["03"] = 24,["04"] = 32,
                },
                ["12"] = 
                {
                    ["12"] = 12,["13"] = 12,["14"] = 12,
                    ["02"] = 24,["03"] = 36,["04"] = 48,
                },
                ["16"] = 
                {
                    ["12"] = 16,["13"] = 16,["14"] = 16,
                    ["02"] = 32,["03"] = 48,["04"] = 64,
                },
            }
            return prices[roundCount .. ""][payType .. "" .. playerCount]
        end,
        isTablePop = true,
        laiziTagTitle = "天用",
        laiziTag = "5",
        isShowPao = true,
        PaoTitles = "不跑|1跑|2跑",
        headTag = {
            serverJson = "Pao",
            localJson = "XiaPao",
            zeroJson = "不跑",
            addJson = "跑",
        },
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,
        view = "tableqingyangpinghu_view",
        isShowTingDefValue = 0,
        goldResultType = "common",
    },
}

ConfigChild.HowToPlayTexts =
{
 [[<size=32><color=#004f3c>一.麻将数量</color></size>
 <size=28>
 1）麻将共136张牌，包括：万、条、筒、风（东南西北中发白）各4张
 </size>
 
 <size=32><color=#004f3c>二.基础规则</color></size>
 <size=28>
 1）可以碰，明杠，暗杠，不可以吃
 2）只能自摸胡，不能接炮胡
 3）坐庄规则：第一局房主坐庄，庄家胡牌连庄，流局时庄家连庄；其他情况轮庄
 4) 每局留7墩，14张牌。剩余牌摸完后黄庄，发财补张、杠从留出的14张牌中去补，不够再从牌堆去补
 5) 发财为花牌，打出去后补张，如果发财为天用牌时，则红中当做花牌使用
 </size>
 
 <size=32><color=#004f3c>三.胡牌规则</color></size>
 <size=28>
 1）胡牌方式：只能自摸胡，不能接炮胡
 2）胡牌限制：大于等于两个天用牌时只能跑风胡牌，清一色、字一色、天胡、地胡除外
 </size>
 
 <size=32><color=#004f3c>四.计分规则</color></size>
 <size=28>
 1）基础分：1分
 2）庄分： 输赢多1分
 3）小倒：+0分
 4）硬斗：+1分
 5）直杠：+4分
 6）弯杠：+2分
 7）风刻：有几个加几分
 8）四喜：+20分
 9）两飞：+1分
 10）清一色：+20分
 11）字一色：+40分
 12）发：1发1分，自动补发
 13）七对：+10
 14）天胡：+20
 15）地胡：+20
 </size>]],
}

return ConfigChild
