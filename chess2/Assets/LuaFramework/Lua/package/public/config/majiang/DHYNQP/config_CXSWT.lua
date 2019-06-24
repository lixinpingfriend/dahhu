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
                    {disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "3人",toggleIsOn = false,clickSmallShow = "1_2"},
                    {disable = false,json = "\"PlayerNum\":2",toggleType = 1,toggleTitle = "2人",toggleIsOn = false,clickSmallShow = "1_2"},
                }
            }
        },
        {
            tag = {togglesTile = "封顶:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"FengDing\":2",toggleType = 1,toggleTitle = "2番封顶",toggleIsOn = false},
                    {disable = false,json = "\"FengDing\":3",toggleType = 1,toggleTitle = "3番封顶",toggleIsOn = false},
                    {disable = false,json = "\"FengDing\":4",toggleType = 1,toggleTitle = "4番封顶",toggleIsOn = true},
                    {disable = false,json = "\"FengDing\":5",toggleType = 1,toggleTitle = "5番封顶",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"PlayType\":1",toggleType = 1,toggleTitle = "自摸",toggleIsOn = true},
                    {disable = false,json = "\"PlayType\":2",toggleType = 1,toggleTitle = "点炮",toggleIsOn = false},
                    {disable = false,json = "\"PlayType\":3",toggleType = 1,toggleTitle = "有番点炮",toggleIsOn = false},
                },
                {
                    {disable = false,json = "\"WuFeng\":true",toggleType = 2,toggleTitle = "无风",toggleIsOn = false},
                    {disable = false,json = "\"ChaJiao\":true",toggleType = 2,toggleTitle = "查叫",toggleIsOn = false},
                    {disable = false,json = "\"FangGangBaoPei\":true",toggleType = 2,toggleTitle = "放杠包赔",toggleIsOn = false},
                    {disable = false,json = "\"QiHuFen\":2",toggleType = 2,toggleTitle = "2分起胡",toggleIsOn = false},
                    {disable = false,json = "\"ZhanWu\":true",toggleType = 2,toggleTitle = "沾5就算",toggleIsOn = false},
                    {disable = false,json = "\"QuWanZi\":true",toggleType = 2,toggleTitle = "无万字",toggleIsOn = true,smallShow = "1_2",smallShowType = 1},
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
                    ["12"] = 10,["13"] = 7,["14"] = 5,
                    ["02"] = 20,["03"] = 20,["04"] = 20,
                    ["22"] = 20,["23"] = 20,["24"] = 20,
                },
                ["8"] =
                {
                    ["12"] = 20,["13"] = 14,["14"] = 10,
                    ["02"] = 40,["03"] = 40,["04"] = 40,
                    ["22"] = 40,["23"] = 40,["04"] = 40,
                },
                ["16"] =
                {
                    ["12"] = 40,["13"] = 27,["14"] = 20,
                    ["02"] = 80,["03"] = 80,["04"] = 80,
                    ["22"] = 80,["23"] = 80,["24"] = 80,
                },
            }
            return prices[roundCount .. ""][payType .. "" .. playerCount]
        end,
        view = "tablechuxiongerwutong_view",
        controller = "tablechuxiongmajiang_controller",
        layout3dTypes = { 2,1 }, ---游戏内可使用的3D麻将布局,如果不设置，则默认为Type1布局
        defGuoHu = 0,
        useOneClickOutMj = true,
        isShowTingDefValue = 0,
        goldResultType = "common",
        isShowFanShuWhileOneGameResult = true,
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
    1）第一局房主坐庄，之后谁胡谁庄，其他情况下轮庄
    2）剩余4张牌是流局（黄庄）
    3）不可吃牌
    4）可碰
    5）没有过碰限制
    6）可暗杠
    7）可明杠
    8）可接杠
    9) 必须听牌，且听口中包含4筒，5筒，并且杠后的听口里边也得包含4筒、或者5筒，才可以杠牌。其他情况下无法杠牌
     </size>
    
    <size=32><color=#004f3c>三.胡牌规则</color></size>
    <size=28>
    1）只能自摸，自摸3家出分
    </size>
    
    <size=32><color=#004f3c>四.计分规则</color></size>
    <size=28>
    1）自摸=0番
    2）接炮=0番
    3）门清=1番
    4）碰碰胡=1番
    5）清一色=1番
    6）小七对=2番 
    7）龙七对=3番
    8）双龙七对=4番
    9）十老头=1番
    10）杠上开花=1番
    11）双杠上花=2番
    12）五梅花=1番
    </size>]]
}

return ConfigChild
