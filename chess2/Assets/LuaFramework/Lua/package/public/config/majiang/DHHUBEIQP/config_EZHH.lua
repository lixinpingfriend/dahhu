local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --鄂州晃晃麻将
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":16",toggleType = 1,toggleTitle = "16局",toggleIsOn = false},
                },
            }
        },
        --{
        --    tag = { togglesTile = "结算:", rowNum = 3 },
        --    list = {
        --        {
        --            { disable = false, json = "\"settleType\":0", toggleType = 1, toggleTitle = "积分模式", toggleIsOn = true, refreshUI = true},
        --            { disable = false, json = "\"settleType\":1", toggleType = 1, toggleTitle = "金币模式", toggleIsOn = false, goldSet = true, refreshUI = true, goldSetVal1 = 50, goldSetVal2 = 1500 },
        --        }
        --    }
        --},
        {
            tag = {togglesTile = "人数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"PlayerNum\":4",toggleType = 1,toggleTitle = "4人",toggleIsOn = true},
                    {disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "3人",toggleIsOn = false,clickSmallShow = "1_1"},
                    {disable = false,json = "\"PlayerNum\":2",toggleType = 1,toggleTitle = "2人",toggleIsOn = false,clickSmallShow = "1_1"},
                }
            }
        },
        {
            tag = {togglesTile = "底分:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"DiFen\":1",toggleType = 1,toggleTitle = "1底分",toggleIsOn = true,clickBigShow = "2_1"},
                    {disable = false,json = "\"DiFen\":2",toggleType = 1,toggleTitle = "2底分",toggleIsOn = false,clickBigShow = "2_2"},
                }
            }
        },
        {
            tag = {togglesTile = "封顶:",rowNum = 3,bigShow = "2_1"},
            list =
            {
                {
                    {disable = false,json = "\"FengDing\":30",toggleType = 1,toggleTitle = "30封顶",toggleIsOn = true},
                    {disable = false,json = "\"FengDing\":50",toggleType = 1,toggleTitle = "50封顶",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "封顶:",rowNum = 3,bigShow = "2_2"},
            list =
            {
                {
                    {disable = false,json = "\"FengDing\":30",toggleType = 1,toggleTitle = "30封顶",toggleIsOn = false},
                    {disable = false,json = "\"FengDing\":50",toggleType = 1,toggleTitle = "50封顶",toggleIsOn = true},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"DaDiaoZhang\":true",toggleType = 2,toggleTitle = "打吊张",toggleIsOn = false},
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
            tag = {togglesTile = "",rowNum = 4, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"PayType\":1",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"PayType\":0",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false},
                },
            }
        },
        caculPrice = function (roundCount, PlayerNum, PayType, bankerType)
            return Config.caculate_price_hshh(roundCount, PlayerNum, PayType, bankerType)
        end,
        isHuangShiHH = true,
        laiziTagTitle = "赖子",
        laiziTag = "3",
        huanghuangGangTag = "13",
        pnShowResult = true,
        wanfaCustomShow = true,

        soundPath = "ezhh",
        defLocationSetting = 0, ---默认的语言配置,0 或者不配置 普通话，1 方言，
        isOpenLocationSetting = true, ---打开方言设置
        defGuoHu = 1, ---默认过胡设置，0开启过胡，1 关闭过胡
        autoOpenTotalResultTime = 5, ---自动跳转大结算到时间，如果没有配置则不会跳转

        defRecommendOutPaiSetting = 1, ---默认的推荐出牌设置,0 或者不配置 关闭，1 打开，
        IsOpenRecommendOutPaiSetting = true,---打开推荐出牌设置
        IsOpenStartNow = true, ---打开提前开局按钮
        --IsUse3dThrowUpLayout = true,---3D模式下的弃张布局使用向上叠加的布局


        laiziNoYellow = true,
        view = "tableezhouhuanghuang_view",
        controller = "tablehuangshihh_controller",
        goldResultType = "hubei",
        table3dStyles = {1,2},
        --useBriefOneGameResult = true,  ---是否使用简略小结算
        useTotalResultRestart = true, ---是否在大结算开启再来一局
        openHuScreenShotUpload = true, ---开启可以胡牌时，截屏上传功能
        useOneClickOutMj = true, ---开启单击麻将出牌配置选项
    },
}


