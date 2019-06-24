



local ConfigChild = {}

ConfigChild.createRoomTable =
{
    {--自由下注
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":10",toggleType = 1,toggleTitle = "10局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":20",toggleType = 1,toggleTitle = "20局",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "设置:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"allowHalfEnter\":true",toggleType = 2,toggleTitle = "允许中途加入",toggleIsOn = true},
                    {disable = false,json = "\"manualShow\":1",toggleType = 2,toggleTitle = "带搓牌",toggleIsOn = true},
                    {disable = false,json = "\"enableForceReady\":true",toggleType = 2,toggleTitle = "自动准备",toggleIsOn = true},
                    {disable = false,json = "\"autoDelegateOnOffline\":true",toggleType = 2,toggleTitle = "带托管",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"disableLittleTriple\":false",toggleType = 2,toggleTitle = "带小三公",toggleIsOn = true},
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
                    {disable = false,json = "\"payType\":1",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false,clickTip="扣除钻石数以牌局结算人数为准。"},
                    {disable = false,json = "\"payType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false,clickTip="扣除钻石数以牌局结算人数为准。"},
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price_sangong(roundCount, playerCount, payType, bankerType)
        end,
        configJson = "{\"playerCount\":6,\"game_type\":1,\"is_multiple\":false,"
    },

    {--自由抢庄
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":10",toggleType = 1,toggleTitle = "10局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":20",toggleType = 1,toggleTitle = "20局",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "设置:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"allowHalfEnter\":true",toggleType = 2,toggleTitle = "允许中途加入",toggleIsOn = true},
                    {disable = false,json = "\"manualShow\":1",toggleType = 2,toggleTitle = "带搓牌",toggleIsOn = true},
                    {disable = false,json = "\"enableForceReady\":true",toggleType = 2,toggleTitle = "自动准备",toggleIsOn = true},
                    {disable = false,json = "\"autoDelegateOnOffline\":true",toggleType = 2,toggleTitle = "带托管",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"disableLittleTriple\":false",toggleType = 2,toggleTitle = "带小三公",toggleIsOn = true,clickSmallShow = "4_1"},
                    {disable = false,json = "\"is_multiple\":false",toggleType = 2,toggleTitle = "无牌型倍数",toggleIsOn = false,clickBigShow = "4_1"},
                },
            }
        },
        {
            tag = {togglesTile = "底分:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"baseScore\":1",toggleType = 1,toggleTitle = "1分",toggleIsOn = true},
                    {disable = false,json = "\"baseScore\":2",toggleType = 1,toggleTitle = "2分",toggleIsOn = false},
                    {disable = false,json = "\"baseScore\":4",toggleType = 1,toggleTitle = "4分",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "倍数:",rowNum = 3, bigShow = "4_1",bigShowType = 2 },
            list =
            {
                {
                    {disable = true,json = "multiple_8",toggleType = 2,toggleTitle = "八点",toggleIsOn = true,dropDown = "1,2", dropDefault = 1},
                    {disable = true,json = "multiple_9",toggleType = 2,toggleTitle = "九点",toggleIsOn = true,dropDown = "1,2,3", dropDefault = 2},
                    {disable = true,json = "multiple_triple",toggleType = 2,toggleTitle = "三公",toggleIsOn = true,dropDown = "2,3,4", dropDefault = 2},
                    {disable = true,json = "multiple_triple_3",toggleType = 2,toggleTitle = "三张三",toggleIsOn = true,dropDown = "8,9,10", dropDefault = 2},
                },
            }
        },
        {
            tag = {togglesTile = "牌型:",rowNum = 3,bigShow = "4_1",bigShowType = 2 },
            list =
            {
                {
                    {disable = false,json = "multiple_triple_mix",toggleType = 2,toggleTitle = "混三公",toggleIsOn = false,dropDown = "3,4,5", dropDefault = 2},
                    {disable = false,json = "multiple_triple_little",toggleType = 2,toggleTitle = "小三公",toggleIsOn = false,dropDown = "4,5,6", dropDefault = 2,smallShow = "4_1",smallShowType = 1},
                    {disable = false,json = "multiple_triple_big",toggleType = 2,toggleTitle = "大三公",toggleIsOn = false,dropDown = "5,6,7", dropDefault = 2},
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
                    {disable = false,json = "\"payType\":1",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false,clickTip="扣除钻石数以牌局结算人数为准。"},
                    {disable = false,json = "\"payType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false,clickTip="扣除钻石数以牌局结算人数为准。"},
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price_sangong(roundCount, playerCount, payType, bankerType)
        end,
        configJson = "{\"playerCount\":6,\"game_type\":2,"
    }
}

ConfigChild.HowToPlayTexts =
{
    [[<size=32><color=#004f3c>一.扑克数量</color></size>
<size=28>
1） 扑克牌一副，不算大小王，从“A~K”13种牌各4种花色，共计52
    张;
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1） “A~9”为点数牌，对应1-9点;
2） “10、J、Q、K”为数字牌，点数为0点;
3） “J、Q、K”为公牌;
4） 游戏人数:2~6人;
</size>
<size=32><color=#004f3c>三.名词解释</color></size>
<size=28>
1） 庄家:无庄家;
2） 闲家:无闲家;
3） 亮牌:玩家将手上的牌面公示给其他玩家;
4） 比牌:所有玩家统一比牌;
5） 结算:玩家按牌面大小依次进分（下多少注赢多少分），直到总
    下注数为零;
6） 公牌:J、Q、K 三种牌面的牌，共计3x4=12 张，被称为公牌。平
    时按10计算;
7） 筹码:游戏中代表积分，在游戏中用作投注的替代品，下注的筹
    码可自由选择;
</size>
<size=32><color=#004f3c>四.牌型</color></size>
<size=28>
1） 基本牌:三张牌点数相加，尾数点数小于或等于7 的牌型为基本
    牌型;
2） 八点牌:三张牌相加点数为8 时。例如:10 2 6;
3） 九点牌:三张牌相加点数为9 时。例如:10 2 7;
4） 混三公:当出现三张公牌时。例如:JQK JJQ;
5） 小三公:当出现三张相同的牌型时。例如:222 444 555;
    ◆ 当创建房间未勾选“带小三公”玩法时，牌局内将没有小三公牌
       牌型，原小三公算作基本牌，即222为6点、444为2点
6） 大三公: KKK QQQ JJJ;
7） 三张三:当出现3 张3 时，既为三公游戏中最大赔率的牌型;
8） 牌型大小:
    ◆ 有小三公牌型：三张3＞大三公＞小三公＞混三公＞9点牌型＞8点
       牌型＞7点牌型＞6点牌型＞5点牌型＞4点牌型＞3点牌型＞2点牌
       型＞1点牌型＞0点牌型;
    ◆ 没有小三公牌型：三张3＞大三公＞混三公＞9点牌型＞8点牌型＞
       7点牌型＞6点牌型＞5点牌型＞4点牌型＞3点牌型＞2点牌型＞1点
       牌型＞0点牌型;
</size>]],
    [[<size=32><color=#004f3c>一.扑克数量</color></size>
<size=28>
1） 扑克牌一副，不算大小王，从“A~K”13种牌各4种花色，共计52
    张;
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1） “A~9”为点数牌，对应1-9点;
2） “10、J、Q、K”为数字牌，点数为0点;
3） “J、Q、K”为公牌;
4） 游戏人数:2~6人;
</size>
<size=32><color=#004f3c>三.名词解释</color></size>
<size=28>
1） 庄家:负责赔付和收取游戏币的玩家;
2） 闲家:与庄家比牌大小的玩家，需要投注;
3） 亮牌:玩家将手上的牌面公示给其他玩家;
4） 比牌:庄家跟闲家一一比较牌型大小;
5） 结算:闲家与庄家一一结算，根据闲家的下注筹码及双方牌型计算
    输赢积分;
6） 公牌:J、Q、K 三种牌面的牌，共计3x4=12 张，被称为公牌。平
    时按10计算;
7） 筹码:游戏中代表积分，在游戏中用作投注的替代品，下注的筹
    码可自由选择;
8） 抢庄:游戏开始后开始抢庄，点过抢庄的人有机会成为庄家，玩
    家点抢庄后，系统会在所有点抢庄的玩家中随机选择玩家为庄;
统会在所有点抢庄的玩家中随机选择玩家为庄
</size>
<size=32><color=#004f3c>四.牌型</color></size>
<size=28>
1） 基本牌:三张牌点数相加，尾数点数小于或等于7 的牌型为基本
    牌型;
2） 八点牌:三张牌相加点数为8 时。例如:10 2 6;
3） 九点牌:三张牌相加点数为9 时。例如:10 2 7;
4） 混三公:当出现三张公牌时。例如:JQK JJQ;
5） 小三公:当出现三张相同的牌型时。例如:222 444 555;
    ◆ 当创建房间未勾选“带小三公”玩法时，牌局内将没有小三公牌
       牌型，原小三公算作基本牌，即222为6点、444为2点
6） 大三公: KKK QQQ JJJ;
7） 三张三:当出现3 张3 时，既为三公游戏中最大赔率的牌型;
8） 牌型大小:
5） 小三公:当出现三张相同的牌型时。例如:222 444 555;
    ◆ 当创建房间未勾选“带小三公”玩法时，牌局内将没有小三公牌
       牌型，原小三公算作基本牌，即222为6点、444为2点
6） 大三公: KKK QQQ JJJ;
7） 三张三:当出现3 张3 时，既为三公游戏中最大赔率的牌型;
8） 牌型大小:
    ◆ 有小三公牌型：三张3＞大三公＞小三公＞混三公＞9点牌型＞8点
       牌型＞7点牌型＞6点牌型＞5点牌型＞4点牌型＞3点牌型＞2点牌
       型＞1点牌型＞0点牌型;
    ◆ 没有小三公牌型：三张3＞大三公＞混三公＞9点牌型＞8点牌型＞
       7点牌型＞6点牌型＞5点牌型＞4点牌型＞3点牌型＞2点牌型＞1点
       牌型＞0点牌型;
</size>]]
}

return ConfigChild;