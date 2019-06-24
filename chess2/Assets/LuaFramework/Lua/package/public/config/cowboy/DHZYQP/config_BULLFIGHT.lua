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
            tag = {togglesTile = "倍率:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"isBigBet\":0",toggleType = 1,toggleTitle = "小倍场(2-5)",toggleIsOn = true},
                    {disable = false,json = "\"isBigBet\":1",toggleType = 1,toggleTitle = "大倍场(3-8)",toggleIsOn = false},
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
            tag = {togglesTile = "翻倍:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ruleType\":1",toggleType = 2,toggleTitle = "一条龙*8/炸弹*7/五小牛*6/金牛*5/银牛*4",toggleIsOn = true,inverseJson = "\"ruleType\":0"},
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
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price7(roundCount, playerCount, payType, bankerType)
        end,
        configJson = "{\"bankerType\":0,\"name\":\"DouNiu\",\"playerCount\":6,\"HallID\":0,\"GameType\":0,"
    },
    { --随机坐庄
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
            tag = {togglesTile = "倍率:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"isBigBet\":0",toggleType = 1,toggleTitle = "小倍场(2-5)",toggleIsOn = true},
                    {disable = false,json = "\"isBigBet\":1",toggleType = 1,toggleTitle = "大倍场(3-8)",toggleIsOn = false},
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
            tag = {togglesTile = "翻倍:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ruleType\":1",toggleType = 2,toggleTitle = "一条龙*8/炸弹*7/五小牛*6/金牛*5/银牛*4",toggleIsOn = true,inverseJson = "\"ruleType\":0"},
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
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price7(roundCount, playerCount, payType, bankerType)
        end,
        configJson = "{\"bankerType\":1,\"name\":\"DouNiu\",\"playerCount\":6,\"HallID\":0,\"GameType\":1,"
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
            tag = {togglesTile = "倍率:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"isBigBet\":0",toggleType = 1,toggleTitle = "小倍场(2-5)",toggleIsOn = true, addJson='"xiaZhuScore_2":true,"xiaZhuScore_3":true,"xiaZhuScore_4":true,"xiaZhuScore_5":true'},
                    {disable = false,json = "\"isBigBet\":1",toggleType = 1,toggleTitle = "大倍场(3-10)",toggleIsOn = false, addJson='"xiaZhuScore_3":true,"xiaZhuScore_4":true,"xiaZhuScore_5":true,"xiaZhuScore_10":true'},
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
            tag = {togglesTile = "翻倍:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ruleType\":1",toggleType = 2,toggleTitle = "一条龙*8/炸弹*7/五小牛*6/金牛*5/银牛*4",toggleIsOn = true,inverseJson = "\"ruleType\":0", addJson='"yiTiaoLong_beiShu":8,"siZha_beiShu":7,"wuXiaoNiu_beiShu":6,"jinNiu_beiShu":5,"yinNiu_beiShu":4'},
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
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price7(roundCount, playerCount, payType, bankerType)
        end,
        configJson = '{"bankerType":2,"name":"DouNiu","playerCount":6,"HallID":0,"GameType":2,"kanPaiCount":4,"qiangZhuangScore_1":true,"isGuangDongMode":true,"niu7_beiShu":2,"niu8_beiShu":2,"niu9_beiShu":2,"niu10_beiShu":3,',
    },
    { --炸金牛
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
            tag = {togglesTile = "上限:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"maxBetScore\":6",toggleType = 1,toggleTitle = "6",toggleIsOn = true},
                    {disable = false,json = "\"maxBetScore\":10",toggleType = 1,toggleTitle = "10",toggleIsOn = false},
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
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price7(roundCount, playerCount, payType, bankerType)
        end,
        configJson = "{\"name\":\"ZhaJinNiu\",\"playerCount\":6,\"HallID\":0,\"GameType\":3,"
    },
}

