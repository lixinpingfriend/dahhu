local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --浠水麻将
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
                    {disable = false,json = "\"PlayerNum\":4",toggleType = 1,toggleTitle = "4人玩法",toggleIsOn = true},
                    {disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "3人玩法",toggleIsOn = false,clickSmallShow = "1_1"},
                    {disable = false,json = "\"PlayerNum\":2",toggleType = 1,toggleTitle = "2人玩法",toggleIsOn = false,clickSmallShow = "1_1"},
                }
            }
        },
        {
            tag = {togglesTile = "封顶:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"FengDingType\":0",toggleType = 1,toggleTitle = "20/30",toggleIsOn = false},
                    {disable = false,json = "\"FengDingType\":1",toggleType = 1,toggleTitle = "30/40/50",toggleIsOn = true},
                    {disable = false,json = "\"FengDingType\":2",toggleType = 1,toggleTitle = "60/80/100",toggleIsOn = false},
                    {disable = false,json = "\"FengDingType\":3",toggleType = 1,toggleTitle = "120/160/200",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"YouFengPai\":false",toggleType = 2,toggleTitle = "无风牌",toggleIsOn = false}, 
                    {disable = false,json = "\"QuanQiuRen\":true",toggleType = 2,toggleTitle = "全求人",toggleIsOn = true,clickSmallShow = "1_2"},
                    {disable = false,json = "\"TingPaiBuBao\":true",toggleType = 2,toggleTitle = "听牌不包",toggleIsOn = false,smallShow = "1_2",smallShowType = 1},
                    {disable = false,json = "\"MenQingDuoLai\":true",toggleType = 2,toggleTitle = "门清多赖",toggleIsOn = true},
                    {disable = false,json = "\"HasWan\":true",toggleType = 2,toggleTitle = "带万字",toggleIsOn = false,smallShow = "1_1",smallShowType = 1},
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
                    {disable = false,json = "\"PayType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price_xsmj(roundCount, playerCount, payType, bankerType)
        end,
        IsOpenStartNow = true, ---打开提前开局按钮
        laiziTagTitle = "宝牌",
        laigenTagTitle = "皮子",
        laiziTag = "3",
        laiziNoYellow = true,
        view = "tablexishuimajiang_view",
        controller = "tablexishuimajiang_controller",
        isShowTingDefValue = 2,
        table3dStyles = {1,2},
        useBriefOneGameResult = true,  ---是否使用简略小结算
        --useTotalResultRestart = true, ---是否在大结算开启再来一局
    },
}

ConfigChild.HowToPlayTexts =
{
    [[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1)麻将共136张牌,包括:万,条,筒,东,南,西,北,中,发,白
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1)可吃,可碰,可杠
2)可自摸,可接炮,没有一炮多响
3)第一轮房主坐庄,之后谁胡牌谁做庄；流局(黄庄)时,庄家连庄
4)发牌后随机翻一张牌,该牌为癞子皮,这张牌数字+1为癞子牌,红中为固定癞子皮
5)癞子皮与癞子打出后可补张
6)剩余4张牌是流局(黄庄)
7)一色包赔:清一色,将一色,风一色,开口三次以上胡牌,则由放第三口的人包赔所有人的分数
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1)胡牌必须满足8斤以上,即不论自摸接炮,输家必须有一家满足输8斤以上才能胡牌
2)一圈内放弃胡牌后,第二家放炮胡牌的分数大于之前弃胡的分数才可以胡牌
</size>
<size=32><color=#004f3c>四.牌型番数</color></size>
<size=28>
1)赖子皮=1番
2)赖子杠=2番
3)明杠=1番
4)暗杠=2番
5)开口=1番
6)放炮=1番,只有大胡放炮才算
7)自摸=1番,只有大胡自摸才算
8)硬胡=1番
9)杠上开花=1番
10)抢杠胡=1番
11)清一色=1番
12)将一色=1番
13)风一色=1番
14)碰碰胡=1番
15)全求人=1番
16)七对=1番
17)豪华七对=2番
18)双豪华七对=3番
19)超豪华七对=4番
</size>
<size=32><color=#004f3c>五.计分规则</color></size>
<size=28>
1)小胡接炮:谁放炮谁出分
2)小胡自摸:三家出分
3)大胡自摸/接炮:三家出分
4)20/30封顶时:底分为1,20斤封顶,1家封顶则封顶玩家输20分,2家封顶则封顶的两个玩家输20分,三家封顶则每人30分
4)30/40/50封顶时:底分为1,30分封顶,1家封顶则封顶玩家输30分,2家封顶则封顶的两个玩家输40分,三家封顶则每人50分
4)60/80/100封顶时:底分为2,60斤封顶,1家封顶则封顶玩家输60分,2家封顶则封顶的两个玩家输80分,三家封顶则每人100分
</size>]]
}

return ConfigChild
