local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --青阳平胡
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
            tag = {togglesTile = "倍数:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"BeiShu\":1",toggleType = 1,toggleTitle = "1倍",toggleIsOn = true},
                    {disable = false,json = "\"BeiShu\":2",toggleType = 1,toggleTitle = "2倍",toggleIsOn = false},
                    {disable = false,json = "\"BeiShu\":5",toggleType = 1,toggleTitle = "5倍",toggleIsOn = false},
                    {disable = false,json = "\"BeiShu\":10",toggleType = 1,toggleTitle = "10倍",toggleIsOn = false},
                }
            }
        },
        { 
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"QueYiMen\":true",toggleType = 2,toggleTitle = "缺门",toggleIsOn = true,--[[clickTip="勾选后胡牌时满足缺一门条件时加对应的分数，不勾选则不加分。"--]]},
                    {disable = false,json = "\"WuQueBuKai\":true",toggleType = 2,toggleTitle = "无缺不开",toggleIsOn = true,--[[clickTip="勾选后必须缺一门才能胡牌，不勾选则无限制。"--]]},
                    {disable = false,json = "\"PaoZi\":true",toggleType = 2,toggleTitle = "跑子",toggleIsOn = true},
                    --{disable = false,json = "\"XiaPao\":true",toggleType = 2,toggleTitle = "下跑",toggleIsOn = true,clickTip="勾选后本局游戏可以进行下跑玩法，不勾选则不带压跑玩法。"},
                    {disable = false,json = "\"SiXi\":true",toggleType = 2,toggleTitle = "四喜",toggleIsOn = true,--[[clickTip="勾选后胡牌时如果有4个天用牌时额外加5分，不勾选则没有此加分规则。"--]]},
                    {disable = false,json = "\"PengPengHu\":true",toggleType = 2,toggleTitle = "碰碰胡",toggleIsOn = true},
                    {disable = false,json = "\"FengKe\":true",toggleType = 2,toggleTitle = "风刻",toggleIsOn = true},
                    {disable = false,json = "\"DuoTianYongXiaoDao\":true",toggleType = 2,toggleTitle = "多天用可小倒",toggleIsOn = false,--[[clickTip="勾选后如果有两个以及两个以上天用牌时也可胡小倒牌型，不够选则不能胡小倒牌型。"--]]},
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
                ["8"] = 
                {
                    ["12"] = 8,["13"] = 8,["14"] = 8,
                    ["02"] = 16,["03"] = 24,["04"] = 32,
                },
                ["12"] = 
                {
                    ["12"] = 12,["13"] = 12,["14"] = 12,
                    ["02"] = 24,["03"] = 36,["04"] = 48,
                },
                ["16"] = 
                {
                    ["12"] = 16,["13"] = 16,["14"] = 16,
                    ["02"] = 32,["03"] = 48,["04"] = 64,
                },
            }
            return prices[roundCount .. ""][payType .. "" .. playerCount]
        end,
        isTablePop = true,
        laiziTagTitle = "天用",
        laiziTag = "5",
        isShowPao = true,
        PaoTitles = "不跑|1跑|2跑",
        headTag = {
            serverJson = "Pao",
            localJson = "XiaPao",
            zeroJson = "不跑",
            addJson = "跑",
        },
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,
        view = "tableqingyangpinghu_view",
        isShowTingDefValue = 0,
        goldResultType = "common",
    },
    { --青阳辣子
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":6",toggleType = 1,toggleTitle = "6局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = true},
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
                    {disable = false,json = "\"SanTanPaoFenFan\":true",toggleType = 2,toggleTitle = "三摊跑分翻",toggleIsOn = false --[[,clickTip="勾选后如果上家打的牌自己可以吃碰，可以选择补花后再进行吃碰的选择。不勾选则必须先吃碰后在进行补花。"--]]},
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
 [[  <size=32><color=#004f3c>一.麻将数量</color></size>
  <size=28>
  1）麻将共136张牌，包括:万、条、筒、风（东南西北中发白）;
  </size>
  <size=32><color=#004f3c>二.基础规则</color></size>
  <size=28>
  1）可碰牌，可开杠，但不能吃牌;
  2）不可以一炮多响;
  3）坐庄:第一局房主坐庄，庄家胡牌连庄；其他情况轮庄;
  4）胡牌规则:只能自摸胡，不能接炮胡;
  5）出分:一家自摸时，剩余三家都要出分;
  6）过碰惩罚:一圈内对方打出的牌能碰却没有碰，则在未经过自己时再
     次出现该可碰的牌时也都不可以碰;
  7）特殊牌型:
     ◆ 小倒:即有天用牌的情况下的普通平胡;
     ◆ 硬斗:即没有天用牌的情况下的普通平胡;
     ◆ 缺一门:即胡牌时手牌少一门牌，混一色为缺2门，清一色计为缺
        3门，字一色计为缺4门;
     ◆ 直杠:杠后摸到天用牌胡牌，以及跑风（见字胡）前提下杠上开
        花胡牌;
     ◆ 弯杠:排除直杠情况下的杠上开花即为弯杠;
     ◆ 大对对胡:硬斗以及跑风情况下胡碰碰胡，即为大对对胡;
     ◆ 小对对胡:排除大对对胡情况下的碰碰胡，即为小对对胡;
     ◆ 风对:胡牌时手中三个相同的风牌算作风对，有几个算几个（必
        须是风牌，天用牌组成的不算）;
     ◆ 跑风:即见字胡;
     ◆ 一飞:手中4个对（碰）或4个顺子，外加一张天用牌的情况下胡
        牌;
     ◆ 两飞:手中3个对（碰）或3个顺子，外加两张相同的任意牌再加
        两张天用牌的情况下胡牌;
  </size>
  <size=32><color=#004f3c>三.胡牌规则</color></size>
  <size=28>
  1）自摸:满足胡牌牌型即可;
  2）接炮:不可接炮胡;
  </size>
  <size=32><color=#004f3c>四.天用牌</color></size>
  <size=28>
  1）每局开始翻一张牌，这张牌+1即为天用牌，数字1-9循环，东南西北
     循环，中发白循环;
  2）翻出来的牌直接从牌堆中拿走，例：翻出来的牌是1条，则开始游戏
     时，牌堆中的1条只有3张;
  3）天用牌可当做任何牌使用，且可以打出;
  </size>
  <size=32><color=#004f3c>五.特殊规则</color></size>
  <size=28>
  1）每局投掷骰子定牌数，骰子为两个，即数值为2-12。本局可用剩余
     牌=麻将牌总数（136）-色子数字*2;
  2）若本局有杠，则每有一个杠就减少2张剩余牌;
  3）每局只剩最后4张牌时，不允许碰牌，可以杠牌;
  </size>
  <size=32><color=#004f3c>六.计分规则</color></size>
  <size=28>
  1）小倒:1分;
  2）硬斗:1分;
  3）缺一门:1分，缺几门加几分;
  4）直杠:4分;
  5）弯杠:2分;
  6）大对对胡:4分;
  7）小对对胡:2分;
  8）风对:有1个算1分;
  9）跑风:翻倍;
  10）一飞:翻倍;
  11）两飞:1飞基础上额外加1分;
  </size>]],
  [[  <size=32><color=#004f3c>一.麻将数量</color></size>
  <size=28>
  1）麻将共144张牌，包括:万、条、筒、风（东南西北中发白）、花（
     春夏秋冬梅兰竹菊）;
  </size>
  <size=32><color=#004f3c>二.基础规则</color></size>
  <size=28>
  1）可碰牌，可开杠，可以吃牌;
  2）可以一炮多响;
  3）坐庄:第一局房主坐庄，之后谁胡谁庄;若一炮多响，则谁点炮谁坐
     庄;流局连庄;
  4）出分:一家点炮时，点炮者出分;一家自摸时，剩余三家都要出分;
  5）过碰惩罚:一圈内对方打出的牌能碰却没有碰，则在未经过自己时再
     次出现该可碰的牌时也都不可以碰;
  6) 过胡惩罚:一圈内对方打出的牌能胡却没有胡，则在未经过自己时再
     次出现可接炮胡的牌时也都不可以胡牌;
  7）胡牌限制:无花时，不可胡小胡，只能胡大吊车、辣子胡;
  8）小胡牌型:
     ◆ 2花小胡:手中只有2个花时，只能自摸胡牌，不能接炮胡;
     ◆ 3花小胡:手中有3个花即以上时，可以接炮胡也可以自摸胡;
  9）大吊车牌型:
     ◆ 大吊车:手里牌全部吃、碰下来，手中只剩最后一张牌;
  10）辣子胡牌型:
     ◆ 清一色:手牌中所有牌为同一花色;
     ◆ 混一色:筒万条只能有一个花色，且必须有风牌;
     ◆ 字一色:胡牌时，手中的牌都是风牌;
     ◆ 大吊车杠上开花:手中只剩一张牌时，抓了花或补杠之后补牌并
        胡牌;
     ◆ 对对胡:胡牌时，手牌中不能有顺子;
     ◆ 杠上开花:补花或杠开后补牌胡牌;
  11）抢杠胡:中2话以上可以抢别人杠的牌胡牌，被抢的人包赔3家;
  </size>
  <size=32><color=#004f3c>三.胡牌规则</color></size>
  <size=28>
  1）自摸:满足胡牌牌型即可;
  2）接炮:满足胡牌牌型即可;
  </size>
  <size=32><color=#004f3c>四.花牌规则</color></size>
  <size=28>
  1）花牌:春夏秋冬梅兰竹菊加四张发财;
  2）补花:花牌必须打出，打出花牌可以补摸一张牌;
  3）吃碰规则:
     ◆ 无花或只有一个明花时，可以吃碰杠，但吃碰杠一次后，再吃碰
        杠只能吃碰杠相同花色的牌;
     ◆ 手中有两个即以上的花时，可以随意吃碰杠;
     ◆ 东南西北中发白碰杠，不受限制;
  4）计花:
     ◆ 补花一次算1花;
     ◆ 普通明杠一次算1花;
     ◆ 普通暗杠一次算2花;
     ◆ 东南西北中白明杠一次算2花;
     ◆ 东南西北中白暗杠一次算3花;
     ◆ 东南西北中白碰牌或收张中有三个一样的算1花;
  </size>
  <size=32><color=#004f3c>五.三口关系</color></size>
  <size=28>
  1）关系说明:	
     ◆ 双方为对等关系;	
     ◆ 激活三口关系就是报警，谁激活谁报警;
  2）激活三口关系:	
     ◆ 吃碰杠上家3手牌后，落地牌型为清一色、混一色、字一色时，
        激活三口关系;
     ◆ 碰杠任意一家3手牌，激活三口关系;
     ◆ 吃碰杠上家任意4手牌，激活三口关系;	
  3）解除三口关系:		
     ◆ 吃碰杠上家3手牌，激活三口关系后。当碰杠任意一家第4手牌落
        地不为清一色、混一色、字一色时，解除三口关系;	
     ◆ 碰杠除上家之外任意一家3手牌，激活三口关系后。吃上一家第4
        手牌解除三口关系;
  </size>
  <size=32><color=#004f3c>六.计分规则</color></size>
  <size=28>
  1）小胡:10分;
  2）大吊车:20分;
  3）辣子胡:40分;
  4）杠上开花:10分;
  5）8花:10分，之后每多一个花，额外加5分;
  </size>]],
}

return ConfigChild
