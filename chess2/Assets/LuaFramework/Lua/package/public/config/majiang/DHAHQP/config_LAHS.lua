local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --霍山
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
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    --{disable = true,json = "\"null\":true",toggleType = 2,toggleTitle = "小宝追踪",toggleIsOn = true},
                    {disable = false,json = "\"FengYiSe\":true",toggleType = 2,toggleTitle = "风一色",toggleIsOn = true},
                    {disable = false,json = "\"TianDiHu\":true",toggleType = 2,toggleTitle = "天胡地胡",toggleIsOn = true},
                    {disable = false,json = "\"SiBaoBiHu\":true",toggleType = 2,toggleTitle = "4宝必胡",toggleIsOn = true},
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
            local prices =
            {
                ["4"] = 
                {
                    ["12"] = 4,["13"] = 4,["14"] = 4,
                    ["02"] = 15,["03"] = 15,["04"] = 15
                },
                ["8"] = 
                {
                    ["12"] = 8,["13"] = 8,["14"] = 8,
                    ["02"] = 30,["03"] = 30,["04"] = 30
                },
                ["16"] = 
                {
                    ["12"] = 15,["13"] = 15,["14"] = 15,
                    ["02"] = 60,["03"] = 60,["04"] = 60
                },
            }
            return prices[roundCount .. ""][payType .. "" .. playerCount]
        end,
        IsOpenStartNow = true, ---打开提前开局按钮
        layout3dTypes = { 2,1 }, ---游戏内可使用的3D麻将布局,如果不设置，则默认为Type1布局
        totalResultshareTypeToggleDefState = 1,

    },
}

ConfigChild.HowToPlayTexts =
{
[[霍山麻将]],
}

return ConfigChild
