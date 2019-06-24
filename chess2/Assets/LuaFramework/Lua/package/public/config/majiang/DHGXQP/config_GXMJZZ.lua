local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --转转麻将
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
            tag = { togglesTile = "玩法:", rowNum = 3},
            list =
            {
                {
                    { disable = false, json = "\"JiePao\":true", toggleType = 1, toggleTitle = "点炮胡（可抢杠）", toggleIsOn = true},
                    { disable = false, json = "\"JiePao\":false", toggleType = 1, toggleTitle = "自摸胡", toggleIsOn = false},
                }
            }
        },
        {
            tag = { togglesTile = "可选:", rowNum = 3},
            list =
            {
                {
                    { disable = false, json = "\"XianZhuang\":true", toggleType = 2, toggleTitle = "庄闲（算分）", toggleIsOn = true},
                    { disable = false, json = "\"QiXiaoDui\":true", toggleType = 2, toggleTitle = "可胡七对", toggleIsOn = true},
                    { disable = false, json = "\"YouHongZhong\":true", toggleType = 2, toggleTitle = "红中癞子", toggleIsOn = false},
                }
            }
        },
        {
            tag = { togglesTile = "扎鸟:", rowNum = 4},
            list =
            {
                {
                    { disable = false, json = "\"ZhaNiaoType\":0", toggleType = 1, toggleTitle = "不扎鸟", toggleIsOn = true},
                    { disable = false, json = "\"ZhaNiaoType\":1", toggleType = 1, toggleTitle = "中鸟加分", toggleIsOn = false,clickSmallShow="5_2"},
                    { disable = false, json = "\"ZhaNiaoType\":2", toggleType = 1, toggleTitle = "中鸟翻倍", toggleIsOn = false,clickSmallShow="5_3"},
                    { disable = false, json = "\"ZhaNiaoType\":3", toggleType = 1, toggleTitle = "159扎鸟", toggleIsOn = false,clickSmallShow="5_4"},
                },
                {
                    { disable = false, json = "\"ZhaNiao\":2", toggleType = 1, toggleTitle = "扎2鸟", toggleIsOn = true,smallShow="5_2",smallShowType = 1},
                    { disable = false, json = "\"ZhaNiao\":4", toggleType = 1, toggleTitle = "扎4鸟", toggleIsOn = false,smallShow="5_2",smallShowType = 1},
                    { disable = false, json = "\"ZhaNiao\":6", toggleType = 1, toggleTitle = "扎6鸟", toggleIsOn = false,smallShow="5_2",smallShowType = 1},
                },
                {
                    { disable = false, json = "\"ZhaNiao\":1", toggleType = 1, toggleTitle = "扎1鸟（x2）", toggleIsOn = true,smallShow="5_3",smallShowType = 1},
                    { disable = false, json = "\"ZhaNiao\":2", toggleType = 1, toggleTitle = "扎2鸟（x3）", toggleIsOn = false,smallShow="5_3",smallShowType = 1},
                    rowNum = 3,
                },
                {
                    { disable = false, json = "\"ZhaNiao\":2", toggleType = 1, toggleTitle = "扎2鸟", toggleIsOn = true,smallShow="5_4",smallShowType = 1},
                    { disable = false, json = "\"ZhaNiao\":4", toggleType = 1, toggleTitle = "扎4鸟", toggleIsOn = false,smallShow="5_4",smallShowType = 1},
                    { disable = false, json = "\"ZhaNiao\":6", toggleType = 1, toggleTitle = "扎6鸟", toggleIsOn = false,smallShow="5_4",smallShowType = 1},
                    {disable = false,json = "\"BuZhongSuanQuanZhong\":true",toggleType = 2,toggleTitle = "不中算全中",toggleIsOn = true,clickTip="一个码都没扎中时，算6个码全都扎中了", smallShow = "5_4", smallShowType = 1},
                    {disable = false,json = "\"QuanZhongFanBei\":true",toggleType = 2,toggleTitle = "全中翻倍",toggleIsOn = true,clickTip="扎码全中，扎码分数翻倍", smallShow = "5_4", smallShowType = 1},
                    rowNum = 3,
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
            return Config.caculate_price3(roundCount, playerCount, payType, bankerType)
        end,
    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.基础规则</color></size>
<size=28>
1)万条筒1~9各4张,共108张牌,带红中的玩法下增加4张红中;
2)只允许碰,杠,不能吃;
3)牌局中杠牌立即结算,与胡不胡牌不相关;
4)首局有房主坐庄,之后谁胡谁庄,如果本局臭庄(黄庄),庄家连庄,一炮多响的情况下由放炮玩家下局坐庄;
</size>
<size=32><color=#004f3c>二.胡牌规则</color></size>
<size=28>
1)胡牌方式有两种,可自摸胡牌,也可以接炮胡,开房时可配置;
2)接炮模式下,可抢杠胡;
3)过胡惩罚：一圈内对方打出的牌能胡却没有胡,则在未经过自己时再次出现可接炮胡的牌时也都不可胡牌;
</size>
<size=32><color=#004f3c>三.扎鸟</color></size>
<size=28>
1)胡牌后从胡牌玩家开始计算(一炮多响的情况下从放炮者开始计算),159算中自己,26算中下家37算中对家,48算中上家;
2)根据房间玩法选择翻开扎鸟数量的牌,如果剩余牌不足则剩余几张翻开几张;
3)如果是扎鸟加分,则输赢双方中几个鸟加几分;
4)如果是扎鸟翻倍,则输赢双方中1鸟,结算时牌型分数X2;输赢双方中2鸟,结算时牌型分数X3
</size>
<size=32><color=#004f3c>四.分数计算</color></size>
<size=28>
1)放杠：放杠玩家给杠牌玩家,计3分;
2)明杠：其他三家每人出1分,杠牌玩家得3分;
3)暗杠：其他三家每人出2分,杠牌玩家得6分;
4)接炮：点炮玩家给1分,接炮玩家得1分;
5)自摸：其他三家每人给2分,胡牌玩家得6分;
</size>]],--转转麻将
}

return ConfigChild
