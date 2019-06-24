local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --轮流坐庄
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":10",toggleType = 1,toggleTitle = "10局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":20",toggleType = 1,toggleTitle = "20局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":30",toggleType = 1,toggleTitle = "30局",toggleIsOn = false},
                },
            }
        },
        { 
            tag = {togglesTile = "坐庄:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"bankerType\":0",toggleType = 1,toggleTitle = "轮流坐庄",toggleIsOn = true},
                    {disable = false,json = "\"bankerType\":1",toggleType = 1,toggleTitle = "随机坐庄",toggleIsOn = false},
                    {disable = false,json = "\"bankerType\":5",toggleType = 1,toggleTitle = "房主当庄",toggleIsOn = false},
                    {disable = false,json = "\"bankerType\":4",toggleType = 1,toggleTitle = "牛牛上庄",toggleIsOn = false},
                    {disable = false,json = "\"bankerType\":3",toggleType = 1,toggleTitle = "牛九上庄",toggleIsOn = false},
                },
            }
        },
        { 
            tag = {togglesTile = "下注:",rowNum = 4,maxValidNum = 5, minValidNum = 2},
            list =
            {
                {
                    {disable = false,json = "\"xiaZhuScore_1\":true",toggleType = 2,toggleTitle = "1分",toggleIsOn = true, refreshUI = true},
                    {disable = false,json = "\"xiaZhuScore_2\":true",toggleType = 2,toggleTitle = "2分",toggleIsOn = true, refreshUI = true},
                    {disable = false,json = "\"xiaZhuScore_3\":true",toggleType = 2,toggleTitle = "3分",toggleIsOn = true, refreshUI = true},
                    {disable = false,json = "\"xiaZhuScore_4\":true",toggleType = 2,toggleTitle = "4分",toggleIsOn = true, refreshUI = true},
                    {disable = false,json = "\"xiaZhuScore_5\":true",toggleType = 2,toggleTitle = "5分",toggleIsOn = true, refreshUI = true},
                    {disable = false,json = "\"xiaZhuScore_6\":true",toggleType = 2,toggleTitle = "6分",toggleIsOn = false, refreshUI = true},
                    {disable = false,json = "\"xiaZhuScore_8\":true",toggleType = 2,toggleTitle = "8分",toggleIsOn = false, refreshUI = true},
                    {disable = false,json = "\"xiaZhuScore_10\":true",toggleType = 2,toggleTitle = "10分",toggleIsOn = false, refreshUI = true},
                },
            }
        },
        { 
            tag = {togglesTile = "牌型:",rowNum = 3},
            list =
            {
                {
                    { disable = true, json = "niu7_beiShu", toggleType = 2, toggleTitle = "牛七", toggleIsOn = true, dropDown = "1,2,3,4,5", dropDefault = 0 },
                    { disable = true, json = "niu8_beiShu", toggleType = 2, toggleTitle = "牛八", toggleIsOn = true, dropDown = "2,3,4,5,6", dropDefault = 0 },
                    { disable = true, json = "niu9_beiShu", toggleType = 2, toggleTitle = "牛九", toggleIsOn = true, dropDown = "2,3,4,5,6", dropDefault = 0 },
                    { disable = true, json = "niu10_beiShu", toggleType = 2, toggleTitle = "牛牛", toggleIsOn = true, dropDown = "3,4,5,6,8", dropDefault = 0 },
                    { disable = true, json = "jinNiu_beiShu", toggleType = 2, toggleTitle = "五花牛", toggleIsOn = true, dropDown = "4,6,8,10", dropDefault = 0 },
                    { disable = false, json = "siZha_beiShu", toggleType = 2, toggleTitle = "四炸", toggleIsOn = true, dropDown = "5,6,8,10,12", dropDefault = 0 },
                    { disable = false, json = "wuXiaoNiu_beiShu", toggleType = 2, toggleTitle = "五小牛", toggleIsOn = true, dropDown = "5,6,8,10,12", dropDefault = 0 },
                    { disable = false, json = "yiTiaoLong_beiShu", toggleType = 2, toggleTitle = "一条龙", toggleIsOn = false, dropDown = "8,10,12,15", dropDefault = 0 },
                },
            }
        },
        { 
            tag = {togglesTile = "花牌:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"haveJQK\":1",toggleType = 1,toggleTitle = "有花牌",toggleIsOn = true},
                    {disable = false,json = "\"haveJQK\":0",toggleType = 1,toggleTitle = "无花牌",toggleIsOn = false},
                },
            }
        },
        { 
            tag = {togglesTile = "特殊:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"wuxiaoNiuBigSiZha\":true",toggleType = 1,toggleTitle = "五小牛大于四炸",toggleIsOn = true},
                    {disable = false,json = "\"wuxiaoNiuBigSiZha\":false",toggleType = 1,toggleTitle = "四炸大于五小牛",toggleIsOn = false},
                },
            }
        },
        { 
            tag = {togglesTile = "打和:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"daHeType\":0",toggleType = 1,toggleTitle = "按花色比",toggleIsOn = true},
                    {disable = false,json = "\"daHeType\":1",toggleType = 1,toggleTitle = "算庄家赢",toggleIsOn = false},
                    {disable = false,json = "\"daHeType\":2",toggleType = 1,toggleTitle = "打和算平",toggleIsOn = false},
                },
            }
        },
        { 
            tag = {togglesTile = "设置:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"halfEnter\":true",toggleType = 1,toggleTitle = "允许中途加入",toggleIsOn = true},
                    {disable = false,json = "\"halfEnter\":false",toggleType = 1,toggleTitle = "不允许中途加入",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "",rowNum = 4, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"payType\":0",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"payType\":1",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false},
                    {disable = false,json = "\"payType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                },
            }
        },
        configJson = "{\"name\":\"DouNiu\",\"GameType\":0,\"playerCount\":6,\"HallID\":0,\"ruleType\":1,\"isGuangDongMode\":true,",
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            local diamonds = Config.caculate_price7(roundCount, playerCount, payType, bankerType)
            if(payType == 2 or payType == 0)then
                diamonds = diamonds * 0.5
            end
            return diamonds
        end,
    },
    { --看牌抢庄
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":10",toggleType = 1,toggleTitle = "10局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":20",toggleType = 1,toggleTitle = "20局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":30",toggleType = 1,toggleTitle = "30局",toggleIsOn = false},
                },
            }
        },
        { 
            tag = {togglesTile = "坐庄:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"kanPaiCount\":3",toggleType = 1,toggleTitle = "看三张抢庄",toggleIsOn = false},
                    {disable = false,json = "\"kanPaiCount\":4",toggleType = 1,toggleTitle = "看四张抢庄",toggleIsOn = true},
                    {disable = false,json = "\"kanPaiCount\":0",toggleType = 1,toggleTitle = "不看牌抢庄",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "抢庄:",rowNum = 4,maxValidNum = 4,minValidNum = 1},
            list =
            {
                {
                    {disable = false,json = "\"qiangZhuangScore_1\":true",toggleType = 2,toggleTitle = "1倍",toggleIsOn = true, refreshUI = true},
                    {disable = false,json = "\"qiangZhuangScore_2\":true",toggleType = 2,toggleTitle = "2倍",toggleIsOn = true, refreshUI = true},
                    {disable = false,json = "\"qiangZhuangScore_3\":true",toggleType = 2,toggleTitle = "3倍",toggleIsOn = true, refreshUI = true},
                    {disable = false,json = "\"qiangZhuangScore_4\":true",toggleType = 2,toggleTitle = "4倍",toggleIsOn = true, refreshUI = true},
                },
            }
        },
        { 
            tag = {togglesTile = "下注:",rowNum = 4,maxValidNum = 5, minValidNum = 2},
            list =
            {
                {
                    {disable = false,json = "\"xiaZhuScore_1\":true",toggleType = 2,toggleTitle = "1分",toggleIsOn = true, refreshUI = true},
                    {disable = false,json = "\"xiaZhuScore_2\":true",toggleType = 2,toggleTitle = "2分",toggleIsOn = true, refreshUI = true},
                    {disable = false,json = "\"xiaZhuScore_3\":true",toggleType = 2,toggleTitle = "3分",toggleIsOn = true, refreshUI = true},
                    {disable = false,json = "\"xiaZhuScore_4\":true",toggleType = 2,toggleTitle = "4分",toggleIsOn = true, refreshUI = true},
                    {disable = false,json = "\"xiaZhuScore_5\":true",toggleType = 2,toggleTitle = "5分",toggleIsOn = true, refreshUI = true},
                    {disable = false,json = "\"xiaZhuScore_6\":true",toggleType = 2,toggleTitle = "6分",toggleIsOn = false, refreshUI = true},
                    {disable = false,json = "\"xiaZhuScore_8\":true",toggleType = 2,toggleTitle = "8分",toggleIsOn = false, refreshUI = true},
                    {disable = false,json = "\"xiaZhuScore_10\":true",toggleType = 2,toggleTitle = "10分",toggleIsOn = false, refreshUI = true},
                },
            }
        },
        { 
            tag = {togglesTile = "牌型:",rowNum = 3},
            list =
            {
                {
                    { disable = true, json = "niu7_beiShu", toggleType = 2, toggleTitle = "牛七", toggleIsOn = true, dropDown = "1,2,3,4,5", dropDefault = 0 },
                    { disable = true, json = "niu8_beiShu", toggleType = 2, toggleTitle = "牛八", toggleIsOn = true, dropDown = "2,3,4,5,6", dropDefault = 0 },
                    { disable = true, json = "niu9_beiShu", toggleType = 2, toggleTitle = "牛九", toggleIsOn = true, dropDown = "2,3,4,5,6", dropDefault = 0 },
                    { disable = true, json = "niu10_beiShu", toggleType = 2, toggleTitle = "牛牛", toggleIsOn = true, dropDown = "3,4,5,6,8", dropDefault = 0 },
                    { disable = true, json = "jinNiu_beiShu", toggleType = 2, toggleTitle = "五花牛", toggleIsOn = true, dropDown = "4,6,8,10", dropDefault = 0 },
                    { disable = false, json = "siZha_beiShu", toggleType = 2, toggleTitle = "四炸", toggleIsOn = true, dropDown = "5,6,8,10,12", dropDefault = 0 },
                    { disable = false, json = "wuXiaoNiu_beiShu", toggleType = 2, toggleTitle = "五小牛", toggleIsOn = true, dropDown = "5,6,8,10,12", dropDefault = 0 },
                    { disable = false, json = "yiTiaoLong_beiShu", toggleType = 2, toggleTitle = "一条龙", toggleIsOn = false, dropDown = "8,10,12,15", dropDefault = 0 },
                },
            }
        },
        { 
            tag = {togglesTile = "花牌:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"haveJQK\":1",toggleType = 1,toggleTitle = "有花牌",toggleIsOn = true},
                    {disable = false,json = "\"haveJQK\":0",toggleType = 1,toggleTitle = "无花牌",toggleIsOn = false},
                },
            }
        },
        { 
            tag = {togglesTile = "特殊:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"wuxiaoNiuBigSiZha\":true",toggleType = 1,toggleTitle = "五小牛大于四炸",toggleIsOn = true},
                    {disable = false,json = "\"wuxiaoNiuBigSiZha\":false",toggleType = 1,toggleTitle = "四炸大于五小牛",toggleIsOn = false},
                },
            }
        },
        { 
            tag = {togglesTile = "打和:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"daHeType\":0",toggleType = 1,toggleTitle = "按花色比",toggleIsOn = true},
                    {disable = false,json = "\"daHeType\":1",toggleType = 1,toggleTitle = "算庄家赢",toggleIsOn = false},
                    {disable = false,json = "\"daHeType\":2",toggleType = 1,toggleTitle = "打和算平",toggleIsOn = false},
                },
            }
        },
        { 
            tag = {togglesTile = "设置:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"halfEnter\":true",toggleType = 1,toggleTitle = "允许中途加入",toggleIsOn = true},
                    {disable = false,json = "\"halfEnter\":false",toggleType = 1,toggleTitle = "不允许中途加入",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "",rowNum = 4, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"payType\":0",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"payType\":1",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false},
                    {disable = false,json = "\"payType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                },
            }
        },
        configJson = "{\"bankerType\":2,\"name\":\"DouNiu\",\"GameType\":1,\"playerCount\":6,\"HallID\":0,\"ruleType\":1,\"isGuangDongMode\":true,",
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            local diamonds = Config.caculate_price7(roundCount, playerCount, payType, bankerType)
            if(payType == 2 or payType == 0)then
                diamonds = diamonds * 0.5
            end
            return diamonds
        end,
    },
    { --通比牛牛
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":10",toggleType = 1,toggleTitle = "10局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":20",toggleType = 1,toggleTitle = "20局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":30",toggleType = 1,toggleTitle = "30局",toggleIsOn = false},
                },
            }
        },
        { 
            tag = {togglesTile = "底注:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"diZhuScore\":1",toggleType = 1,toggleTitle = "1分",toggleIsOn = true},
                    {disable = false,json = "\"diZhuScore\":2",toggleType = 1,toggleTitle = "2分",toggleIsOn = false},
                    {disable = false,json = "\"diZhuScore\":5",toggleType = 1,toggleTitle = "5分",toggleIsOn = false},
                    {disable = false,json = "\"diZhuScore\":10",toggleType = 1,toggleTitle = "10分",toggleIsOn = false},
                    {disable = false,json = "\"diZhuScore\":20",toggleType = 1,toggleTitle = "20分",toggleIsOn = false},
                    {disable = false,json = "\"diZhuScore\":50",toggleType = 1,toggleTitle = "50分",toggleIsOn = false},
                    {disable = false,json = "\"diZhuScore\":100",toggleType = 1,toggleTitle = "100分",toggleIsOn = false},
                },
            }
        },
        { 
            tag = {togglesTile = "花牌:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"haveJQK\":1",toggleType = 1,toggleTitle = "有花牌",toggleIsOn = true},
                    {disable = false,json = "\"haveJQK\":0",toggleType = 1,toggleTitle = "无花牌",toggleIsOn = false},
                },
            }
        },
        { 
            tag = {togglesTile = "牌型:",rowNum = 3},
            list =
            {
                {
                    { disable = true, json = "niu7_beiShu", toggleType = 2, toggleTitle = "牛七", toggleIsOn = true, dropDown = "1,2,3,4,5", dropDefault = 0 },
                    { disable = true, json = "niu8_beiShu", toggleType = 2, toggleTitle = "牛八", toggleIsOn = true, dropDown = "2,3,4,5,6", dropDefault = 0 },
                    { disable = true, json = "niu9_beiShu", toggleType = 2, toggleTitle = "牛九", toggleIsOn = true, dropDown = "2,3,4,5,6", dropDefault = 0 },
                    { disable = true, json = "niu10_beiShu", toggleType = 2, toggleTitle = "牛牛", toggleIsOn = true, dropDown = "3,4,5,6,8", dropDefault = 0 },
                    { disable = true, json = "jinNiu_beiShu", toggleType = 2, toggleTitle = "五花牛", toggleIsOn = true, dropDown = "4,6,8,10", dropDefault = 0 },
                    { disable = false, json = "siZha_beiShu", toggleType = 2, toggleTitle = "四炸", toggleIsOn = true, dropDown = "5,6,8,10,12", dropDefault = 0 },
                    { disable = false, json = "wuXiaoNiu_beiShu", toggleType = 2, toggleTitle = "五小牛", toggleIsOn = true, dropDown = "5,6,8,10,12", dropDefault = 0 },
                    { disable = false, json = "yiTiaoLong_beiShu", toggleType = 2, toggleTitle = "一条龙", toggleIsOn = false, dropDown = "8,10,12,15", dropDefault = 0 },
                },
            }
        },
        { 
            tag = {togglesTile = "特殊:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"wuxiaoNiuBigSiZha\":true",toggleType = 1,toggleTitle = "五小牛大于四炸",toggleIsOn = true},
                    {disable = false,json = "\"wuxiaoNiuBigSiZha\":false",toggleType = 1,toggleTitle = "四炸大于五小牛",toggleIsOn = false},
                },
            }
        },
        { 
            tag = {togglesTile = "打和:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"daHeType\":0",toggleType = 1,toggleTitle = "按花色比",toggleIsOn = true},
                },
            }
        },
        { 
            tag = {togglesTile = "设置:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"halfEnter\":true",toggleType = 1,toggleTitle = "允许中途加入",toggleIsOn = true},
                    {disable = false,json = "\"halfEnter\":false",toggleType = 1,toggleTitle = "不允许中途加入",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "",rowNum = 4, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"payType\":0",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"payType\":1",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false},
                    {disable = false,json = "\"payType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                },
            }
        },
        configJson = "{\"name\":\"TongbiNiu\",\"GameType\":2,\"playerCount\":6,\"HallID\":0,\"ruleType\":1,\"isGuangDongMode\":true,",
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            local diamonds = Config.caculate_price7(roundCount, playerCount, payType, bankerType)
            if(payType == 2 or payType == 0)then
                diamonds = diamonds * 0.5
            end
            return diamonds
        end,
    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一、定庄</color></size>
