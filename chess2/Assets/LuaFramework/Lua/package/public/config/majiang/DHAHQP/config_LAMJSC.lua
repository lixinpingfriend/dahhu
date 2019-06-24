local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --舒城
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
            tag = {togglesTile = "模式:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"BuKeJiePao\":false",toggleType = 1,toggleTitle = "无宝牌(放冲)",toggleIsOn = false,clickBigShow = "3_1"},
                    {disable = false,json = "\"BuKeJiePao\":true",toggleType = 1,toggleTitle = "有宝牌(推倒胡)",toggleIsOn = true,clickBigShow = "3_2"},
                }
            }
        },
        {
            tag = {togglesTile = "选项:",rowNum = 3,bigShow = "3_1"},
            list =
            {
                {
                    {disable = false,json = "\"QiangGangHu\":true",toggleType = 2,toggleTitle = "可抢杠胡",toggleIsOn = true,clickTip = "勾选后本局游戏可以进行抢杠胡。"},
                    {disable = false,json = "\"QiangGangQuanBao\":true",toggleType = 2,toggleTitle = "抢杠全包",toggleIsOn = true,clickTip = "勾选后本局游戏抢杠胡时，被抢杠的人需要包赔所有人的分数。不勾选则以抢杠胡的人自摸计算分数。"},
                    {disable = false,json = "\"HuangZhuangHuangGang\":true",toggleType = 2,toggleTitle = "黄庄黄杠",toggleIsOn = false,clickTip = "勾选后本局游戏黄庄时杠分不再计算。"},
                    {disable = false,json = "\"QiXiaoDui\":true",toggleType = 2,toggleTitle = "七对+4",toggleIsOn = true,clickTip = "勾选后本局游戏可以胡七小对，七小对+4分。"},
                }
            }
        },
        {
            tag = {togglesTile = "选项:",rowNum = 3,bigShow = "3_2"},
            list =
            {
                {
                    {disable = false,json = "\"GangSuiHuZou\":true",toggleType = 1,toggleTitle = "杠随胡走",toggleIsOn = true,clickTip = "选中后本局游戏内的杠分只有胡牌者才会有分。"},
                    {disable = false,json = "\"GangSuiHuZou\":false",toggleType = 1,toggleTitle = "杠了就有",toggleIsOn = false,clickTip = "选中后本局游戏内的只要出现杠牌，则杠牌的人救会赢得对应分数。明杠每人出1分；暗杠每人出2分。"},
                }
            }
        },
        {
            tag = {togglesTile = "扎码:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ZhaMa\":0",toggleType = 1,toggleTitle = "不扎码",toggleIsOn = true,clickTip = "选中后本局没有扎码流程。"},
                    {disable = false,json = "\"ZhaMa\":2",toggleType = 1,toggleTitle = "扎2码",toggleIsOn = false,clickTip = "选中后本局激活扎码玩法，胡牌后翻两张牌，数值为159或者红中则算胡牌者中码，中一码多赢一分。"},
                    {disable = false,json = "\"ZhaMa\":4",toggleType = 1,toggleTitle = "扎4码",toggleIsOn = false,clickTip = "选中后本局激活扎码玩法，胡牌后翻四张牌，数值为159或者红中则算胡牌者中码，中一码多赢一分。"},
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
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,

    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.基础规则</color></size>
<size=28>
①可碰、杠，不可吃.
②分可接炮与不可接炮玩法.
③宝牌：翻最后一张牌，该牌的下一顺序牌即为宝牌（也叫万能牌），能随意变字.举例：翻出9万，1万就是宝牌，翻出3条，4条就是宝牌，一般都是4张宝牌，除非翻出红中，就只有三张宝牌.
④麻将共计112张牌，包含筒万条，加4张红中.
</size>
<size=32><color=#004f3c>二.胡牌规则</color></size>
<size=28>
①胡牌方式有两种，可接炮与不可接炮两种可选玩法.
  可接炮：可自摸、接炮胡.
  不可接炮：所有人只能自摸胡.
②开杠时，其他玩家可以胡玩家杠的这个牌，叫抢杠胡，只能抢明杠，暗杠点杠不可抢.
③开杠完成以后，再打出一张牌，其他玩家也可以抢这张牌胡，叫杠上炮.
④开杠后自摸胡牌，则叫杠上开花.
⑤杠分是胡牌后才结算，碰牌后开杠、暗杠是三家支付相应的杠分，点杠只有放杠出分.
</size>
<size=32><color=#004f3c>三.分数计算</color></size>
<size=28>
①点杠+3分，放杠者出分.
②明杠+1分，三家出分.（碰牌后再摸到该牌进行杠）
③暗杠+2分，三家出分.
④（流局杠分照常结算）
⑤小倒：+1分.
⑥卡当：+2分.
⑦独卡：+1分.
⑧对对胡：+3分.
⑨天胡：+5 分.
⑩地胡：+5分.
⑪杠上开花：胡牌分*4倍.两连杠*8，三连杠*12，四连杠*16，以此类推.
⑫连庄分：连庄1局+1分，连庄2局+2分，以此类推.</size>
<size=32><color=#004f3c>四.无宝模式玩法选项说明</color></size>
<size=28>
①可抢杠胡，勾选后可抢杠胡，不勾选不能抢杠胡.
②抢杠全包，勾选后抢杠胡包赔所有人，不勾选只出胡牌者1人的分数.
③黄庄黄杠，勾选后黄庄杠不算分，不勾选黄庄后杠依然算分.
④七小对+4分，勾选后胡七小对将+4分（独立的胡牌类型），不勾选则按照对对胡的分数+3分计算.
</size>]],--舒城
}

return ConfigChild
