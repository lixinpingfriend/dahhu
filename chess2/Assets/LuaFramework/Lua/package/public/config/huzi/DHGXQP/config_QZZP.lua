local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --全州字牌
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":10",toggleType = 1,toggleTitle = "10局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":20",toggleType = 1,toggleTitle = "20局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":30",toggleType = 1,toggleTitle = "30局",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "选王:",rowNum = 5},
            list =
            {
                {
                    {disable = false,json = "\"WangPaiNum\":0",toggleType = 1,toggleTitle = "无王",toggleIsOn = true, clickSmallShow = "3_0"},
                    {disable = false,json = "\"WangPaiNum\":1",toggleType = 1,toggleTitle = "单王",toggleIsOn = false, clickSmallShow = "3_1", clickBigShow = "3_2"},
                    {disable = false,json = "\"WangPaiNum\":2",toggleType = 1,toggleTitle = "双王",toggleIsOn = false, clickSmallShow = "3_1", clickBigShow = "3_2"},
                    {disable = false,json = "\"WangPaiNum\":3",toggleType = 1,toggleTitle = "三王",toggleIsOn = false, clickSmallShow = "3_1", clickBigShow = "3_2"},
                    {disable = false,json = "\"WangPaiNum\":4",toggleType = 1,toggleTitle = "四王",toggleIsOn = false, clickSmallShow = "3_2", clickBigShow = "3_2"},
				}
			},
		},
		{
            tag = {togglesTile = "人数:",rowNum = 3},
            list =
            {
                {
                  	{disable = false,json = "\"PlayerNum\":2",toggleType = 1,toggleTitle = "两人PK",toggleIsOn = false, clickSmallShow = "2_1"},
                	{disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "三人激情",toggleIsOn = true, clickSmallShow = "2_2", clickBigShow = "2_4"},
                    {disable = false,json = "\"PlayerNum\":4",toggleType = 1,toggleTitle = "四人(坐醒)",toggleIsOn = false, clickSmallShow = "2_2", clickBigShow = "2_5"},
                }
            }
		},
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"XingType\":0",toggleType = 1,toggleTitle = "跟醒",toggleIsOn = true},
					{disable = false,json = "\"XingType\":1",toggleType = 1,toggleTitle = "翻醒",toggleIsOn = false},
					{disable = false,json = "\"ShuangXing\":true",toggleType = 2,toggleTitle = "双醒",toggleIsOn = false},
                }
            }
		},
		{
            tag = {togglesTile = "限胡:", bigShow="3_2", rowNum = 3},
            list =
            {
                {
					{ disable = false, json = "\"XianHuType\":0", toggleType = 1, toggleTitle = "有王必自摸", toggleIsOn = true,smallShow= "3_1",smallShowType = 1},
                    { disable = false, json = "\"XianHuType\":1", toggleType = 1, toggleTitle = "按番限胡", toggleIsOn = true,smallShow= "3_2",smallShowType = 1},
                    { disable = false, json = "\"XianHuType\":2", toggleType = 1, toggleTitle = "按王限胡", toggleIsOn = false,smallShow= "3_2",smallShowType = 1},
                }
            }
        },
        {
            tag = { togglesTile = "可选:", rowNum = 4},
            list =
            {
                {
                    { disable = false, json = "\"FengDing\":300", toggleType = 2, toggleTitle = "300封顶", toggleIsOn = false,},
                    { disable = false, json = "\"WangPai\":true", toggleType = 2, toggleTitle = "亡牌", toggleIsOn = false, smallShow= "2_1",smallShowType = 1},
                    { disable = false, json = "\"HongZhuanHei\":true", toggleType = 2, toggleTitle = "红转朱黑", toggleIsOn = false},
                    { disable = false, json = "\"HuPaiRule\":21", toggleType = 2, toggleTitle = "21胡起胡", toggleIsOn = false, smallShow= "2_1",smallShowType = 1},
                }
            }
		},
		{
            tag = {togglesTile = "换位:", bigShow="2_4", rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"SeatRule\":1",toggleType = 1,toggleTitle = "不换位",toggleIsOn = true},
                    {disable = false,json = "\"SeatRule\":2",toggleType = 1,toggleTitle = "每局换位",toggleIsOn = false},
                }
            }
		},
		{
            tag = { togglesTile = "少人:", bigShow="2_4", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"StartNow\":true", toggleType = 2, toggleTitle = "允许少人时提前开局", toggleIsOn = true },
                }
            }
		},
		{
            tag = { togglesTile = "少人:", bigShow="2_5", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"StartNow\":true", toggleType = 2, toggleTitle = "允许少人时提前开局", toggleIsOn = true },
                }
            }
        },
        {
            tag = { togglesTile = "定位:", bigShow="2_4", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"CheckIPAddress\":true", toggleType = 2, toggleTitle = "相同IP检测", toggleIsOn = false },
                    { disable = false, json = "SafeDistance", toggleType = 2, toggleTitle = "GPS检测", toggleIsOn = false ,dropDown = "50,100,300", dropDefault = 1,dropAddStr = "米"
                    ,addJson = "\"NeedOpenGPS\":true",clickTip = "距离小于X米的玩家不能加入房间"},
                }
            }
		},
		{
            tag = { togglesTile = "定位:", bigShow="2_5", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"CheckIPAddress\":true", toggleType = 2, toggleTitle = "相同IP检测", toggleIsOn = false },
                    { disable = false, json = "SafeDistance", toggleType = 2, toggleTitle = "GPS检测", toggleIsOn = false ,dropDown = "50,100,300", dropDefault = 1,dropAddStr = "米"
                    ,addJson = "\"NeedOpenGPS\":true",clickTip = "距离小于X米的玩家不能加入房间"},
                }
            }
        },

        {
            tag = {togglesTile = "语音:",bigShow="322_2222",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ShiShiYuYin\":true",toggleType = 2,toggleTitle = "开启实时语音",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "",rowNum = 3, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"PayType\":1",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
					{disable = false,json = "\"PayType\":0",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false,clickTip = "扣除钻石数以牌局结算人数为准"},
					--{disable = false,json = "\"PayType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                 
                },
            }
        },
        
		caculPrice = function(roundCount, playerNum, payType, bankerType)
            return ConfigChild.caculate_price_guilin(roundCount, playerNum, payType, bankerType)
        end,
        addJson = ""
    },
}

