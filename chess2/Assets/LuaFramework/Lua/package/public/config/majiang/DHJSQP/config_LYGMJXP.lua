local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --新浦麻将
        {
            tag = {togglesTile = "局数:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":4",toggleType = 1,toggleTitle = "4局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = true,addJson = "\"isDoubleQuan\":false"},
                    {disable = false,json = "\"roundCount\":16",toggleType = 1,toggleTitle = "16局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "两圈",toggleIsOn = false,addJson = "\"isDoubleQuan\":true",clickSmallShow = "4_1"},
                },
            }
        },
        { 
            tag = {togglesTile = "人数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"PlayerNum\":4",toggleType = 1,toggleTitle = "4人玩法",toggleIsOn = true,smallShow = "4_1",smallShowType = 2},
                    {disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "3人玩法",toggleIsOn = false,smallShow = "4_1",smallShowType = 2},
                },
                {
                    {disable = false,json = "\"PlayerNum\":4",toggleType = 1,toggleTitle = "4人玩法",toggleIsOn = true,smallShow = "4_1",smallShowType = 1},
                }
            }
        },
        { 
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"KeJiaoTing\":true",toggleType = 2,toggleTitle = "可叫听",toggleIsOn = true,clickTip="勾选后有听牌流程，可自动摸打"},
                },
                {
                    {disable = false,json = "\"GangKaiFanBei\":true",toggleType = 2,toggleTitle = "杠开翻2倍",toggleIsOn = true,clickTip="勾选，杠上开花计分翻2倍，不勾选常规自摸计分"},
                    {disable = false,json = "\"SanKouFanBei\":true",toggleType = 2,toggleTitle = "三口翻2倍",toggleIsOn = true,clickTip="勾选后B玩家自摸时A玩家包三家时，计分翻2倍，不勾选则常规自摸计分"},
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
            return Config.caculate_price_lygxp(roundCount, playerCount, payType, bankerType)
        end,
        isMidTing = true,
        tingLocalJson = "KeJiaoTing",
    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一、基础规则</color></size>
<size=28>
1）万、条、饼（1-9各4张）+风牌（东南西北中发白各4张），共136张
2）可吃、碰、杠
3）荒庄：留14张牌荒庄，每有1杠多留2张牌荒庄
4）跟牌：庄家第一个出牌后，后三家都跟着出相同的牌，即为跟牌
5）三口：A通过吃/碰/杠给B喂了三张牌，即AB两家形成三口关系
</size>
<size=32><color=#004f3c>二、庄家规则</color></size>
<size=28>
1）第1局游戏房主为庄
2）庄胡则连庄，否则逆时针轮庄
</size>
<size=32><color=#004f3c>三、胡牌规则</color></size>
<size=28>
1）可自摸和点炮胡
2）勾选叫听选项，听牌后不改变牌面的情况下，可以杠
3）可以一炮多响
4）抢杠胡算普通点炮
5）暗杠杠上花算自摸，明杠杠上花点杠玩家包三家
</size>
<size=32><color=#004f3c>四、胡牌牌型</color></size>
<size=28>
1）平胡，顺子/刻子+将牌
2）清一色
3）七对
4）杠上开花
5）字一色，只有“东南西北中发白”中的几种牌
6）大乱（十三幺），手牌为147/258/369，万筒条三个花色齐即可，加“东南西北中发白”中任意5张牌
</size>
<size=32><color=#004f3c>五、计分规则</color></size>
<size=28>
5.1杠
1）暗杠：另外三家每家给1分
2）明杠：放杠者给2分
3）补杠：放杠者给2分

5.2自摸
1）庄家自摸：每个偏家给3分
2）偏家自摸：每个偏家给2分，庄家给3分

5.3点炮
1）庄家点炮：庄家给4分
2）偏家点炮给庄家：点炮者给4分
3）偏家点炮给偏家：点炮者给3分

5.4牌型倍数
大胡牌型翻倍只针对于胡牌底分，杠分、跟分不翻倍
1）清一色/大乱（十三幺）/七对，牌型胡牌翻4倍
2）字一色翻8倍
3）勾选“杠开翻倍”，则杠上开花翻2倍

5.5杠上花
1）暗杠杠上花：暗杠分+自摸分
2）明杠杠上花：明杠分+自摸（点杠人包三家）

5.6跟牌
庄家给每个偏家1分

5.7荒庄（流局）
流局情况下，杠和跟牌不计分，庄家给每个偏家1分

5.8三口
1）自摸：包三家
2）点炮：跟赔
</size>]] --新浦麻将
}

return ConfigChild
