local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --太和
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
                    {disable = false,json = "\"YouHuaPai\":true",toggleType = 2,toggleTitle = "带花牌",toggleIsOn = true,clickTip = "勾选后牌局内可使用梅兰竹菊春夏秋冬,作为花牌使用"},
                    {disable = false,json = "\"YouFengPai\":true",toggleType = 2,toggleTitle = "带风牌",toggleIsOn = false,clickTip = "勾选后牌局内将出现东南西北中发白作为风牌使用"},
                    {disable = false,json = "\"YouPao\":true",toggleType = 2,toggleTitle = "带压跑",toggleIsOn = true,clickTip = "勾选后本局游戏带压跑玩法"},
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
        isTablePop = true,
        headTag = {
            serverJson = "Pao",
            zeroJson = "不压",
            notZeroJson = "压跑",
            localJson = "YouPao",
        },
        isShowPao = true,
        PaoTitles = "不压|压跑",
    },
    IsOpenStartNow = true, ---打开提前开局按钮
    totalResultshareTypeToggleDefState = 1,

}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1）麻将共136张牌，包括:万、条、筒、风（东南西北中发白）;
2）中发白开房时可设置是否为花牌;
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）可碰牌，可开杠，不可吃牌;
2）可自摸，可接炮，可以一炮多响;
3）坐庄:第一局房主坐庄，庄家胡牌连庄;流局或闲家胡则轮庄;
4）过碰惩罚:一圈内对方打出的牌能碰却没有碰，则在未经过自己时再
 次出现该牌时也都不可以碰;
6) 过胡惩罚:一圈内对方打出的牌能胡却没有胡，则在未经过自己时再
 次出现可接炮胡的牌时也都不可以胡牌;
7）一炮多响:一炮多响时，第一顺序为可以胡牌;
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）自摸:满足胡牌牌型即可;
2）接炮:满足胡牌牌型即可;
</size>
<size=32><color=#004f3c>四.花牌规则</color></size>
<size=28>
1）花牌:梅兰竹菊春夏秋冬为花牌，开房时可设置是否开启;
2）补花:花牌必须打出，打出花牌可以补摸一张牌;
</size>
<size=32><color=#004f3c>五.计分规则</color></size>
<size=28>
1）接炮/自摸:1分;
2）补花:1花1分;
3）杠分:明杠1分，暗杠2分，杠随胡走;
4）断门:+1分
</size>]],--太和
}

return ConfigChild
