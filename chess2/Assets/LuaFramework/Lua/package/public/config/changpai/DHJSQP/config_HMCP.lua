local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --海门长牌
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":6",toggleType = 1,toggleTitle = "6局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":9",toggleType = 1,toggleTitle = "9局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":12",toggleType = 1,toggleTitle = "12局",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "喜牌:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"XiPai\":true",toggleType = 1,toggleTitle = "带喜牌",toggleIsOn = true},
                    {disable = false,json = "\"XiPai\":false",toggleType = 1,toggleTitle = "不带喜牌",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "买庄:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"MaiZhuang\":0",toggleType = 1,toggleTitle = "无倍数",toggleIsOn = false},
                    {disable = false,json = "\"MaiZhuang\":1",toggleType = 1,toggleTitle = "一二三倍",toggleIsOn = true},
                    {disable = false,json = "\"MaiZhuang\":2",toggleType = 1,toggleTitle = "二三四倍",toggleIsOn = false},
                    {disable = false,json = "\"MaiZhuang\":3",toggleType = 1,toggleTitle = "三四五倍",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "将牌:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"DanJiang\":true",toggleType = 1,toggleTitle = "单将牌",toggleIsOn = true},
                    {disable = false,json = "\"DanJiang\":false",toggleType = 1,toggleTitle = "双将牌",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"HuFenLimit\":true",toggleType = 2,toggleTitle = "22胡起胡",toggleIsOn = false},
                }
            }
        },
        --{
        --    tag = {togglesTile = "买庄:",rowNum = 3},
        --    list =
        --    {
        --        {
        --            {disable = false,json = "\"MaiZhuang\":0",toggleType = 1,toggleTitle = "无倍数",  clickTip = "无买庄", toggleIsOn = true},
        --            {disable = false,json = "\"MaiZhuang\":1",toggleType = 1,toggleTitle = "一二三倍",clickTip = "有买庄，且结算时两人都买了庄，则算胡分数x3；两人中1人买庄，则算胡分数x2；两人都没买庄，则分数x1", toggleIsOn = false},
        --            {disable = false,json = "\"MaiZhuang\":2",toggleType = 1,toggleTitle = "二三四倍",clickTip = "有买庄，且结算时两人都买了庄，则算胡分数x4；两人中1人买庄，则算胡分数x3；两人都没买庄，则分数x2", toggleIsOn = false},
        --            {disable = false,json = "\"MaiZhuang\":3",toggleType = 1,toggleTitle = "三四五倍",clickTip = "有买庄，且结算时两人都买了庄，则算胡分数x5；两人中1人买庄，则算胡分数x4；两人都没买庄，则分数x3", toggleIsOn = false},
        --        }
        --    }
        --},
        {
            tag = {togglesTile = "封顶:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"FengDing\":0",toggleType = 1,toggleTitle = "不封顶",--[[clickTip = "无买庄",--]] toggleIsOn = true},
                    {disable = false,json = "\"FengDing\":600",toggleType = 1,toggleTitle = "600",--[[clickTip = "",--]] toggleIsOn = false},
                    {disable = false,json = "\"FengDing\":800",toggleType = 1,toggleTitle = "800",--[[clickTip = "",--]] toggleIsOn = false},
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
            return Config.caculate_price8(roundCount, playerCount, payType, bankerType)
        end,
        addJson = "\"PlayerNum\":3,"
    },
}

