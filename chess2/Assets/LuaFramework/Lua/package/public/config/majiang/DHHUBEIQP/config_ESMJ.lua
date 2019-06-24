local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --湖北恩施麻将
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
            tag = {togglesTile = "分数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"DiFen\":1",toggleType = 1,toggleTitle = "0.1分",toggleIsOn = false},
                    {disable = false,json = "\"DiFen\":2",toggleType = 1,toggleTitle = "0.2分",toggleIsOn = false},
                    {disable = false,json = "\"DiFen\":5",toggleType = 1,toggleTitle = "0.5分",toggleIsOn = true},
                    {disable = false,json = "\"DiFen\":10",toggleType = 1,toggleTitle = "1分",toggleIsOn = false},
                    {disable = false,json = "\"DiFen\":25",toggleType = 1,toggleTitle = "2.5分",toggleIsOn = false},
                    {disable = false,json = "\"DiFen\":50",toggleType = 1,toggleTitle = "5分",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "起胡:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"QiHuBeiShu\":0",toggleType = 1,toggleTitle = "不限点",toggleIsOn = true},
                    {disable = false,json = "\"QiHuBeiShu\":8",toggleType = 1,toggleTitle = "8点",toggleIsOn = false},
                    {disable = false,json = "\"QiHuBeiShu\":16",toggleType = 1,toggleTitle = "16点",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "封顶:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"FengDing\":80",toggleType = 1,toggleTitle = "普80/金100",toggleIsOn = true},
                    {disable = false,json = "\"FengDing\":100",toggleType = 1,toggleTitle = "普100/金120",toggleIsOn = false},
                    {disable = false,json = "\"FengDing\":120",toggleType = 1,toggleTitle = "普120/金150",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"YiLaiDaoDi\":true",toggleType = 1,toggleTitle = "一赖到底",toggleIsOn = true},
                    {disable = false,json = "\"YiLaiDaoDi\":false",toggleType = 1,toggleTitle = "多赖",toggleIsOn = false},
                }
            }
        },
        {
            tag = { togglesTile = "可选:", rowNum = 4},
            list =
            {
                {
                    { disable = false, json = "\"TaiZhuang\":true", toggleType = 2, toggleTitle = "抬庄", toggleIsOn = false},
                    { disable = false, json = "\"GangShangPao\":true", toggleType = 2, toggleTitle = "杠上炮", toggleIsOn = false},

                    -- { disable = false, json = "\"DaiZhuang\":true", toggleType = 2, toggleTitle = "打痞禁胡", toggleIsOn = false},
                    -- { disable = false, json = "\"GaiTingBuGang\":true", toggleType = 2, toggleTitle = "打赖禁胡", toggleIsOn = true},
                    { disable = false, json = "\"BuNengYangPi\":true", toggleType = 2, toggleTitle = "禁止养痞", toggleIsOn = false},
                    { disable = false, json = "\"ZuanShiDing\":true", toggleType = 2, toggleTitle = "钻石顶(200)", toggleIsOn = false},
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
        caculPrice = function (roundCount, playerCount, payType)
            return Config.caculate_price_ESMJ(roundCount, playerCount, payType, bankerType)
        end,
        addJson = "\"WanFa\":0,",
        isHuangShiHH = true,resultBeiShuScale = 10,  ---结算时候显示得分数除以这个数
        isEnShiMJ = true,
        -- isBaPiSiLai = true;
        laiziTagTitle = "赖子",
        laiziTag = "3",
        pnShowResult = true,
        wanfaCustomShow = true,
        laiziNoYellow = true,
        -- soundPath = "hshh",
        -- tingLocalJson = "KeJiaoTing",
        view = "tableenshimj_view",
        controller = "tableenshimj_controller",
        table3dStyles = {1,2},

    },
    { --八痞四赖
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
            tag = {togglesTile = "分数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"DiFen\":1",toggleType = 1,toggleTitle = "0.1分",toggleIsOn = false},
                    {disable = false,json = "\"DiFen\":2",toggleType = 1,toggleTitle = "0.2分",toggleIsOn = false},
                    {disable = false,json = "\"DiFen\":5",toggleType = 1,toggleTitle = "0.5分",toggleIsOn = true},
                    {disable = false,json = "\"DiFen\":10",toggleType = 1,toggleTitle = "1分",toggleIsOn = false},
                    {disable = false,json = "\"DiFen\":25",toggleType = 1,toggleTitle = "2.5分",toggleIsOn = false},
                    {disable = false,json = "\"DiFen\":50",toggleType = 1,toggleTitle = "5分",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "起胡:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"QiHuBeiShu\":0",toggleType = 1,toggleTitle = "不限点",toggleIsOn = true},
                    {disable = false,json = "\"QiHuBeiShu\":8",toggleType = 1,toggleTitle = "8点",toggleIsOn = false},
                    {disable = false,json = "\"QiHuBeiShu\":16",toggleType = 1,toggleTitle = "16点",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "封顶:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"FengDing\":80",toggleType = 1,toggleTitle = "普80/金100",toggleIsOn = true},
                    {disable = false,json = "\"FengDing\":100",toggleType = 1,toggleTitle = "普100/金120",toggleIsOn = false},
                    {disable = false,json = "\"FengDing\":120",toggleType = 1,toggleTitle = "普120/金150",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"YiLaiDaoDi\":true",toggleType = 1,toggleTitle = "一赖到底",toggleIsOn = true},
                    {disable = false,json = "\"YiLaiDaoDi\":false",toggleType = 1,toggleTitle = "多赖",toggleIsOn = false},
                }
            }
        },
        {
            tag = { togglesTile = "可选:", rowNum = 4},
            list =
            {
                {
                    { disable = false, json = "\"TaiZhuang\":true", toggleType = 2, toggleTitle = "抬庄", toggleIsOn = false},
                    { disable = false, json = "\"GangShangPao\":true", toggleType = 2, toggleTitle = "杠上炮", toggleIsOn = false},

                    -- { disable = false, json = "\"DaiZhuang\":true", toggleType = 2, toggleTitle = "打痞禁胡", toggleIsOn = false},
                    -- { disable = false, json = "\"GaiTingBuGang\":true", toggleType = 2, toggleTitle = "打赖禁胡", toggleIsOn = true},
                    { disable = false, json = "\"BuNengYangPi\":true", toggleType = 2, toggleTitle = "禁止养痞", toggleIsOn = false},
                    { disable = false, json = "\"ZuanShiDing\":true", toggleType = 2, toggleTitle = "钻石顶(200)", toggleIsOn = false},
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
        caculPrice = function (roundCount, playerCount, payType)
            return Config.caculate_price_ESMJ(roundCount, playerCount, payType, bankerType)
        end,
        addJson = "\"WanFa\":1,",
        isHuangShiHH = true,resultBeiShuScale = 10,  ---结算时候显示得分数除以这个数
        isEnShiMJ = true,
        isBaPiSiLai = true;
        laiziTagTitle = "赖子",
        laiziTag = "3",
        pnShowResult = true,
        wanfaCustomShow = true,
        laiziNoYellow = true,
        view = "tableenshimj_view",
        controller = "tableenshimj_controller",
        table3dStyles = {1,2},

    },
}

function ConfigChild:PlayRule(playRule)
    if playRule and type(playRule) == "table" then
        local desc = ""
        for i, j in pairs(playRule) do
            --hasKing false
            local v = tostring(j)
            local json = i .. ":" .. v
            local tem = ""
            for n = 1, #ConfigChild.GoldRule do
                if json == ConfigChild.GoldRule[n].json then
                    tem = ConfigChild.GoldRule[n].toggleTitle
                end
            end
            if tem ~= "" then
                desc = desc .. "，" .. tem
            end
        end
        if desc ~= "" then
            desc =string.sub(desc,4)
        end
        return desc
    else
        return ""
    end
end

ConfigChild.HowToPlayTexts =
{
    [[<size=32><color=#004f3c>一、基本规则</color></size>
<size=28><color=#7c5608>
1)四人游戏，筒、条、万共108张，没有字牌、风牌。
2)可吃、碰、杠，可自摸胡和点炮胡，无一炮多响。
3)有痞子不能胡。
4)过水不碰，过水不胡。
5)见字胡必须自摸。
</color></size>
<size=32><color=#004f3c>二、庄家选择</color></size>
<size=28><color=#7c5608>
1)固定庄家：游戏开始系统随机选一位打牌用户作为庄家。
2)轮换庄家：第二局开始，上局胡牌的用户为庄家。
3)荒庄判定：上一局庄家继续当庄。
</color></size>
<size=32><color=#004f3c>三、赖子选择</color></size>
<size=28><color=#7c5608>
1)翻痞子： 在发完手牌后，从尾墩翻出一张牌作为痞子。
2)赖子判定：痞子点数+1为赖子。如果痞子是9万则1万是赖子。
</color></size>
<size=32><color=#004f3c>四、抬庄规则</color></size>
<size=28><color=#7c5608>
抬庄说明：其他闲家打出的第一张牌与庄家打出的第一张牌一样，则为抬庄成功。
</color></size>
<size=32><color=#004f3c>五、翻倍规则</color></size>
<size=28><color=#7c5608>
1)痞子杠：2倍。
2)赖子杠：4倍。
3)点杠：2倍。
4)碰杠：2倍。
5)暗杠：4倍。
6)杠上开花：2倍。
7)杠上炮：2倍。
</color></size>
<size=32><color=#004f3c>六、牌型规则</color></size>
<size=28><color=#7c5608>
1)小胡：由顺子、坎子、对子湊成的非大胡牌型。
2)大胡：
 ◆ 清一色：同一种花色的牌组成。
 ◆ 将一色：玩家手上每一张牌都由2、5、8构成，无需成型，可碰牌。
 ◆ 碰碰胡：即四副刻子或杠组成的和牌。
 ◆ 全求人：只剩一张（熟称单调）。
 ◆ 七对：任意花色组成的七对牌。
 ◆ 豪华七对：七对中有一副四张一样的牌。
 ◆ 双豪华七对：七对中有两副四张一样的牌。
