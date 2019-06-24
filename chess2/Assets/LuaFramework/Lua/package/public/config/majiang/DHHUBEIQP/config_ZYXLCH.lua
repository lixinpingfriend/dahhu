local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --血流成河
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
        --{
        --    tag = { togglesTile = "结算:", rowNum = 3 },
        --    list = {
        --        {
        --            { disable = false, json = "\"settleType\":0", toggleType = 1, toggleTitle = "积分结算", toggleIsOn = true, refreshUI = true},
        --            { disable = false, json = "\"settleType\":1", toggleType = 1, toggleTitle = "金币辅助结算", toggleIsOn = false, goldSet = true, refreshUI = true, goldSetVal1 = 50, goldSetVal2 = 1500 },
        --        }
        --    }
        --},
        {
            tag = {togglesTile = "人数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"PlayerNum\":4",toggleType = 1,toggleTitle = "4人玩法",toggleIsOn = true},
                }
            }
        },
        {
            tag = {togglesTile = "漂分:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"Piao\":1",toggleType = 1,toggleTitle = "漂1",toggleIsOn = true},
                    {disable = false,json = "\"Piao\":2",toggleType = 1,toggleTitle = "漂2",toggleIsOn = false},
                    {disable = false,json = "\"Piao\":3",toggleType = 1,toggleTitle = "漂3",toggleIsOn = false},
                    {disable = false,json = "\"Piao\":5",toggleType = 1,toggleTitle = "漂5",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"HuanSanZhang\":true",toggleType = 2,toggleTitle = "换三张",toggleIsOn = true,clickTip = "勾选后有换三张流程"},
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

        isXueLiuCH = true,
        pnShowResult = true,
        wanfaCustomShow = true,
        view = "tablexueliuchenghe_view",
        controller = "tablexueliuchenghe_controller",
        use3dcontroller = true,
        table3dStyles = {1,2},

    },
}


