local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --桂柳麻将
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
                    {disable = false,json = "\"PlayerNum\":4",toggleType = 1,toggleTitle = "4人玩法",toggleIsOn = true},
                    {disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "3人玩法",toggleIsOn = false},
                    {disable = false,json = "\"PlayerNum\":2",toggleType = 1,toggleTitle = "2人玩法",toggleIsOn = false},
                }
            }
        },
        {
            tag = { togglesTile = "玩法:", rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"KeChi\":true",toggleType = 2,toggleTitle = "可吃牌",toggleIsOn = true},
                    {disable = false,json = "\"KeJiePao\":true",toggleType = 2,toggleTitle = "可点炮",toggleIsOn = true},
                    {disable = false,json = "\"YouFengPai\":true",toggleType = 2,toggleTitle = "带风牌",toggleIsOn = true},
                }
            }
        }, 
        {
            tag = {togglesTile = "翻醒:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ShangXing\":true",toggleType = 2,toggleTitle = "上醒",toggleIsOn = true},
                    {disable = false,json = "\"ZhongXing\":true",toggleType = 2,toggleTitle = "中醒",toggleIsOn = true},
                    {disable = false,json = "\"XiaXing\":true",toggleType = 2,toggleTitle = "下醒",toggleIsOn = true},
                },
                {
                    {disable = false,json = "\"XingWithHuaSe\":true",toggleType = 1,toggleTitle = "看花色",toggleIsOn = true},
                    {disable = false,json = "\"XingWithHuaSe\":false",toggleType = 1,toggleTitle = "不看花色",toggleIsOn = false},
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
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            local prices =
            {
                ["4"] = 
                {   
                    ["12"] = 4,["13"] = 4,["14"] = 4,
                    ["02"] = 8,["03"] = 12,["04"] = 16,
                    ["22"] = 8,["23"] = 12,["24"] = 16,
                },
                ["8"] = 
                {
                    ["12"] = 8,["13"] = 8,["14"] = 8,
                    ["02"] = 16,["03"] = 24,["04"] = 32,
                    ["22"] = 16,["23"] = 24,["24"] = 32,
                },
                ["16"] = 
                {
                    ["12"] = 16,["13"] = 16,["14"] = 16,
                    ["02"] = 32,["03"] = 48,["04"] = 64,
                    ["22"] = 32,["23"] = 48,["24"] = 64,
                },
            }
            return prices[roundCount .. ""][payType .. "" .. playerCount]
        end,
        maiMaTitelTag = "4",
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
    1）吃牌有吃什么牌不能打什么牌的限制
    2）过碰惩罚：有过碰限制
    3) 庄家规则：第一局随机庄家,之后谁胡谁庄,一炮多响放炮的人下局坐庄，流局轮庄
    </size>
    <size=32><color=#004f3c>三.杠牌规则</color></size>
    <size=28>
    1）可接杠、可补杠
    2）可暗杠
    3）杠后立刻结算杠分
    </size>
    <size=32><color=#004f3c>四.胡牌规则</color></size>
    <size=28>
    1）胡牌方式：可以自摸胡，也可以接炮胡
    2）有一炮多响
    3) 有过胡限制,过胡后同圈内不能接炮，必须进张后才能再次接炮。过单张
    4) 有抢杠胡，抢补杠
    </size>
    <size=32><color=#004f3c>五.翻醒规则</color></size>
    <size=28>
    1）胡牌的人从剩余的牌中番一张牌，与手中的牌对比，相同的牌为“中醒”，大1点的为“上醒”，小1点的为“下醒” 
         注：普通牌1-9循环，东南西北中发白循环
    2）醒牌数的计算需可配置是否看花色，看花色的话，醒牌数计算需要与翻的牌花色相同，不看花色则只看数字（此规则只影响筒万条，风牌不受影响）
    </size>
    <size=32><color=#004f3c>六.互包规则</color></size>
    <size=28>
    1）吃碰杠同一家3次后，两人形成互包关系
    2）互包关系的两人之间自摸胡牌，则另一方包3家分数后再乘2
    3）互包关系的两人之间接炮，另一方输分翻倍
    4）互包关系的两人接其他人炮，另一方也需要输给赢家响应的分数。(一炮多响时相互间独立计算）
    </size>
    <size=32><color=#004f3c>七.计分规则</color></size>
    <size=28>
    1）自摸3出分，谁放炮谁出分
    2）牌型分：
             牌型	     庄家胡牌	         闲家胡牌
                     自摸        接炮    自摸        接炮	
             平胡	  4           7      闲2，庄4     5
             烂牌     5           10     闲3，庄5	  8
             清一色   15          35      15          35
             字一色   15          35      15          35
             碰碰胡   15          35      15          35
             全求人   无          35      15          35
             七星烂牌 15          35      15          35
             七对     15          35      15          35
             豪华七对 30          70      15          35
             天胡     15          无      15          35
             地胡     无          35      无          35
    ● 追：庄家起手打的牌，如果其他3人第一圈都跟着打出4张相同的牌，则庄家立刻赔给每人1分（注：独立计算的分数）
    ● 门清=分数翻倍
    ● 杠分独立即时结算（与互包没有关系）
    ● 暗杠=每人2分
    ● 接杠补杠=放碰或者放杠的人3分
    ● 醒牌分数=1张醒牌1分，不参与三口翻倍计算
    </size>]],
}

return ConfigChild
