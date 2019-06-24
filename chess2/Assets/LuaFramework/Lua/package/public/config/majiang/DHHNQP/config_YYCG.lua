local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --岳阳炒股
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
                },
            }
        },
        {
            tag = { togglesTile = "飘分:", rowNum = 3 },
            list =
            {
                {
                    {disable = false,json = "\"ZongJiaFen\":1",toggleType = 1,toggleTitle = "1分",toggleIsOn = true},
                    {disable = false,json = "\"ZongJiaFen\":2",toggleType = 1,toggleTitle = "2分",toggleIsOn = false},
                    {disable = false,json = "\"ZongJiaFen\":3",toggleType = 1,toggleTitle = "3分",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"XianZhuang\":true",toggleType = 2,toggleTitle = "庄闲得分",toggleIsOn = true,clickTip="庄家进分/出分时+1分"},
                    {disable = false,json = "\"Piao\":true",toggleType = 2,toggleTitle = "自由选飘",toggleIsOn = false,clickTip="牌局开始时可选择额外飘分"},
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
            local prices =
            {
                ["4"] = {["13"] = 5,["14"] = 5,["03"] = 15,["04"] = 20,["23"] = 15,["24"] = 20},
                ["8"] = {["13"] = 9,["14"] = 9,["03"] = 27,["04"] = 36,["23"] = 27,["24"] = 36},
                ["16"] = {["13"] = 18,["14"] = 18,["03"] = 54,["04"] = 72,["23"] = 54,["24"] = 72},
            }
            return prices[roundCount .. ""][payType .. "" .. playerCount]
        end,
        isTablePop = true,
        headTag = {
            serverJson = "PiaoNum",
            zeroJson = "不选",
            addJson = "分",
            localJson = "Piao",
        },
        isShowPiao = true,
        PaoTitles = "不选|1分|2分|3分",
    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一、基础规则</color></size>
<size=28>
1）万、条、饼（1-9各4张），共108张
2）可碰、杠，不可吃
</size>
<size=32><color=#004f3c>二、庄家规则</color></size>
<size=28>
1）第1局游戏房主为庄
2）后续胡牌为庄
3）流局不换庄
</size>
<size=32><color=#004f3c>三、胡牌规则</color></size>
<size=28>
1）可点炮，可自摸
2）可漏胡，漏胡后未过手之前不可胡牌（过所有牌）
3）无通炮（一炮多响），若出现通炮情况，按出牌顺序胡牌，例如：1点炮，2/3可胡，则算2胡
</size>
<size=32><color=#004f3c>四、可胡牌型</color></size>
<size=28>
满足一下任意一个牌型即可胡牌
1）11+123+456+789+234
2）11+123+456+789+333
3）11+123+456+777+888
4）11+123+777+888+999
5）11+222+333+444+555
</size>
<size=32><color=#004f3c>五、算分规则</color></size>
<size=28>
5.1 算分公式
1）分数=胡牌分+飘分（自己+其他玩家）+庄分（可选项，庄家点炮/胡牌才有）
2）胡牌分：大胡2分，小胡1分
3）庄分：1分

5.2 大胡判定
1）胡牌时只有没碰、明杠过的，算大胡
2）杠上开花算大胡
3）其他胡牌都算小胡
</size>]], --岳阳炒股
}

return ConfigChild
