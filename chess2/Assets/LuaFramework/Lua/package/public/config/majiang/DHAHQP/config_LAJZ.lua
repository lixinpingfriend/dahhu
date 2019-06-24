local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --金寨
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
                    {disable = false,json = "\"QiangGangHu\":true",toggleType = 2,toggleTitle = "抢杠胡",toggleIsOn = true,clickTip = "勾选后本局游戏可以进行抢杠胡。"},
                    --{disable = false,json = "\"YouPao\":true",toggleType = 2,toggleTitle = "跑嘴",toggleIsOn = true,clickTip = "勾选后本局游戏激活压跑玩法。"},
                }
            }
        },
        {
            tag = {togglesTile = "跑嘴:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"PaoZui\":2",toggleType = 1,toggleTitle = "自由跑嘴",toggleIsOn = true,clickTip = "勾选后每局都可进行跑嘴分下注。"},
                    {disable = false,json = "\"PaoZui\":1",toggleType = 1,toggleTitle = "固定跑嘴",toggleIsOn = false,clickTip = "勾选后将只有首局进行下注，其他局默认首局下注分。"},
                    {disable = false,json = "\"PaoZui\":0",toggleType = 1,toggleTitle = "不跑嘴",toggleIsOn = false,clickTip = "勾选后将不激活跑嘴下注。"},
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
        isTablePop = true,
        isShowPao = true,
        PaoTitles = "不跑|1跑|2跑|3跑",
        headTag = {
            serverJson = "Pao",
            zeroJson = "不跑",
            addJson = "跑",
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            local prices =
            {
                ["4"] = 
                {
                    ["12"] = 8,["13"] = 5,["14"] = 4,
                    ["02"] = 15,["03"] = 15,["04"] = 15
                },
                ["8"] = 
                {
                    ["12"] = 15,["13"] = 10,["14"] = 8,
                    ["02"] = 30,["03"] = 30,["04"] = 30
                },
                ["16"] = 
                {
                    ["12"] = 30,["13"] = 20,["14"] = 15,
                    ["02"] = 60,["03"] = 60,["04"] = 60
                },
            }
            return prices[roundCount .. ""][payType .. "" .. playerCount]
        end,
        IsOpenStartNow = true, ---打开提前开局按钮
        layout3dTypes = { 2,1 }, ---游戏内可使用的3D麻将布局,如果不设置，则默认为Type1布局
        totalResultshareTypeToggleDefState = 1,

    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.基础规则</color></size>
<size=28>
①可碰，不可吃.
②可自摸，可接炮，没有一炮多响.
③麻将共136张牌，包括：万、条、筒、风（东南西北中发白）.
④第1局由房主坐庄，之后谁胡牌后谁坐庄，流局不换庄.
</size>
<size=32><color=#004f3c>二.胡牌规则</color></size>
<size=28>
①胡牌方式有两种，可自摸胡牌，也可以接炮胡.
②过胡惩罚：一圈内对方打出的牌能胡却没有胡，则在未经过自己时再次出现可接炮胡的牌时也都不可胡牌.
③可设置抢杠胡：开明杠时，其他玩家可以胡杠的这张牌.
④杠随着胡走，不胡不计分.
⑤胡牌没有特殊限制，与推到胡规则相同.
</size>
<size=32><color=#004f3c>三.分数计算</color></size>
<size=28>
①点炮，点炮者出分，自摸，三家出分.
②平胡：+1分.
③七小对：+2分.
④十三不靠：+2分.
⑤杠上花：+1分.
⑥抢杠胡：包三家，非平胡时分数翻倍.
⑦杠分：有几个杠加几分.
</size>]],--金寨
}

return ConfigChild
