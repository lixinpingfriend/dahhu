local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --东至麻将
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "",toggleType = 1,toggleTitle = "4局",toggleIsOn = false},
                    {disable = false,json = "",toggleType = 1,toggleTitle = "8局",toggleIsOn = true},
                    {disable = false,json = "",toggleType = 1,toggleTitle = "16局",toggleIsOn = false},
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
            tag = {togglesTile = "跑风:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"PaoFeng\":0",toggleType = 1,toggleTitle = "不跑分",toggleIsOn = false,ruleTitle = "",clickTip=""},
                    {disable = false,json = "\"PaoFeng\":1",toggleType = 1,toggleTitle = "1圈",toggleIsOn = false,ruleTitle = "",clickTip=""},
                    {disable = false,json = "\"PaoFeng\":2",toggleType = 1,toggleTitle = "2圈",toggleIsOn = false,ruleTitle = "",clickTip=""},
                    {disable = false,json = "\"PaoFeng\":3",toggleType = 1,toggleTitle = "3圈",toggleIsOn = true,ruleTitle = "",clickTip=""},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"Piao\":true",toggleType = 2,toggleTitle = "压跑",toggleIsOn = true,clickTip=""},
                    {disable = false,json = "\"QingYiSe\":true",toggleType = 2,toggleTitle = "清一色",toggleIsOn = true,clickTip=""},
                    {disable = false,json = "\"ShunQingYiSe\":true",toggleType = 2,toggleTitle = "顺清一色",toggleIsOn = true,clickTip=""},
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
            return Config.caculate_price2(roundCount, playerCount, payType, bankerType)
        end,
        isTablePop = true,
        isShowPiao = true,
        PaoTitles = "不跑|1跑|2跑|3跑",
        headTag = {
            serverJson = "PiaoNum",
            localJson = "YouPao",
            zeroJson = "不跑",
            addJson = "跑",
        },
        laiziTagTitle = "钻牌",
        laiziTag = "11",
        view = "tabledongzhi_view",
        use3dcontroller = true,
        controller = "tabledongzhi_controller",
        IsOpenStartNow = true, ---打开提前开局按钮
        useBriefOneGameResult = true,  ---是否使用简略小结算
        layout3dTypes = { 2,1 }, ---游戏内可使用的3D麻将布局,如果不设置，则默认为Type1布局
        totalResultshareTypeToggleDefState = 1,

    },
}

ConfigChild.HowToPlayTexts =
{
    [[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1）麻将共136张牌，包括：万、条、筒、风（东南西北中发白）
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）可碰，可杠，不可吃
2）只能自摸不能接炮
3）坐庄:第一局房主坐庄，庄家胡牌连庄，其他情况下逆时针轮庄
4）过碰惩罚:一圈内对方打出的牌能碰却没有碰，则在未经过自己时再
 次出现该可碰的牌时也都不可以碰;
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）自摸:满足胡牌牌型即可
2）杠上开花:满足牌型即可
3）抢杠胡:满足牌型即可
</size>
<size=32><color=#004f3c>四.花牌规则</color></size>
<size=28>
1）花牌:中发白为花牌
2）补花:打出花牌可以补摸一张牌
</size>
<size=32><color=#004f3c>五.钻牌规则</color></size>
<size=28>
1）钻牌:发牌后翻一张牌，这张牌的上一个数，就是钻牌。
2）钻牌功能：钻牌可以当任何牌来用，只能在手里组牌用，可以打出去，不能被吃碰杠。
3）红中配:红中牌可以作为钻牌的替代牌
</size>
<size=32><color=#004f3c>六.计分规则</color></size>
<size=28>
1）补花:花的数量为3/5/7/8/9/10/11/12时对应的加分为，1/2/3/4/5/6/7/8分
2）明杠/接杠1花，暗杠2花
3）胡牌：+1分
4）庄家：输赢多1分
5）天胡：+3分
6）地胡：+3分
7）十三乱：+1分
8）七星十三乱：+4分
9）七对：+1分
10）硬七对：+4分
11）双七对：+8分
12）碰碰胡：+1分
13）硬碰碰胡：+4分
14）清一色：+1分
15）顺清一色：+1分
16）硬顺清一色：+4分
17）全幺：+1分
18）跑风：每跑风一圈，额外多+2分，跑风时别人胡牌，则额外赔给3家对应的跑风分数
</size>]],
}

return ConfigChild
