local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --营口麻将
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":2",toggleType = 1,toggleTitle = "2圈",addJson = "\"isDoubleQuan\":true",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":4",toggleType = 1,toggleTitle = "4圈",addJson = "\"isDoubleQuan\":true",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":6",toggleType = 1,toggleTitle = "6圈",addJson = "\"isDoubleQuan\":true",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "人数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"PlayerNum\":4",toggleType = 1,toggleTitle = "4人",toggleIsOn = true},
                    {disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "3人",toggleIsOn = false},
                    {disable = false,json = "\"PlayerNum\":2",toggleType = 1,toggleTitle = "2人",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "混牌:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"HunType\":1",toggleType = 1,toggleTitle = "4张混",toggleIsOn = true},
                    {disable = false,json = "\"HunType\":2",toggleType = 1,toggleTitle = "8张混",toggleIsOn = false},
                    {disable = false,json = "\"HunType\":0",toggleType = 1,toggleTitle = "无混",toggleIsOn = false,clickSmallShow = "1_2"},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"Gang\":true",toggleType = 2,toggleTitle = "杠",toggleIsOn = true},
                    {disable = false,json = "\"XuanFengGang\":true",toggleType = 2,toggleTitle = "旋风杠",toggleIsOn = true,clickSmallShow = "1_1"},
                    {disable = false,json = "\"ChangMaoGang\":true",toggleType = 2,toggleTitle = "长毛杠",toggleIsOn = false,smallShow = "1_1",smallShowType = 1},
                    {disable = false,json = "\"QingYiSe\":true",toggleType = 2,toggleTitle = "清一色",toggleIsOn = true},
                    {disable = false,json = "\"QiongHu\":true",toggleType = 2,toggleTitle = "穷胡",toggleIsOn = true,smallShow = "1_2",smallShowType = 2},
                    {disable = false,json = "\"DianPaoQuanBao\":true",toggleType = 2,toggleTitle = "点炮全包",toggleIsOn = true},
                    {disable = false,json = "\"TuiDaoHu\":true",toggleType = 2,toggleTitle = "推倒胡",toggleIsOn = true},
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
            tag = {togglesTile = "",rowNum = 4, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"PayType\":1",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"PayType\":0",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false},
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType, ruleTable)
            local prices =
            {
                ["2"] =
                {
                    ["12"] = 10,["13"] = 10,["14"] = 10,
                    ["02"] = 20,["03"] = 30,["04"] = 40
                },
                ["4"] =
                {
                    ["12"] = 20,["13"] = 20,["14"] = 20,
                    ["02"] = 40,["03"] = 60,["04"] = 80
                },
                ["6"] =
                {
                    ["12"] = 30,["13"] = 30,["14"] = 30,
                    ["02"] = 60,["03"] = 90,["04"] = 120
                },
            }
            return prices[roundCount .. ""][payType .. "" .. playerCount]
        end,

        laiziTagTitle = "混牌",
        laiziTag = "16",
        defGuoHu = 1, ---默认过胡设置，0开启过胡，1 关闭过胡
        IsOpenStartNow = true, ---打开提前开局按钮
        view = "tableyingkoumajiang_view",
        controller = "tableyingkoumajiang_cntroller",
        roundTitle = "圈",

    },
}

ConfigChild.HowToPlayTexts =
{
    [[<size=32><color=#004f3c>一.麻将数量</color></size>
    <size=28>
    1）麻将共136张牌，包括：万、条、筒、东、南、西、北、中、发、白
    </size>
    
    <size=32><color=#004f3c>二.基础规则</color></size>
    <size=28>
    1）可吃、可碰、可杠，只能吃碰杠3手落地
    2）过碰惩罚：无过碰惩罚
    3）无一炮多响
                 ● 如一炮多响时番数最大的优先胡牌，番数相同是根据摸牌顺序的优先级胡牌
    4) 第一局随机庄家，庄家胡牌连庄，其他情况下轮庄
    5) 留牌：最后4张牌只摸不打，只能胡牌不能进行其他操作
    6）发牌后翻牌堆第一张，4张混模式下+1为本局混、8张混模式下+1跟-1为本局的混
    7）混牌可以当做任何牌使用，但是不能组合进行吃碰杠。且不可打出
    </size>
    
    <size=32><color=#004f3c>三.杠牌规则</color></size>
    <size=28>
    1）可明杠，可暗杠
    2）旋风刚：起手有东南西北或者中发白每个一张的时候可以选择亮，东南西北算暗杠（不算开门），中发白算明杠（算开门）
    3）长毛杠：旋风后之后又摸到了 东南西北，或者中发白，则可以再杠
    </size>
    
    <size=32><color=#004f3c>四.胡牌规则</color></size>
    <size=28>
    1）胡牌方式：可自摸，可接炮。有过胡限制，过胡所有张
    2）没有抢杠胡
    3) 不缺门或者缺两门时可胡。（东南西北不算门）
    4) 必须有幺九才能胡牌，混牌变的幺九不算（风牌也算幺九）
    5) 必须有碰或者刻才能胡牌，混牌变的刻不算，如手里有一对风牌的将，则没有此条限制
    6）必须开门才能胡牌，吃碰明杠算开门
    </size>
    
    <size=32><color=#004f3c>五.计分规则</color></size>
    <size=28>
    1）自摸=1番
    2）点炮=1番
    3）庄=1番
    4）穷胡=1番
    5）清一色=1番
    6）飘胡=1番
    7）暗杠每人4分，明杠每人2分
    8）东南西北每人4分，中发白每人2分
    </size>]],
}

return ConfigChild
