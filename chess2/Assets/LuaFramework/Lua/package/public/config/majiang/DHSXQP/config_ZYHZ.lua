local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --红中
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
            tag = {togglesTile = "玩法:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"YouLaiZi\":true",toggleType = 2,toggleTitle = "红中",toggleIsOn = true,clickTip="勾选后有红中牌。", clickSmallShow = "3_1"},
                    {disable = false,json = "\"QiangGangHu\":true",toggleType = 2,toggleTitle = "可抢杠胡",toggleIsOn = true,clickTip = "勾选后可以抢杠胡。"},
                    {disable = false,json = "\"QiXiaoDui\":true",toggleType = 2,toggleTitle = "可胡七对",toggleIsOn = true,clickTip = "勾选后可以胡七对。"},
                    {disable = false,json = "\"SiHongZhong\":true",toggleType = 2,toggleTitle = "4红中胡牌",toggleIsOn = true,clickTip="有4个红中可以直接胡牌。", smallShow = "3_1", smallShowType = 1},
                }
            }
        },
        { 
            tag = {togglesTile = "扎码:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"ZhaMa\":3",toggleType = 1,toggleTitle = "扎2码",toggleIsOn = true,clickTip="胡牌后摸2张牌，如果数字为159或者红中，则算中码，每中一码多1分。"},
                    {disable = false,json = "\"ZhaMa\":4",toggleType = 1,toggleTitle = "扎4码",toggleIsOn = false,clickTip="胡牌后摸4张牌，如果数字为159或者红中，则算中码，每中一码多1分。"},
                    {disable = false,json = "\"ZhaMa\":5",toggleType = 1,toggleTitle = "扎6码",toggleIsOn = false,clickTip="胡牌后摸6张牌，如果数字为159或者红中，则算中码，每中一码多1分。"},
                    {disable = false,json = "\"ZhaMa\":2",toggleType = 1,toggleTitle = "一码全中",toggleIsOn = false,clickTip="如果摸到红中和一字牌，即都算10分，其他的为几码便是几分。"},
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
            return Config.caculate_price2_3(roundCount, playerCount, payType, bankerType)
        end,
    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.基础规则</color></size>
  <size=28>
  1）红中麻将为四人麻将，红中为赖子，可以代替任何牌进行胡牌；
  2）红中麻将可以碰杠，不能吃；
  3）牌局中杠牌的分数胡牌一起结算，黄庄杠不记分；
  4）万条筒1~9各4张，红中4张，共112张；
  5）首局房主坐庄，之后谁胡牌谁庄，如果本局黄庄，则下局由摸最后一
     张牌的玩家坐庄，抢杠胡牌下一局由被抢杠玩家坐庄；
  6）多码玩法根据创建房间时选择买码的数量，最后要留对应张数的牌不
     能摸，做为码牌，如：选择4码，倒数第5张摸起后还无人胡牌，则黄
     庄；
  7）一码全中玩法摸牌至最后一张，还无人胡牌，则黄庄。如最后一张自
     摸，无码可买，只算底分；
  </size>
  <size=32><color=#004f3c>二.胡牌规则</color></size>
  <size=28>
  1）自摸胡:自摸胡牌所有牌型记分都一样，不翻倍（七对、杠上开花、
     抢杠胡牌都算自摸，不翻倍记分）；
  2）抢杠胡：由杠牌者全包其它玩家分数。抢杠胡牌算自摸，正常买码，
     可多人抢杠胡牌；
  </size>
  <size=32><color=#004f3c>三.分数计算</color></size>
  <size=28>
  1）放杠：
     ◆ 四人玩法：3分；
     ◆ 三人玩法：2分；
  2）明杠：
     ◆ 四人玩法：1分；
     ◆ 三人玩法：1分；
  3）暗杠：
     ◆ 四人玩法：2分；
     ◆ 三人玩法：2分；
  4）底分：1分；
  5）码分：
     ◆ 一码全中：“红中”和“一”字牌为10码，二~九对应为2~9码，
        一码为一分；自摸胡牌有红中时，底分1分；自摸胡牌没有红中时
        ，底分2分；
     ◆ 多码：固定一五九中码， 每中一个码1分,如果码牌中有红中，也
        作为中一码；自摸胡牌有红中时，底分1分；自摸胡牌没有红中时
        ，多摸一个码；
  </size>]]
}

return ConfigChild