</color></size>
<size=32><color=#004f3c>七、漏碰规则</color></size>
<size=28><color=#7c5608>
过水不碰，必须再次动一次手牌后才能碰牌。
</color></size>
<size=32><color=#004f3c>八、赖子规则</color></size>
<size=28><color=#7c5608>
1)赖子可以当任何牌来用，但不可充当某张牌去碰和杠，赖子不可碰杠赖
子。当可以打出，打出算“赖子杠”，并补一张牌。
2)痞子必须打出，留在手中不可以胡牌（即两张不算将，三张不算坎），
打出后算痞子杠，并补一张牌。
3)痞子必须打出，留在手中不可以胡牌（即两张不算将，三张不算坎），
打出后算痞子杠，并补一张牌。
4)禁止养痞：拿到开局第一张翻牌的痞子，强制扛出。
</color></size>
<size=32><color=#004f3c>三、计分规则</color></size>
<size=28><color=#7c5608>
1)普通计分:
 ◆ 屁胡：点炮者2分，其他两家1分
 ◆ 小血：每家3分
 ◆ 大血：每家5分
 ◆ 清一色/将一色/碰碰胡/七对：捉炮每家5分，自摸X2
 ◆ 全求人：每家5分
2)牌型组合:
 ◆ 清一色碰碰胡、碰碰胡全求人、碰碰胡将一色、清一色七对：点炮每
 家10分，自摸x2
 ◆ 清一色暗四坎、清一色全求人、将一色全求人：点炮每家20分，
 自摸x2
 ◆ 三大胡牌型在双大胡牌型分上x2
