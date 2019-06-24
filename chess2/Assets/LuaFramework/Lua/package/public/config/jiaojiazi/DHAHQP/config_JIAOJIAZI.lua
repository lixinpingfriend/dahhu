local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --大冶五十K
        {--不同分类 局数 人数..
            tag = {togglesTile = "局数:",rowNum = 3},--toggle标题信息
            list =--不同group
            {
                {--不同toggle组
                    {disable = false,json = "\"roundCount\":2",toggleType = 1,toggleTitle = "2局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":3",toggleType = 1,toggleTitle = "3局",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "叫牌:",rowNum = 3},--toggle标题信息
            list =
            {
                {
                    {disable = false,json = "\"jiaoPaiRangeType\":1",toggleType = 1,toggleTitle = "3-10以内",toggleIsOn = true},
                    {disable = false,json = "\"jiaoPaiRangeType\":2",toggleType = 1,toggleTitle = "2-A以内",toggleIsOn = false},
                },
                {
                    {disable = false,json = "\"isMingJiao\":true",toggleType = 1,toggleTitle = "明叫",toggleIsOn = true},
                    {disable = false,json = "\"isMingJiao\":false",toggleType = 1,toggleTitle = "暗叫",toggleIsOn = false},
                }
            }
        },
        --{
        --    tag = {togglesTile = "首发:",rowNum = 4},--toggle标题信息
        --    list =
        --    {
        --        {
        --            {disable = false,json = "\"isJiaoPaiMustFirstPattern\":true",toggleType = 1,toggleTitle = "必打叫牌",toggleIsOn = true},
        --            {disable = false,json = "\"isJiaoPaiMustFirstPattern\":false",toggleType = 1,toggleTitle = "不必打叫牌",toggleIsOn = false},
        --        }
        --    }
        --},
        {
            tag = {togglesTile = "牌数:",rowNum = 3},--toggle标题信息
            list =
            {
                {
                    {disable = false,json = "\"showCardsCount\":true",toggleType = 1,toggleTitle = "显示剩余牌数",toggleIsOn = true},
                    {disable = false,json = "\"showCardsCount\":false",toggleType = 1,toggleTitle = "不显示剩余牌数",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "聊天:",rowNum = 3},--toggle标题信息
            list =
            {
                {
                    {disable = false,json = "\"isPrivateChat\":false",toggleType = 1,toggleTitle = "明聊",toggleIsOn = true},
                    {disable = false,json = "\"isPrivateChat\":true",toggleType = 1,toggleTitle = "私聊",toggleIsOn = false},
                },
            }
        },
        {
            tag = { togglesTile = "高级:", rowNum = 3 }, --toggle标题信息
            list = {
                {
                    { disable = false, json = "\"SameIpForbidden\":true", toggleType = 2, toggleTitle = "同IP限制", toggleIsOn = false },

                    { disable = false, json = "\"TableGiftForbidden\":true", toggleType = 2, toggleTitle = "禁止互动表情", toggleIsOn = false },{ disable = false, json = "\"VoiceChatForbidden\":true", toggleType = 2, toggleTitle = "禁止语音和聊天", toggleIsOn = false },
                }
            }
        },
        {
            tag = { togglesTile = "定位:", rowNum = 3 }, --toggle标题信息
            list = {
                {
                    { disable = false, json = "\"CheckIPAddress\":true", toggleType = 2, toggleTitle = "相同IP检测", toggleIsOn = false },
                    { disable = false, json = "SafeDistance", toggleType = 2, toggleTitle = "GPS检测", toggleIsOn = false ,dropDown = "50,100,300", dropDefault = 1,dropAddStr = "米"
                        ,addJson = "\"NeedOpenGPS\":true",clickTip = "距离小于X米的玩家不能加入房间"},
                }
            }
        },
        {
            tag = {togglesTile = "",rowNum = 3, isPay = true},--toggle标题信息
            list =--不同group
            {
                {--不同toggle组
                    {disable = false,json = "\"payType\":0",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"payType\":1",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false},
                },
            }
        },
        configJson = '{"game_type":1, "GameType":1,\"playerCount\":4,\"HallID\":0, "isKingMagic":true, "decksOfCards":3,',
        caculPrice = function (roundCount, PlayerNum, PayType, bankerType)
            return Config.caculate_price_jiaojiazi(roundCount, PlayerNum, PayType, bankerType)
        end,
        defLocationSetting = 0, ---默认的语言配置,0 或者不配置 普通话，1 方言，
    isOpenLocationSetting = false, ---是否打开方言设置
    },
    { --大冶五十K
        {--不同分类 局数 人数..
            tag = {togglesTile = "局数:",rowNum = 3},--toggle标题信息
            list =--不同group
            {
                {--不同toggle组
                    {disable = false,json = "\"roundCount\":4",toggleType = 1,toggleTitle = "4局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "叫牌:",rowNum = 3},--toggle标题信息
            list =
            {
                {
                    {disable = false,json = "\"jiaoPaiRangeType\":1",toggleType = 1,toggleTitle = "3-10以内",toggleIsOn = true},
                    {disable = false,json = "\"jiaoPaiRangeType\":2",toggleType = 1,toggleTitle = "2-A以内",toggleIsOn = false},
                },
                {
                    {disable = false,json = "\"isMingJiao\":true",toggleType = 1,toggleTitle = "明叫",toggleIsOn = true},
                    {disable = false,json = "\"isMingJiao\":false",toggleType = 1,toggleTitle = "暗叫",toggleIsOn = false},
                }
            }
        },
        --{
        --    tag = {togglesTile = "首发:",rowNum = 4},--toggle标题信息
        --    list =
        --    {
        --        {
        --            {disable = false,json = "\"isJiaoPaiMustFirstPattern\":true",toggleType = 1,toggleTitle = "必打叫牌",toggleIsOn = true},
        --            {disable = false,json = "\"isJiaoPaiMustFirstPattern\":false",toggleType = 1,toggleTitle = "不必打叫牌",toggleIsOn = false},
        --        }
        --    }
        --},
        {
            tag = {togglesTile = "牌数:",rowNum = 3},--toggle标题信息
            list =
            {
                {
                    {disable = false,json = "\"showCardsCount\":true",toggleType = 1,toggleTitle = "显示剩余牌数",toggleIsOn = true},
                    {disable = false,json = "\"showCardsCount\":false",toggleType = 1,toggleTitle = "不显示剩余牌数",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "聊天:",rowNum = 3},--toggle标题信息
            list =
            {
                {
                    {disable = false,json = "\"isPrivateChat\":false",toggleType = 1,toggleTitle = "明聊",toggleIsOn = true},
                    {disable = false,json = "\"isPrivateChat\":true",toggleType = 1,toggleTitle = "私聊",toggleIsOn = false},
                },
            }
        },
        {
            tag = { togglesTile = "高级:", rowNum = 3 }, --toggle标题信息
            list = {
                {
                    { disable = false, json = "\"SameIpForbidden\":true", toggleType = 2, toggleTitle = "同IP限制", toggleIsOn = false },

                    { disable = false, json = "\"TableGiftForbidden\":true", toggleType = 2, toggleTitle = "禁止互动表情", toggleIsOn = false },{ disable = false, json = "\"VoiceChatForbidden\":true", toggleType = 2, toggleTitle = "禁止语音和聊天", toggleIsOn = false },
                }
            }
        },
        {
            tag = { togglesTile = "定位:", rowNum = 3 }, --toggle标题信息
            list = {
                {
                    { disable = false, json = "\"CheckIPAddress\":true", toggleType = 2, toggleTitle = "相同IP检测", toggleIsOn = false },
                    { disable = false, json = "SafeDistance", toggleType = 2, toggleTitle = "GPS检测", toggleIsOn = false ,dropDown = "50,100,300", dropDefault = 1,dropAddStr = "米"
                        ,addJson = "\"NeedOpenGPS\":true",clickTip = "距离小于X米的玩家不能加入房间"},
                }
            }
        },
        {
            tag = {togglesTile = "",rowNum = 3, isPay = true},--toggle标题信息
            list =--不同group
            {
                {--不同toggle组
                    {disable = false,json = "\"payType\":0",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"payType\":1",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false},
                },
            }
        },
        configJson = '{"game_type":2, "GameType":2,\"playerCount\":4,\"HallID\":0, "isKingMagic":true, "decksOfCards":2,',
        caculPrice = function (roundCount, PlayerNum, PayType, bankerType)
            return Config.caculate_price_jiaojiazi(roundCount, PlayerNum, PayType, bankerType)
        end,
        defLocationSetting = 0, ---默认的语言配置,0 或者不配置 普通话，1 方言，
    isOpenLocationSetting = false, ---是否打开方言设置
    },

}

ConfigChild.PlayRuleText = {
    [[叫家子]]
}

ConfigChild.HowToPlayTexts =
{
    [[
<size=32><color=#004f3c>一、基础规则</color></size>
<size=28>
1）需要4人才可进行游戏
2）2副牌，共108张，每个玩家27张
3）3副牌，额外增加6个王，3大王3小王，每个玩家42张
4）首发出牌没有任何限制，任意牌都可以出
5）接风：若1个玩家打出最后1手牌，其他玩家都不要（或要不起），由该玩家的下家出牌（若下家已经出完牌，则继续轮转下家的下家出牌）
6）同一边的2个玩家都打完手中的牌，则本局游戏结束
</size>
<size=32><color=#004f3c>二、庄家规则</color></size>
<size=28>
1）第1局房主当庄
2）后续由上一局的一游玩家当庄
</size>
<size=32><color=#004f3c>三、叫牌规则</color></size>
<size=28>
3.1 叫牌范围：
1）选项1：可叫3-10的手牌
2）选项2：除了王以外其他牌都可以叫

3.2 叫牌规则
1）3副牌的情况下，选择手上的完全相同的1对牌，不可以是3张相同牌中的1对
2）2副牌的情况下，选择手上没有相同1对的牌进行叫牌
3）若庄家没有可叫的牌，则重新发牌
</size>
<size=32><color=#004f3c>四、牌型规则</color></size>
<size=28>
4.1 牌型介绍
1）单张：任意1张单牌
2）对子：任意2张点数相同的牌
3）顺子：相邻的6张或6张以上的牌，【2】能当做顺子组成
4）连对：相邻的2对或2对以上的牌，【2】可以做连对
5）三张：任意3张点数相同的牌，可以带1对，不能带2张散牌
6）飞机：相连的三张，可以带对子，也可以不带，对子不用相连
7）炸弹：4张或4张以上点数相同的牌

4.2 牌型大小
1）所有相同牌型的牌，只看牌面点数比较大小
2）单张：2>A>K>Q>J>10>9>8>7>6>5>4>3
3）对子：对2>对A>对K>对Q>对J>对10>对9>对8>对7>对6>对5>对4>对3
4）三张：3个2>3个A>3个K>3个Q>3个J>3个10>3个9>3个8>3个7>3个6>3个5>3个4>3个3
5）三带二：看三张的牌面点数比较大小，不看带的对子
6）顺子：A23456为最小的顺子
7）连对：AA22为最小连对，KKAA为最大
8）炸弹：优先比较炸弹张数，例如8张牌炸弹>7张牌炸弹，张数相同比较牌面点数

4.3 特殊规则
1）【王】为癞子牌，可代替除王以外所有牌打出
2）常规情况下，“王”不能被单独打出（单张王、一对王、三张王等等都不行）
3）若手牌只剩下“王”的时候，“王”视为3点，可打出
</size>
<size=32><color=#004f3c>五、结算规则</color></size>
<size=28>
5.1 胜负判断
头游和其队友所在的一方获得本局胜利

5.2 算分公式
得分=胜利分+炸弹分+喜牌分

5.3 胜利分
1）头游所在队伍获得本局胜利分，另一边2个玩家需出胜利分
2）根据头游和其队友的游数决定分数
3）头游和二游为队友：头游方每人进10分，对立方每人出10分
4）头游和三游为队友：头游方每人进5分，对立方每人出5分
5）头游和四游为队友：本局所有人都没有胜利分数进出

5.4 炸弹分
1）牌局中，某1轮出牌打出的所有炸弹分，由最后最大出牌的玩家与其队友获得
2）获得炸弹分的一方，每人进N分，另外一方每人出N分，炸弹分会在牌桌内显示
3）两副牌打出炸弹得分：
   5炸：1分/人
   6炸：2分/人
   7炸：4分/人
   8炸：8分/人
   9炸：16分/人
   10炸：32分/人
   11炸：64分/人
   12炸：128分/人
4）三副牌打出炸弹得分，5炸为1分/人，之后每多1张炸弹，得分+1分/人

5.5 喜钱分
1）玩家只要打出对应的喜钱炸弹就算喜钱，喜钱由打出的玩家获得，其他3家每人出指定分数
2）2副牌1喜=10分，3副牌1喜=5分
3）2副牌，抓到4个王算1喜；3副牌，抓到8个算1喜，每多抓1个王就多算1喜
4）起手没有王，算1喜
5）两副牌硬炸喜钱分：
   硬7炸：1喜
   硬8炸：2喜
6）三副牌硬炸喜钱分：
   硬7炸：1喜
   硬8炸：2喜
   硬9炸：3喜
   硬10炸：4喜
   硬11炸：5喜
   硬12炸：6喜
7）两幅牌带王炸喜钱分：
   9炸：1喜
   10炸：2喜
   11炸：3喜
   12炸：4喜
8）三副牌带王炸喜钱分从14炸起算，每多1张炸则多算1个喜钱
9）喜钱可以叠加，同时满足硬炸喜钱和带王喜钱，两边喜钱都要算
</size>
    ]],
}

return ConfigChild
