local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --望江
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
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"PiHuBuHu\":false",toggleType = 2,toggleTitle = "1分可胡",toggleIsOn = true,clickTip="勾选后本局游戏不需要补花也可以进行接炮胡，不勾选则必须补花后才能接炮胡。"},
                    {disable = false,json = "\"TianHuJiaFen\":true",toggleType = 2,toggleTitle = "天胡加分",toggleIsOn = true,clickTip="勾选本局游戏天胡时额外加天胡的分数。"},
                    {disable = false,json = "\"PuPuYao\":true",toggleType = 2,toggleTitle = "普普幺",toggleIsOn = false},
                    {disable = false,json = "\"QuanYao\":true",toggleType = 2,toggleTitle = "全幺",toggleIsOn = false},
                }
            }
        },
        {
            tag = { togglesTile = "少人:", rowNum = 3 ,},
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
                    {disable = false,json = "\"PayType\":1",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = false},
                    {disable = false,json = "\"PayType\":0",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = true},
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price2(roundCount, playerCount, payType, bankerType)
        end,
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,

    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.基础规则</color></size>
<size=28>
①可以吃碰，明杠，暗杠.
②可以一炮多响.
③麻将共136张牌，包括，万，条，筒，风（东南西北中发白）.
其中东风，红中，发财，白板是花牌.
</size>
<size=32><color=#004f3c>二.胡牌规则</color></size>
<size=28>

①胡牌方式有两种，可自摸胡牌，也可以接炮胡.
②过胡惩罚：一圈内对方打出的牌能胡却没有胡，则在未经过自己时再
次出现可接炮胡的牌时也都不可胡牌.
③杠分是胡牌后结算，荒庄杠也荒掉.

④存在3口关系的两人输赢关系为3倍.只有自摸时才算3口关系.
接炮不算3口关系，但4口关系接炮也算.
⑤抢杠胡，被抢的玩家包赔3家的分数.
</size>

<size=32><color=#004f3c>三.分数计算</color></size>
<size=28>
①点炮，点炮者出分，自摸，三家出分.

②平胡：+1分.
③自摸：+1分.

④单调胡：+3分.
⑤卡胡：+3分.
⑥边胡：+3分.

⑦海底胡：+3分.
⑧碰碰胡：+3分.
⑨全求人：+3分.

⑩门清：+3分.
⑪混一色：+3分.
⑫清一色：+5分.
⑬一条龙：+5分.
⑭七小对：+5分.
⑮豪华七小对：+10分.
⑯双豪华七小对：+15分.
⑰三豪华七小对：+20分.
⑱风碰：+1分，可叠加.
⑲明杠：自摸+1分，接炮+3分.
暗杠：自摸+2分，接炮+6分.
风明杠：自摸+2分，接炮+6分.
风暗杠：自摸+3分，接炮+9分.
</size>]],
}

return ConfigChild
