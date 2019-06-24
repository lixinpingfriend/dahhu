local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --池州辣子
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":6",toggleType = 1,toggleTitle = "6局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":10",toggleType = 1,toggleTitle = "10局",toggleIsOn = false},
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
                    --{disable = false,json = "\"QiangGangHu\":true",toggleType = 2,toggleTitle = "抢杠胡",toggleIsOn = true--[[,clickTip="勾选后可进行抢杠胡，不勾选则不能抢杠胡。"--]]},
                    --{disable = false,json = "\"GuoPeng\":true",toggleType = 2,toggleTitle = "过手碰",toggleIsOn = false--[[,clickTip="勾选后当别人出的牌没有碰牌时，则到自己摸牌之前都不能再碰此牌，不勾选则无限制。"--]]},
                    {disable = false,json = "\"YouPao\":true",toggleType = 2,toggleTitle = "跑子",toggleIsOn = true --[[,clickTip="勾选后本局带压跑玩法，不勾选则没有压跑玩法。"--]]},
                    {disable = false,json = "\"BaHua\":true",toggleType = 2,toggleTitle = "八花",toggleIsOn = true --[[,clickTip="勾选后如果上家打的牌自己可以吃碰，可以选择补花后再进行吃碰的选择。不勾选则必须先吃碰后在进行补花。"--]]},
                    --{disable = false,json = "\"XianBuHua\":true",toggleType = 2,toggleTitle = "可先补花再吃碰",toggleIsOn = true --[[,clickTip="勾选后如果上家打的牌自己可以吃碰，可以选择补花后再进行吃碰的选择。不勾选则必须先吃碰后在进行补花。"--]]},
                    --{disable = false,json = "\"SanTanPaoFenFan\":true",toggleType = 2,toggleTitle = "三摊跑分翻",toggleIsOn = false --[[,clickTip="勾选后如果上家打的牌自己可以吃碰，可以选择补花后再进行吃碰的选择。不勾选则必须先吃碰后在进行补花。"--]]},
                }

            }
        },
        { 
            tag = {togglesTile = "底分:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"PaiXingFen\":1",toggleType = 1,toggleTitle = "5,10,15分",toggleIsOn = false,ruleTitle = "底分5,10,15"}, --clickTip="本局游戏小胡10分、大吊车20分、辣子胡40分"
                    {disable = false,json = "\"PaiXingFen\":2",toggleType = 1,toggleTitle = "10,20,30分",toggleIsOn = true,ruleTitle = "底分10,20,30"},
                    {disable = false,json = "\"PaiXingFen\":3",toggleType = 1,toggleTitle = "20,40,60分",toggleIsOn = false,ruleTitle = "底分20,40,60"},
                    {disable = false,json = "\"PaiXingFen\":4",toggleType = 1,toggleTitle = "30,60,100分",toggleIsOn = false,ruleTitle = "底分30,60,100"},
                    {disable = false,json = "\"PaiXingFen\":5",toggleType = 1,toggleTitle = "50,100,150分",toggleIsOn = false,ruleTitle = "底分50,100,150"},
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
                    { disable = false, json = "\"NeedOpenGPS\":true", toggleType = 2, toggleTitle = "GPS检测", toggleIsOn = false
                    ,input = { type = 1,defValue = "100",AddText = "米",json = "SafeDistance",maxLen = 3,followingTogglerState = true },clickTip = "距离小于X米的玩家不能加入房间"  },
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
                ["6"] = 
                {
                    ["12"] = 6,["13"] = 6,["14"] = 6,
                    ["02"] = 12,["03"] = 18,["04"] = 24,
                },
                ["8"] = 
                {
                    ["12"] = 8,["13"] = 8,["14"] = 8,
                    ["02"] = 16,["03"] = 24,["04"] = 32,
                },
                ["10"] = 
                {
                    ["12"] = 10,["13"] = 10,["14"] = 10,
                    ["02"] = 20,["03"] = 30,["04"] = 40,
                },
            }
            return prices[roundCount .. ""][payType .. "" .. playerCount]
        end,
        isTablePop = true,
        isShowPao = true,
        PaoTitles = "不跑|10跑|20跑",
        isQYLaZi = true,
        headTag = {
            serverJson = "Pao",
            localJson = "YouPao",
            zeroJson = "不跑",
            addJson = "跑",
        },
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,
        view = "tableqingyanglazi_view",
        HuBaoTitel = "吃三口",
        isShowTingDefValue = 0,
        goldResultType = "common",
    },
}

ConfigChild.HowToPlayTexts =
{
 [[<size=32><color=#004f3c>一.麻将数量</color></size>
 <size=28>
 1）麻将共144张牌，包括：万、条、筒、风（东南西北中发白）各4张，花（春夏秋冬梅兰竹菊）各1张
 </size>
 
 <size=32><color=#004f3c>二.基础规则</color></size>
 <size=28>
 1）可以碰，明杠，暗杠，可以吃
 2）可以一炮多响
 3）坐庄规则：第一局房主坐庄，谁胡谁庄，一炮多响时，胡牌顺序的第一个人坐庄，流局时庄家连庄
 </size>
 
 <size=32><color=#004f3c>三.胡牌规则</color></size>
 <size=28>
 1）胡牌方式：分两种，可自摸胡牌，也可以接炮胡，无胡牌方式限制
 2）胡牌限制：无花时，不可胡小胡，只能胡辣子胡、大吊车
 3）小胡：
         1. 手上有2个花只能自摸
         2. 手上有3个花可以接炮
     3. 0花时，可杠牌胡牌
 4) 大吊车
 5) 辣子胡
 6) 过胡惩罚：一圈内对方打出的牌能胡却没有胡，则在未经过自己时再次出现可接炮胡的牌时也都不可以胡牌
 7) 抢杠胡：手中2花以上可以抢别人杠的牌胡牌
 </size>
 
 <size=32><color=#004f3c>四.计分规则</color></size>
 <size=28>
 1）牌型分：A/B/C,  对应底分选项中的分值
    a.小胡：+A分
    b.大吊车：+B分
    c.辣子胡：+C分
 2）特殊加分：
    a.杠上开花+A分
    b.8花加分（不胡牌也算分）+A分，每多1花再固定+10分
 </size>]],
}

return ConfigChild
