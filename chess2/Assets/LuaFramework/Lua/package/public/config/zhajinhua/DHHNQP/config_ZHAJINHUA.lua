local ConfigChild = {}

ConfigChild.createRoomTable = 
{
    {
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":12",toggleType = 1,toggleTitle = "12局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":18",toggleType = 1,toggleTitle = "18局",toggleIsOn = false},
                },
            }
        },

        { 
            tag = {togglesTile = "闷牌:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"menNum\":0",toggleType = 1,toggleTitle = "可不闷",toggleIsOn = true},
                    {disable = false,json = "\"menNum\":1",toggleType = 1,toggleTitle = "闷1圈",toggleIsOn = false},
                    {disable = false,json = "\"menNum\":3",toggleType = 1,toggleTitle = "闷3圈",toggleIsOn = false},
                },
            }
        },

        { 
            tag = {togglesTile = "封顶:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"maxScore\":6",toggleType = 1,toggleTitle = "最多压6分",toggleIsOn = true},
                    {disable = false,json = "\"maxScore\":10",toggleType = 1,toggleTitle = "最多压10分",toggleIsOn = false},
                    -- {disable = false,json = "\"maxScore\":20",toggleType = 1,toggleTitle = "最多压20分",toggleIsOn = false},
                },
            }
        },

        { 
            tag = {togglesTile = "特殊:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"special\":0",toggleType = 1,toggleTitle = "235大于豹子",toggleIsOn = true},
                    {disable = false,json = "\"special\":1",toggleType = 1,toggleTitle = "235仅大于AAA",toggleIsOn = false},
                },
                {
                    {disable = false,json = "\"shunziRule\":2",toggleType = 1,toggleTitle = "顺子123最小",toggleIsOn = true, clickTip = "QKA>JQK>...>123"},
                    {disable = false,json = "\"shunziRule\":1",toggleType = 1,toggleTitle = "123仅小于QKA",toggleIsOn = false, clickTip = "QKA>123>JQK>...>234"},
                    {disable = false,json = "\"shunziRule\":0",toggleType = 1,toggleTitle = "顺子123最大",toggleIsOn = false, clickTip = "123>QKA>...>234"},
                },
            }
        },

        { 
            tag = {togglesTile = "喜牌:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"leopardAddScore\":true",toggleType = 2,toggleTitle = "豹子10分",toggleIsOn = false},
                    {disable = false,json = "\"shunKingAddScore\":true",toggleType = 2,toggleTitle = "顺金5分",toggleIsOn = false},
                },
            }
        },

        {
            tag = {togglesTile = "时间:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"GiveupTime\":0",toggleType = 1,toggleTitle = "无",toggleIsOn = true},
                    {disable = false,json = "\"GiveupTime\":15",toggleType = 1,toggleTitle = "15秒",toggleIsOn = false,clickTip = "15秒内无有效操作自动弃牌"},
                    {disable = false,json = "\"GiveupTime\":30",toggleType = 1,toggleTitle = "30秒",toggleIsOn = false,clickTip = "30秒内无有效操作自动弃牌"},
                    {disable = false,json = "\"GiveupTime\":60",toggleType = 1,toggleTitle = "1分钟",toggleIsOn = false,clickTip = "1分钟内无有效操作自动弃牌"},
                },
            }
        },

        { 
            tag = {togglesTile = "设置:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"allowEnter\":true",toggleType = 2,toggleTitle = "游戏开始后允许其他玩家加入",toggleIsOn = true},
                },
                {
                    {disable = true,json = "\"sameCardThanColor\":true",toggleType = 2,toggleTitle = "达到最大轮数时相同的牌比花色（黑红梅方）",toggleIsOn = true},
                },
            }
        },
        {
            tag = { togglesTile = "定位:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"NeedOpenGPS\":true", toggleType = 2, toggleTitle = "GPS检测", toggleIsOn = false },
                    { disable = false, json = "\"CheckIPAddress\":true", toggleType = 2, toggleTitle = "相同IP检测", toggleIsOn = false },
                }
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
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price_zhajinhua(roundCount, playerCount, payType, bankerType)
        end,
        configJson = "{\"game_type\":0,\"playerCount\":6,\"HallID\":0,"
    },
}

ConfigChild.HowToPlayTexts = 
{
[[<size=32><color=#004f3c>一、简介</color></size>
<size=28><color=#7c5608>
"飘三叶"又叫炸金花等,是在全国广泛流传尤其在澳门的一种民间多人纸牌游戏,玩家以手中的三张牌比输赢,游戏过程中需要考验玩家的胆略和智慧,飘三叶是被公认的最受欢迎的纸牌游戏之一.
</color></size>
<size=32><color=#004f3c>二、基本玩法</color></size>
<size=28><color=#7c5608>
游戏参与人数 2- 6 人，使用一副去掉到大小王的扑克牌，共 52 张牌
1）坐庄：首局房主当庄，以后谁赢谁坐庄；
2）锅底：在发牌前每个玩家投一定的底注，上限6分和10分,是1分的底；
3）发牌：从庄家开始逆时针发牌，每人发3张牌，牌面向下；
4）操作：从庄家的下家开始操作，可进行的选择为弃牌、看牌、比牌、跟注、加注；
5）结算：弃牌或比牌决出最后一个玩家后游戏结束，所有筹码全部归最终赢家.
</color></size>
<size=32><color=#004f3c>三、牌型及大小</color></size>
<size=28><color=#7c5608>
牌型：豹子、顺金、金花、顺子、对子、单张
1）豹子>顺金>金花>顺子>对子>单张；
2）特殊523>豹子（通过玩法选择控制）；
3）同为顺子时大小为AKQ >KQJ>...234>A23；
4）同为对子时先比较对，再比较单牌；
5）单张A最大，2最小，全部是单张时，由最大的单张开始依次比较；
6）相同的牌，谁发起比牌算谁输；若达到最大轮数时，相同的牌比最大那张牌的花色：黑桃>红桃>梅花>方片.
</color></size>
]],
}

return ConfigChild
