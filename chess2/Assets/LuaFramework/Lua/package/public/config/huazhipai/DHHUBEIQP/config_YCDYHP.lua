local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { 	--当阳翻精
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
					{ disable = false, json = "\"YouHuBiHu\":true", toggleType = 2, toggleTitle = "有胡必胡", toggleIsOn = false,},
					{ disable = false, json = "\"BuKeJiePao\":true", toggleType = 2, toggleTitle = "自摸胡", toggleIsOn = false,},
					{ disable = false, json = "\"BuDaiMaoKan\":true", toggleType = 2, toggleTitle = "不带毛坎", toggleIsOn = false,},
					{ disable = false, json = "\"HaiDiHu\":true", toggleType = 2, toggleTitle = "海底胡加分", toggleIsOn = false,},
					{ disable = false, json = "\"ShangBaHu\":true", toggleType = 2, toggleTitle = "上8胡", toggleIsOn = false,},
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
                    {disable = false,json = "\"ShiShiYuYin\":true",toggleType = 2,toggleTitle = "开启实时语音",toggleIsOn = false},
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
        addJson = "\"PlayerNum\":3,\"FanJing\":true,"
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
	<size=32><color=#004f3c>一.基础规则</color></size>
	<size=28>
	1）上大人，孔乙己，化三千，七十土，尔小生，八九子，佳作仁，
	福禄寿24个字，每个字4张，共96张牌。其中每局上为固定精牌，另外一张  由翻牌决定（翻牌排除上，且翻的牌是存在于牌局中）
	2）每句话第1个字为红色牌，第2个字为绿色牌，第3个字为黑色牌
	3）游戏共3人，第一局房主坐庄，庄家胡牌连庄，其他情况下轮庄
	4）最后3张，轮流摸到手里不能打牌出去，能胡自动胡。
   
	</size>
	<size=32><color=#004f3c>二.胡数计算规则</color></size>
	<size=28>
	1）精牌，1张4胡，上4胡
	2）对，对一对2胡
	3）坎，手中一坎4胡
	4）毛，一毛6胡
	</size>
	<size=32><color=#004f3c>三.计分规则</color></size>
	<size=28>
	1）20胡=1倍底分
	2）30胡=2倍底分
	3）40胡=3倍底分
	4）50胡=4倍底分
	5）一棵树=3倍底分
	6）2原句=2倍底分
	7）胡牌带红=1倍底分
	8）带毛=2倍底分
	9）带坎=1倍底分
	10）海底捞=1倍底分，最后3张胡牌
	</size>
]],
}

return ConfigChild