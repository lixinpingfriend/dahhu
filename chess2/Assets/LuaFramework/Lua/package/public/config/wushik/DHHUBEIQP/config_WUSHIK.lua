local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --大冶五十K
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":4",toggleType = 1,toggleTitle = "4局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":12",toggleType = 1,toggleTitle = "12局",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "底分:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"DiFen\":5",toggleType = 1,toggleTitle = "5分",toggleIsOn = true},
                    {disable = false,json = "\"DiFen\":10",toggleType = 1,toggleTitle = "10分",toggleIsOn = false},
                    {disable = false,json = "\"DiFen\":20",toggleType = 1,toggleTitle = "20分",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"exceptCard34\":true",toggleType = 2,toggleTitle = "去掉3和4",toggleIsOn = true,inverseJson = "\"exceptCard34\":false"},
                    {disable = false,json = "\"isKingMagic\":true",toggleType = 2,toggleTitle = "王当癞子",toggleIsOn = true,inverseJson = "\"isKingMagic\":false"},
                }
            }
        },
        {
            tag = { togglesTile = "记牌:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"isOpenCardCountRecorder\":false", toggleType = 1, toggleTitle = "不可用", toggleIsOn = true },
                    { disable = false, json = "\"isOpenCardCountRecorder\":true", toggleType = 1, toggleTitle = "可用", toggleIsOn = false },
                }
            }
        },
        {
            tag = { togglesTile = "高级:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"SameIpForbidden\":true", toggleType = 2, toggleTitle = "同IP限制", toggleIsOn = false },

                    { disable = false, json = "\"TableGiftForbidden\":true", toggleType = 2, toggleTitle = "禁止互动表情", toggleIsOn = true },{ disable = false, json = "\"VoiceChatForbidden\":true", toggleType = 2, toggleTitle = "禁止语音和聊天", toggleIsOn = true },
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
            tag = {togglesTile = "",rowNum = 3, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"payType\":0",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"payType\":1",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false},
                },
            }
        },
        configJson = '{"game_type":1, "GameType":1,\"playerCount\":4,\"HallID\":0,',
        caculPrice = function (roundCount, PlayerNum, PayType, bankerType)
            return Config.caculate_price_50k(roundCount, PlayerNum, PayType, bankerType)
        end,
        defLocationSetting = 1, ---默认的语言配置,0 或者不配置 普通话，1 方言，
        isOpenLocationSetting = true, ---打开方言设置
    },
    { --黄石五十K
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":4",toggleType = 1,toggleTitle = "4局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":12",toggleType = 1,toggleTitle = "12局",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "底分:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"DiFen\":5",toggleType = 1,toggleTitle = "5分",toggleIsOn = true},
                    {disable = false,json = "\"DiFen\":10",toggleType = 1,toggleTitle = "10分",toggleIsOn = false},
                    {disable = false,json = "\"DiFen\":20",toggleType = 1,toggleTitle = "20分",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 4},
            list =
            {
                {
                    --{disable = false,json = "\"isKingMagic\":true",toggleType = 2,toggleTitle = "王当癞子",toggleIsOn = false,inverseJson = "\"isKingMagic\":false"},
                    {disable = false,json = "\"exceptCard34\":true",toggleType = 2,toggleTitle = "去掉3和4",toggleIsOn = true,inverseJson = "\"exceptCard34\":false"},
                }
            }
        },
        {
            tag = { togglesTile = "记牌:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"isOpenCardCountRecorder\":false", toggleType = 1, toggleTitle = "不可用", toggleIsOn = true },
                    { disable = false, json = "\"isOpenCardCountRecorder\":true", toggleType = 1, toggleTitle = "可用", toggleIsOn = false },
                }
            }
        },
        {
            tag = { togglesTile = "高级:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"SameIpForbidden\":true", toggleType = 2, toggleTitle = "同IP限制", toggleIsOn = false },

                    { disable = false, json = "\"TableGiftForbidden\":true", toggleType = 2, toggleTitle = "禁止互动表情", toggleIsOn = true },{ disable = false, json = "\"VoiceChatForbidden\":true", toggleType = 2, toggleTitle = "禁止语音和聊天", toggleIsOn = true },
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
            tag = {togglesTile = "",rowNum = 3, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"payType\":0",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"payType\":1",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false},
                },
            }
        },
        configJson = '{"game_type":2, "GameType":2,\"playerCount\":4,\"HallID\":0,"isKingMagic":false,',
        caculPrice = function (roundCount, PlayerNum, PayType, bankerType)
            return Config.caculate_price_50k(roundCount, PlayerNum, PayType, bankerType)
        end,
        defLocationSetting = 1, ---默认的语言配置,0 或者不配置 普通话，1 方言，
        isOpenLocationSetting = true, ---打开方言设置
    },
    { --黄石经典
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":4",toggleType = 1,toggleTitle = "4局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":12",toggleType = 1,toggleTitle = "12局",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "底分:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"DiFen\":5",toggleType = 1,toggleTitle = "5分",toggleIsOn = true},
                    {disable = false,json = "\"DiFen\":10",toggleType = 1,toggleTitle = "10分",toggleIsOn = false},
                    {disable = false,json = "\"DiFen\":20",toggleType = 1,toggleTitle = "20分",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 4},
            list =
            {
                {
                    --{disable = false,json = "\"isKingMagic\":true",toggleType = 2,toggleTitle = "王当癞子",toggleIsOn = false,inverseJson = "\"isKingMagic\":false"},
                    {disable = false,json = "\"exceptCard34\":true",toggleType = 2,toggleTitle = "去掉3和4",toggleIsOn = true,inverseJson = "\"exceptCard34\":false"},
                }
            }
        },
        {
            tag = { togglesTile = "记牌:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"isOpenCardCountRecorder\":false", toggleType = 1, toggleTitle = "不可用", toggleIsOn = true },
                    { disable = false, json = "\"isOpenCardCountRecorder\":true", toggleType = 1, toggleTitle = "可用", toggleIsOn = false },
                }
            }
        },
        {
            tag = { togglesTile = "高级:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"SameIpForbidden\":true", toggleType = 2, toggleTitle = "同IP限制", toggleIsOn = false },

                    { disable = false, json = "\"TableGiftForbidden\":true", toggleType = 2, toggleTitle = "禁止互动表情", toggleIsOn = true },{ disable = false, json = "\"VoiceChatForbidden\":true", toggleType = 2, toggleTitle = "禁止语音和聊天", toggleIsOn = true },
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
            tag = {togglesTile = "",rowNum = 3, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"payType\":0",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"payType\":1",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false},
                },
            }
        },
        configJson = '{"game_type":3, "GameType":3,\"playerCount\":4,\"HallID\":0,"isKingMagic":false,',
        caculPrice = function (roundCount, PlayerNum, PayType, bankerType)
            return Config.caculate_price_50k(roundCount, PlayerNum, PayType, bankerType)
        end,
        defLocationSetting = 1, ---默认的语言配置,0 或者不配置 普通话，1 方言，
    isOpenLocationSetting = true, ---打开方言设置
    },
    { --六人五十K
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":4",toggleType = 1,toggleTitle = "4局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":12",toggleType = 1,toggleTitle = "12局",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "底分:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"DiFen\":5",toggleType = 1,toggleTitle = "5分",toggleIsOn = true},
                    {disable = false,json = "\"DiFen\":10",toggleType = 1,toggleTitle = "10分",toggleIsOn = false},
                    {disable = false,json = "\"DiFen\":20",toggleType = 1,toggleTitle = "20分",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 4},
            list =
            {
                {
                    --{disable = false,json = "\"isKingMagic\":true",toggleType = 2,toggleTitle = "王当癞子",toggleIsOn = false,inverseJson = "\"isKingMagic\":false"},
                    {disable = false,json = "\"exceptCard34\":true",toggleType = 2,toggleTitle = "去掉3和4",toggleIsOn = true,inverseJson = "\"exceptCard34\":false"},
                }
            }
        },
        {
            tag = { togglesTile = "记牌:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"isOpenCardCountRecorder\":false", toggleType = 1, toggleTitle = "不可用", toggleIsOn = true },
                    { disable = false, json = "\"isOpenCardCountRecorder\":true", toggleType = 1, toggleTitle = "可用", toggleIsOn = false },
                }
            }
        },
        {
            tag = { togglesTile = "高级:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"SameIpForbidden\":true", toggleType = 2, toggleTitle = "同IP限制", toggleIsOn = false },

                    { disable = false, json = "\"TableGiftForbidden\":true", toggleType = 2, toggleTitle = "禁止互动表情", toggleIsOn = true },{ disable = false, json = "\"VoiceChatForbidden\":true", toggleType = 2, toggleTitle = "禁止语音和聊天", toggleIsOn = true },
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
            tag = {togglesTile = "",rowNum = 3, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"payType\":0",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"payType\":1",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false},
                },
            }
        },
        configJson = '{"game_type":4, "GameType":4,\"playerCount\":6,\"HallID\":0,"isKingMagic":false,',
        caculPrice = function (roundCount, PlayerNum, PayType, bankerType)
            return Config.caculate_price_50k(roundCount, PlayerNum, PayType, bankerType)
        end,
        defLocationSetting = 1, ---默认的语言配置,0 或者不配置 普通话，1 方言，
    isOpenLocationSetting = true, ---打开方言设置
    },
}

