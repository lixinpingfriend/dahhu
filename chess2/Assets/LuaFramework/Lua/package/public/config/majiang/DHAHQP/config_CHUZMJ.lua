local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --明光
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
                    {disable = false,json = "\"YouLaiZi\":true",toggleType = 2,toggleTitle = "白皮百搭",toggleIsOn = true,clickTip = "勾选后本局游戏白皮可作为万能牌使用，不勾选则不能当做万能牌。"},
                    {disable = false,json = "\"BuKeJiePao\":false",toggleType = 2,toggleTitle = "可接炮",toggleIsOn = false,clickTip = "勾选后本局游戏可以接炮胡牌，不勾选则只能自摸胡牌。"},
                    {disable = false,json = "\"HuangZhuangHuangGang\":true",toggleType = 2,toggleTitle = "黄庄黄杠",toggleIsOn = true,clickTip = "勾选后本局游戏流局时杠分将不在计算，不勾选则流局也计算杠分。"},
                }
            }
        },
        {
            tag = { togglesTile = "少人:", rowNum = 3 ,},
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
1）麻将共136张牌，包括：万、条、筒、风（东南西北中发白）.
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）可碰牌，可开杠，但不能吃牌.
2）可自模胡，接炮胡开房时可又选项配置.
3）坐庄:第一局房主坐庄，之后谁胡谁庄，流局不下庄.
4）白皮百搭，开房时可由选项配置.
 ◆ 白皮可以当做万能牌使用，可与其他牌任意组合.
 ◆ 白皮可以打出去，其他人可以碰，可以杠，但是不能吃不能胡.
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）自摸:满足胡牌牌型即可.
2）接炮:开房时选择是否可接炮胡.
3）可以抢杠胡.
4）过胡惩罚：放弃胡牌后，直到自己再次摸牌才能胡牌.
5）自摸三家出分，可接炮情况下，谁放炮谁出分.
</size>
<size=32><color=#004f3c>四.计分规则</color></size>
<size=28>	
1）自摸/接炮：1分.
2）配子吃：1分.
3）独一：2分.
4）碰碰胡：3分.
5）混一色：3分.
6）清一色：4分.
7）四喜：4分.
8）天胡：5分.
</size>]]
}

return ConfigChild
