local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --怀宁
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
                    {disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "3人玩法",toggleIsOn = false,},
                    {disable = false,json = "\"PlayerNum\":2",toggleType = 1,toggleTitle = "2人玩法",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "吃三比:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ChiSanBiType\":2",toggleType = 1,toggleTitle = "顺2反4",toggleIsOn = true},
                    {disable = false,json = "\"ChiSanBiType\":3",toggleType = 1,toggleTitle = "顺3反6",toggleIsOn = false},
                    {disable = false,json = "\"ChiSanBiType\":4",toggleType = 1,toggleTitle = "顺4反8",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "杠分:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"GangFenType\":1",toggleType = 1,toggleTitle = "明1暗2",toggleIsOn = true},
                    {disable = false,json = "\"GangFenType\":2",toggleType = 1,toggleTitle = "明2暗3",toggleIsOn = false},
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
                    {disable = false,json = "\"PayType\":1",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = false},
                    {disable = false,json = "\"PayType\":0",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = true},
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price2(roundCount, playerCount, payType, bankerType)
        end,
        IsOpenStartNow = true, ---打开提前开局按钮
        headTag = {
            serverJson = "Pao",
            zeroJson = "压自摸",
            serverJson2 = "PiaoNum",
            zeroJson2 = "下0分",
            preJson2 = "下",
            addJson2 = "分",
        },
        isStrategy = true,
        view = "tablehuainingmajiang_view",
        totalResultshareTypeToggleDefState = 1,
    },
}

ConfigChild.HowToPlayTexts =
{
    [[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1） 麻将共136张牌，包括:万、条、筒、风（东南西北中发白）;
2)  花牌:中、发、白为花牌，自动补花;
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1） 可碰牌，可开杠，可吃牌;
2） 可自摸，可接炮，可以一炮多响、杠上炮和抢杠胡;
3） 坐庄规则:第一局房主坐庄;之后谁胡谁庄;一炮多响时，谁点炮谁
    庄;流局时上局庄家继续坐庄;
4） 胡牌牌型:起手胡、七小对、无花果、碰碰胡、杠上花、抢杠胡，
    有额外加分;不可以打十三烂和七星归位，其他牌型可胡，但不加
    分，和平胡一样;
5） 过手碰:一圈内对方打出的牌能碰却没有碰，则在未经过自己时再
    次出现该可碰的牌时也都不可以碰;
6） 过手胡:一圈内对方打出的牌能胡却没有胡，则在未经过自己时（
    吃、碰、杠、摸牌）再次出现该可胡的牌，该玩家也不能胡;
7） 见字胡不可以接炮胡;
</size>
<size=32><color=#004f3c>三.特殊规则</color></size>
<size=28>
1） 风刻子:胡牌时有三个相同的风牌，碰也算（南、西、北）;
2） 起手胡:庄家起手自摸或闲家摸第一张牌自摸;
3） 无花果:在没有“花”的情况下自摸胡牌（风刻子也不算无花果）;
4） 吃三比规则:被同一个玩家吃、碰、杠合计达到3次，则这两家都失
    去接点炮胡的资格，只能自摸胡牌;
    ◆ 顺包:A给B吃碰杠3口，B未给A吃碰杠3口，B自摸，达成顺包条
       件，分数在胡牌基础上+2分;
    ◆ 反包:A给B吃碰杠3口，B未给A吃碰杠3口，A自摸，达成反包条
       件，分数在胡牌基础上+4分;
5） 杠分:杠分不收取被杠玩家分数，而是在玩家胡牌时结算加分;暗杠
    需要翻开一张牌;
6） 风吊头:单吊风牌胡牌，只能自摸胡牌，不能接点炮胡;
7） 买分:牌局开始时（发牌前）可买“自摸、单吊、缺门/买0分、买
    1分、买2分”;
    ◆ A买自摸，A自摸胡后，BCD玩家需要各自赔给A买自摸的分数;
    ◆ A买自摸，B自摸胡，则A要赔B自摸分;
    ◆ AB都买自摸，A自摸胡，则B既要给A买的自摸分，也要赔自己买
       的自摸分（即赔自摸分x2）
    ◆ 若A买单吊，B买自摸，A或者B只是单吊胡或者自摸胡，则输家
       只要赔自摸或者单吊分;但若是自摸单吊胡，则单吊和自摸的分
       都要赔;
    ◆ “缺门”同上;
</size>
<size=32><color=#004f3c>四.计分规则</color></size>
<size=28>
1） 杠分:谁点炮谁出杠分，自摸三家都要出;
    ◆ 普通明杠:+1分;
    ◆ 普通暗杠:+2分;
    ◆ 风牌明杠:+2分;
    ◆ 风牌暗杠:+3分;
2） 1花=1分;
    ◆ 风刻子（南、西、北）:1个风刻子算1个花
3)  平胡1分;
4） 无花果5分;
5） 碰碰胡1分;
6） 七对2分;
7） 杠上开花1分;连杠加分，连杠1次加1分，依次叠加;
8） 抢杠胡1分;
9） 胡牌总分=平胡+牌型分+花+杠分;
</size>]],
}

return ConfigChild