ConfigChild.HowToPlayTexts =
{
    [[  <size=32><color=#004f3c>一.长牌数量</color></size>
    <size=28>
    1）长牌共125张牌，其中万条筒序数牌108张，红花、千字、白花各4张，
       再加福禄寿喜财（统称为喜牌）各1张;
    </size>
    <size=32><color=#004f3c>二.基础规则</color></size>
    <size=28>
    1）可碰牌，可开杠，不可吃牌;
    2）无一炮多响，若多家可胡，则只有放炮玩家的下家胡牌;
    3）可以接炮胡，也可以自摸胡牌;
    4）坐庄:第一局由房主坐庄，之后无论谁胡都是轮庄，即庄家下家坐庄;
    5）老将:红花、千字、白花、九条这四种牌统称为老将;
    6）出分:无论有无胡牌，三个玩家都要依次与另外两个玩家结算;
    </size>
    <size=32><color=#004f3c>三.底分算胡</color></size>
    <size=28>
    1）刻名次解释:三张算作刻，三张在手算暗刻，碰三张算明刻;
    2）杠名次解释:四张算作杠，自己摸四张算暗杠，接别人的算明杠，起手
       四张算叫牌;
    3）普通将:翻将牌时，翻出的将牌不是老将也不相同;
       ◆ 在将上:明刻8胡，暗刻24胡，叫牌32胡;
       ◆ 不在将上:明刻4胡，暗刻8胡，明杠16胡，暗杠24胡，叫牌32胡;
    4）双将相同:将牌是普通将，且两张牌相同;
       ◆ 在将上:叫牌64胡;
       ◆ 不在将上:明刻8胡，暗刻16胡，明杠32胡，暗杠48胡，叫牌64胡;
    5）双将不同:将牌是普通将，两张牌花色不同但序数相同;
       ◆ 在将上:明刻16胡，暗刻48胡，叫牌64胡;
       ◆ 不在将上:明刻8胡，暗刻16胡，明杠32胡，暗杠48胡，叫牌64胡;
    6）双龙会:翻出的两张将牌都是老将;
       ◆ 在将上:明刻32胡，暗刻96胡，叫牌128胡;
       ◆ 不在将上:明刻16胡，暗刻32胡，明杠64胡，暗杠96胡，叫牌128胡
    7）半边将之老将:翻出的将牌一张是老将，一张是普通牌;
       ◆ 在将上:明刻16胡，暗刻48胡，叫牌64胡;
       ◆ 不在将上:明刻8胡，暗刻16胡，明杠32胡，暗杠48胡，叫牌64胡;
    8）半边将之普通将:翻出的将牌一张是老将，一张是普通牌;
       ◆ 在将上:明刻8胡，暗刻24胡，叫牌32胡;
       ◆ 不在将上:明刻4胡，暗刻8胡，明杠16胡，暗杠24胡，叫牌32胡;
    9）普通牌:普通牌，不满足在将上或不在将上的条件;
       ◆ 明刻2胡，暗刻4胡，明杠8胡，暗杠12胡，叫牌16胡;
    10）老将牌:翻出将都是普通牌;
       ◆ 明刻4胡，暗刻8胡，明杠16胡，暗杠24胡，叫牌32胡;
    11）三老聚会:若算胡时，某玩家同时拥有红花、千字、白花的算胡，则
        每个红花、千字、白花的胡数x2;
    </size>
    <size=32><color=#004f3c>四.特殊算胡</color></size>
    <size=28>
    1）文钱:牌型中每出现一个123筒，称为一个文钱;
       ◆ 单文钱:20胡;
       ◆ 双文钱:50胡;
       ◆ 三文钱:100胡;
       ◆ 四文钱:200胡;
    2）单吊:10胡，胡牌时，胡的是组成对子的那张;
    3）丫子:10胡，胡牌时，胡的时组成顺子的中间那张;
    4）边张:10胡，指“一二三”里的三，“七八九”里的七;
    5）自摸:10胡;
    6）天胡:所有算胡x2，庄家起手自摸胡牌称为天胡;
    7）天听:所有算户x2，闲家起手听牌称为天听，天听后不可改听，在此
       基础上允许胡、杠;
    8）窃喜:所有算户x2，创建房间时选择有喜牌，但胡牌玩家没有喜牌;
    </size>
    <size=32><color=#004f3c>五.喜牌算胡</color></size>
    <size=28>
    1）按玩家手里的喜牌数量算胡;
       ◆ 1个:10胡;
       ◆ 2个:30胡;
       ◆ 3个:50胡;
       ◆ 4个:100胡;
       ◆ 5个:200胡;
    </size>
    <size=32><color=#004f3c>六.牌型算胡</color></size>
    <size=28>
    1）飘胡:胡牌时，牌型由文钱和刻子/杠以及一个对子组成;
    2）清胡:胡牌时，牌型有7个顺子加一个对子组成;
    3）塌子胡:胡牌时，由顺子、刻子/杠以及一个对子组成;
    </size>]]
}

return ConfigChild