ConfigChild.PlayRuleText = {
    [[<size=32><color=#004f3c>一.麻将数量</color></size>
    <size=28>
    1）麻将共120张牌，包括：万、条、筒、中、发、白
    </size>
    
    <size=32><color=#004f3c>二.基础规则</color></size>
    <size=28>
    1）可碰，可杠，可吃
    2）过碰惩罚：无过碰惩罚
    3）无一炮多响
                 ● 若多家可胡时，按逆时针顺序优先胡牌
    4) 坐庄规则：第一随机主坐庄，之后谁胡牌谁做庄；黄庄后，庄家下家为庄
    5) 留牌：每局留最后9张牌，即打到剩余9张牌就流局
    </size>
    
    <size=32><color=#004f3c>三.赖子、痞子规则</color></size>
    <size=28>
    1）赖子：由两个骰子的点数和逆时针方向数确定从谁抓起，小点为起抓墩，大点从尾墩倒数确定翻癞子的位置。翻出的牌摸不到，视为弃张。
    2）赖子可以当任何牌来用，但不可充当某张牌去碰杠，赖子不可以碰杠赖子，当可以打出，打出算“赖子杠”，并补一张牌
                 ●特殊规则：赖子当本身用时可以吃，例如2万是赖子，手中有一张1万和2万，上家打出3万时，此时可以用1、2万吃3万，算吃赖子
    3）痞子：翻出的牌，与红中为痞子
    </size>
    
    <size=32><color=#004f3c>四.胡牌规则</color></size>
    <size=28>
    1）胡牌方式：可以自摸胡，也可以接炮胡
    2）平胡胡牌限制：需要满足起胡分数，即胡牌后所有的人出的分数加起来需要大于等于起胡分，否则不能胡
    3) 见字胡只能自摸，不能接炮
    4) 抢杠胡：不可抢杠胡
    5) 杠后炮：无算分
    6）天胡、地胡：可胡，无额外算分
    7）过胡惩罚：过胡所有张，包括自摸过胡。但如果同圈内，有人放炮且番数比弃胡时的最大番数大则可以接炮
    </size>
    
    <size=32><color=#004f3c>五.计分规则</color></size>
    <size=28>
    1）自摸与接炮均3家出分
    
    2）牌型分
             ● 屁胡:1分
    
             ● 自摸屁胡:3分
    
             ● 大胡：6分
                         注：七对、清一色、碰碰胡、将一色（不需要笼牌，全是将即可），以上牌型为大胡牌型，癞子都可变。多大胡可以叠加，每多1个大胡多1番
    
    3）附加番
             ● 点炮：1番
                         注：点炮番只有点炮玩家才算，其他未点炮玩家不算此番数，且只有大胡才有
             ● 自摸：1番
                         注：牌局结束时算自摸番，三家出分玩家都要算，且只有大胡才有
         ● 明杠：1番
    
         ● 暗杠：2番
    
         ● 吃赖子：2番
    
          ● 赖子杠：2番
    
         ● 红中杠：1番
    
         ● 痞子杠：1番
    
         ● 硬胡：1番
    
         ● 三枪：1番
    
         ● 豪华七对：如果胡豪华七对，算作七对再加一个大胡番，双豪华，三豪华，以此类推
    
         ● 门清：1番
    </size>									
                                    
                                                
                                                                                
    ]],
}

ConfigChild.HowToPlayGoldTexts =
{
    [[<size=32><color=#004f3c>一.麻将数量</color></size>
    <size=28>
    1）麻将共120张牌，包括：万、条、筒、中、发、白
    </size>
    
    <size=32><color=#004f3c>二.基础规则</color></size>
    <size=28>
    1）可碰，可杠，可吃
    2）过碰惩罚：无过碰惩罚
    3）无一炮多响
                 ● 若多家可胡时，按逆时针顺序优先胡牌
    4) 坐庄规则：第一随机主坐庄，之后谁胡牌谁做庄；黄庄后，庄家下家为庄
    5) 留牌：每局留最后9张牌，即打到剩余9张牌就流局
    </size>
    
    <size=32><color=#004f3c>三.赖子、痞子规则</color></size>
    <size=28>
    1）赖子：由两个骰子的点数和逆时针方向数确定从谁抓起，小点为起抓墩，大点从尾墩倒数确定翻癞子的位置。翻出的牌摸不到，视为弃张。
    2）赖子可以当任何牌来用，但不可充当某张牌去碰杠，赖子不可以碰杠赖子，当可以打出，打出算“赖子杠”，并补一张牌
                 ●特殊规则：赖子当本身用时可以吃，例如2万是赖子，手中有一张1万和2万，上家打出3万时，此时可以用1、2万吃3万，算吃赖子
    3）痞子：翻出的牌，与红中为痞子
    </size>
    
    <size=32><color=#004f3c>四.胡牌规则</color></size>
    <size=28>
    1）胡牌方式：可以自摸胡，也可以接炮胡
    2）平胡胡牌限制：需要满足起胡分数，即胡牌后所有的人出的分数加起来需要大于等于起胡分，否则不能胡
    3) 见字胡只能自摸，不能接炮
    4) 抢杠胡：不可抢杠胡
    5) 杠后炮：无算分
    6）天胡、地胡：可胡，无额外算分
    7）过胡惩罚：过胡所有张，包括自摸过胡。但如果同圈内，有人放炮且番数比弃胡时的最大番数大则可以接炮
    </size>
    
    <size=32><color=#004f3c>五.计分规则</color></size>
    <size=28>
    1）自摸与接炮均3家出分
    
    2）牌型分
             ● 屁胡:1分
    
             ● 自摸屁胡:3分
    
             ● 大胡：6分
                         注：七对、清一色、碰碰胡、将一色（不需要笼牌，全是将即可），以上牌型为大胡牌型，癞子都可变。多大胡可以叠加，每多1个大胡多1番
    
    3）附加番
             ● 点炮：1番
                         注：点炮番只有点炮玩家才算，其他未点炮玩家不算此番数，且只有大胡才有
             ● 自摸：1番
                         注：牌局结束时算自摸番，三家出分玩家都要算，且只有大胡才有
         ● 明杠：1番
    
         ● 暗杠：2番
    
         ● 吃赖子：2番
    
          ● 赖子杠：2番
    
         ● 红中杠：1番
    
         ● 痞子杠：1番
    
         ● 硬胡：1番
    
         ● 三枪：1番
    
         ● 豪华七对：如果胡豪华七对，算作七对再加一个大胡番，双豪华，三豪华，以此类推
    
         ● 门清：1番
    </size>									
                                    
                                                
                                                                                
    ]],
}

