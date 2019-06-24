local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --安徽跑得快
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
            tag = {togglesTile = "牌数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"showCardsCount\":true",toggleType = 1,toggleTitle = "显示剩余牌数",toggleIsOn = true},
                    {disable = false,json = "\"showCardsCount\":false",toggleType = 1,toggleTitle = "不显示剩余牌数",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "封顶:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"maxbeishu\":4",toggleType = 1,toggleTitle = "4倍",toggleIsOn = true},
                    {disable = false,json = "\"maxbeishu\":8",toggleType = 1,toggleTitle = "8倍",toggleIsOn = false},
                    {disable = false,json = "\"maxbeishu\":0",toggleType = 1,toggleTitle = "不封顶",toggleIsOn = false},
                },
            }
        },
        -- {
        --     tag = {togglesTile = "玩法:",rowNum = 3},
        --     list =
        --     {
        --         {
        --             --smallShowType 2：控制clickSmallShow相对应的smallShow，当clickSmallShow选中时smallShow这一项隐藏，反之一样
        --             --              1：当clickSmallShow选中时smallShow这一项显示，反之一样
        --             {disable = false,json = "\"notify_card_cnt\":false",toggleType = 1,toggleTitle = "不显示牌数",toggleIsOn = true},
        --             {disable = false,json = "\"notify_card_cnt\":true",toggleType = 1,toggleTitle = "显示牌数",toggleIsOn = false},
        --         },
        --         {
        --             {disable = false,json = "\"maxbeishu\":false",toggleType = 1,toggleTitle = "有牌必压",toggleIsOn = false},
        --             {disable = false,json = "\"maxbeishu\":true",toggleType = 1,toggleTitle = "可不要",toggleIsOn = true},
        --         },
        --     }
        -- },
        --{
        --    tag = { togglesTile = "定位:", rowNum = 3 },
        --    list = {
        --        {
        --            { disable = false, json = "\"CheckIPAddress\":true", toggleType = 2, toggleTitle = "相同IP检测", toggleIsOn = false },
        --            { disable = false, json = "SafeDistance", toggleType = 2, toggleTitle = "GPS检测", toggleIsOn = false ,dropDown = "50,100,300", dropDefault = 1,dropAddStr = "米"
        --                ,addJson = "\"NeedOpenGPS\":true",clickTip = "距离小于X米的玩家不能加入房间"},
        --        }
        --    }
        --},
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
        configJson = '{\"game_type\":0,\"playerCount\":3,\"HallID\":0,\"GameType\":0,',
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price10(roundCount, playerCount, payType, bankerType)
        end,
    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一、发牌</color></size>
<size=28>
一副牌54张，每人随机发17张，剩余3张为底牌
</size>
<size=32><color=#004f3c>二、叫分</color></size>
<size=28>
1）叫分按出牌顺序逆时针进行
2）玩家可选择“不叫”、“1分”、“2分”、“3分”
3）选择“3分”的玩家直接成为地主
4）所有玩家都选择完后，叫分最多的成为地主
5）第1局房主第1个叫分，之后按出牌顺序逆时针轮流第1个叫分
6）选择“明牌”的玩家优先叫分
7）都不叫分重新发牌
</size>
<size=32><color=#004f3c>三、计分规则</color></size>
<size=28>
1）底分：根据玩家叫分判断底分，最少为1分，最多为3分
2）地主计分=±（农民A计分+农民B计分）
3）农民计分=±底分*倍数
</size>
<size=32><color=#004f3c>四、倍数</color></size>
<size=28>
1）炸弹：2倍
2）王炸：2倍
3）春天：2倍
4）明牌：3倍
</size>
<size=32><color=#004f3c>五、牌型</color></size>
<size=28>
1）火箭：双王，即大小王，最大的牌
2）炸弹：牌面数字相同的4张牌（例如KKKK，QQQQ，3333）
3）单牌：单张的牌（例如黑桃K）
4）对子：牌面数字相同的2张牌（例如黑桃K+红桃K）
5）三张：牌面数字相同的3张牌（例如黑桃K+红桃K+梅花K）
6）三带一：牌面数字相同的3张牌+1张单牌或对子（例如KKK+8或QQQ+44）
7）顺子：5张或更多的连续单牌（例如78910J，3456789）
8）连对：3对或以上的连续对子牌型（例如334455，991010JJQQ）
9）飞机：2个或更多的连续三张牌型，飞机牌型中每1个三张都可+1张单牌或对子（例如：333444+78或333444+7788）
10）四带二：牌面数字相同的4张牌+2张牌或2对牌（例如KKKK+89，8888+AAKK）
</size>
]],
}

return ConfigChild