ConfigChild.GoldRule = {
    {disable = false,json = "ZiMoJiaDi:true",toggleType = 1,toggleTitle = "自摸加底",toggleIsOn = true,clickTip = "自摸胡牌时加1倍底分"},
    {disable = false,json = "ZiMoJiaDi:false",toggleType = 1,toggleTitle = "自摸加番",toggleIsOn = false,clickTip = "自摸胡牌时加1番"},
    {disable = false,json = "DianGangHua:true",toggleType = 1,toggleTitle = "算点炮",toggleIsOn = true,clickTip = "点杠杠上花胡牌只有点杠玩家出分"},
    {disable = false,json = "DianGangHua:false",toggleType = 1,toggleTitle = "算自摸",toggleIsOn = false,clickTip = "点杠杠上花胡牌算自摸三家都要出分"},
    {disable = false,json = "HuanSanZhang:true",toggleType = 2,toggleTitle = "换三张",toggleIsOn = true,clickTip = "勾选后有换三张流程"},
    {disable = false,json = "MenQingZhongZhang:true",toggleType = 2,toggleTitle = "门清中张",toggleIsOn = false,clickTip = "勾选后有门清中张算分"},
    {disable = false,json = "TianDiHu:true",toggleType = 2,toggleTitle = "天地胡",toggleIsOn = false,clickTip = "勾选后有天胡地胡算分"},
    {disable = false,json = "DaiYaoJiuJiang:true",toggleType = 2,toggleTitle = "带幺九将对",toggleIsOn = false,clickTip = "勾选后有幺九和将对算分"},
    {disable = false,json = "FengDing:2",toggleType = 1,toggleTitle = "2番封顶",toggleIsOn = false},
    {disable = false,json = "FengDing:3",toggleType = 1,toggleTitle = "3番封顶",toggleIsOn = true},
    {disable = false,json = "FengDing:4",toggleType = 1,toggleTitle = "4番封顶",toggleIsOn = false},


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

ConfigChild.PlayRuleText = {
    [[血流换三张,4番封顶]]
}

ConfigChild.HowToPlayGoldTexts =
{
    [[

<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1）麻将共108张牌，包括:万、条、筒;
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）可碰牌，可开杠，不可吃牌;
2）可自摸，可接炮，可以一炮多响;
3）必须缺门才能胡牌，开局定缺;
4）当有玩家胡牌后，不结束游戏，该玩家的牌变为听牌状态，不可改章
只能摸牌打牌，有胡时自动胡；可暗杠，已碰的牌可以补杠;
5）最后四张牌，有胡必须胡，不能过;
6）刮风:
◆直杠:手中有暗刻，其他玩家打出相同牌，暗刻玩家接杠;直杠收取
放杠玩家2倍底分;
◆弯杠:手中有明刻，即碰的三张，自己摸到第四张补杠;弯杠收取其
余三家各1倍底分;
7）下雨:手中有四张没有碰，玩家选择杠牌；暗杠收取三家各2倍底分;
8）查大叫:流局时没叫的玩家赔给有叫的玩家和已胡牌的玩家最大可能
番数（大叫），并退回所有刮风下雨所得;
9）自摸加底:玩家自摸胡牌时，除获得相应牌型计分外，还要收取未胡
牌玩家1倍底分;
10）自摸加番:玩家自摸胡牌时，胡牌牌型上额外加1番;
11）门清:玩家胡牌时，没有碰杠，没有明杠，胡牌牌型上加1番;
12）中张:玩家胡牌时，所有牌没有一和九，胡牌牌型上加1番;
13）点杠花“自摸”:玩家点杠后杠上花胡牌时，按自摸算并收三家分数;
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）自摸:满足胡牌限制即可;
2）接炮:满足胡牌限制即可;
</size>
<size=32><color=#004f3c>四.胡牌类型</color></size>
<size=28>
1）平胡:0番;
2）对对胡:1番;四副刻子加一对将;
3）将对:1番;由2、5、8组成的对对胡;
4）清一色:2番;胡牌时，都是同一种花色;
5）带幺九:2番;每个刻子、顺子、将牌都必须包含1或9;
6）七对:2番;胡牌时结算，都是对子，没有碰杠;
7）龙七对:3番;胡牌时结算，都是对子，手上有四张相同的牌（没有杠
出）;
8）天胡:5番;庄家起手摸第一张胡牌;
9）地胡:5番;闲家摸第一张胡牌;
</size>
<size=32><color=#004f3c>五.额外算番</color></size>
<size=28>
1）杠上花:1番;杠牌后补牌并胡牌;
2）杠上炮:1番;玩家杠牌补牌后打出一张牌，被其他玩家胡牌;
3）抢杠胡:1番;玩家补杠时，其他玩家可以抢杠胡;
4）扫底胡:1番;最后一张牌自摸胡牌;
5）海底胡:1番;最后一张牌点炮胡牌;
6）金沟胡:1番;对对胡单吊将牌，并且其它牌都碰、杠出;
7）门清:1番;胡牌时，没有碰，没有明杠;
8）中张:1番;胡牌时，所有牌都没有1和9;
9）根:1番;有四张相同的牌，不论碰杠都算，可叠加;
</size>]]
}




ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1） 麻将共108张牌，包括:万、条、筒;
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1） 可碰牌，可开杠，不可吃牌;
2） 可自摸，可接炮，可以一炮多响;
3） 必须缺门才能胡牌，开局无定缺;
4） 坐庄:第一局房主坐庄；上一局最先胡牌的人为庄家，若此时是一
    炮多响则点炮玩家为庄家；若无任何人胡牌则逆时针轮庄;
5） 当有玩家胡牌后，不结束游戏，该玩家的牌变为听牌状态，不可
    改章只能摸牌打牌，有胡时自动胡；可暗杠，已碰的牌可以补杠;
6） 最后四张牌，有胡必须胡，不能过;
7） 吃包子:流局时没叫的玩家赔给有叫的玩家和已胡牌的玩家最大可
    能番数;
8） 捉花猪:游戏结算时，未胡牌玩家手中有筒、万、条三种花色的牌
    就算捉花猪，要赔给已听牌和已胡牌玩家3倍最大胡牌分数;
9） 门清:玩家胡牌时，没有碰杠，没有明杠，胡牌牌型上加1番;
10）天胡:不允许天胡;
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1） 自摸:满足胡牌限制即可;
2） 接炮:满足胡牌限制即可;
</size>
<size=32><color=#004f3c>四.胡牌类型</color></size>
<size=28>
1） 基础胡:3番;
2） 对对胡:5番;四副刻子加一对将;
3） 清一色:8番;胡牌时，都是同一种花色;
4） 清一色对对胡:12番;
5） 明杠:1番;
6） 接杠:1番;
7） 暗杠:2番;
</size>]]
}

return ConfigChild