<size=28><color=#7c5608>
【经典牛仔】
轮流坐庄：第一局房主坐庄，之后逆时针轮流坐庄；
房主当庄：每局都是房主当庄；
随机坐庄：系统随机指定玩家当庄；
牛牛上庄：第一局房主坐庄，之后玩家抓到牛牛牌型或更大的牌，下一局成为庄家，多个牛牛则选择最大的坐庄，若本局无牛牛牌型或更大牌型，则本局庄家下局连庄；
牛九上庄：第一局房主坐庄，之后玩家抓到牛九牌型或更大的牌，下一局成为庄家，多个牛九则选择牌最大的坐庄，若本局无牛九牌型或更大牌型，则本局庄家下局连庄；
  【看牌抢庄】
       看三张牌抢庄；
       看四张牌抢庄；
       不看牌进行抢庄；
  【通比牛牛】
        无庄家，牌最大的赢。
</color></size>
<size=32><color=#004f3c>二、基本玩法</color></size>
<size=28><color=#7c5608>
游戏可以由2人到6人同时进行，总共52张牌（除大小王）。
进入游戏，玩家准备后，房主按开始按钮，定庄，玩家选择下注，开始发牌流程。
玩家每人发5张牌，根据5张牌进行排列组合，玩家必须3张牌组成10，20，30的整数，剩余2张相加取个位数，得出最后的牌型；