function ConfigChild.caculate_price_guilin(roundCount, playerNum, payType ,bankerType)
	local pay = 8 * playerNum * roundCount / 10

    if payType == 1 then
        pay = pay / playerNum
    end
    return pay
end

ConfigChild.HowToPlayTexts =
{

[[
<size=32><color=#004f3c>一．基本规则</color></size>

1.小写的一到十各4张，共40张，大写壹到拾各4张，共40张，一共80张牌，另外还有4张王牌；
2.王牌：王牌可以代替任何牌进行游戏，玩家起手抓到的王牌不用明示，在之后摸牌过程中抓到的王牌需要明示；手中有王牌的玩家，只能自摸，王牌不能打出，只能代替牌；
3.黄庄：手中有王牌的玩家需要赔付给没有王牌的玩家；一张王牌赔付赌注5倍，两张则是10倍；

<size=32><color=#004f3c>二．牌型介绍</color></size>

啸：起手有两张，再自摸一张相同牌叫啸；
坎：起手3个相同的牌，一坎牌不能拆散与其它牌组合；
倾：自己摸到的第四张，啸就变成了倾；
跑：第4张牌如果是摸到的，可以跑桌面上碰的牌，但桌面上碰的牌不能跑任何人手中打出的牌；				
碰：当别人打或摸的牌自己手中有一对，则可碰，碰牌后将牌放到桌上明示给其他人；
恰牌：上家出的或者自己摸的牌，示众后没有人碰牌或者跑牌，则可以与自己手中的牌组合成一句话，称为恰牌；				
顺子：手中的牌依据规则组合成相连的三张，比如小三、四、五；
大小三搭：俗称半边，是两张大字一张小字或者两张小字一张大字组成；
下伙：吃牌时，如果手中有吃的牌，必须一起放出来；
过张：自己或别人打出的牌未碰或未吃，下次出现这张牌则不能进行吃碰；但可偎可胡；
	
<size=32><color=#004f3c>三．特殊规则</color></size>

王钓：在手上有王牌的情况下，必须得跑了一条龙或者除了一条龙的其他牌都成一处牌后，手上只剩下一张王牌的时候，才能王钓；4番
王钓王：王钓时又钓到一个王牌，叫王钓王；8番
王闯：在手上有两个王牌的情况下，其他牌都成一处牌后，手上只剩两张王牌的时候，即可以王闯；8番
王闯王：王闯时又遇到一个王牌，叫王闯王；16番
王炸：在手上有三个王牌的情况下，其他牌都成一处牌后，手上只剩下三张王牌的情况，称为王炸；16番
王炸王：王炸时又炸到一个王牌，叫王炸王；32番
红胡王钓：红字大于等于10张的王钓：8番
红胡王闯：红字大于等于10张的王闯：16番
黑胡王钓：没有红字的王钓；16番
黑胡王闯：没有红字的王闯；32番
点胡王钓：仅有1个红字王钓；12番
点胡王闯：仅有1个红字王闯；24番 												
		
<size=32><color=#004f3c>四．玩法名堂</color></size>

自摸：胡牌时，所胡的那张牌是玩家自己从牌墩上摸的；2番
点胡：仅有1个红字；3番
红胡：10个以上的红字；2番
黑胡：手中没有红字；4番
红转点：大于等于13小于等于15个红字；3番
红转黑：15个以上红字；4番
按番限胡：一王要2番，两王要4番，3王要8番，4王16番才能胡牌；
按王限胡：一王两王可以自摸，3王4王只能王钓，王闯，王炸；										

<size=32><color=#004f3c>五．计分规则</color></size>

胡数计算：
碰：（大写字）计3胡 ，（小写字）计1胡
坎、啸、臭啸：（大写字）计6胡，（小写字）计3胡
跑：（大写字）计9胡，（小写字）计6胡
倾：（大写字）计12胡，（小写字）计9胡
壹贰叁 ：计6胡
一二三：计3胡
贰柒拾：计6胡
二七十：计3胡
		
<size=32><color=#004f3c>六．结算规则</color></size>

1.15胡起胡，15胡2囤，15胡之后每3胡息加1囤；如：15胡起胡，3胡1囤，16-18胡加1囤，19-21胡为加2囤，22-24胡加3囤，以此类推；				
2.翻醒：胡牌后的下一张牌，往后顺推一张，即为醒，手上有一张醒牌加一囤；，若是海底胡，即胡的牌墩最后一张，则翻醒也是最后一张牌；如：翻出来的是小六，那醒牌就是小七；			
3.跟醒：胡牌后的那一张牌，就是醒牌，手上有一张醒牌加1囤；如：胡的牌是小六，那醒牌就是小六。
]],
}

return ConfigChild
