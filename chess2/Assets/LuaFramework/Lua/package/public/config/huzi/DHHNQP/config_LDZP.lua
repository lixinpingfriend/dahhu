local ConfigChild = {}

ConfigChild.createRoomTable = {
    {
        --大冶字牌
        {
            tag = {togglesTile = "结算:", rowNum = 3},

            list = {
                {
                    {
                        disable = false,
                        json = '"roundCount":100',
                        toggleType = 1,
                        toggleTitle = "100胡息结算",
                        toggleIsOn = true
                    },
                    {
                        disable = false,
                        json = '"roundCount":200',
                        toggleType = 1,
                        toggleTitle = "200胡息结算",
                        toggleIsOn = false
                    }
                }
            }
        },

        {
            tag = {togglesTile = "人数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"PlayerNum\":2",toggleType = 1,toggleTitle = "2人",toggleIsOn = false},
                    {disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "3人",toggleIsOn = true, clickBigShow = "2_2"},
                },
            }
        },
        
        
        {
            tag = {togglesTile = "封顶:", rowNum = 3},

            list = {
                {
                    {disable = false, json = '"FengDing":200', toggleType = 1, toggleTitle = "200胡息", toggleIsOn = true},
                    {
                        disable = false,
                        json = '"FengDing":400',
                        toggleType = 1,
                        toggleTitle = "400胡息",
                        toggleIsOn = false
                    }
                }
            }
        },
        {
            tag = {togglesTile = "玩法:", rowNum = 3},

            list = {
                {
                    {disable = false, json = '"DaTuo":0', toggleType = 1, toggleTitle = "不打坨", toggleIsOn = true},
                    {
                        disable = false,
                        json = '"DaTuoSanFan":true',
                        toggleType = 1,
                        toggleTitle = "坨对坨3番",
                        toggleIsOn = false,
                        addJson = '"DaTuo":1'
                    },
                    {
                        disable = false,
                        json = '"DaTuoSanFan":false',
                        toggleType = 1,
                        toggleTitle = "坨对坨4番",
                        toggleIsOn = false,
                        addJson = '"DaTuo":1'
                    }
                }
            }
        },
        {
            tag = {togglesTile = "接炮:", rowNum = 3},

            list = {
                {
                    {
                        disable = false,
                        json = '"JiePaoFengDing":0',
                        toggleType = 1,
                        toggleTitle = "不封顶",
                        toggleIsOn = true
                    },
                    {
                        disable = false,
                        json = '"JiePaoFengDing":100',
                        toggleType = 1,
                        toggleTitle = "100封顶",
                        toggleIsOn = false
                    }
                }
            }
        },
        {
            tag = {togglesTile = "底分:", rowNum = 5},

            list = {
                {
                    {disable = false, json = '"DiFen":100', toggleType = 1, toggleTitle = "0.1", toggleIsOn = false,addJson="\"Ratio\":0.001"},
                    {disable = false, json = '"DiFen":200', toggleType = 1, toggleTitle = "0.2", toggleIsOn = true,addJson="\"Ratio\":0.001"},
                    {disable = false, json = '"DiFen":300', toggleType = 1, toggleTitle = "0.3", toggleIsOn = false,addJson="\"Ratio\":0.001"},
                    {disable = false, json = '"DiFen":500', toggleType = 1, toggleTitle = "0.5", toggleIsOn = false,addJson="\"Ratio\":0.001"},
                    {disable = false, json = '"DiFen":1000', toggleType = 1, toggleTitle = "1", toggleIsOn = false,addJson="\"Ratio\":0.001"}
                }
            }
        },
        {
            tag = {togglesTile = "换位:", rowNum = 3, bigShow = "2_2"},

            list = {
                {
                    {disable = false, json = '"SeatRule":1', toggleType = 1, toggleTitle = "不换位", toggleIsOn = true},
                    {disable = false, json = '"SeatRule":2', toggleType = 1, toggleTitle = "每局换位", toggleIsOn = false}
                }
            }
        },
        {
            tag = {togglesTile = "定位:", rowNum = 3},
            list = {
                {
                    {
                        disable = false,
                        json = '"CheckIPAddress":true',
                        toggleType = 2,
                        toggleTitle = "相同IP检测",
                        toggleIsOn = false
                    },
                    {
                        disable = false,
                        json = "SafeDistance",
                        toggleType = 2,
                        toggleTitle = "GPS检测",
                        toggleIsOn = false,
                        dropDown = "50,100,300",
                        dropDefault = 1,
                        dropAddStr = "米",
                        addJson = '"NeedOpenGPS":true',
                        clickTip = "距离小于X米的玩家不能加入房间"
                    }
                }
            }
        },
        {
            tag = {togglesTile = "", rowNum = 3, isPay = true},

            list = {

                {
                    --不同toggle 组
                    {disable = false, json = '"PayType":1', toggleType = 1, toggleTitle = "AA支付", toggleIsOn = true},
                    {
                        disable = false,
                        json = '"PayType":0',
                        toggleType = 1,
                        toggleTitle = "房主支付",
                        toggleIsOn = false,
                        clickTip = "扣除钻石数以牌局结算人数为准"
                    },
                    --{disable = false, json = '"PayType":2', toggleType = 1, toggleTitle = "大赢家支付", toggleIsOn = false}
                }
            }
        },
        caculPrice = function(roundCount, playerNum, payType, bankerType)
            return ConfigChild.caculate_priceXX(roundCount, playerNum, payType, bankerType)
        end,
        addJson = '"PlayerNum11":3,"KuaiSuChi121":true,\"LiPai\":2,'
    },
    {
        --大冶字牌
        {
            tag = {togglesTile = "结算:", rowNum = 3},

            list = {
                {
                    {
                        disable = false,
                        json = '"roundCount":100',
                        toggleType = 1,
                        toggleTitle = "15胡起胡，满百结算",
                        toggleIsOn = true
                    },
                }
            }
        },

        {
            tag = {togglesTile = "人数:", rowNum = 3},

            list = {
                {
                    {
                        disable = false,
                        json = '"PlayerNum":2',
                        toggleType = 1,
                        toggleTitle = "2人",
                        toggleIsOn = false,clickSmallShow="2_2"
                    },
                    {
                        disable = false,
                        json = '"PlayerNum":3',
                        toggleType = 1,
                        toggleTitle = "3人",
                        toggleIsOn = true,clickBigShow = "2_2"
                    },
                }
            }
        },
        
        {
            tag = {togglesTile = "封顶:", rowNum = 3},

            list = {
                {
                    {disable = false, json = '"FengDing":200', toggleType = 1, toggleTitle = "200胡息", toggleIsOn = true},
                    {
                        disable = false,
                        json = '"FengDing":400',
                        toggleType = 1,
                        toggleTitle = "400胡息",
                        toggleIsOn = false
                    }
                }
            }
        },
       
        {
            tag = {togglesTile = "换位:", rowNum = 3,bigShow = "2_2"},

            list = {
                {
                    {disable = false, json = '"SeatRule":1', toggleType = 1, toggleTitle = "不换位", toggleIsOn = true},
                    {disable = false, json = '"SeatRule":2', toggleType = 1, toggleTitle = "每局换位", toggleIsOn = false}
                }
            }
        },
        


        {
            tag = {togglesTile = "定位:", rowNum = 3},
            list = {
                {
                    {
                        disable = false,
                        json = '"CheckIPAddress":true',
                        toggleType = 2,
                        toggleTitle = "相同IP检测",
                        toggleIsOn = false
                    },
                    {
                        disable = false,
                        json = "SafeDistance",
                        toggleType = 2,
                        toggleTitle = "GPS检测",
                        toggleIsOn = false,
                        dropDown = "50,100,300",
                        dropDefault = 1,
                        dropAddStr = "米",
                        addJson = '"NeedOpenGPS":true',
                        clickTip = "距离小于X米的玩家不能加入房间"
                    }
                }
            }
        },

        {
            tag = {togglesTile = "高级:", rowNum = 3},
            list = {
                {
                    {
                        disable = false,
                        json = '"KuaiSuChi":true',
                        toggleType = 2,
                        toggleTitle = "快速吃牌",
                        toggleIsOn = false
                    },
                }
            }
        },

        {
            tag = {togglesTile = "", rowNum = 4, isPay = true},

            list = {

                {
                    --不同toggle 组
                    {disable = false, json = '"PayType":1', toggleType = 1, toggleTitle = "AA支付", toggleIsOn = true},
                    {
                        disable = false,
                        json = '"PayType":0',
                        toggleType = 1,
                        toggleTitle = "房主支付",
                        toggleIsOn = false,
                        clickTip = "扣除钻石数以牌局结算人数为准"
                    },
                    {disable = false, json = '"PayType":2', toggleType = 1, toggleTitle = "大赢家支付", toggleIsOn = false}
                }
            }
        },
        caculPrice = function(roundCount, playerNum, payType, bankerType)
            return ConfigChild.caculate_priceXX(roundCount, playerNum, payType, bankerType)
        end,
        addJson = '"PlayerNum11":2,"JiePaoFengDing1":0,'
    }
}

