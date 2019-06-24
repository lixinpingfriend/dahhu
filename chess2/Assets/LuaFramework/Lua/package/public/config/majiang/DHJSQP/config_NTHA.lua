local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --红中
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
            tag = {togglesTile = "辣子:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"FengDing\":1",toggleType = 1,toggleTitle = "20封顶",toggleIsOn = true},
                    {disable = false,json = "\"FengDing\":2",toggleType = 1,toggleTitle = "40封顶",toggleIsOn = false},
                    {disable = false,json = "\"FengDing\":3",toggleType = 1,toggleTitle = "60封顶",toggleIsOn = false},
                    {disable = false,json = "\"FengDing\":5",toggleType = 1,toggleTitle = "100封顶",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"BuKeChi\":false",toggleType = 2,toggleTitle = "可吃牌",toggleIsOn = true},
                    {disable = false,json = "\"MaiZhuang\":true",toggleType = 2,toggleTitle = "带买庄",toggleIsOn = false},
                    {disable = false,json = "\"BaoZi\":true",toggleType = 2,toggleTitle = "带豹子",toggleIsOn = false},
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
        isShowPao = true,
        PaoTitles = "不买|买庄",
        headTag = {
            serverJson = "Pao",
            zeroJson = "不买",
            notZeroJson = "买庄",
        },
        view = "tablehaianmajiang_view",
        controller = "tablehaianmajiang_controller",
    },
}

ConfigChild.HowToPlayTexts =
{
    [[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1） 麻将共144张牌，包括:万、条、筒、风（东南西北中发白）、梅
    兰竹菊春夏秋冬;
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1） 可碰牌，可开杠，可吃牌;
2） 可自摸，可接炮，可以一炮多响、杠上炮和抢杠胡;
3） 坐庄规则:第一局房主坐庄;之后谁胡谁庄;一炮多响时，谁点炮
    谁庄;流局时上局庄家继续坐庄;
4） 吃牌+碰牌+杠牌的总次数最多3次且同一色（吃+碰+杠，包括风牌
    ）的不能超过2个;
5） 过手碰:一圈内对方打出的牌能碰却没有碰，则在未经过自己时再
    次出现该可碰的牌时也都不可以碰;
6） 过手胡:一圈内对方打出的牌能胡却没有胡，则在未经过自己时（
    吃、碰、杠、摸牌）再次出现该可胡的牌，该玩家也不能胡;
7） 买庄:有2人都买庄并发生结算则是4倍。买庄还和辣子封顶有关，
    例如如果封顶20，那么1人买庄算40封顶，对买庄算80封顶;
</size>
<size=32><color=#004f3c>三.花牌规则</color></size>
<size=28>
1） 真花:梅兰竹菊春夏秋冬;
2） 假花:条筒万，明杠算1花，暗杠算2花;
3） 东南西北中发白:碰和刻子算1花，明杠算2花，暗杠算3花;
4） 本风:庄家东风、下家南风、对家西风、上家北风算作本风，本风
    和中发白的碰杠在胡牌时有额外加番;
</size>
<size=32><color=#004f3c>四.特殊牌型</color></size>
<size=28>
1） 七对:20分，封顶（平胡放炮给，自摸三家给）;
2） 清一色:20分，封顶（平胡放炮给，自摸三家给）;
3） 混一色+对对胡:20分，封顶（平胡放炮给，自摸三家给）;
4） 大门清:自摸20分，封顶;
5） 小门清:自摸10分;
6） 小门清+独钓:自摸20分，封顶;
</size>
<size=32><color=#004f3c>五.番数算分</color></size>
<size=28>
1） 独钓:1番;
2） 对对胡:2番;
3） 豹子:1番;
4） 杠开:1番;
5） 中、发、白、本风:1番;
6） 混一色:2番;
</size>]]
}

return ConfigChild