ConfigChild.HowToPlayTexts =
{
    [[<size=32><color=#004f3c>一、定庄</color></size>
    <size=28><color=#7c5608>
    从房主开始轮流坐庄
    </color></size>
    <size=32><color=#004f3c>二、基本玩法</color></size>
    <size=28><color=#7c5608>
    ①游戏可以由2人到6人同时进行，总共52张牌（除大小王）。
    进入游戏，玩家准备后，房主按开始按钮，定庄，玩家选择加倍数量
    ，开始正常游戏发牌流程。
    ②玩家每人发5张牌，根据5张牌进行排列组合，并由每个闲家和庄家
    进行比大小确定胜负。
    ③切记是庄家和每个闲家来比牌大小，并进行结算，闲家与闲家之间
    没有比牌关系。
    </color></size>
    <size=32><color=#004f3c>三、牌型比较</color></size>
    <size=28><color=#7c5608>
    ①玩家把5张牌分为2组后，需要各自和庄家进行大小比较。
    ②第一组3张牌的比较规则：要求玩家必须拿且只拿3张牌组成10，20
    ，30的整数（加法运算）。数字A-10的代表数字1-10，JQK统一代
    表数字10，若庄家和闲家中有三张牌凑成10或20或30的整数，称之有
    牛，那么进行第2组两张牌的大小比较。若庄家或闲家有某人无法使
    用3张牌凑成10的倍数，我们称之为没牛。
    ③第二组牌的比较则把剩下的两张牌按照加法计算，10的整数倍最大
    ，1最小，若大于10小于20则取个位计算。数字越大则牌型越大，数
    字越小，则牌型越小。若第2组牌数字为1，我们称之为牛丁，若第2
    组数字为10或20我们称之为牛牛，其他以牛二，牛三…..等等名称称
    呼。牌型从小到达排序为:一条龙>炸弹>五小牛>金牛>银牛>牛牛>
    牛九>牛八>...>牛一。
    ④若庄家和闲家都没有牛，则进行5张牌中最大的一张来比较，大小
    次序依次为K>Q>J>10>9...>A,若最大一张牌也相同，则根据花色进
    行比较，大小次序依次为黑桃>红桃>梅花>方片。
    </color></size>
    <size=32><color=#004f3c>四、牌型及倍数</color></size>
    <size=28><color=#7c5608>
    一条龙：固定为12345(不是任意连续的五张)（8倍）。
    炸弹：拥有4张相同字数的牌（7倍）。
    五小牛：总和<=10（6倍）。
    金牛：五张牌全为JQK（5倍）。
    银牛：五张牌都>=10（4倍）。
    牛牛：五张牌之和是10的倍数（3倍）。
    牛七-牛九：三张牌之和是10的倍数（2倍）。
    牛一-牛六：三张牌之和是10的倍数（1倍）。
    </color></size>
    <size=32><color=#004f3c>五、计分</color></size>
    <size=28><color=#7c5608>
    底分：以上两种定庄模式，底分都固定是1分。
    闲家倍数：闲家在开始发牌的时候选择倍数。
    牌型倍数：根据各自的牌型所得到的倍数，参看牌型及倍数。
    设底分为A，闲家倍数为B，牌型倍数为C，那么最终赢家得分为A*
    B*C。
    比如：底分固定为1，闲家倍数10倍，若闲家牛牛，庄家牛
    </color></size>
    <size=32><color=#004f3c>六、闲家</color></size>
    <size=28><color=#7c5608>
    与庄家比对，闲家赢1*10*3=30分。
    </color></size>
    ]],
    [[<size=32><color=#004f3c>一、定庄</color></size>
    <size=28><color=#7c5608>
    从第一把开始随机指定玩家为庄
    </color></size>
    <size=32><color=#004f3c>二、基本玩法</color></size>
    <size=28><color=#7c5608>
    ①游戏可以由2人到6人同时进行，总共52张牌（除大小王）。
    进入游戏，玩家准备后，房主按开始按钮，定庄，玩家选择加倍数量
    ，开始正常游戏发牌流程。
    ②玩家每人发5张牌，根据5张牌进行排列组合，并由每个闲家和庄家
    进行比大小确定胜负。
    ③切记是庄家和每个闲家来比牌大小，并进行结算，闲家与闲家之间
    没有比牌关系。
    </color></size>
    <size=32><color=#004f3c>三、牌型比较</color></size>
    <size=28><color=#7c5608>
    ①玩家把5张牌分为2组后，需要各自和庄家进行大小比较。
    ②第一组3张牌的比较规则：要求玩家必须拿且只拿3张牌组成10，20
    ，30的整数（加法运算）。数字A-10的代表数字1-10，JQK统一代
    表数字10，若庄家和闲家中有三张牌凑成10或20或30的整数，称之有
    牛，那么进行第2组两张牌的大小比较。若庄家或闲家有某人无法使
    用3张牌凑成10的倍数，我们称之为没牛。
    ③第二组牌的比较则把剩下的两张牌按照加法计算，10的整数倍最大
    ，1最小，若大于10小于20则取个位计算。数字越大则牌型越大，数
    字越小，则牌型越小。若第2组牌数字为1，我们称之为牛丁，若第2
    组数字为10或20我们称之为牛牛，其他以牛二，牛三…..等等名称称
    呼。牌型从小到达排序为:一条龙>炸弹>五小牛>金牛>银牛>牛牛>
    牛九>牛八>...>牛一。
    ④若庄家和闲家都没有牛，则进行5张牌中最大的一张来比较，大小
    次序依次为K>Q>J>10>9...>A,若最大一张牌也相同，则根据花色进
    行比较，大小次序依次为黑桃>红桃>梅花>方片。
    </color></size>
    <size=32><color=#004f3c>四、牌型及倍数</color></size>
    <size=28><color=#7c5608>
    一条龙：固定为12345(不是任意连续的五张)（8倍）。
    炸弹：拥有4张相同字数的牌（7倍）。
    五小牛：总和<=10（6倍）。
    金牛：五张牌全为JQK（5倍）。
    银牛：五张牌都>=10（4倍）。
    牛牛：五张牌之和是10的倍数（3倍）。
    牛七-牛九：三张牌之和是10的倍数（2倍）。
    牛一-牛六：三张牌之和是10的倍数（1倍）。
    </color></size>
    <size=32><color=#004f3c>五、计分</color></size>
    <size=28><color=#7c5608>
    底分：以上两种定庄模式，底分都固定是1分。
    闲家倍数：闲家在开始发牌的时候选择倍数。
    牌型倍数：根据各自的牌型所得到的倍数，参看牌型及倍数。
    设底分为A，闲家倍数为B，牌型倍数为C，那么最终赢家得分为A*
    B*C。
    比如：底分固定为1，闲家倍数10倍，若闲家牛牛，庄家牛
    </color></size>
    <size=32><color=#004f3c>六、闲家</color></size>
    <size=28><color=#7c5608>
    与庄家比对，闲家赢1*10*3=30分。
    </color></size>
    ]],
    [[<size=32><color=#004f3c>一、定庄</color></size>
    <size=28><color=#7c5608>
    游戏开始后，系统给每位玩家发5张牌，4张翻开自己可以看到，一张
    盖着，玩家可根据自己的牌决定是否抢庄，选择“不抢”或“抢庄”
    ，若所有玩家都放弃抢庄，则系统随机选择一个玩家坐庄，选择抢庄
    的玩家，系统随机分配庄家，若玩家不选择，则10秒超时后视为放弃
    抢庄。
    </color></size>
    <size=32><color=#004f3c>二、基本玩法</color></size>
    <size=28><color=#7c5608>
    ①游戏可以由2人到6人同时进行，总共52张牌（除大小王）。
    进入游戏，玩家准备后，房主按开始按钮，定庄，玩家选择加倍数量
    ，开始正常游戏发牌流程。
    ②玩家每人发5张牌，根据5张牌进行排列组合，并由每个闲家和庄家
    进行比大小确定胜负。
    ③切记是庄家和每个闲家来比牌大小，并进行结算，闲家与闲家之间
    没有比牌关系。
    </color></size>
    <size=32><color=#004f3c>三、牌型比较</color></size>
    <size=28><color=#7c5608>
    ①玩家把5张牌分为2组后，需要各自和庄家进行大小比较。
    ②第一组3张牌的比较规则：要求玩家必须拿且只拿3张牌组成10，20
    ，30的整数（加法运算）。数字A-10的代表数字1-10，JQK统一代
    表数字10，若庄家和闲家中有三张牌凑成10或20或30的整数，称之有
    牛，那么进行第2组两张牌的大小比较。若庄家或闲家有某人无法使
    用3张牌凑成10的倍数，我们称之为没牛。
    ③第二组牌的比较则把剩下的两张牌按照加法计算，10的整数倍最大
    ，1最小，若大于10小于20则取个位计算。数字越大则牌型越大，数
    字越小，则牌型越小。若第2组牌数字为1，我们称之为牛丁，若第2
    组数字为10或20我们称之为牛牛，其他以牛二，牛三…..等等名称称
    呼。牌型从小到达排序为:一条龙>炸弹>五小牛>金牛>银牛>牛牛>
    牛九>牛八>...>牛一。
    ④若庄家和闲家都没有牛，则进行5张牌中最大的一张来比较，大小
    次序依次为K>Q>J>10>9...>A,若最大一张牌也相同，则根据花色进
    行比较，大小次序依次为黑桃>红桃>梅花>方片。
    </color></size>
    <size=32><color=#004f3c>四、牌型及倍数</color></size>
    <size=28><color=#7c5608>
    一条龙：固定为12345(不是任意连续的五张)（8倍）。
    炸弹：拥有4张相同字数的牌（7倍）。
    五小牛：总和<=10（6倍）。
    金牛：五张牌全为JQK（5倍）。
    银牛：五张牌都>=10（4倍）。
    牛牛：五张牌之和是10的倍数（3倍）。
    牛七-牛九：三张牌之和是10的倍数（2倍）。
    牛一-牛六：三张牌之和是10的倍数（1倍）。
    </color></size>
    <size=32><color=#004f3c>五、计分</color></size>
    <size=28><color=#7c5608>
    底分：以上两种定庄模式，底分都固定是1分。
    闲家倍数：闲家在开始发牌的时候选择倍数。
    牌型倍数：根据各自的牌型所得到的倍数，参看牌型及倍数。
    设底分为A，闲家倍数为B，牌型倍数为C，那么最终赢家得分为A*
    B*C。
    </color></size>
    ]],
    [[<size=28><color=#7c5608>
    ①弃牌：轮到当前玩家，可选择弃牌，放弃本局游戏，翻开自己的牌，其它玩家不能看到，其他人弃牌，当前玩家无法看到其他人的牌；

    ②比牌：选择比牌后，玩家可选择与本局中的任意一名玩家比牌。比牌时下注为跟注的1倍；比牌后，获胜的玩家继续游戏，失利的玩家结束游戏；

    ③看牌：开始时玩家是暗牌，选择看牌后暗牌变为明牌。看牌后下注自动翻倍，是暗牌的2倍；

    ④跟注：上一个玩家下注后，下一个玩家下注与上家相同，即为跟注，玩家点击跟注后，按钮变为“跟到底”可选框，勾选后系统默认玩家选择跟注，直到本局游戏结束，过程中再次点击可取消跟注；

    ⑤加注：上一个玩家下注后，下家可选择高于上家的筹码，不能高于当前房间的加注上限；

    ⑥更多：玩家加注时可选择更多，加注不能高于当前房间的加注上限。</color></size>]],
}

return ConfigChild
