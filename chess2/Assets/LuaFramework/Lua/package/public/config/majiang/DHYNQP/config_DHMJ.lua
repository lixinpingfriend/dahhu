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
    [[德宏麻将]]
}

return ConfigChild
