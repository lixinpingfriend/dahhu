local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --北海推倒胡
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":4",toggleType = 1,toggleTitle = "4局",toggleIsOn = false},
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
                    {disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "3人玩法",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "底分:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"DiFen\":1",toggleType = 1,toggleTitle = "1分",toggleIsOn = true},
                    {disable = false,json = "\"DiFen\":2",toggleType = 1,toggleTitle = "2分",toggleIsOn = false},
                }
            }
        },
        {
            tag = { togglesTile = "奖马:", rowNum = 3},
            list =
            {
                {
                    { disable = false, json = "\"ZhaMa\":1", toggleType = 1, toggleTitle = "一马打法", toggleIsOn = false,clickTip = "只翻1张马牌，中马数与翻牌的牌面相关",clickSmallShow = "3_1"},
                    { disable = false, json = "ZhaMa", toggleType = 1, toggleTitle = "奖", toggleIsOn = true, dropDown = "2,4,6,8,10", dropDefault = 1, dropAddStr = "马"},
                },
                {
                    { disable = false, json = "\"YiDiShi\":true", toggleType = 2, toggleTitle = "一抵十", toggleIsOn = true,smallShow = "3_1",smallShowType = 1,clickTip = "翻中一/东/中算10马"},
                    { disable = false, json = "\"MaGDahu\":true", toggleType = 2, toggleTitle = "马跟胡走", toggleIsOn = true,clickTip = "每个马分与胡牌分相同，不勾选则每个马牌2分"},
                }
            }
        },
        {
            tag = { togglesTile = "可选:", rowNum = 3},
            list =
            {
                {
                    { disable = false, json = "\"YouFengPai\":false", toggleType = 2, toggleTitle = "不带风", toggleIsOn = false},
                    { disable = false, json = "\"FengDing\":true", toggleType = 2, toggleTitle = "4倍封顶", toggleIsOn = true,clickTip = "胡牌分上限倍数为4倍，不勾选时无倍数上限"},
                    { disable = false, json = "\"GenZhuang\":true", toggleType = 2, toggleTitle = "跟庄", toggleIsOn = true,clickTip = "第1圈起庄家打出1张牌，其余3家跟着出相同的牌，庄家给每人1分，可叠加"},
                    { disable = false, json = "\"GuiPai\":true", toggleType = 2, toggleTitle = "翻种", toggleIsOn = true, clickSmallShow = "4_4",clickTip = "翻牌后的下一张为种牌，不勾选则无种牌"},
                    { disable = false, json = "\"NoGuiFanBei\":true", toggleType = 2, toggleTitle = "无种翻倍", toggleIsOn = false, smallShow="4_4",smallShowType = 1,clickTip = "胡牌时手中无种牌，胡牌分翻2倍"},
                    { disable = false, json = "\"YouGuiJiaFen\":true", toggleType = 2, toggleTitle = "有种加分", toggleIsOn = false, smallShow="4_4",smallShowType = 1,clickTip = "每有1张种牌，结算时+1分"},
                },
                {
                    { disable = false, json = "\"SSY8Bei\":true", toggleType = 2, toggleTitle = "十三幺8倍", toggleIsOn = false,clickTip = "胡十三幺牌型时，胡牌分翻8倍"},
                    --{ disable = false, json = "\"QingPeng\":true", toggleType = 2, toggleTitle = "清碰8倍", toggleIsOn = false,clickTip = "胡清一色碰碰胡牌型时，胡牌分翻8倍"},
                    { disable = false, json = "\"QuanQiuRen\":true", toggleType = 2, toggleTitle = "可胡全求人", toggleIsOn = true},
                },
                {
                    { disable = false, json = "\"QiXiaoDui\":true", toggleType = 2, toggleTitle = "可胡七对", toggleIsOn = true, clickSmallShow = "5_1"},
                    { disable = false, json = "\"LongQiDui\":true", toggleType = 2, toggleTitle = "可胡龙七对", toggleIsOn = true, smallShow="5_1",smallShowType = 1,clickTip = "必须持有4张相同的实牌，4张种牌不拆开用可以算"},
                }
            }
        },
        IsOpenStartNow = true, ---打开提前开局按钮
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
            return Config.caculate_price_bhtdh(roundCount, playerCount, payType, bankerType)
        end,
        pnShowResult = true,
        wanfaCustomShow = true,
        laiziTagTitle = "种牌",
        laiziTag = "9",
    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一、基础规则</color></size>
<size=28>
1）万、条、饼（1-9各4张）+风牌（东南西北中发白各4张），共136张
2）可碰、杠，不能吃
3）翻种：翻出一张牌，此张牌的下一张牌当种牌，种牌可以代替任何牌，可以打出，可以碰杠，但不可跟其他牌组合碰杠
</size>
<size=32><color=#004f3c>二、庄家规则</color></size>
<size=28>
1）第1局游戏房主为庄，后续胡牌为庄
2）荒庄摸最后一张牌（海底牌）的人坐庄
3）荒庄：一马玩法留1张牌荒庄，多马玩法选择买几匹马就留几张牌荒庄
</size>
<size=32><color=#004f3c>三、胡牌规则</color></size>
<size=28>
1）只能自摸，不能点炮
2）没有抢杠胡
</size>
<size=32><color=#004f3c>四、胡牌牌型和倍数</color></size>
<size=28>
1）底分2分
2）平胡，每家给底分2分
3）碰碰胡2倍
4）清一色2倍
5）七小对2倍
6）海底捞月2倍
7）杠上花2倍，点杠者出杠分，暗杠和补杠3家出杠分
8）地胡2倍
9）天胡4倍
10）十三幺4倍，勾选“十三幺8倍”则倍数改为8倍
11）全求人4倍，最后1张牌为种牌时，摸到种牌算全求人，摸到其他牌算碰碰胡
12）豪华七对4倍
</size>
<size=32><color=#004f3c>五、计分规则</color></size>
<size=28>
5.1算分公式
1）胡牌总分=底分*倍数+杠分+马分+跟分
2）多个大胡可以叠加，倍数相乘（例如清一色碰碰胡，计分=2*2*2=8分）
3）4倍封顶：创建房间时勾选“4倍封顶”则最高按4倍计算，不足4倍按实际倍数计算

5.2杠分
1）明杠：点杠者出3分
2）暗杠：其余3家每家出2分
3）补杠：其余3家每家出1分
4）流局不流杠
5）过手杠只能补牌，不算杠分，补牌胡牌算杠上花翻倍

5.3跟分
开局庄家打出一张牌，其他3家依次打出这张牌，算作跟庄，庄家给其他人每人1分
</size>
<size=32><color=#004f3c>六、马牌</color></size>
<size=28>
6.1一马打法
1）胡牌后翻1张牌，牌面数字为中马数，例如马牌为7万则中7马
2）翻拍为东/南/西/北对应中1/2/3/4马，中/发/白对应中1/2/3马

6.2多马打法
1）庄家马牌：一五九东中
2）庄下家马牌：二六南发
3）庄对家马牌：三七西白
4）庄上家马牌：四八北

6.3马跟胡/马不跟胡
1）马跟胡：单个马牌分与胡牌分相同（例如：清一色=2*2=4分，则每个马牌分为4分）
2）马不跟胡：2分/马牌
</size>
<size=32><color=#004f3c>七、特殊规则</color></size>
<size=28>
1）无种加倍：没有种牌胡牌，胡牌分*2（勾选“翻种”选项之后才可以勾选此项）
2）海底捞月：最后1张牌自摸时翻倍，胡牌分*2
</size>]],--北海推倒胡
}

return ConfigChild