</color></size>
<size=32><color=#004f3c>三、牌型</color></size>
<size=28><color=#7c5608>
一条龙：固定为12345(不是其它任意连续的五张)；
炸弹：拥有4张相同字数的牌；
五小牛：五张牌都小于5，并且相加总和小于等于10；
五花牛：五张牌全为JQK；
牛牛：五张牌之和是10的倍数；
牛一-牛九：三张牌之和是10的倍数；
</color></size>]],
[[<size=32><color=#004f3c>一、定庄</color></size>
<size=28><color=#7c5608>
【经典牛仔】
轮流坐庄：第一局房主坐庄，之后逆时针轮流坐庄；
房主当庄：每局都是房主当庄；
随机坐庄：系统随机指定玩家当庄；
牛牛上庄：第一局房主坐庄，之后玩家抓到牛牛牌型或更大的牌，下一局成为庄家，多个牛牛则选择最大的坐庄，若本局无牛牛牌型或更大牌型，则本局庄家下局连庄；
牛九上庄：第一局房主坐庄，之后玩家抓到牛九牌型或更大的牌，下一局成为庄家，多个牛九则选择牌最大的坐庄，若本局无牛九牌型或更大牌型，则本局庄家下局连庄；
  【看牌抢庄】
       看三张牌抢庄；
       看四张牌抢庄；
       不看牌进行抢庄；
  【通比牛牛】
        无庄家，牌最大的赢。
</color></size>
<size=32><color=#004f3c>二、基本玩法</color></size>
<size=28><color=#7c5608>
游戏可以由2人到6人同时进行，总共52张牌（除大小王）。
进入游戏，玩家准备后，房主按开始按钮，定庄，玩家选择下注，开始发牌流程。
玩家每人发5张牌，根据5张牌进行排列组合，玩家必须3张牌组成10，20，30的整数，剩余2张相加取个位数，得出最后的牌型；

</color></size>
<size=32><color=#004f3c>三、牌型</color></size>
<size=28><color=#7c5608>
一条龙：固定为12345(不是其它任意连续的五张)；
炸弹：拥有4张相同字数的牌；
五小牛：五张牌都小于5，并且相加总和小于等于10；
五花牛：五张牌全为JQK；
牛牛：五张牌之和是10的倍数；
牛一-牛九：三张牌之和是10的倍数；
</color></size>]],
[[<size=32><color=#004f3c>一、定庄</color></size>
<size=28><color=#7c5608>
【经典牛仔】
轮流坐庄：第一局房主坐庄，之后逆时针轮流坐庄；
房主当庄：每局都是房主当庄；
随机坐庄：系统随机指定玩家当庄；
牛牛上庄：第一局房主坐庄，之后玩家抓到牛牛牌型或更大的牌，下一局成为庄家，多个牛牛则选择最大的坐庄，若本局无牛牛牌型或更大牌型，则本局庄家下局连庄；
牛九上庄：第一局房主坐庄，之后玩家抓到牛九牌型或更大的牌，下一局成为庄家，多个牛九则选择牌最大的坐庄，若本局无牛九牌型或更大牌型，则本局庄家下局连庄；
  【看牌抢庄】
       看三张牌抢庄；
       看四张牌抢庄；
       不看牌进行抢庄；
  【通比牛牛】
        无庄家，牌最大的赢。
</color></size>
<size=32><color=#004f3c>二、基本玩法</color></size>
<size=28><color=#7c5608>
游戏可以由2人到6人同时进行，总共52张牌（除大小王）。
进入游戏，玩家准备后，房主按开始按钮，定庄，玩家选择下注，开始发牌流程。
玩家每人发5张牌，根据5张牌进行排列组合，玩家必须3张牌组成10，20，30的整数，剩余2张相加取个位数，得出最后的牌型；

</color></size>
<size=32><color=#004f3c>三、牌型</color></size>
<size=28><color=#7c5608>
一条龙：固定为12345(不是其它任意连续的五张)；
炸弹：拥有4张相同字数的牌；
五小牛：五张牌都小于5，并且相加总和小于等于10；
五花牛：五张牌全为JQK；
牛牛：五张牌之和是10的倍数；
牛一-牛九：三张牌之和是10的倍数；
</color></size>]],
}

return ConfigChild
