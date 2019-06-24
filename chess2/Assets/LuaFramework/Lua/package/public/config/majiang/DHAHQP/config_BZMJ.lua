local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --利辛
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
                    {disable = false,json = "\"ShuiFangPaoChuFen\":true",toggleType = 2,toggleTitle = "谁放炮谁出分",toggleIsOn = false,clickTip="勾选后放炮胡牌时只由放炮的人出分，不勾选则所有人都出分。"},
                    {disable = false,json = "\"AnGangMingPai\":true",toggleType = 2,toggleTitle = "暗杠明牌",toggleIsOn = true,clickTip="勾选后暗杠需要亮出一张牌给别人看，不勾选则其他人看不到暗杠的牌。"},
                    {disable = false,json = "\"BuKeChi\":true",toggleType = 2,toggleTitle = "不可吃",toggleIsOn = true,clickTip="勾选后牌局内不能吃牌，不勾选则可以吃牌。"},
                }
            }
        },
        { 
            tag = {togglesTile = "花牌:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"HuaPaiNum\":20",toggleType = 1,toggleTitle = "20花",toggleIsOn = true},
                    {disable = false,json = "\"HuaPaiNum\":8",toggleType = 1,toggleTitle = "8花",toggleIsOn = false},
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
            return Config.caculate_dhahqp_gymj(roundCount, playerCount, payType, bankerType)
        end,
        isMidTing = true,
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,

    },
    { --涡阳
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
                    {disable = false,json = "\"ZhuangReward\":true",toggleType = 2,toggleTitle = "庄家算番",toggleIsOn = false,clickTip="勾选后胡牌时庄家的输赢分数翻倍，不勾选则不翻倍。"},
                    {disable = false,json = "\"BuKeChi\":true",toggleType = 2,toggleTitle = "不可吃",toggleIsOn = false,clickTip="勾选后牌局内不能吃牌，不勾选则可以吃牌。"},
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
            return Config.caculate_dhahqp_gymj(roundCount, playerCount, payType, bankerType)
        end,
        isMidTing = true,
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,

    },
    { --蒙城
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
                    {disable = false,json = "\"ShuiFangPaoChuFen\":true",toggleType = 2,toggleTitle = "谁放炮谁出分",toggleIsOn = false},
                    {disable = false,json = "\"AnGangMingPai\":true",toggleType = 2,toggleTitle = "暗杠明牌",toggleIsOn = true},
                    {disable = false,json = "\"BuKeChi\":true",toggleType = 2,toggleTitle = "不可吃",toggleIsOn = true},
                }
            }
        },
        { 
            tag = {togglesTile = "花牌:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"HuaPaiNum\":20",toggleType = 1,toggleTitle = "20花",toggleIsOn = true},
                    {disable = false,json = "\"HuaPaiNum\":8",toggleType = 1,toggleTitle = "8花",toggleIsOn = false},
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
            return Config.caculate_dhahqp_gymj(roundCount, playerCount, payType, bankerType)
        end,
        isMidTing = true,
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,

    },
}

