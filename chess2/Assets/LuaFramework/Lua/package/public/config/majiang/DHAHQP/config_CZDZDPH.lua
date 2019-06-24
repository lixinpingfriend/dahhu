local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --东至点炮
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":4",toggleType = 1,toggleTitle = "4局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":12",toggleType = 1,toggleTitle = "12局",toggleIsOn = false},
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
                    {disable = false,json = "\"DaiQiXing\":true",toggleType = 2,toggleTitle = "带七星",toggleIsOn = false,clickTip=""},
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
                    {disable = false,json = "\"PayType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                },
            }
        },
        caculPrice = function (roundCount, playerNum, payType)
            local prices =
            {
                ["4"] = 
                {
                    ["12"] = 5,["13"] = 5,["14"] = 5,
                    ["02"] = 10,["03"] = 15,["04"] = 20,
                    ["22"] = 10,["23"] = 15,["24"] = 20
                },
                ["8"] =
                 {
                     ["12"] = 10,["13"] = 10,["14"] = 10,
                     ["02"] = 20,["03"] = 30,["04"] = 40,
                     ["22"] = 20,["23"] = 30,["24"] = 40
                },
                ["12"] = 
                {
                    ["12"] = 15,["13"] = 15,["14"] = 15,
                    ["02"] = 30,["03"] = 45,["04"] = 60,
                    ["22"] = 30,["23"] = 45,["24"] = 60
                },
            }
            print("roundCount : "..tostring(roundCount))
            print("payType : "..tostring(payType))
            print("playerNum : "..tostring(playerNum))

            return prices[roundCount .. ""][payType .. "" .. playerNum]
        end,
        isTablePop = true,
        isShowPiao = true,
        PaoTitles = "不跑|1跑|2跑",
        headTag = {
            serverJson = "PiaoNum",
            localJson = "YouPao",
            zeroJson = "不跑",
            addJson = "跑",
        },
        IsOpenStartNow = true, ---打开提前开局按钮
        useBriefOneGameResult = true,  ---是否使用简略小结算
        layout3dTypes = { 2,1 }, ---游戏内可使用的3D麻将布局,如果不设置，则默认为Type1布局
        totalResultshareTypeToggleDefState = 1,

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
    1）第一局随机庄家，之后谁胡谁庄，一炮多响时，放炮的人当庄，其他情况下轮庄
    2）不可吃牌
    3）可碰
    4）有过碰限制，同圈内不能碰同张
    5）可明杠
    6）可暗杠
    7）可接杠，接杠不接碰后不可杠
    8）杠分立刻结算，流局也正常结算  
     
    </size>
    <size=32><color=#004f3c>三.胡牌规则</color></size>
    <size=28>
    1）可自摸
    2）可接炮，可一炮多响。（有过胡限制，同圈过胡所有牌）
    3）可抢杠胡，按照放炮计算
    </size>
    <size=32><color=#004f3c>四.计分规则</color></size>
    <size=28>
    1）明杠=每人1分
    2）暗杠=每人2分
    3）接杠=放杠的出3分
    4）自摸=1分
    5）接炮=1分
    6）抢杠胡=1分
    7）七对=1分
    8）碰碰胡=1分
    9）天胡=1分
    10）地胡=1分
    </size>]],
}

return ConfigChild
