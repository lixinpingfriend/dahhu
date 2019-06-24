local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --极速
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":16",toggleType = 1,toggleTitle = "16局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":24",toggleType = 1,toggleTitle = "24局",toggleIsOn = false},
                },
            }
        },
        { 
            tag = {togglesTile = "底分:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"diFen\":1",toggleType = 1,toggleTitle = "1分",toggleIsOn = false, ruleTitle = "底分1分"},
                    {disable = false,json = "\"diFen\":2",toggleType = 1,toggleTitle = "2分",toggleIsOn = true, ruleTitle = "底分2分"},
                }
            }
        },
        { 
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"brankType\":0",toggleType = 1,toggleTitle = "抢庄",toggleIsOn = true},
                    {disable = false,json = "\"brankType\":1",toggleType = 1,toggleTitle = "轮庄",toggleIsOn = false},
                }
            }
        },
        { 
            tag = {togglesTile = "人数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"startNum\":4",toggleType = 2,toggleTitle = "满4人开局",toggleIsOn = false,clickTip = "勾选后将满4人才开局"},
                }
            }
        },
        { 
            tag = {togglesTile = "特殊:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"autoBet\":true",toggleType = 2,toggleTitle = "超时自动下注",toggleIsOn = false,clickTip = "勾选后下注超时将自动下注"},
                    {disable = false,json = "\"sanPi\":true",toggleType = 2,toggleTitle = "三批炸弹",toggleIsOn = true,clickTip = "勾选后出现三批将直接获得胜利"},
                    {disable = false,json = "\"color\":true",toggleType = 2,toggleTitle = "大小+花色比牌",toggleIsOn = true,clickTip = "勾选后将先比点数，再比花色"},
                    {disable = false,json = "\"allowEnter\":true",toggleType = 2,toggleTitle = "中途加入",toggleIsOn = true,clickTip = "勾选后将允许中途加入"},
                }
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
                    {disable = false,json = "\"payType\":1",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false,clickTip = "扣除钻石数以牌局结算人数为准"},
                    --{disable = false,json = "\"payType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price4(roundCount, playerCount, payType, bankerType)
        end,
        configJson = "{\"playType\":0,\"HallID\":0,\"brankScore\":0,\"playerCount\":7,\"gameType\":0,"
    },
    { --极速
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":16",toggleType = 1,toggleTitle = "16局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":24",toggleType = 1,toggleTitle = "24局",toggleIsOn = false},
                },
            }
        },
        { 
            tag = {togglesTile = "底分:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"diFen\":1",toggleType = 1,toggleTitle = "1分",toggleIsOn = false, ruleTitle = "1分"},
                    {disable = false,json = "\"diFen\":2",toggleType = 1,toggleTitle = "2分",toggleIsOn = true, ruleTitle = "2分"},
                }
            }
        },
        { 
            tag = {togglesTile = "上庄:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"brankScore\":20",toggleType = 1,toggleTitle = "20分",toggleIsOn = true},
                    {disable = false,json = "\"brankScore\":50",toggleType = 1,toggleTitle = "50分",toggleIsOn = false},
                    {disable = false,json = "\"brankScore\":100",toggleType = 1,toggleTitle = "100分",toggleIsOn = false},
                }
            }
        },
        { 
            tag = {togglesTile = "换庄:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"brankType\":3",toggleType = 2,toggleTitle = "一副牌",toggleIsOn = true},
                }
            }
        },
        { 
            tag = {togglesTile = "特殊:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"autoBet\":true",toggleType = 2,toggleTitle = "超时自动下注",toggleIsOn = false,clickTip = "勾选后下注超时将自动下注"},
                    {disable = false,json = "\"sanPi\":true",toggleType = 2,toggleTitle = "三批炸弹",toggleIsOn = true,clickTip = "勾选后出现三批将直接获得胜利"},
                    {disable = false,json = "\"color\":true",toggleType = 2,toggleTitle = "大小+花色比牌",toggleIsOn = true,clickTip = "勾选后将先比点数，再比花色"},
                    {disable = false,json = "\"allowEnter\":true",toggleType = 2,toggleTitle = "中途加入",toggleIsOn = true,clickTip = "勾选后将允许中途加入"},
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
                    --{disable = false,json = "\"payType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price4(roundCount, playerCount, payType, bankerType)
        end,
        configJson = "{\"playType\":1,\"HallID\":0,\"playerCount\":7,\"gameType\":1,"
    },
}

ConfigChild.HowToPlayTexts =
{
 [[<size=32><color=#004f3c>一.扑克数量</color></size>
<size=28>
1）一副扑克牌，去掉大小王，共52张。
</size>

<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）人数：2-7人，1个庄家，其余为闲家;
2）比牌：每人发两张牌（最多三张），比点数大小（A最大，2最小）比花色（黑>红>梅>方）;
3）坐庄:抢庄：抢庄的玩家随机坐庄;轮庄：首局房主坐庄，其余逆时针轮庄
4）捞牌:发牌点数太小，可且只能捞一张牌成最终点数;
5）炸开:闲家/庄家发牌点数是8点或9点时炸开;

</size>

<size=32><color=#004f3c>三.牌型规则</color></size>
<size=28>
1）三批:三张点数一样的牌;
2）三腌:三张花色相同的牌;
3）双腌:两张点数或花色相同的牌;

</size>
<size=32><color=#004f3c>四.计分规则</color></size>
<size=28>
1）三批:下注分*5;
2）三腌:下注分*3;
3）双腌:下注分*2;

</size>
]],
[[<size=32><color=#004f3c>一.扑克数量</color></size>
<size=28>
1）一副扑克牌，去掉大小王，共52张。
</size>

<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）人数：2-7人，1个庄家，其余为闲家;
2）比牌：每人发两张牌（最多三张），比点数大小（A最大，2最小）比花色（黑>红>梅>方）;
3）坐庄:抢庄：抢庄的玩家随机坐庄;轮庄：首局房主坐庄，其余逆时针轮庄
4）捞牌:发牌点数太小，可且只能捞一张牌成最终点数;
5）炸开:闲家/庄家发牌点数是8点或9点时炸开;

</size>

<size=32><color=#004f3c>三.牌型规则</color></size>
<size=28>
1）三批:三张点数一样的牌;
2）三腌:三张花色相同的牌;
3）双腌:两张点数或花色相同的牌;

</size>
<size=32><color=#004f3c>四.计分规则</color></size>
<size=28>
1）三批:下注分*5;
2）三腌:下注分*3;
3）双腌:下注分*2;

</size>

<size=32><color=#004f3c>补充规则</color></size>
<size=28>
1）码宝规则：闲家第一局下注分数*2倍的数字，成为下局的下注选项分;
             如：闲家第一局下5分，赢5分，则下一局可多选10分的码宝分

2）上庄规则：输一倍上庄分，赢二倍上庄分数时，进行换庄。

</size>
]],
}

return ConfigChild
