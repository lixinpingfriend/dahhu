local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --南宁麻将
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
            tag = {togglesTile = "鬼牌:",rowNum = 3},
            list =
            {
                {
                    { disable = false, json = "\"FanGui\":false", toggleType = 1, toggleTitle = "不翻", toggleIsOn = true,clickSmallShow = "4_1"},
                    { disable = false, json = "\"FanGui\":true", toggleType = 1, toggleTitle = "翻1鬼", toggleIsOn = false,clickSmallShow = "4_1",clickTip = "鬼牌可代替任何牌，不能打出，不能与其他牌搭配进行碰/杠"},
                    --{ disable = false, json = "\"FanGui\":2", toggleType = 1, toggleTitle = "翻2鬼", toggleIsOn = false,clickSmallShow = "4_1",clickTip = "鬼牌可代替任何牌，不能打出，不能与其他牌搭配进行碰/杠"},
                }
            }
        },
        {
            tag = {togglesTile = "买马:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ZhaMa\":0",toggleType = 1,toggleTitle = "不买",toggleIsOn = false, clickSmallShow = "3_1"},
                    { disable = false, json = "ZhaMa", toggleType = 1, toggleTitle = "买", toggleIsOn = true, dropDown = "2,4,6,8,10", dropDefault = 2, dropAddStr = "马"},
                    {disable = false,json = "\"LiuDun\":true",toggleType = 2,toggleTitle = "留足马牌",toggleIsOn = false,smallShow = "3_1",smallShowType = 2,clickTip = "买几匹马则留几张牌进入流局"},
                }
            }
        },
        {
            tag = { togglesTile = "可选:", rowNum = 3},
            list =
            {
                {
                    { disable = false, json = "\"PingHuDianPao\":true", toggleType = 2, toggleTitle = "平胡可吃胡", toggleIsOn = false},
                    { disable = false, json = "\"DaHuChiHu\":true", toggleType = 2, toggleTitle = "大胡可吃胡", toggleIsOn = true, clickTip = "勾选后大胡可以点炮胡牌"},
                    { disable = false, json = "\"DianPaoBuSuanMenQ\":false", toggleType = 2, toggleTitle = "点炮算门清", toggleIsOn = false},
                },
                {
                    { disable = false, json = "\"ShiSanYao\":true", toggleType = 2, toggleTitle = "十三幺", toggleIsOn = true, clickSmallShow = "5_1",clickTip = "可选择24分和48分两个算分方式之一"},
                    { disable = false, json = "\"ShiSanYao24\":true", toggleType = 1, toggleTitle = "十三幺24分", toggleIsOn = false, smallShow = "5_1", smallShowType = 1,clickTip = "点炮24分，自摸16分/家"},
                    { disable = false, json = "\"ShiSanYao24\":false", toggleType = 1, toggleTitle = "十三幺48分", toggleIsOn = true, smallShow = "5_1", smallShowType = 1,clickTip = "点炮48分，自摸32分/家"},
                },
                {
                    { disable = false, json = "\"KeHuQuanQiuRen\":true", toggleType = 2, toggleTitle = "可胡全求人", toggleIsOn = true, clickTip = "勾选后可胡全求人牌型"},
                    { disable = false, json = "\"SiShuang\":true", toggleType = 2, toggleTitle = "死双", toggleIsOn = true,clickTip = "玩家在碰三比关系中，胡牌分数翻2倍"},
                },
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
            return Config.caculate_price2_5(roundCount, playerCount, payType, bankerType)
        end,
        pnShowResult = true,
        wanfaCustomShow = true,
        laiziTagTitle = "鬼牌",
        laiziTag = "8",
    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一、基础规则</color></size>
<size=28>
1）万、条、饼（1-9各4张）+风牌（东南西北中发白各4张），共136张
2）可碰、杠，不可吃
3）流局剩余的牌数等于选择的抓鸟数
4）封胡：玩家A被玩家B碰3次牌，则玩家A被封胡（此局玩家A不能胡牌）
5）翻鬼：鬼牌可代替任何牌，不能打出，不能与其他牌搭配进行碰/杠
6）死双：玩家在碰三比关系中，胡牌分数翻2倍
</size>
<size=32><color=#004f3c>二、庄家规则</color></size>
<size=28>
1）第1局游戏房主为庄，后续胡牌为庄
2）一炮双响或多响，点炮者为庄
3）流局情况下抓最后一张牌的人为庄
</size>
<size=32><color=#004f3c>三、胡牌规则</color></size>
<size=28>
1）可自摸和点炮胡
2）有门清，大胡牌型不算门清（例如：清一色门清就按清一色计算），门清只能自摸
3）可以一炮多响
4）有抢杠胡/杠上花/杠上炮/全求人
5）可过胡，过胡后未过手之前不能胡牌
</size>
<size=32><color=#004f3c>四、买马规则</color></size>
<size=28>
1）买马方式：跟庄买马
2）庄家马牌：一五九东中
3）庄下家马牌：二六南发
4）庄对家马牌：三七西白
5）庄上家马牌：四八北
6）点炮胡牌不能买马，只有自摸才能买马
7）自摸胡牌后，翻拍查看中马牌数，中几张马则积分增加几倍
</size>
<size=32><color=#004f3c>五、杠牌规则</color></size>
<size=28>
1）碰杠：放杠者出1分
2）先碰再杠：放碰者出1分
3）暗杠：每家出1分，暗杠不显示牌
4）鸟不跟杠：抓鸟时翻倍分数不含杠牌之分数
5）流局也算分，杠牌跟是否胡牌无关
</size>
<size=32><color=#004f3c>六、碰三比规则</color></size>
<size=28>
1）A给玩家B碰3次，A封胡，此局A不能胡牌
2）A给玩家B碰3次，A封胡，A放炮给玩家B，所出分数翻倍
3）A给玩家B碰3次，A封胡，C放炮给B，A必须赔付B与C相同分数
4）A给玩家B碰3次，A封胡，B自摸胡牌，A要包三家
</size>
<size=32><color=#004f3c>七、分数计算</color></size>
<size=28>
7.1 牌型算分
1）平胡：点炮2，自摸3/家
2）门清：点炮3，自摸4/家
3）碰碰胡：点炮9，自摸6/家
4）七小对：点炮9，自摸8/家
5）七大对：点炮18，自摸16/家
6）双七大对：点炮36，自摸32/家
7）三七大对：点炮54，自摸48/家
8）清一色：点炮9，自摸6/家
9）清一色碰碰胡：点炮18，自摸12/家
10）清一色七小对：点炮18，自摸16/家
11）全求人：点炮18
12）全求人放炮：平胡9，碰碰胡/七小对/清一色18
13）清一色全求人：点炮36
14）十三幺24分：点炮24，自摸16/家
15）十三幺48分：点炮48，自摸32/家

7.2 特殊胡牌算分
1）抢杠胡：平胡9，碰碰胡/七小对/清一色18，七大对/清一色碰碰胡/清一色七小对27，双七大对45，三七大对63
2）杠上炮：平胡9，其他分数与抢杠胡相同
3）杠上花：平胡6/家，清一色/碰碰胡12/家，清一色碰碰胡18
4）抢杠胡算点炮，胡牌后不算被抢杠的杠分
5）杠上炮杠分同样要算
</size>]],--南宁麻将
}

return ConfigChild
