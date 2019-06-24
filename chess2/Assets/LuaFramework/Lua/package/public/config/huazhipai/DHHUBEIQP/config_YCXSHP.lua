local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --兴山上大人
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":4",toggleType = 1,toggleTitle = "4局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "底分:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"DiFen\":1",toggleType = 1,toggleTitle = "1底分",toggleIsOn = true},
					{disable = false,json = "\"DiFen\":2",toggleType = 1,toggleTitle = "2底分",toggleIsOn = false},
					{disable = false,json = "\"DiFen\":3",toggleType = 1,toggleTitle = "3底分",toggleIsOn = false},
					{disable = false,json = "\"DiFen\":5",toggleType = 1,toggleTitle = "5底分",toggleIsOn = false},
				}
			},
		},
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"buyongguan\":2",toggleType = 1,toggleTitle = "按胡计分",toggleIsOn = true},	
				},
				{
					{ disable = false, json = "\"BuKeJiePao\":true", toggleType = 2, toggleTitle = "自摸胡", clickSmallShow="2_1", toggleIsOn = false,},
					{ disable = false, json = "\"ZiMoJiaFen\":true", toggleType = 2, toggleTitle = "自摸有喜", toggleIsOn = false,},
					{ disable = false, json = "\"BuDaiMaoKan\":true", toggleType = 2, toggleTitle = "不带毛坎", toggleIsOn = false,},
					{ disable = false, json = "\"YouHuBiHu\":true", toggleType = 2, toggleTitle = "有胡必胡", toggleIsOn = false,},
					{ disable = false, json = "\"CheAnMao\":true", toggleType = 2, toggleTitle = "扯暗毛", smallShowType = 2,smallShow="2_1", toggleIsOn = false,},
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
            tag = {togglesTile = "语音:", rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ShiShiYuYin\":true",toggleType = 2,toggleTitle = "开启实时语音",toggleIsOn = true},
                }
            }
        },
        {
            tag = {togglesTile = "",rowNum = 4, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"PayType\":1",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
					{disable = false,json = "\"PayType\":0",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false,clickTip = "扣除钻石数以牌局结算人数为准"},
					{disable = false,json = "\"PayType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                },
            }
        },
        
		caculPrice = function(roundCount, playerNum, payType, bankerType)
            return ConfigChild.caculate_price_guilin(roundCount, playerNum, payType, bankerType)
        end,
        addJson = "\"PlayerNum\":3,\"ZuiDiHu\":21,"
    },
}

function ConfigChild.caculate_price_guilin(roundCount, playerNum, payType ,bankerType)
	local pay = 1.25 * playerNum * roundCount
	if roundCount == 4 then
		pay = 5 * playerNum
	elseif roundCount == 8 then
		pay = 10 * playerNum
	end

    if payType == 1 then
        pay = pay / playerNum
    end
    return pay
end

ConfigChild.HowToPlayTexts =
{

[[
	兴山
	<size=32><color=#004f3c>一.基础规则</color></size>
	<size=28>
	1）上大人，孔乙己，化三千，七十土，尔小生，八九子，佳作仁，
	福禄寿24个字，每个字4张，共96张牌。其中上、七、福为精牌
	2）每句话第1个字为红色牌，第2个字为绿色牌，第3个字为黑色牌
	3）游戏共3人，第一局房主坐庄，庄家胡牌连庄，其他情况下轮庄
	4）可吃、可对、可毛、可贴
	</size>
	<size=32><color=#004f3c>二.胡数计算规则</color></size>
	<size=28>
	1）精牌，1张5胡
	2）原句，1句1胡
	3）对，对一对2胡
	4）坎，手中一坎4胡
	5) 毛/贴，一毛或一贴6胡
	</size>
	<size=32><color=#004f3c>三.计分规则</color></size>
	<size=28>
	1）清胡2分：手里不带精牌，11胡分以上胡牌
	2）大清胡4分=手里不带精牌，21胡分以上胡牌
	3）枯胡4分=手里没有上大人、七十土、福禄寿，11胡分以上胡牌
	4）大枯胡8分=手里没有上大人、七十土、福禄寿，21胡分以上胡牌
	5）黑胡8分=手里没有红色牌的对对胡
	6）屁胡1分=21以上胡分以上胡牌
	7）台胡3分=41胡分以上胡牌
	8）台胡番6分=51胡分以上胡牌
	9）对对胡=1倍底分
	</size>
]],
}

return ConfigChild
