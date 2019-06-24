local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --楚雄
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
                    {disable = false,json = "\"PlayerNum\":4",toggleType = 1,toggleTitle = "4人",toggleIsOn = true},
                }
            }
        },
        {
            tag = {togglesTile = "封顶:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"FengDing\":3",toggleType = 1,toggleTitle = "三番",toggleIsOn = true},
                    {disable = false,json = "\"FengDing\":4",toggleType = 1,toggleTitle = "四番",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"KaBianJue\":true",toggleType = 2,toggleTitle = "卡边绝张",toggleIsOn = false},
                    {disable = false,json = "\"TianDiHu\":true",toggleType = 2,toggleTitle = "天地胡",toggleIsOn = false},
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
            local prices =
            {
                ["4"] =
                {
                    ["12"] = 5,["13"] = 5,["14"] = 5,
                    ["02"] = 10,["03"] = 15,["04"] = 20,
                    ["22"] = 10,["23"] = 15,["24"] = 20,
                },
                ["8"] =
                {
                    ["12"] = 10,["13"] = 10,["14"] = 10,
                    ["02"] = 20,["03"] = 30,["04"] = 40,
                    ["22"] = 20,["23"] = 30,["04"] = 40,
                },
                ["16"] =
                {
                    ["12"] = 20,["13"] = 20,["14"] = 20,
                    ["02"] = 40,["03"] = 60,["04"] = 80,
                    ["22"] = 40,["23"] = 60,["24"] = 80,
                },
            }
            return prices[roundCount .. ""][payType .. "" .. playerCount]
        end,
    },
}

ConfigChild.HowToPlayTexts =
{
    [[<size=32><color=#004f3c>一.麻将数量</color></size>
    <size=28>
    1）麻将共108张牌，包括：万、条、筒
    </size>
    
    <size=32><color=#004f3c>二.基础规则</color></size>
    <size=28>
    1）第一局房主坐庄，之后谁胡谁庄，一炮多响放炮的下局坐庄，其他情况轮庄
    2）不可吃牌
    3）可碰
    4）过碰后必须过手，才能碰牌
    5) 可明杠、暗杠、接杠
    6) 杠分立即结算，黄庄黄杠
    </size>
    
    <size=32><color=#004f3c>三.胡牌规则</color></size>
    <size=28>
    1）自摸，自摸3家出分
    2）接炮，谁放炮谁出分，可一炮多响
    3）有过胡规则，过胡后没过手之前不能接任何跑，即过说有听
    4) 最后4张必须胡，不能过
    </size>
    
    <size=32><color=#004f3c>四.计分规则</color></size>
    <size=28>
    1）平胡=0番
    2）门清=1番
    3）碰碰胡=1番
    4）清一色=1番
    5）龙抓背=2番
    6）卡绝张=1番
    7）边绝张=1番
    8）刚上开花=1番
    9）杠上炮=1番
    10）天胡=3番
    11）地胡=2番
    12）明杠=1分
    13）暗杠=2分
    14）接杠=1分
    </size>]]
}

return ConfigChild
