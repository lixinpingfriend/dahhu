local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --血战到底
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":4",toggleType = 1,toggleTitle = "4局",addJson = "\"isDoubleQuan\":false",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",addJson = "\"isDoubleQuan\":false",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":16",toggleType = 1,toggleTitle = "16局",addJson = "\"isDoubleQuan\":false",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":1",toggleType = 1,toggleTitle = "1圈",addJson = "\"isDoubleQuan\":true",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":2",toggleType = 1,toggleTitle = "2圈",addJson = "\"isDoubleQuan\":true",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":3",toggleType = 1,toggleTitle = "3圈",addJson = "\"isDoubleQuan\":true",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "人数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"PlayerNum\":4",toggleType = 1,toggleTitle = "4人玩法",toggleIsOn = true},
                    {disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "3人玩法",toggleIsOn = false,clickSmallShow = "1_1"},
                    {disable = false,json = "\"PlayerNum\":2",toggleType = 1,toggleTitle = "2人玩法",toggleIsOn = false,clickSmallShow = "1_1"},
                }
            }
        },
        {
            tag = {togglesTile = "自摸:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ZiMoType\":1",toggleType = 1,toggleTitle = "自摸加底",toggleIsOn = true},
                    {disable = false,json = "\"ZiMoType\":2",toggleType = 1,toggleTitle = "自摸加番",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "点杠花:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"DianGangHua\":true",toggleType = 1,toggleTitle = "算点炮",toggleIsOn = true},
                    {disable = false,json = "\"DianGangHua\":false",toggleType = 1,toggleTitle = "算自摸",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"HuanSanZhang\":true",toggleType = 2,toggleTitle = "换三张",toggleIsOn = true},
                    {disable = false,json = "\"MenQingZhongZhang\":true",toggleType = 2,toggleTitle = "门清中张",toggleIsOn = true},
                    {disable = false,json = "\"TianDiHu\":true",toggleType = 2,toggleTitle = "天地胡",toggleIsOn = true},
                    {disable = false,json = "\"DaiYaoJiuJiang\":true",toggleType = 2,toggleTitle = "带幺九将对",toggleIsOn = true},
                    {disable = false,json = "\"HuJiaoZhuanYi\":1",toggleType = 2,toggleTitle = "呼叫转移",toggleIsOn = true},
                    {disable = false,json = "\"PingHuJiePao\":true",toggleType = 2,toggleTitle = "平胡接炮",toggleIsOn = true,smallShow = "1_1",smallShowType = 1},
                },
            }
        },
        {
            tag = {togglesTile = "封顶:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"FengDing\":2",toggleType = 1,toggleTitle = "2番封顶",toggleIsOn = false},
                    {disable = false,json = "\"FengDing\":3",toggleType = 1,toggleTitle = "3番封顶",toggleIsOn = true},
                    {disable = false,json = "\"FengDing\":4",toggleType = 1,toggleTitle = "4番封顶",toggleIsOn = false},
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
            tag = {togglesTile = "",rowNum = 4, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"PayType\":1",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"PayType\":0",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false},
                    {disable = false,json = "\"PayType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType, ruleTable)
            if ruleTable.isDoubleQuan then
                local prices =
                {
                    ["1"] = 
                    {   
                        ["12"] = 15,["13"] = 10,["14"] = 8,
                        ["02"] = 30,["03"] = 30,["04"] = 30,
                        ["22"] = 30,["23"] = 30,["24"] = 30,
                    },
                    ["2"] = 
                    {
                        ["12"] = 25,["13"] = 17,["14"] = 13,
                        ["02"] = 50,["03"] = 50,["04"] = 50,
                        ["22"] = 50,["23"] = 50,["24"] = 50,
                    },
                    ["3"] = 
                    {
                        ["12"] = 40,["13"] = 27,["14"] = 20,
                        ["02"] = 80,["03"] = 80,["04"] = 80,
                        ["22"] = 80,["23"] = 80,["24"] = 80,
                    },
                }
                return prices[roundCount .. ""][payType .. "" .. playerCount]
            else
                local prices =
                {
                    ["4"] = 
                    {   
                        ["12"] = 10,["13"] = 7,["14"] = 5,
                        ["02"] = 20,["03"] = 20,["04"] = 20,
                        ["22"] = 20,["23"] = 20,["24"] = 20,
                    },
                    ["8"] = 
                    {
                        ["12"] = 15,["13"] = 10,["14"] = 8,
                        ["02"] = 30,["03"] = 30,["04"] = 30,
                        ["22"] = 30,["23"] = 30,["24"] = 30,
                    },
                    ["16"] = 
                    {
                        ["12"] = 25,["13"] = 17,["14"] = 13,
                        ["02"] = 50,["03"] = 50,["04"] = 50,
                        ["22"] = 50,["23"] = 50,["24"] = 50,
                    },
                }
                return prices[roundCount .. ""][payType .. "" .. playerCount]
            end
        end,
        isXueLiuCH = true,
        isDingQue = true,
        pnShowResult = true,
        wanfaCustomShow = true,
        isXueZhanDD = true,
        view = "tablerenshouxuezhandaodi_view",
        controller = "tablexuezhandaodi_controller",
        use3dcontroller = true,
        useBriefOneGameResult = true,  ---是否使用简略小结算
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
    [[<size=32><color=#004f3c>一.麻将数量</color></size>
    <size=28>
    1）麻将共136张牌，包括：万、条、筒、东、南、西、北、中、发、白
    </size>
    <size=32><color=#004f3c>二.基础规则</color></size>
    <size=28>
    1）第一局随机庄家，之后谁胡谁庄，一炮多响时，放炮的人当庄，其他情况下轮庄
    2）不可吃牌
    3）可碰
    4）有过碰限制，同圈内不能碰同张
    5）可明杠
    6）可暗杠
    7）可接杠，接杠不接碰后不可杠
    8）杠分立刻结算，流局也正常结算	
     
    </size>
    <size=32><color=#004f3c>三.胡牌规则</color></size>
    <size=28>
    1）可自摸
    2）可接炮，可一炮多响。（有过胡限制，同圈过胡所有牌）
    3）可抢杠胡，按照放炮计算
    </size>
    <size=32><color=#004f3c>四.花牌规则</color></size>
    <size=28>
    1）花牌:中发白为花牌
    2）补花:打出花牌可以补摸一张牌
    </size>
    <size=32><color=#004f3c>五.钻牌规则</color></size>
    <size=28>
    1）钻牌:发牌后翻一张牌，这张牌的上一个数，就是钻牌。
    2）钻牌功能：钻牌可以当任何牌来用，只能在手里组牌用，可以打出去，不能被吃碰杠。
    3）红中配:红中牌可以作为钻牌的替代牌
    </size>
    <size=32><color=#004f3c>六.计分规则</color></size>
    <size=28>
    1）补花:花的数量为3/5/7/8/9/10/11/12时对应的加分为，1/2/3/4/5/6/7/8分
    2）明杠/接杠1花，暗杠2花
    3）胡牌：+1分
    4）庄家：输赢多1分
    5）天胡：+3分
    6）地胡：+3分
    7）十三乱：+1分
    8）七星十三乱：+4分
    9）七对：+1分
    10）硬七对：+4分
    11）双七对：+8分
    12）碰碰胡：+1分
    13）硬碰碰胡：+4分
    14）清一色：+1分
    15）顺清一色：+1分
    16）硬顺清一色：+4分
    17）全幺：+1分
    18）跑风：每跑风一圈，额外多+2分，跑风时别人胡牌，则额外赔给3家对应的跑风分数
    </size>]]
}


ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1）麻将共136张牌，包括：万、条、筒、东、南、西、北、中、发、白
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）第一局随机庄家，之后谁胡谁庄，一炮多响时，放炮的人当庄，其他情况下轮庄
2）不可吃牌
3）可碰
4）有过碰限制，同圈内不能碰同张
5）可明杠
6）可暗杠
7）可接杠，接杠不接碰后不可杠
8）杠分立刻结算，流局也正常结算	
 
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）可自摸
2）可接炮，可一炮多响。（有过胡限制，同圈过胡所有牌）
3）可抢杠胡，按照放炮计算
</size>
<size=32><color=#004f3c>四.花牌规则</color></size>
<size=28>
1）花牌:中发白为花牌
2）补花:打出花牌可以补摸一张牌
</size>
<size=32><color=#004f3c>五.钻牌规则</color></size>
<size=28>
1）钻牌:发牌后翻一张牌，这张牌的上一个数，就是钻牌。
2）钻牌功能：钻牌可以当任何牌来用，只能在手里组牌用，可以打出去，不能被吃碰杠。
3）红中配:红中牌可以作为钻牌的替代牌
</size>
<size=32><color=#004f3c>六.计分规则</color></size>
<size=28>
1）补花:花的数量为3/5/7/8/9/10/11/12时对应的加分为，1/2/3/4/5/6/7/8分
2）明杠/接杠1花，暗杠2花
3）胡牌：+1分
4）庄家：输赢多1分
5）天胡：+3分
6）地胡：+3分
7）十三乱：+1分
8）七星十三乱：+4分
9）七对：+1分
10）硬七对：+4分
11）双七对：+8分
12）碰碰胡：+1分
13）硬碰碰胡：+4分
14）清一色：+1分
15）顺清一色：+1分
16）硬顺清一色：+4分
17）全幺：+1分
18）跑风：每跑风一圈，额外多+2分，跑风时别人胡牌，则额外赔给3家对应的跑风分数
</size>]]
}

return ConfigChild