ConfigChild.HowToPlayTexts =
{
    [[<size=32><color=#004f3c>一.麻将数量</color></size>
    <size=28>
    1）麻将共120张牌，包括：万、条、筒、中、发、白
    </size>
    
    <size=32><color=#004f3c>二.基础规则</color></size>
    <size=28>
    1）可碰，可杠，可吃
    2）过碰惩罚：无过碰惩罚
    3）无一炮多响
                 ● 若多家可胡时，按逆时针顺序优先胡牌
    4) 坐庄规则：第一随机主坐庄，之后谁胡牌谁做庄；黄庄后，庄家下家为庄
    5) 留牌：每局留最后9张牌，即打到剩余9张牌就流局
    </size>
    
    <size=32><color=#004f3c>三.赖子、痞子规则</color></size>
    <size=28>
    1）赖子：由两个骰子的点数和逆时针方向数确定从谁抓起，小点为起抓墩，大点从尾墩倒数确定翻癞子的位置。翻出的牌摸不到，视为弃张。
    2）赖子可以当任何牌来用，但不可充当某张牌去碰杠，赖子不可以碰杠赖子，当可以打出，打出算“赖子杠”，并补一张牌
                 ●特殊规则：赖子当本身用时可以吃，例如2万是赖子，手中有一张1万和2万，上家打出3万时，此时可以用1、2万吃3万，算吃赖子
    3）痞子：翻出的牌，与红中为痞子
    </size>
    
    <size=32><color=#004f3c>四.胡牌规则</color></size>
    <size=28>
    1）胡牌方式：可以自摸胡，也可以接炮胡
    2）平胡胡牌限制：需要满足起胡分数，即胡牌后所有的人出的分数加起来需要大于等于起胡分，否则不能胡
    3) 见字胡只能自摸，不能接炮
    4) 抢杠胡：不可抢杠胡
    5) 杠后炮：无算分
    6）天胡、地胡：可胡，无额外算分
    7）过胡惩罚：过胡所有张，包括自摸过胡。但如果同圈内，有人放炮且番数比弃胡时的最大番数大则可以接炮
    </size>
    
    <size=32><color=#004f3c>五.计分规则</color></size>
    <size=28>
    1）自摸与接炮均3家出分
    
    2）牌型分
             ● 屁胡:1分
    
             ● 自摸屁胡:3分
    
             ● 大胡：6分
                         注：七对、清一色、碰碰胡、将一色（不需要笼牌，全是将即可），以上牌型为大胡牌型，癞子都可变。多大胡可以叠加，每多1个大胡多1番
    
    3）附加番
             ● 点炮：1番
                         注：点炮番只有点炮玩家才算，其他未点炮玩家不算此番数，且只有大胡才有
             ● 自摸：1番
                         注：牌局结束时算自摸番，三家出分玩家都要算，且只有大胡才有
         ● 明杠：1番
    
         ● 暗杠：2番
    
         ● 吃赖子：2番
    
          ● 赖子杠：2番
    
         ● 红中杠：1番
    
         ● 痞子杠：1番
    
         ● 硬胡：1番
    
         ● 三枪：1番
    
         ● 豪华七对：如果胡豪华七对，算作七对再加一个大胡番，双豪华，三豪华，以此类推
    
         ● 门清：1番
    </size>									
                                    
                                                
                                                                                
    ]],
}

return ConfigChild