3)最终计分:
底分*赢家倍数*本人倍数=输家付出倍数。
 ◆ 封顶：超出封顶后只需要付出封顶分数。
 ◆ 当三家输分都达到并超过封顶分时，则称为金顶。输分按金顶分数。
 ◆ 开房时钩选钻石顶后，家家满金顶即升为钻石顶。
</color></size>]],--湖北恩施麻将
    [[<size=32><color=#004f3c>一、基本规则</color></size>
<size=28><color=#7c5608>
1)四人游戏，筒、条、万共108张，没有字牌、风牌。
2)可吃、碰、杠，可自摸胡和点炮胡，无一炮多响。
3)有痞子不能胡。
4)过水不碰，过水不胡。
5)见字胡必须自摸。
</color></size>
<size=32><color=#004f3c>二、庄家选择</color></size>
<size=28><color=#7c5608>
1)固定庄家：游戏开始系统随机选一位打牌用户作为庄家。
2)轮换庄家：第二局开始，上局胡牌的用户为庄家。
3)荒庄判定：上一局庄家继续当庄。
</color></size>
<size=32><color=#004f3c>三、赖子选择</color></size>
<size=28><color=#7c5608>
1)翻痞子： 在发完手牌后，从尾墩翻出一张牌作为痞子。
2)赖子判定：痞子点数+1为赖子。如果痞子是9万则1万是赖子。
</color></size>
<size=32><color=#004f3c>四、抬庄规则</color></size>
<size=28><color=#7c5608>
抬庄说明：其他闲家打出的第一张牌与庄家打出的第一张牌一样，则为抬庄成功。
</color></size>
<size=32><color=#004f3c>五、翻倍规则</color></size>
<size=28><color=#7c5608>
1)痞子杠：2倍。
2)赖子杠：4倍。
3)点杠：2倍。
4)碰杠：2倍。
5)暗杠：4倍。
6)杠上开花：2倍。
7)杠上炮：2倍。
</color></size>
<size=32><color=#004f3c>六、牌型规则</color></size>
<size=28><color=#7c5608>
1)小胡：由顺子、坎子、对子湊成的非大胡牌型。
2)大胡：
 ◆ 清一色：同一种花色的牌组成。
 ◆ 将一色：玩家手上每一张牌都由2、5、8构成，无需成型，可碰牌。
 ◆ 碰碰胡：即四副刻子或杠组成的和牌。
 ◆ 全求人：只剩一张（熟称单调）。
 ◆ 七对：任意花色组成的七对牌。
 ◆ 豪华七对：七对中有一副四张一样的牌。
 ◆ 双豪华七对：七对中有两副四张一样的牌。
