local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --淮北推倒胡
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
                    {disable = false,json = "\"PlayerNum\":4",toggleType = 1,toggleTitle = "4人玩法",toggleIsOn = false},
                    {disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "3人玩法",toggleIsOn = true},
                }
            }
        },
        { 
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"GangSuiHuZou\":true",toggleType = 1,toggleTitle = "杠随胡走",toggleIsOn = false,clickTip="选中后本局游戏只有胡牌的人才能赢得杠分。"},
                    {disable = false,json = "\"GangSuiHuZou\":false",toggleType = 1,toggleTitle = "杠了就有",toggleIsOn = true,clickTip="选中后本局游戏的杠分独立结算，与是否胡牌无关。"},
                },
                {
                    {disable = false,json = "\"BuKeChi\":true",toggleType = 2,toggleTitle = "不可吃牌",toggleIsOn = true,clickTip="勾选后本局游戏不能进行吃牌。"},
                    {disable = false,json = "\"QiangGangQuanBao\":true",toggleType = 2,toggleTitle = "抢杠全包",toggleIsOn = true,clickTip="勾选后本局游戏被抢杠的玩家需要包赔所有玩家的分数。"},
                },
                {
                    {disable = false,json = "\"QiDui\":true",toggleType = 2,toggleTitle = "七小对算番",toggleIsOn = true,clickTip="勾选后本局游戏胡七小对时分数翻倍。"},
                    {disable = false,json = "\"ShiSanBuKao\":true",toggleType = 2,toggleTitle = "十三不靠算番",toggleIsOn = true,clickTip="勾选后本局游戏胡七小对时分数翻倍。"},
                },
                {
                    {disable = false,json = "\"Pao\":true",toggleType = 2,toggleTitle = "压跑分",toggleIsOn = true,clickTip="勾选有激活压跑玩法。"},
                    {disable = false,json = "\"LaZuo\":true",toggleType = 2,toggleTitle = "拉坐分",toggleIsOn = true,clickTip="勾选后激活拉坐玩法。"},
                },
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
        isHBTDH = true,
        isTablePop2 = true,
        headTag = {
            serverJson = "PiaoNum",
            localJson = "LaZuo",
            zeroJson = "拉0",
            preJson = "拉",
            zeroMasterJson = "坐0",
            preMasterJson = "坐",
            serverJson2 = "Pao",
            localJson2 = "Pao",
            zeroJson2 = "0跑",
            addJson2 = "跑",
        },
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,

    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1）麻将共136张牌，包括：万、条、筒、风（东南西北中发白）;
</size>

<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）不可吃牌，可碰牌，可开杠;
2）可以一炮多响;
3）坐庄:庄家胡牌、流局时连庄，闲家胡牌逆时针轮庄;
4）压跑分：每局发牌前确定下的额外赌注，有：跑1，跑2，跑随胡走;
5）拉坐分：庄家为坐分，闲家为拉分，有：拉1，拉2，坐1，坐2，拉坐分只有参与胡的玩家与庄家进行计算
5）过胡惩罚:能胡而未胡，则只有在自己摸了牌后才能胡，可以自摸胡;
6）过碰惩罚：能碰而未碰，则只有自己摸了牌后再打的该牌才能碰;
7）杠随胡走：只有胡牌才计算杠分（有杠时第一时间可以不杠，随时可以开杠）
</size>

<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）自摸:满足胡牌牌型即可;
2）接炮:满足胡牌牌型即可;
3）杠上花:满足牌型即可;
4）杠后炮:满足牌型即可;
5）抢杠胡:满足牌型即可;
6）七小对:满足牌型即可;
5）十三不靠:满足牌型即可;
</size>
<size=32><color=#004f3c>四.计分规则</color></size>
<size=28>
1）接炮:1分;
2）自摸:1分;
3）明杠:1分;
4）暗杠:2分;
5）小七对：胡牌总分*2倍;
6）十三不靠：胡牌总分*2倍;
7）杠上花：胡牌总分*2倍;
8）杠后翻：胡牌总分*2倍.

</size>]],--淮北
}

return ConfigChild