function ConfigChild.caculate_priceXX(roundCount, playerNum, payType, bankerType)
	local nCost = 0
	if payType == 1 then
		if playerNum == 2 then
			return 8
		else 
			return 5
		end
	else
		return 15
	end
    
    return 
end

ConfigChild.HowToPlayTexts = {
    [[
    <size=32><color=#004f3c>一.  基本规则</color></size>

    1）满15胡息才能胡牌；
    2）手里的与桌上的牌组合有7方门子；
    3）可以胡过张、别人要碰或跑的牌；
    4）不能胡任何人提或偎的牌；
    5）有炮必接；
    6）首局房主坐庄，之后赢家坐庄，流局庄家扣10胡息，并且连庄；
    7）坨对坨：总结算玩家相减得到的积分*3，坨对不打坨，总结算玩家
    相减得到的积分*2；
    
    <size=32><color=#004f3c>二.  名堂玩法</color></size>
    
    1）自摸：所胡那张牌是自己从墩牌上摸上来的，加一番；
    2）一点红：只有一个红字，加一番；
    3）一条扁：红字一句话（提、偎、臭偎、坎、碰、吃、绞），加一番；
    4）乌胡；胡牌时手上全是黑字，等于100胡息；
    5）海底胡：玩家所胡的牌是牌墩的最后一张牌，加一番；
    6）十三红：13张及以上的红牌，等于100胡息；
    7）十红：10张到13张以下的红牌，加一番；
    8）30胡：等于30胡，算100胡息；
    9）20胡：等于20胡息，加一番；
    10）天胡：庄家所胡牌为亮张牌（最后起上来那张牌），等于100胡息；
    11）地胡：庄家打出的第一张牌放炮；等于100胡息；
    12）放炮：扣相等分，放炮者单局最多扣100胡息；
    
    <size=32><color=#004f3c>三.  牌型介绍</color></size>
    
    1）一句话：手中的牌依据规则组合成相连的三张，比如小三、四、五，
    称为一句话；

    2）一坎牌：手中3个相同的牌，一坎牌不能拆散与其它牌组合；

    3）一对牌：手中2个相同的牌为1对；

    4）一提牌：4张相同的牌为一提（不可拆散与其它牌组合），在进第
    一张牌之前，必须放到桌面示众；

    5）绞牌：当1对大牌与1张相同的小牌，或者1对小牌与1张相同的大
    牌组合时，成为绞牌。如1对小九与1张大玖。
    
    <size=32><color=#004f3c>四.  玩法规则</color></size>
    
    1）碰牌：当别人打或摸的牌自己手中有一对，则可碰，碰牌后将牌放
    到桌上明示给其他人；
    2）吃牌：上家出的或者自己摸的牌，明示后没有人碰牌或者跑牌，则
    自己与自己手中的牌组合成一句话，放到桌上，称为吃牌；
    3）忍碰：当有机会吃碰时，自己却没有碰的牌，称为忍碰，
    之后再不能碰该牌；调整牌序后可以胡；
    4）偎：抓牌时，如果所抓的牌正好是手中的一对牌，则必须将牌
    由手上放到桌面上；
    5）臭偎：忍碰之后，又偎牌，称为臭偎；
    6）提牌：提牌时，如果所摸的牌正好是手中的一坎牌，则必须将
    牌由手上放到桌上；
    7）跑牌：当别人打或摸的牌自己手中有一坎，或者是已经偎的
    牌，则可以跑牌，跑牌后将牌放到桌面。
    8）重跑：当跑的牌超过1次时，之后的不用再打牌；
    9）过张：当有机会吃碰时，自己没有吃或者碰的牌，称为过张
    ，过张后，不能再吃碰该牌。			

]],
    [[
    <size=32><color=#004f3c>一.  基本规则</color></size>

    1）满15胡息才能胡牌；
    2）手里的与桌上的牌组合有7方门子；
    3）可以胡过张、别人要碰或跑的牌；
    4）不能胡任何人提或偎的牌；
    5）有炮必接；
    6）首局房主坐庄，之后赢家坐庄，流局庄家扣10胡息，并且连庄；
    7）坨对坨：总结算玩家相减得到的积分*3，坨对不打坨，总结算玩家
    相减得到的积分*2；
    
    <size=32><color=#004f3c>二.  名堂玩法</color></size>
    
    1）自摸：所胡那张牌是自己从墩牌上摸上来的，加一番；
    2）一点红：只有一个红字，加一番；
    3）一条扁：红字一句话（提、偎、臭偎、坎、碰、吃、绞），加一番；
    4）乌胡；胡牌时手上全是黑字，等于100胡息；
    5）海底胡：玩家所胡的牌是牌墩的最后一张牌，加一番；
    6）十三红：13张及以上的红牌，等于100胡息；
    7）十红：10张到13张以下的红牌，加一番；
    8）30胡：等于30胡，算100胡息；
    9）20胡：等于20胡息，加一番；
    10）天胡：庄家所胡牌为亮张牌（最后起上来那张牌），等于100胡息；
    11）地胡：庄家打出的第一张牌放炮；等于100胡息；
    12）放炮：扣相等分，放炮者单局最多扣100胡息；
    
    <size=32><color=#004f3c>三.  牌型介绍</color></size>
    
    1）一句话：手中的牌依据规则组合成相连的三张，比如小三、四、五，
    称为一句话；

    2）一坎牌：手中3个相同的牌，一坎牌不能拆散与其它牌组合；

    3）一对牌：手中2个相同的牌为1对；

    4）一提牌：4张相同的牌为一提（不可拆散与其它牌组合），在进第
    一张牌之前，必须放到桌面示众；

    5）绞牌：当1对大牌与1张相同的小牌，或者1对小牌与1张相同的大
    牌组合时，成为绞牌。如1对小九与1张大玖。
    
    <size=32><color=#004f3c>四.  玩法规则</color></size>
    
    1）碰牌：当别人打或摸的牌自己手中有一对，则可碰，碰牌后将牌放
    到桌上明示给其他人；
    2）吃牌：上家出的或者自己摸的牌，明示后没有人碰牌或者跑牌，则
    自己与自己手中的牌组合成一句话，放到桌上，称为吃牌；
    3）忍碰：当有机会吃碰时，自己却没有碰的牌，称为忍碰，
    之后再不能碰该牌；调整牌序后可以胡；
    4）偎：抓牌时，如果所抓的牌正好是手中的一对牌，则必须将牌
    由手上放到桌面上；
    5）臭偎：忍碰之后，又偎牌，称为臭偎；
    6）提牌：提牌时，如果所摸的牌正好是手中的一坎牌，则必须将
    牌由手上放到桌上；
    7）跑牌：当别人打或摸的牌自己手中有一坎，或者是已经偎的
    牌，则可以跑牌，跑牌后将牌放到桌面。
    8）重跑：当跑的牌超过1次时，之后的不用再打牌；
    9）过张：当有机会吃碰时，自己没有吃或者碰的牌，称为过张
    ，过张后，不能再吃碰该牌。			

]]
}

return ConfigChild