</color></size>
<size=32><color=#004f3c>七、漏碰规则</color></size>
<size=28><color=#7c5608>
过水不碰，必须再次动一次手牌后才能碰牌。
</color></size>
<size=32><color=#004f3c>八、赖子规则</color></size>
<size=28><color=#7c5608>
1)赖子可以当任何牌来用，但不可充当某张牌去碰和杠，赖子不可碰杠赖
子。当可以打出，打出算“赖子杠”，并补一张牌。
2)痞子必须打出，留在手中不可以胡牌（即两张不算将，三张不算坎），
打出后算痞子杠，并补一张牌。
3)痞子必须打出，留在手中不可以胡牌（即两张不算将，三张不算坎），
打出后算痞子杠，并补一张牌。
4)禁止养痞：拿到开局第一张翻牌的痞子，强制扛出。
</color></size>
<size=32><color=#004f3c>三、计分规则</color></size>
<size=28><color=#7c5608>
1)普通计分:
 ◆ 屁胡：点炮者2分，其他两家1分
 ◆ 小血：每家3分
 ◆ 大血：每家5分
 ◆ 清一色/将一色/碰碰胡/七对：捉炮每家5分，自摸X2
 ◆ 全求人：每家5分
2)牌型组合:
 ◆ 清一色碰碰胡、碰碰胡全求人、碰碰胡将一色、清一色七对：点炮每
 家10分，自摸x2
 ◆ 清一色暗四坎、清一色全求人、将一色全求人：点炮每家20分，
 自摸x2
 ◆ 三大胡牌型在双大胡牌型分上x2
3)最终计分:
底分*赢家倍数*本人倍数=输家付出倍数。
 ◆ 封顶：超出封顶后只需要付出封顶分数。
 ◆ 当三家输分都达到并超过封顶分时，则称为金顶。输分按金顶分数。
 ◆ 开房时钩选钻石顶后，家家满金顶即升为钻石顶。
</color></size>]],--八痞四赖
}

return ConfigChild
