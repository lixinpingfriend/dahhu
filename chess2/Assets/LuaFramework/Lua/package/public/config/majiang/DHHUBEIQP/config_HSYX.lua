local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --阳新麻将
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
            tag = {togglesTile = "类型:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"Jiang258\":true",toggleType = 1,toggleTitle = "258将",toggleIsOn = true},
                    {disable = false,json = "\"Jiang258\":false",toggleType = 1,toggleTitle = "乱将",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "底分:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"DiFen\":1",toggleType = 1,toggleTitle = "1分",toggleIsOn = true, ruleTitle = "底分1"},
                    {disable = false,json = "\"DiFen\":2",toggleType = 1,toggleTitle = "2分",toggleIsOn = false, ruleTitle = "底分2"},
                    {disable = false,json = "\"DiFen\":3",toggleType = 1,toggleTitle = "3分",toggleIsOn = false, ruleTitle = "底分3"},
                }
            }
        },
        {
            tag = {togglesTile = "封顶:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"FengDing\":30",toggleType = 1,toggleTitle = "30封顶",toggleIsOn = false},
                    {disable = false,json = "\"FengDing\":50",toggleType = 1,toggleTitle = "50封顶",toggleIsOn = true},
                    {disable = false,json = "\"FengDing\":80",toggleType = 1,toggleTitle = "80封顶",toggleIsOn = false},
                    {disable = false,json = "\"FengDing\":100",toggleType = 1,toggleTitle = "100封顶",toggleIsOn = false},
                    {disable = false,json = "\"FengDing\":150",toggleType = 1,toggleTitle = "150封顶",toggleIsOn = false},
                    {disable = false,json = "\"FengDing\":200",toggleType = 1,toggleTitle = "200封顶",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 2},
            list =
            {
                {
                    {disable = false,json = "\"LiangQingPeng\":true",toggleType = 2,toggleTitle = "亮后不算清一色、碰碰胡、将一色",toggleIsOn = false},
                    {disable = false,json = "\"HasWan\":true",toggleType = 2,toggleTitle = "带万字",toggleIsOn = false,smallShow = "1_1",smallShowType = 1},
                    {disable = false,json = "\"QuanQiuRen\":true",toggleType = 2,toggleTitle = "全求人",toggleIsOn = false},
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
                    --{disable = false,json = "\"PayType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                },
            }
        },
        caculPrice = function (roundCount, PlayerNum, PayType, bankerType)
            return Config.caculate_price_hshh(roundCount, PlayerNum, PayType, bankerType)
        end,
        isHuangShiHH = true,
        laiziTagTitle = "赖子",
        laiziTag = "3",
        pnShowResult = true,
        wanfaCustomShow = true,

        soundPath = "hshh",
        defLocationSetting = 0, ---默认的语言配置,0 或者不配置 普通话，1 方言，
        isOpenLocationSetting = true, ---打开方言设置
        defGuoHu = 1, ---默认过胡设置，0开启过胡，1 关闭过胡
        autoOpenTotalResultTime = 5, ---自动跳转大结算到时间，如果没有配置则不会跳转

        defRecommendOutPaiSetting = 1, ---默认的推荐出牌设置,0 或者不配置 关闭，1 打开，
        IsOpenRecommendOutPaiSetting = true,---打开推荐出牌设置
        IsOpenStartNow = true, ---打开提前开局按钮
        --IsUse3dThrowUpLayout = true,---3D模式下的弃张布局使用向上叠加的布局

        chatShotTextList = {
            "想什么呢,快点出牌呀",
            "不好意思,刚接了个电话,耽搁一下",
            "上手能不能不捉果紧,放个档子啦",
            "几张牌活活被恩碰死",
            "能不能来果,真正一七心",
            "真正一有味,带果个牌也能胡",
            "果个牌冒杠开,痞手的哭",
            "打渔看倒浪啦,莫糊涂打",
            "打牌不冲锋,不如回家做负工",
            "恩能不能有点最求啦,果噶屁胡机子",
        },

        laiziNoYellow = true,
        view = "tablehuangshihh_view",
        controller = "tablehuangshihh_controller",
        goldResultType = "hubei",
        table3dStyles = {1,2},
        useBriefOneGameResult = false,  ---是否使用简略小结算
        openHuScreenShotUpload = true, ---开启可以胡牌时，截屏上传功能
        useOneClickOutMj = true, ---开启单击麻将出牌配置选项
    },
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
    4) 坐庄规则：第一局随机庄家，之后谁胡谁庄，流局庄家连庄
    5) 留牌：每局留最后10张牌，即打到剩余10张牌就流局
    6) 海底捞：最后4张牌，每人轮流摸一张，摸牌后不能打出牌
    </size>
    
    <size=32><color=#004f3c>三.胡牌规则</color></size>
    <size=28>
    1）胡牌方式：可以自摸胡，也可以接炮胡，没有见字胡必须自摸的限制
    2）有抢杠胡：按照杠牌的人放炮计算
    3) 过胡惩罚：过胡只过接炮胡，自摸弃胡后仍然可以接炮
                 注：过所有牌
                 特殊规则：在第一家点炮是平胡的情况下过胡，若第二家点炮是大胡
                 第一家点炮是1个大胡，第二家点炮是2个大胡
                 第一家点炮是软胡，第二家点炮是硬胡（必须是大胡）
                 以上3种情况不激活过胡惩罚，可以胡牌；
    4) 胡牌方式：
                ● 接炮：三家出分
                ● 自摸：三家出分
    5) 一色包赔:
                ● 清一色将一色，由放第三口的人包赔所有人的分数
    </size>
    
    <size=32><color=#004f3c>四.计分规则</color></size>
    <size=28>
    1）屁胡=自摸2分， 接炮时放炮的2分，其他人1分
    2）大胡=自摸7分，接炮时放炮的7分，其他人5分
    3）赖子杠=1杠1番
    4）硬胡=1番，胡牌时赖子当做自己本身使用
    5）明杠/暗杠=1杠1番
    6）亮中发白=亮1次1番， 如果其中包含赖子则多加1番
    7）大胡=大胡的情况下，多一个大胡额外再加1番
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
    4) 坐庄规则：第一局随机庄家，之后谁胡谁庄，流局庄家连庄
    5) 留牌：每局留最后10张牌，即打到剩余10张牌就流局
    6) 海底捞：最后4张牌，每人轮流摸一张，摸牌后不能打出牌
    </size>
    
    <size=32><color=#004f3c>三.胡牌规则</color></size>
    <size=28>
    1）胡牌方式：可以自摸胡，也可以接炮胡，没有见字胡必须自摸的限制
    2）有抢杠胡：按照杠牌的人放炮计算
    3) 过胡惩罚：过胡只过接炮胡，自摸弃胡后仍然可以接炮
                 注：过所有牌
                 特殊规则：在第一家点炮是平胡的情况下过胡，若第二家点炮是大胡
                 第一家点炮是1个大胡，第二家点炮是2个大胡
                 第一家点炮是软胡，第二家点炮是硬胡（必须是大胡）
                 以上3种情况不激活过胡惩罚，可以胡牌；
    4) 胡牌方式：
                ● 接炮：三家出分
                ● 自摸：三家出分
    5) 一色包赔:
                ● 清一色将一色，由放第三口的人包赔所有人的分数
    </size>
    
    <size=32><color=#004f3c>四.计分规则</color></size>
    <size=28>
    1）屁胡=自摸2分， 接炮时放炮的2分，其他人1分
    2）大胡=自摸7分，接炮时放炮的7分，其他人5分
    3）赖子杠=1杠1番
    4）硬胡=1番，胡牌时赖子当做自己本身使用
    5）明杠/暗杠=1杠1番
    6）亮中发白=亮1次1番， 如果其中包含赖子则多加1番
    7）大胡=大胡的情况下，多一个大胡额外再加1番
    </size>
                                        
                                    
                                                
                                                                                
    ]],
}

return ConfigChild