ConfigChild.HowToPlayTexts =
{
 [[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1）麻将共144张牌，包括:万、条、筒、东南西北中发白、春
 夏秋冬梅兰竹菊
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）可碰牌，可开杠，但不能吃牌.
2）不可以一炮多响.
3）坐庄:第一局房主坐庄，之后谁胡谁庄，流局后下家当庄.
4）出分:自摸时，三家出分.未报听放炮赔三家，报听后放炮，三家出分.
5）听牌:听牌时必须报听，听牌未报听不能胡牌，报听后不可以更换手
 牌，但可杠牌.
6）过胡惩罚:一圈内对方打出的牌能胡却没有胡，则在未经过自己时再次
 出现可接炮胡的牌时也都不可以胡牌.
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）自摸:满足胡牌牌型即可.
2）接炮:满足胡牌牌型即可.
3）特殊牌型:满足胡牌牌型即可.
</size>
<size=32><color=#004f3c>四.补花规则</color></size>
<size=28>
1）补花简介:在此玩法中（春夏秋冬梅兰竹菊各1张，中发白各4张）共计
 20张花牌，花牌放置在手牌中最右侧.
2）补花操作：补花不需要玩家手动操作，轮到玩家回合时，自动将花牌
 打出并补牌.
3）补花流程:当轮到自己回合时，先摸牌，摸完牌后，此时如果有花牌，
4）花牌限制:花牌不可进行吃碰杠，不可在手中当对子或顺子使用.
</size>
<size=32><color=#004f3c>四.计分规则</color></size>
<size=28>
1）接炮:1分.
2）自摸:2分.
3）明杠:1分.
4）暗杠:2分.
5）补花1个算1分.
</size>]],
  [[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1）麻将共144张牌，包括:万、条、筒、东南西北中发白、春
 夏秋冬梅兰竹菊
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）可碰牌，可开杠，但不能吃牌.
2）不可以一炮多响.
3）坐庄:第一局房主坐庄，之后谁胡谁庄，流局后下家当庄.
4）出分:自摸时，三家出分.未报听放炮赔三家，报听后放炮，三家出分.
5）听牌:听牌时必须报听，听牌未报听不能胡牌，报听后不可以更换手
 牌，但可杠牌.
6）杠随胡走，杠分只有胡牌时才解散，流局或者未胡牌不结算.
7）过胡惩罚:一圈内对方打出的牌能胡却没有胡，则在未经过自己时再次
 出现可接炮胡的牌时也都不可以胡牌.
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）自摸:满足胡牌牌型即可.
2）接炮:满足胡牌牌型即可.
3）特殊牌型:满足胡牌牌型即可.
</size>
<size=32><color=#004f3c>四.补花规则</color></size>
<size=28>
1）补花简介:在此玩法中（春夏秋冬梅兰竹菊各1张，中发白各4张）共计
 20张花牌，花牌放置在手牌中最右侧.
2）补花操作：补花不需要玩家手动操作，轮到玩家回合时，自动将花牌
 打出并补牌.
3）补花流程:当轮到自己回合时，先摸牌，摸完牌后，此时如果有花牌，
4）花牌限制:花牌不可进行吃碰杠，不可在手中当对子或顺子使用.
</size>
<size=32><color=#004f3c>四.计分规则</color></size>
<size=28>
1）底分:1分.
2）补花:1花1分，补齐4个红中或者发现或者白班算10花.
 无花听牌时+10花.
3）明杠:10分.
4）暗杠:10分.
5）天胡:庄家起手胡牌额外+20分.
</size>]],
  [[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1）麻将共144张牌，包括:万、条、筒、东南西北中发白、春
 夏秋冬梅兰竹菊
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）可碰牌，可开杠，但不能吃牌.
2）不可以一炮多响.
3）坐庄:第一局房主坐庄，之后谁胡谁庄，流局后下家当庄.
4）出分:自摸时，三家出分.未报听放炮赔三家，报听后放炮，三家出分.
5）听牌:听牌时必须报听，听牌未报听不能胡牌，报听后不可以更换手
 牌，但可杠牌.
6）过胡惩罚:一圈内对方打出的牌能胡却没有胡，则在未经过自己时再次
 出现可接炮胡的牌时也都不可以胡牌.
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）自摸:满足胡牌牌型即可.
2）接炮:满足胡牌牌型即可.
3）特殊牌型:满足胡牌牌型即可.
</size>
<size=32><color=#004f3c>四.补花规则</color></size>
<size=28>
1）补花简介:在此玩法中（春夏秋冬梅兰竹菊各1张，中发白各4张）共计
 20张花牌，花牌放置在手牌中最右侧.
2）补花操作：补花不需要玩家手动操作，轮到玩家回合时，自动将花牌
 打出并补牌.
3）补花流程:当轮到自己回合时，先摸牌，摸完牌后，此时如果有花牌，
4）花牌限制:花牌不可进行吃碰杠，不可在手中当对子或顺子使用.
</size>
<size=32><color=#004f3c>四.计分规则</color></size>
<size=28>
1）接炮:1分.
2）自摸:2分.
3）明杠:1分.
4）暗杠:2分.
5）补花1个算1分.
</size>]],
}

return ConfigChild
