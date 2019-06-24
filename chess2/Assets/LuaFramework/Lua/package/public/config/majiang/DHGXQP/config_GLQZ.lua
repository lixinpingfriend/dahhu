local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --全州麻将
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
            tag = {togglesTile = "翻醒:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ShangXing\":true",toggleType = 2,toggleTitle = "上醒",toggleIsOn = true,clickTip="勾选后计算上醒醒牌数量"},
                    {disable = false,json = "\"ZhongXing\":true",toggleType = 2,toggleTitle = "中醒",toggleIsOn = true,clickTip="勾选后计算中醒醒牌数量"},
                    {disable = false,json = "\"XiaXing\":true",toggleType = 2,toggleTitle = "下醒",toggleIsOn = true,clickTip="勾选后计算下醒醒牌数量"},
                }
            }
        },
        {
            tag = { togglesTile = "玩法:", rowNum = 2,xTotalOffset = 276 * 1.5 },
            list =
            {
                {
                    {disable = false,json = "\"ZiMoType\":0",toggleType = 1,toggleTitle = "自摸无分",toggleIsOn = true},
                    {disable = false,json = "\"ZiMoType\":1",toggleType = 1,toggleTitle = "自摸翻倍",toggleIsOn = false},
                    {disable = false,json = "\"ZiMoType\":2",toggleType = 1,toggleTitle = "自摸加子",toggleIsOn = false},
                    {disable = false,json = "\"YiPaoDuoXiang\":true",toggleType = 2,toggleTitle = "一炮多响",toggleIsOn = false},
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
            tag = {togglesTile = "语音:", rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ShiShiYuYin\":true",toggleType = 2,toggleTitle = "开启实时语音",toggleIsOn = false},
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
                ["8"] = 
                {   
                    ["12"] = 5,["13"] = 5,["14"] = 5,
                    ["02"] = 10,["03"] = 15,["04"] = 20,
                    ["22"] = 10,["23"] = 15,["24"] = 20,
                },
                ["12"] = 
                {
                    ["12"] = 8,["13"] = 8,["14"] = 8,
                    ["02"] = 16,["03"] = 24,["04"] = 32,
                    ["22"] = 16,["23"] = 24,["24"] = 32,
                },
                ["16"] = 
                {
                    ["12"] = 10,["13"] = 10,["14"] = 10,
                    ["02"] = 20,["03"] = 30,["04"] = 40,
                    ["22"] = 20,["23"] = 30,["24"] = 40,
                },
            }
            return prices[roundCount .. ""][payType .. "" .. playerCount]
        end,
        isMidTing = true,
        laiziTagTitle = "王牌",
        laiziTag = "15",
        maiMaTitelTag = "4",
        view = "tablequanzhoumajiang_view",
        layout3dTypes = { 2,1 }, ---游戏内可使用的3D麻将布局,如果不设置，则默认为Type1布局

        soundPath = "glqz",
        defLocationSetting = 1, ---默认的语言配置,0 或者不配置 普通话，1 方言，
        isOpenLocationSetting = true, ---打开方言设置
        useTotalResultRestart = true,
    },
}

ConfigChild.HowToPlayTexts =
{
    [[<size=32><color=#004f3c>一.基础规则</color></size>
    <size=28>
    1）麻将共136张牌，包括：万、条、筒、东、南、西、北、中、发、白；
    2）首局房主坐庄，之后谁胡牌谁做庄；流局（黄庄）时，摸最后一张牌的人坐庄；
    3）可吃、可碰、可杠；
    4）每局翻牌确定王八，王八可当做任何牌使用，但不能打出去；
    </size>
    <size=32><color=#004f3c>二.胡牌规则</color></size>
    <size=28>
    1）可自摸，也接炮，可抢杠胡；
    2）过胡后同圈内不能接炮，必须进张后才能再次接炮；
    </size>
    <size=32><color=#004f3c>三.翻醒规则</color></size>
    <size=28>
    1）胡牌的人从剩余的牌中翻一张牌，与手中的牌对比，相同的牌为“中醒”，大1点的为“上醒”，小1点的为“下醒”；
    2）醒牌数量用于最终分数结算；
    </size>
    <size=32><color=#004f3c>四.计分规则</color></size>
    <size=28>
    1）结算分=牌型总分+牌型总分*醒牌数；
    2）屁胡+1分；
    3）碰碰胡+1分；
    4）混一色+1分；
    5）清一色+2分；
    6）大三元+2分；
    7）七对+2分；
    8）无王八+1分；
    9）烂牌+1分；
    10）七星归位+2分；
    11）抓鱼+2分；
    12）暗杠+2分；
    13）明杠+1分；
    14）4王八+4分；
    15）天胡+5分；
    16）杠上炮+2分；
    17）抢杠胡+2分；
    18）杠上开花+2分；
    19）起手叫听+2分；
    </size>
    <size=32><color=#004f3c>五.互包规则</color></size>
    <size=28>
    1）吃碰杠同一家3次后，两人形成互包关系；
    2）互包关系的两人之间，结算分数*4倍；
    3）如果本局存在互包关系，则只有互包关系的两人之间可以接炮，其他人都不能接炮，自摸无限制；
    </size>]],
}

return ConfigChild
