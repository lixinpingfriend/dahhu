local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --团团转掼蛋
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":4",toggleType = 1,toggleTitle = "4局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":6",toggleType = 1,toggleTitle = "6局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":12",toggleType = 1,toggleTitle = "12局",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "翻倍:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"doubleType_fourBoss\":true",toggleType = 2,toggleTitle = "四个王",toggleIsOn = true},
                    {disable = false,json = "\"doubleType_6BombOrAbove\":true",toggleType = 2,toggleTitle = "六炸及以上",toggleIsOn = false},
                    {disable = false,json = "\"doubleType_flushStraight\":true",toggleType = 2,toggleTitle = "同花顺",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "算倍:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"calcMethod\":1",toggleType = 1,toggleTitle = "只计算胜方",toggleIsOn = true},
                    {disable = false,json = "\"calcMethod\":2",toggleType = 1,toggleTitle = "计算所有人",toggleIsOn = false},
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
                    {disable = false,json = "\"payType\":0",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"payType\":1",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false,clickTip = "扣除钻石数以牌局结算人数为准"},
                    {disable = false,json = "\"payType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price5(roundCount, playerCount, payType, bankerType)
        end,
        configJson = "{\"gameType\":0,\"playingMethod\":2,\"playerCount\":4,\"HallID\":0,\"GameType\":0,"
    },
    { --传统掼蛋
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":4",toggleType = 1,toggleTitle = "4局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":6",toggleType = 1,toggleTitle = "6局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":12",toggleType = 1,toggleTitle = "12局",toggleIsOn = false},
                },
            }
        },
        -- {
        --     tag = {togglesTile = "玩法:",rowNum = 3},
        --     list =
        --     {
        --         {
        --             {disable = false,json = "\"playingMethod\":false",toggleType = 1,toggleTitle = "传统玩法",toggleIsOn = true},
        --             {disable = false,json = "\"playingMethod\":true",toggleType = 1,toggleTitle = "团团转",toggleIsOn = false,clickBigShow = "2_2"},
        --         }
        --     }
        -- },
        {
            tag = {togglesTile = "进贡:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"tribute\":1",toggleType = 1,toggleTitle = "是",toggleIsOn = true},
                    {disable = false,json = "\"tribute\":0",toggleType = 1,toggleTitle = "否",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "翻倍:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"doubleType_fourBoss\":true",toggleType = 2,toggleTitle = "四个王",toggleIsOn = true},
                    {disable = false,json = "\"doubleType_6BombOrAbove\":true",toggleType = 2,toggleTitle = "六炸及以上",toggleIsOn = false},
                    {disable = false,json = "\"doubleType_flushStraight\":true",toggleType = 2,toggleTitle = "同花顺",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "算倍:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"calcMethod\":1",toggleType = 1,toggleTitle = "只计算胜方",toggleIsOn = true},
                    {disable = false,json = "\"calcMethod\":2",toggleType = 1,toggleTitle = "计算所有人",toggleIsOn = false},
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
                -- {
                --     {disable = false,json = "\"payType\":0",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                --     {disable = false,json = "\"payType\":1",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false,clickTip = "扣除钻石数以牌局结算人数为准"},
                --     {disable = false,json = "\"payType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                -- },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price5(roundCount, playerCount, payType, bankerType)
        end,
        configJson = "{\"gameType\":1,\"playingMethod\":1,\"playerCount\":4,\"HallID\":0,\"GameType\":1,"
    },
}

ConfigChild.HowToPlayTexts =
{
    [[<size=32><color=#004f3c>一.牌型解释</color></size>
    <size=28>
    1）主牌:左上角主牌显示板上显示的点数;
    2）逢人配:主牌中的两张红桃，可以任意配除鬼牌之外的任何牌;
    3）四王:由四个王组成，是游戏里最大的炸弹;
    4）同花顺:同花顺的顺子，最大的是10-J-Q-K-A，最小的是A-2-3-4-5;
    5）飞机:只能是2个的连续三张;
    6）单张:1张牌;
    7）对子:2张相同的点数;
    8）三张:3张相同的点数;
    9）三张加对子;
    10）三联对:只能是3个连续的对子，不包括双王，不分花色;
    </size>
    <size=32><color=#004f3c>二.大小比较</color></size>
    <size=28>
    1）牌点大小顺序:
     ◆ 大王＞小王＞A＞K＞Q＞J＞10＞9＞8＞7＞6＞5＞4＞3＞2;
    2）牌型大小顺序:
     ◆ 四王＞8炸＞7炸＞6炸＞同花顺＞5炸＞4炸＞其它牌型;
    3）同种牌型大小比较:
     ◆ 顺子:比较最大的那张牌点数;
     ◆ 三张:比较三张的点数大小;
     ◆ 三带二:比较三张的点数大小;
     ◆ 三连对:比较最大的那一对点数大小;
    </size>
    <size=32><color=#004f3c>三.出牌排名</color></size>
    <size=28>
    1）头游:第一个出完手牌的玩家;
    2）二游:第二个出完手牌的玩家;
    3）三游:第三个出完手牌的玩家;
    4）四游:没有打完手牌的玩家;
    </size>
    <size=32><color=#004f3c>四.出牌</color></size>
    <size=28>
    1）谁抓到明牌谁先出牌;
    2）出现双下情况时，直接进入结算，无需决出三游;
    </size>
    <size=32><color=#004f3c>五.升级</color></size>
    <size=28>
    1）无升级，每一局都打2;
    </size>
    <size=32><color=#004f3c>六.加分</color></size>
    <size=28>
    1）头游和二游是同一队时:加3分;
    2）头游和三游是同一队时:加2分;
    3）头游和末游是同一队时:加1分;
    </size>
    ]],
    [[<size=32><color=#004f3c>一.牌型解释</color></size>
  <size=28>
  1）主牌:左上角主牌显示板上显示的点数;
  2）逢人配:主牌中的两张红桃，可以任意配除鬼牌之外的任何牌;
  3）四王:由四个王组成，是游戏里最大的炸弹;
  4）同花顺:同花顺的顺子，最大的是10-J-Q-K-A，最小的是A-2-3-4-5;
  5）飞机:只能是2个的连续三张;
  6）单张:1张牌;
  7）对子:2张相同的点数;
  8）三张:3张相同的点数;
  9）三张加对子;
  10）三联对:只能是3个连续的对子，不包括双王，不分花色;
  </size>
  <size=32><color=#004f3c>二.大小比较</color></size>
  <size=28>
  1）牌点大小顺序:
   ◆ 大王＞小王＞A＞K＞Q＞J＞10＞9＞8＞7＞6＞5＞4＞3＞2;
  2）牌型大小顺序:
   ◆ 四王＞8炸＞7炸＞6炸＞同花顺＞5炸＞4炸＞其它牌型;
  3）同种牌型大小比较:
   ◆ 顺子:比较最大的那张牌点数;
   ◆ 三张:比较三张的点数大小;
   ◆ 三带二:比较三张的点数大小;
   ◆ 三连对:比较最大的那一对点数大小;
  </size>
  <size=32><color=#004f3c>三.出牌排名</color></size>
  <size=28>
  1）头游:第一个出完手牌的玩家;
  2）二游:第二个出完手牌的玩家;
  3）三游:第三个出完手牌的玩家;
  4）四游:没有打完手牌的玩家;
  </size>
  <size=32><color=#004f3c>四.进贡还贡</color></size>
  <size=28>
  1）双下:在一局牌中，某一队的两个成员分别是三游和末游;
  2）单下:在一局牌中，某一队的其中一个成员是头游或二游，另一个
     成员是末游;
  3）进贡:
     ◆ 双下局的下一局发牌后，输的两人需分别进贡一张最大的手牌
        给赢的玩家，谁进贡的牌大谁获得优先出牌权;
     ◆ 单下局的下一局发牌后，末游要像头游进贡一张最大的牌，下游
        获得优先出牌权;
  4）还贡:被进贡的玩家需要向进贡的玩家还贡一张除大小王之外的任意
     手牌;
  5）抗供:
     ◆ 进贡的玩家若抓到两张大王，可单独抗供，若单下的情况下，头
        游无需还贡且获得优先出牌权;若双下的情况下，则另一个下游
        玩家还是需要进贡，且可以获得优先出牌权;
     ◆ 双下的情况下，两个下游玩家分别抓到一张大王，则都不用进贡
        ，头游玩家获得优先出牌权;
  </size>
  <size=32><color=#004f3c>五.出牌</color></size>
  <size=28>
  1）第一句由房主首先出牌，之后按谁进贡的点数大决定谁先出牌;
  2）出现双下情况时，直接进入结算，无需决出三游;
  </size>
  <size=32><color=#004f3c>六.升级</color></size>
  <size=28>
  1）头游和二游是同一队时:升3级;
  2）头游和三游是同一队时:升2级;
  3）头游和末游是同一队时:升1级;
  </size>
  ]],
}

return ConfigChild
