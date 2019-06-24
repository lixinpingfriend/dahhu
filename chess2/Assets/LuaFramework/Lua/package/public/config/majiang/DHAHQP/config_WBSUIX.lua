local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --濉溪
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
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"KeJiePao\":true",toggleType = 2,toggleTitle = "可接炮",toggleIsOn = false,clickTip="勾选后本局游戏可以接炮胡。"},
                    {disable = false,json = "\"QiangGangHu\":true",toggleType = 2,toggleTitle = "抢杠胡",toggleIsOn = false,clickTip="勾选后本局游戏可以抢杠胡。"},
                    {disable = false,json = "\"QiXiaoDui\":true",toggleType = 2,toggleTitle = "七小对",toggleIsOn = false,clickTip="勾选后本局游戏可以胡七小对。"},
                }
            }
        },
        {
            tag = {togglesTile = "扎码:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ZhaMa\":0",toggleType = 1,toggleTitle = "不扎码",toggleIsOn = true},
                    {disable = false,json = "\"ZhaMa\":2",toggleType = 1,toggleTitle = "扎2码",toggleIsOn = false},
                    {disable = false,json = "\"ZhaMa\":4",toggleType = 1,toggleTitle = "扎4码",toggleIsOn = false},
                    {disable = false,json = "\"ZhaMa\":6",toggleType = 1,toggleTitle = "扎6码",toggleIsOn = false},
                    {disable = false,json = "\"ZhaMa\":10",toggleType = 1,toggleTitle = "一码全中",toggleIsOn = false},
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
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,

    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
①麻将共108张牌，包括：万、条、筒;
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
①可吃牌，可碰牌，可开杠;
②可以一炮多响;
③坐庄:庄家胡牌、流局时连庄，闲家胡牌逆时针轮庄;
④出分:一家点炮时，点炮者出分;一家自摸时，剩余三家都要出分;
⑤过胡惩罚:一圈内对方打出的牌能胡却没有胡，则在未经过自己时再次出现可接炮胡的牌时也都不可以胡牌;
⑥不可胡牌型:七对，十三烂牌型不可胡牌;
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
①自摸:满足胡牌牌型即可;
②接炮:满足胡牌牌型即可;
③杠上开花:满足牌型即可;
④杠上炮:满足牌型即可;
⑤抢杠胡:满足牌型即可;
</size>
<size=32><color=#004f3c>四.计分规则</color></size>
<size=28>
①接炮:1分;
②自摸:2分;
③明杠:1分;
④暗杠:2分;
⑤点杠:点杠者出3分
⑥抢杠胡:被抢者出6分;
</size>]], --濉溪
}

return ConfigChild
