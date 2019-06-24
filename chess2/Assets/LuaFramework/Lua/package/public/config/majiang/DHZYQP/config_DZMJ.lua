local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --邓州
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "",toggleType = 1,toggleTitle = "4局",toggleIsOn = false},
                    {disable = false,json = "",toggleType = 1,toggleTitle = "8局",toggleIsOn = true},
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
                    {disable = true,json = "\"ZhuangJiaKeTuo\":true",toggleType = 2,toggleTitle = "庄家可坨",toggleIsOn = true},
                    {disable = true,json = "\"PianJiaKeDi\":true",toggleType = 2,toggleTitle = "偏家可抵",toggleIsOn = true},
                }
            }
        },
        { 
            tag = {togglesTile = "选漂:",rowNum = 3},
            list =
            {
                {
                    {disable = true,json = "\"KeQianPiao\":true",toggleType = 2,toggleTitle = "可前漂10或20胡",toggleIsOn = true},
                    {disable = true,json = "\"KeHouPiao\":true",toggleType = 2,toggleTitle = "可后漂10或20胡",toggleIsOn = true},
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
        isDengZhou = true,
        headTag = {
            serverJson = "PiaoNum",
            zeroJson = "前0",
            preJson = "前",
            serverJson2 = "Pao",
            zeroJson2 = "后0",
            preJson2 = "后",
        },
        isStrategy = true,
        view = "tabledengzhou_view",
        controller = "tabledengzhou_controller",
        layout3dTypes = {3},
        IsOpenStartNow = true, ---打开提前开局按钮
    },
}

ConfigChild.HowToPlayTexts =
{
 [[<size=32><color=#004f3c>一.基础规则</color></size>
<size=28>
  ①麻将共120 张牌，包括，万，条，筒，中发白.
  ②没有特殊胡牌牌型，且没有大胡设定，只有胡牌.
  ③胡牌后，庄家还需与偏家进行逮胡，比碰、刻、杠，再算分结算.
  ④庄偏之间可互相抵坨，胡牌时分数翻倍.
  ⑤可压前后漂，用于赢得额外分数. </size>
   
<size=32><color=#004f3c>二.胡牌规则</color></size>
<size=28>
  ①胡牌方式有两种，可自摸胡牌，也可以接炮胡.
  ②过胡惩罚：一圈内对方打出的牌能胡却没有胡，则在未经过自己时再
  次出现可接炮胡的牌时也都不可胡牌. </size>

<size=32><color=#004f3c>三.分数计算</color></size>
<size=28>
  ①平胡：+20胡.
  ②自摸：+10胡.
  ③庄家：+10胡.
  ④普通碰：+2胡.
  ⑤普通刻：+4胡.
  ⑥普通杠：+8胡.
  ⑦普通暗杠：+16胡.
  ⑧幺九碰：+4胡.
  ⑨幺九刻：+8胡.
  ⑩幺九杠：16胡.
  ⑪幺九暗杠：32胡.
  ⑫抵坨：分数翻倍. </size>]],
}

return ConfigChild