ConfigChild.PlayRuleText = {
    [[五十K]]
}

ConfigChild.HowToPlayTexts =
{
    [[
<size=32><color=#004f3c>一、基础规则</color></size>
<size=28>
1）需要4人才可进行游戏
2）使用2副牌，共108张
3）每个玩家27张牌
</size>
<size=32><color=#004f3c>二、庄家规则</color></size>
<size=28>
1）第1局房主当庄
2）后续由上一局的一游玩家当庄
</size>
<size=32><color=#004f3c>三、牌型规则</color></size>
<size=28>
3.1 牌型介绍
1）单张：任意1张单牌
2）炸弹：任意3张或3张以上，且点数相同的牌
3）顺子：相邻的3张或3张以上的牌，例如：678，【2】不能当做顺子组成
4）连对：相邻的3对或3对以上的牌，例如：667788，【2】不能当做连对组成
5）杂五十K炸弹：花色不同的单张5+单张10+单张K
6）正五十K炸弹：花色相同的单张5+单张10+单张K
7）王炸：2张或2张以上的大小王

3.2 普通牌型大小规则
1）只有在牌型和张数一致时才可以比较大小
2）单张牌面大小：大王>小王>2>A>K>Q>J>10>9>8>7>6>5>4>3
3）连对：比较最大一组对牌的牌面点数
4）顺子：比较最大一张牌的牌面点数

3.3 炸弹牌型大小规则
1）大冶玩法：3条<4条<5条<6条<7条<杂五十K<正五十K<对王（杂王）<3王<8条<4王
2）普通炸弹张数相同时，按牌面点数比较大小
3）杂五十K炸弹按先出的为大
4）正五十K炸弹按花色比较大小，花色顺序为：黑桃>红桃>梅花>方块
5）一对大王>一对小王>杂王
</size>
<size=32><color=#004f3c>四、癞子规则</color></size>
<size=28>
1）【王】作为癞子牌，可跟任意牌搭配
2）【王】不可单独打出，若只剩最后1张牌时，可单独打出
3）【王】可以搭配任意炸弹打出，无论搭配多少个【王】，最多算8个炸，例如7个7+3个王，算8个7的炸弹
4）相同花色的【5】【10】【K】任意2张，加1张王，算正五十K
5）相同花色下，正五十K（不带癞子）>正五十K（带癞子）
6）花色不同，大小顺序为：黑桃正五十K（不带癞子）>黑桃正五十K（带癞子）>红桃正五十K（不带癞子）……>方块正五十K（带癞子）
7）杂五十K无论是否带癞子，大小相同
</size>
<size=32><color=#004f3c>五、结算规则</color></size>
<size=28>
5.1 算分公式
1）玩家分数=±底分*倍数
2）底分选项：1分、2分、4分
3）玩家为胜利方时，赢得对应分数；玩家为失败方时，付出对应分数

5.2 独牌模式
1）独牌模式下，独牌玩家先出完牌，则独牌玩家胜利，其他任意1名玩家先出完牌，则非独牌玩家胜利
2）独牌算分倍数：4倍

5.3 找朋友胜负模式
1）当玩家为一游、二游队伍时，获得胜利，对方有捡分则赢得2倍底分，对方没捡分则赢得4倍底分
2）当玩家为一游、三游队伍时，若二游玩家捡分少于105分，则获得胜利，倍数为1倍；若二游玩家没拿分，则底分倍数为4倍
3）当玩家为一游、三游队伍时，若二游玩家捡分大于等于105分，则二游玩家所在队伍胜利，底分倍数为1倍
4）当玩家为一游、四游队伍时，若捡分大于等于100分，则一游玩家队伍胜利，捡分200分时底分倍数为4倍，捡分不到200时底分倍数为1倍
5）当玩家为一游、四游队伍时，若捡分小于100分，则二游玩家队伍胜利，底分倍数为1倍，若一游、四游捡分为0分，【大冶玩法】中底分倍数为4倍，【黄石玩法】底分倍数为2倍

5.4 游戏提前结束
1）当二游玩家得分大于等于105分，且对方有拿分，则二游队伍胜利，该局游戏立即结束，底分倍数为1倍
2）当一游队伍合计得分大于等于100分，且对方二游有拿分，则一游队伍胜利，该局游戏立即结束，底分倍数为1倍
</size>
<size=32><color=#004f3c>六、接风规则</color></size>
<size=28>
1）已经确定了队友关系（叫牌被打出），则由最后一手牌玩家的队友进行下一轮首发出牌
2）未确定队友关系（叫牌未被打出），则由最后一手牌玩家逆时针的下一位玩家出牌
</size>
    ]],
    [[
<size=32><color=#004f3c>一、基础规则</color></size>
<size=28>
1）需要4人才可进行游戏
2）使用2副牌，共108张
3）每个玩家27张牌
</size>
<size=32><color=#004f3c>二、庄家规则</color></size>
<size=28>
1）第1局房主当庄
2）后续由上一局的一游玩家当庄
</size>
<size=32><color=#004f3c>三、牌型规则</color></size>
<size=28>
3.1 牌型介绍
1）单张：任意1张单牌
2）炸弹：任意3张或3张以上，且点数相同的牌
3）顺子：相邻的3张或3张以上的牌，例如：678，【2】不能当做顺子组成
4）连对：相邻的3对或3对以上的牌，例如：667788，【2】不能当做连对组成
5）杂五十K炸弹：花色不同的单张5+单张10+单张K
6）正五十K炸弹：花色相同的单张5+单张10+单张K
7）王炸：2张或2张以上的大小王

3.2 普通牌型大小规则
1）只有在牌型和张数一致时才可以比较大小
2）单张牌面大小：大王>小王>2>A>K>Q>J>10>9>8>7>6>5>4>3
3）连对：比较最大一组对牌的牌面点数
4）顺子：比较最大一张牌的牌面点数

3.3 炸弹牌型大小规则
1）3条<4条<5条<杂五十K<正五十K<6条<对王（杂王）<7条<3王<8条<4王
2）普通炸弹张数相同时，按牌面点数比较大小
3）杂五十K炸弹按先出的为大
4）正五十K炸弹按花色比较大小，花色顺序为：黑桃>红桃>梅花>方块
5）一对大王>一对小王>杂王
</size>
<size=32><color=#004f3c>四、结算规则</color></size>
<size=28>
4.1 算分公式
1）玩家分数=±底分*倍数
2）底分选项：1分、2分、4分
3）玩家为胜利方时，赢得对应分数；玩家为失败方时，付出对应分数

4.2 独牌模式
1）独牌模式下，独牌玩家先出完牌，则独牌玩家胜利，其他任意1名玩家先出完牌，则非独牌玩家胜利
2）独牌算分倍数：4倍

4.3 找朋友胜负模式
1）当玩家为一游、二游队伍时，获得胜利，对方有捡分则赢得2倍底分，对方没捡分则赢得4倍底分
2）当玩家为一游、三游队伍时，若二游玩家捡分少于105分，则获得胜利，倍数为1倍；若二游玩家没拿分，则底分倍数为4倍
3）当玩家为一游、三游队伍时，若二游玩家捡分大于等于105分，则二游玩家所在队伍胜利，底分倍数为1倍
4）当玩家为一游、四游队伍时，若捡分大于等于100分，则一游玩家队伍胜利，捡分200分时底分倍数为4倍，捡分不到200时底分倍数为1倍
5）当玩家为一游、四游队伍时，若捡分小于100分，则二游玩家队伍胜利，底分倍数为1倍，若一游、四游捡分为0分，【大冶玩法】中底分倍数为4倍，【黄石玩法】底分倍数为2倍

4.4 游戏提前结束
1）当二游玩家得分大于等于105分，且对方有拿分，则二游队伍胜利，该局游戏立即结束，底分倍数为1倍
2）当一游队伍合计得分大于等于100分，且对方二游有拿分，则一游队伍胜利，该局游戏立即结束，底分倍数为1倍
</size>
<size=32><color=#004f3c>五、接风规则</color></size>
<size=28>
1）已经确定了队友关系（叫牌被打出），则由最后一手牌玩家的队友进行下一轮首发出牌
2）未确定队友关系（叫牌未被打出），则由最后一手牌玩家逆时针的下一位玩家出牌
</size>
    ]],
    [[
<size=32><color=#004f3c>一、基础规则</color></size>
<size=28>
1）需要4人才可进行游戏
2）使用2副牌，共108张
3）每个玩家27张牌
</size>
<size=32><color=#004f3c>二、庄家规则</color></size>
<size=28>
1）第1局房主当庄
2）后续由上一局的一游玩家当庄
</size>
<size=32><color=#004f3c>三、牌型规则</color></size>
<size=28>
3.1 牌型介绍
1）单张：任意1张单牌
2）炸弹：任意3张或3张以上，且点数相同的牌
3）顺子：相邻的3张或3张以上的牌，例如：678，【2】不能当做顺子组成
4）连对：相邻的3对或3对以上的牌，例如：667788，【2】不能当做连对组成
5）杂五十K炸弹：花色不同的单张5+单张10+单张K
6）正五十K炸弹：花色相同的单张5+单张10+单张K
7）王炸：2张或2张以上的大小王

3.2 普通牌型大小规则
1）只有在牌型和张数一致时才可以比较大小
2）单张牌面大小：大王>小王>2>A>K>Q>J>10>9>8>7>6>5>4>3
3）连对：比较最大一组对牌的牌面点数
4）顺子：比较最大一张牌的牌面点数

3.3 炸弹牌型大小规则
1）3条<4条<5条<6条<7条<8条<杂510K<正510K<对王（杂王）<3王<4王
2）普通炸弹张数相同时，按牌面点数比较大小
3）杂五十K炸弹按先出的为大
4）正五十K炸弹按花色比较大小，花色顺序为：黑桃>红桃>梅花>方块
5）一对大王>一对小王>杂王
</size>
<size=32><color=#004f3c>四、结算规则</color></size>
<size=28>
4.1 算分公式
1）玩家分数=±底分*倍数
2）底分选项：1分、2分、4分
3）玩家为胜利方时，赢得对应分数；玩家为失败方时，付出对应分数

4.2 独牌模式
1）独牌模式下，独牌玩家先出完牌，则独牌玩家胜利，其他任意1名玩家先出完牌，则非独牌玩家胜利
2）独牌算分倍数：4倍

4.3 找朋友胜负模式
1）当玩家为一游、二游队伍时，获得胜利，对方有捡分则赢得2倍底分，对方没捡分则赢得4倍底分
2）当玩家为一游、三游队伍时，若二游玩家捡分少于105分，则获得胜利，倍数为1倍；若二游玩家没拿分，则底分倍数为4倍
3）当玩家为一游、三游队伍时，若二游玩家捡分大于等于105分，则二游玩家所在队伍胜利，底分倍数为1倍
4）当玩家为一游、四游队伍时，若捡分大于等于100分，则一游玩家队伍胜利，捡分200分时底分倍数为4倍，捡分不到200时底分倍数为1倍
5）当玩家为一游、四游队伍时，若捡分小于100分，则二游玩家队伍胜利，底分倍数为1倍，若一游、四游捡分为0分，底分倍数为4倍

4.4 游戏提前结束
1）当二游玩家得分大于等于105分，且对方有拿分，则二游队伍胜利，该局游戏立即结束，底分倍数为1倍
2）当一游队伍合计得分大于等于100分，且对方二游有拿分，则一游队伍胜利，该局游戏立即结束，底分倍数为1倍
</size>
<size=32><color=#004f3c>五、接风规则</color></size>
<size=28>
1）已经确定了队友关系（叫牌被打出），则由最后一手牌玩家的队友进行下一轮首发出牌
2）未确定队友关系（叫牌未被打出），则由最后一手牌玩家逆时针的下一位玩家出牌
</size>
    ]],
    [[
<size=32><color=#004f3c>一、基础规则</color></size>
<size=28>
1）需要4人才可进行游戏
2）使用2副牌，共108张
3）每个玩家27张牌
</size>
<size=32><color=#004f3c>二、庄家规则</color></size>
<size=28>
1）第1局房主当庄
2）后续由上一局的一游玩家当庄
</size>
<size=32><color=#004f3c>三、牌型规则</color></size>
<size=28>
3.1 牌型介绍
1）单张：任意1张单牌
2）炸弹：任意3张或3张以上，且点数相同的牌
3）顺子：相邻的3张或3张以上的牌，例如：678，【2】不能当做顺子组成
4）连对：相邻的3对或3对以上的牌，例如：667788，【2】不能当做连对组成
5）杂五十K炸弹：花色不同的单张5+单张10+单张K
6）正五十K炸弹：花色相同的单张5+单张10+单张K
7）王炸：2张或2张以上的大小王

3.2 普通牌型大小规则
1）只有在牌型和张数一致时才可以比较大小
2）单张牌面大小：大王>小王>2>A>K>Q>J>10>9>8>7>6>5>4>3
3）连对：比较最大一组对牌的牌面点数
4）顺子：比较最大一张牌的牌面点数

3.3 炸弹牌型大小规则
1）3条<4条<5条<6条<7条<8条<杂510K<正510K<对王（杂王）<3王<4王
2）普通炸弹张数相同时，按牌面点数比较大小
3）杂五十K炸弹按先出的为大
4）正五十K炸弹按花色比较大小，花色顺序为：黑桃>红桃>梅花>方块
5）一对大王>一对小王>杂王
</size>
<size=32><color=#004f3c>四、结算规则</color></size>
<size=28>
4.1 算分公式
1）玩家分数=±底分*倍数
2）底分选项：1分、2分、4分
3）玩家为胜利方时，赢得对应分数；玩家为失败方时，付出对应分数

4.2 独牌模式
1）独牌模式下，独牌玩家先出完牌，则独牌玩家胜利，其他任意1名玩家先出完牌，则非独牌玩家胜利
2）独牌算分倍数：4倍

4.3 找朋友胜负模式
1）当玩家为一游、二游队伍时，获得胜利，对方有捡分则赢得2倍底分，对方没捡分则赢得4倍底分
2）当玩家为一游、三游队伍时，若二游玩家捡分少于105分，则获得胜利，倍数为1倍；若二游玩家没拿分，则底分倍数为4倍
3）当玩家为一游、三游队伍时，若二游玩家捡分大于等于105分，则二游玩家所在队伍胜利，底分倍数为1倍
4）当玩家为一游、四游队伍时，若捡分大于等于100分，则一游玩家队伍胜利，捡分200分时底分倍数为4倍，捡分不到200时底分倍数为1倍
5）当玩家为一游、四游队伍时，若捡分小于100分，则二游玩家队伍胜利，底分倍数为1倍，若一游、四游捡分为0分，底分倍数为4倍

4.4 游戏提前结束
1）当二游玩家得分大于等于105分，且对方有拿分，则二游队伍胜利，该局游戏立即结束，底分倍数为1倍
2）当一游队伍合计得分大于等于100分，且对方二游有拿分，则一游队伍胜利，该局游戏立即结束，底分倍数为1倍
</size>
<size=32><color=#004f3c>五、接风规则</color></size>
<size=28>
1）已经确定了队友关系（叫牌被打出），则由最后一手牌玩家的队友进行下一轮首发出牌
2）未确定队友关系（叫牌未被打出），则由最后一手牌玩家逆时针的下一位玩家出牌
</size>
    ]],
}

return ConfigChild
