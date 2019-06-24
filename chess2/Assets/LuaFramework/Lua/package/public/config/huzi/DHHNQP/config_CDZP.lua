local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { 	--常德全名堂
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":16",toggleType = 1,toggleTitle = "16局",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "封顶:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"FengDing\":0",toggleType = 1,toggleTitle = "不封顶",toggleIsOn = true},
                    {disable = false,json = "\"FengDing\":100",toggleType = 1,toggleTitle = "单局100分",toggleIsOn = false},
                    {disable = false,json = "\"FengDing\":200",toggleType = 1,toggleTitle = "单局200分",toggleIsOn = false},
				}
			},
		},
		{
            tag = { togglesTile = "冲囤:", rowNum = 3 },
            list = {
                {
					{disable = false,json = "\"DiFen\":0",toggleType = 1,toggleTitle = "不充囤",toggleIsOn = true},
					{disable = false,json = "\"DiFen\":1",toggleType = 1,toggleTitle = "充1囤",toggleIsOn = false},
					{disable = false,json = "\"DiFen\":2",toggleType = 1,toggleTitle = "充2囤",toggleIsOn = false},
					{disable = false,json = "\"DiFen\":3",toggleType = 1,toggleTitle = "充3囤",toggleIsOn = false},
					{disable = false,json = "\"DiFen\":4",toggleType = 1,toggleTitle = "充4囤",toggleIsOn = false},
					{disable = false,json = "\"DiFen\":5",toggleType = 1,toggleTitle = "充5囤",toggleIsOn = false},
                }
            }
		},
		{
			tag = {togglesTile = "名堂:",rowNum = 4},
			list =
			{
				{
					{disable = true,json = "\"buyongguan1\":true",toggleType = 2,toggleTitle = "天胡:6",toggleIsOn = true},
					{disable = true,json = "\"buyongguan2\":true",toggleType = 2,toggleTitle = "地胡:6",toggleIsOn = true},
					{disable = true,json = "\"buyongguan3\":true",toggleType = 2,toggleTitle = "海胡:6",toggleIsOn = true},
					{disable = true,json = "\"buyongguan4\":true",toggleType = 2,toggleTitle = "红胡:3",toggleIsOn = true},
					{disable = true,json = "\"buyongguan5\":true",toggleType = 2,toggleTitle = "乌胡:8",toggleIsOn = true},
					{disable = true,json = "\"buyongguan6\":true",toggleType = 2,toggleTitle = "点胡:6",toggleIsOn = true},
					{disable = true,json = "\"buyongguan7\":true",toggleType = 2,toggleTitle = "大胡:8+n",toggleIsOn = true},
					{disable = true,json = "\"buyongguan8\":true",toggleType = 2,toggleTitle = "小胡:10+n",toggleIsOn = true},
					{disable = true,json = "\"buyongguan9\":true",toggleType = 2,toggleTitle = "对子胡:8",toggleIsOn = true},
					{disable = true,json = "\"buyongguan10\":true",toggleType = 2,toggleTitle = "自摸:1囤",toggleIsOn = true},
				}
			}
		},
        {
            tag = { togglesTile = "可选:", rowNum = 4},
            list =
            {
                {
					{ disable = false, json = "\"TingHu\":true", toggleType = 2, toggleTitle = "听胡:6", toggleIsOn = false,},
					{ disable = false, json = "\"ShuaHou\":true", toggleType = 2, toggleTitle = "耍猴:8", toggleIsOn = false,},
					{ disable = false, json = "\"TuanYuan\":true", toggleType = 2, toggleTitle = "大团圆:8", toggleIsOn = false,},
					{ disable = false, json = "\"HangHangHu\":true", toggleType = 2, toggleTitle = "行行息:8", toggleIsOn = false,},
					{ disable = false, json = "\"HuangFan\":true", toggleType = 2, toggleTitle = "黄番:2倍", toggleIsOn = false,},
					{ disable = false, json = "\"JiaHangHang\":true", toggleType = 2, toggleTitle = "假行行:4", toggleIsOn = false,},
					{ disable = false, json = "\"SiQiHong\":true", toggleType = 2, toggleTitle = "四七红:2", toggleIsOn = false,},
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
        addJson = "\"WanFa\":1,\"PlayerNum\":3,"
	},
	
	{ 	--常德红黑点
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":16",toggleType = 1,toggleTitle = "16局",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "封顶:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"FengDing\":0",toggleType = 1,toggleTitle = "不封顶",toggleIsOn = true},
                    {disable = false,json = "\"FengDing\":20",toggleType = 1,toggleTitle = "单局20分",toggleIsOn = false},
                    {disable = false,json = "\"FengDing\":40",toggleType = 1,toggleTitle = "单局40分",toggleIsOn = false},
				}
			},
		},
		{
            tag = { togglesTile = "冲囤:", rowNum = 3 },
            list = {
                {
                    {disable = false,json = "\"DiFen\":0",toggleType = 1,toggleTitle = "不充囤",toggleIsOn = true},
					{disable = false,json = "\"DiFen\":1",toggleType = 1,toggleTitle = "充1囤",toggleIsOn = false},
					{disable = false,json = "\"DiFen\":2",toggleType = 1,toggleTitle = "充2囤",toggleIsOn = false},
					{disable = false,json = "\"DiFen\":3",toggleType = 1,toggleTitle = "充3囤",toggleIsOn = false},
					{disable = false,json = "\"DiFen\":4",toggleType = 1,toggleTitle = "充4囤",toggleIsOn = false},
					{disable = false,json = "\"DiFen\":5",toggleType = 1,toggleTitle = "充5囤",toggleIsOn = false},
                }
            }
		},
		{
			tag = {togglesTile = "名堂:",rowNum = 4},
			list =
			{
				{
					{disable = true,json = "\"buyongguan1\":true",toggleType = 2,toggleTitle = "红胡:2",toggleIsOn = true},
					{disable = true,json = "\"buyongguan2\":true",toggleType = 2,toggleTitle = "点胡:3",toggleIsOn = true},
					{disable = true,json = "\"buyongguan3\":true",toggleType = 2,toggleTitle = "红鸟:4",toggleIsOn = true},
					{disable = true,json = "\"buyongguan4\":true",toggleType = 2,toggleTitle = "乌胡:5",toggleIsOn = true},
					{disable = true,json = "\"buyongguan5\":true",toggleType = 2,toggleTitle = "自摸:1囤",toggleIsOn = true},
				}
			}
		},
        {
            tag = { togglesTile = "可选:", rowNum = 4},
            list =
            {
                {
					{ disable = false, json = "\"DuiZiHu\":true", toggleType = 2, toggleTitle = "对子胡:4", toggleIsOn = false,},
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
            tag = {togglesTile = "语音:",bigShow="322_2222",rowNum = 3},
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
        addJson = "\"WanFa\":2,\"PlayerNum\":3,"
	},
	
	{ 	--常德多红对
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":16",toggleType = 1,toggleTitle = "16局",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "封顶:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"FengDing\":0",toggleType = 1,toggleTitle = "不封顶",toggleIsOn = true},
                    {disable = false,json = "\"FengDing\":60",toggleType = 1,toggleTitle = "单局60分",toggleIsOn = false},
                    {disable = false,json = "\"FengDing\":80",toggleType = 1,toggleTitle = "单局80分",toggleIsOn = false},
				}
			},
		},
		{
            tag = { togglesTile = "冲囤:", rowNum = 3 },
            list = {
                {
                    {disable = false,json = "\"DiFen\":0",toggleType = 1,toggleTitle = "不充囤",toggleIsOn = true},
					{disable = false,json = "\"DiFen\":1",toggleType = 1,toggleTitle = "充1囤",toggleIsOn = false},
					{disable = false,json = "\"DiFen\":2",toggleType = 1,toggleTitle = "充2囤",toggleIsOn = false},
					{disable = false,json = "\"DiFen\":3",toggleType = 1,toggleTitle = "充3囤",toggleIsOn = false},
					{disable = false,json = "\"DiFen\":4",toggleType = 1,toggleTitle = "充4囤",toggleIsOn = false},
					{disable = false,json = "\"DiFen\":5",toggleType = 1,toggleTitle = "充5囤",toggleIsOn = false},
                }
            }
		},
		{
			tag = {togglesTile = "名堂:",rowNum = 4},
			list =
			{
				{
					{disable = true,json = "\"buyongguan1\":true",toggleType = 2,toggleTitle = "点胡:4",toggleIsOn = true},
					{disable = true,json = "\"buyongguan2\":true",toggleType = 2,toggleTitle = "红胡:2+n",toggleIsOn = true},
					{disable = true,json = "\"buyongguan3\":true",toggleType = 2,toggleTitle = "乌胡:6",toggleIsOn = true},
					{disable = true,json = "\"buyongguan4\":true",toggleType = 2,toggleTitle = "对子胡:6",toggleIsOn = true},
					{disable = true,json = "\"buyongguan5\":true",toggleType = 2,toggleTitle = "自摸:1囤",toggleIsOn = true},
				}
			}
		},
        {
            tag = { togglesTile = "可选:", rowNum = 4},
            list =
            {
                {
					{ disable = false, json = "\"TianHu\":true", toggleType = 2, toggleTitle = "天胡:4", toggleIsOn = false,},
					{ disable = false, json = "\"DiHu\":true", toggleType = 2, toggleTitle = "地胡:4", toggleIsOn = false,},
					{ disable = false, json = "\"HaiHu\":true", toggleType = 2, toggleTitle = "海胡:4", toggleIsOn = false,},
					{ disable = false, json = "\"TingHu\":true", toggleType = 2, toggleTitle = "听胡:4", toggleIsOn = false,},
					{ disable = false, json = "\"HuangFan\":true", toggleType = 2, toggleTitle = "黄番:2倍", toggleIsOn = false,},
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
            tag = {togglesTile = "语音:",bigShow="322_2222",rowNum = 3},
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
        addJson = "\"WanFa\":3,\"PlayerNum\":3,"
	},
}

function ConfigChild.caculate_price_guilin(roundCount, playerNum, payType ,bankerType)
	local pay = 1.25 * 3 * roundCount

    if payType == 1 then
        pay = pay / 3
    end
    return pay
end

ConfigChild.HowToPlayTexts =
{
[[
	<size=32><color=#004f3c>一. 牌型介绍</color></size>	
	
	1.一句话：手中的牌依据规则组合成相连的三张，称为一句话。
	2.一坎牌：手中3个相同的牌，一坎牌不能拆散与其它牌组合；
	3.一对牌：手中2个相同的牌为1对；
	4.一提牌：4张相同的牌为一提（不可拆散与其它牌组合）；
	5.绞牌：当1对大牌与1张相同的小牌，或者1对小牌与1张相同的大牌组合
	时，成为绞牌。
	
	<size=32><color=#004f3c>二. 玩法规则</color></size>
	
	1.碰牌：当别人打或摸的牌自己手中有一对，则可碰；
	2.吃牌：上家出的或者自己摸的牌，明示后没有人碰牌或者跑牌，则自己
	与自己手中的牌组合成一句话，放到桌上，称为吃牌；
	3.忍碰：当有机会吃碰时，自己却没有碰的牌，称为忍碰，之后再不能碰
	该牌；调整牌序后可以胡；
	4.偎：抓牌时，如果所抓的牌正好是手中的一对牌，则必须将牌由手上放
	到桌面上；
	5.臭偎：忍碰之后，又偎牌，称为臭偎，臭偎必须明示；
	6.提牌：提牌时，如果所摸的牌正好是手中的一坎牌，则必须将牌由手上
	放到桌上；
	7.跑牌：当别人打或摸的牌自己手中有一坎，或者是已经偎的牌，则可以
	跑牌，跑牌后将牌放到桌面。或者当别人从墩上摸的牌，是自己已经碰的
	牌，则同样可以跑牌；
	8.重跑：当跑的牌超过1次时，称为八快。如跑了大伍再跑小六时，称为
	八块重跑，此时不用从手中打牌出去，而要让下家摸牌，不能忍偎和忍跑。
	9.过张：当有机会吃碰时，自己没有吃或者碰的牌，称为过张，过张后，
	不能再吃碰该牌。
	10.比牌：比牌：当吃的牌手中还有时，必须要将手中的这张牌再组合并
	放到桌面，称为比牌；如手中有小1.2.3.4.5，以4.5组合吃小3，那么
	手中的小3，必须以1.2.3的组合同时放到桌面；如果玩家符合吃牌的条
	件但达不到比牌的条件，即要比的牌无法和手上剩下的牌组成吃的牌型，
	则不允许吃牌；
	11.一方门子：比如一句话.一绞牌.一碰.一提.一偎，一跑称为1方门子；
	当有跑或提牌时，一对牌可以成为1方门子，叫做将，跑或提牌时，必须
	有一对将，否则就要单钓将；
	12.每进一张牌，必须打出一张，重跑除外。
														
	<size=32><color=#004f3c>三. 玩法名堂</color></size>
		
	全名堂玩法
	
	红胡：胡牌时大于或等于十张红字，每多一个红字多一番，起始3番
	乌胡：胡牌时，手中没有红字；8番
	点胡：胡牌时只有一张红字；6番
	对子胡：7方门子中全部是碰牌、提牌、跑牌、臭偎牌、对子组成的；8番
	大胡：大字>=18张，每多1张大字加1番），起始8番
	小胡：小字>=16张（以16张为基数（10番），每多1张小字加1番；10+番
	海胡：玩家所胡的牌是墩中最后的一只牌，即海底胡；6番
	天胡：庄家起手胡牌（庄家起手三提五坎也算天胡）；6番
	地胡:闲家所胡的牌为亮张牌（闲家起手三提五坎也算地胡）；6番
	大团圆:胡牌时有大字4个小字4个，如4个壹4个一，8番，2个大团圆叫双
	团，16番，三个大团圆为24番；；8+番
	行行息:胡牌时每门房子都有息，番数：8番；
	四七红:胡牌时只有4张或者7张红字，番数均为2番
	耍猴:胡牌时，手中只有一张牌；8番
	听胡:没有进牌就胡牌，重跑不算进字（天胡和地胡都是听胡）；6番
	假行行:6方门子有息，加一对，为假行行；番数：4番；
	黄番:胡牌之前有过黄庄，总囤数乘以2，有N黄番则2+N，在胡牌之后重
	新计算；2倍
	自摸:胡牌时，所胡的那张牌是玩家自己从牌墩上摸出来的，在原有的
	基础上加1囤（不加番）
	番数：如果有两个或以上名堂的，总番数按各名堂的番数累加。
	
	<size=32><color=#004f3c>四．计分规则</color></size>
		
	   胡数计算：
		碰：大字3胡 ，小字1胡
		坎、偎、臭偎：大字6胡，小字3胡
		跑：大字9胡，小字6胡
		提：大字12胡，小字9胡
		壹贰叁 ：6胡
		一二三：3胡
		贰柒拾：6胡
		二七十：3胡
		
	<size=32><color=#004f3c>五. 结算规则</color></size>
		
	1.计分：基本单位为囤，最小单位为胡（息）；
	2.15胡起胡，3胡增加1囤；
	3.分数=囤数*番数；
	例：玩家以19胡息胡牌，那么囤数应为2（19-15-3余1，不足3，
	不算囤）。
]],

[[
	<size=32><color=#004f3c>一. 牌型介绍</color></size>	
	
	1.一句话：手中的牌依据规则组合成相连的三张，称为一句话。
	2.一坎牌：手中3个相同的牌，一坎牌不能拆散与其它牌组合；
	3.一对牌：手中2个相同的牌为1对；
	4.一提牌：4张相同的牌为一提（不可拆散与其它牌组合）；
	5.绞牌：当1对大牌与1张相同的小牌，或者1对小牌与1张相同的大牌组合
	时，成为绞牌。
	
	<size=32><color=#004f3c>二. 玩法规则</color></size>
	
	1.碰牌：当别人打或摸的牌自己手中有一对，则可碰；
	2.吃牌：上家出的或者自己摸的牌，明示后没有人碰牌或者跑牌，则自己
	与自己手中的牌组合成一句话，放到桌上，称为吃牌；
	3.忍碰：当有机会吃碰时，自己却没有碰的牌，称为忍碰，之后再不能碰
	该牌；调整牌序后可以胡；
	4.偎：抓牌时，如果所抓的牌正好是手中的一对牌，则必须将牌由手上放
	到桌面上；
	5.臭偎：忍碰之后，又偎牌，称为臭偎，臭偎必须明示；
	6.提牌：提牌时，如果所摸的牌正好是手中的一坎牌，则必须将牌由手上
	放到桌上；
	7.跑牌：当别人打或摸的牌自己手中有一坎，或者是已经偎的牌，则可以
	跑牌，跑牌后将牌放到桌面。或者当别人从墩上摸的牌，是自己已经碰的
	牌，则同样可以跑牌；
	8.重跑：当跑的牌超过1次时，称为八快。如跑了大伍再跑小六时，称为
	八块重跑，此时不用从手中打牌出去，而要让下家摸牌，不能忍偎和忍跑。
	9.过张：当有机会吃碰时，自己没有吃或者碰的牌，称为过张，过张后，
	不能再吃碰该牌。
	10.比牌：比牌：当吃的牌手中还有时，必须要将手中的这张牌再组合并
	放到桌面，称为比牌；如手中有小1.2.3.4.5，以4.5组合吃小3，那么
	手中的小3，必须以1.2.3的组合同时放到桌面；如果玩家符合吃牌的条
	件但达不到比牌的条件，即要比的牌无法和手上剩下的牌组成吃的牌型，
	则不允许吃牌；
	11.一方门子：比如一句话.一绞牌.一碰.一提.一偎，一跑称为1方门子；
	当有跑或提牌时，一对牌可以成为1方门子，叫做将，跑或提牌时，必须
	有一对将，否则就要单钓将；
	12.每进一张牌，必须打出一张，重跑除外。
														
	<size=32><color=#004f3c>三. 玩法名堂</color></size>
	
	红黑点

	红胡：胡牌时大于或等于10张红字，小于13张红字；2番
	乌胡：胡牌时，手中没有红字；5番
	点胡：胡牌时只有一张红字；3番：
	红乌：胡牌时大于等于13个红字，4番；
	对子胡：7方门子中全部是碰牌、提牌、跑牌、臭偎牌、对子组成的；4番
	
	<size=32><color=#004f3c>四．计分规则</color></size>
		
	   胡数计算：
		碰：大字3胡 ，小字1胡
		坎、偎、臭偎：大字6胡，小字3胡
		跑：大字9胡，小字6胡
		提：大字12胡，小字9胡
		壹贰叁 ：6胡
		一二三：3胡
		贰柒拾：6胡
		二七十：3胡
		
	<size=32><color=#004f3c>五. 结算规则</color></size>
		
	1.计分：基本单位为囤，最小单位为胡（息）；
	2.15胡起胡，3胡增加1囤；
	3.分数=囤数*番数；
	例：玩家以19胡息胡牌，那么囤数应为2（19-15-3余1，不足3，
	不算囤）。
]],

[[
	<size=32><color=#004f3c>一. 牌型介绍</color></size>	
	
	1.一句话：手中的牌依据规则组合成相连的三张，称为一句话。
	2.一坎牌：手中3个相同的牌，一坎牌不能拆散与其它牌组合；
	3.一对牌：手中2个相同的牌为1对；
	4.一提牌：4张相同的牌为一提（不可拆散与其它牌组合）；
	5.绞牌：当1对大牌与1张相同的小牌，或者1对小牌与1张相同的大牌组合
	时，成为绞牌。
	
	<size=32><color=#004f3c>二. 玩法规则</color></size>
	
	1.碰牌：当别人打或摸的牌自己手中有一对，则可碰；
	2.吃牌：上家出的或者自己摸的牌，明示后没有人碰牌或者跑牌，则自己
	与自己手中的牌组合成一句话，放到桌上，称为吃牌；
	3.忍碰：当有机会吃碰时，自己却没有碰的牌，称为忍碰，之后再不能碰
	该牌；调整牌序后可以胡；
	4.偎：抓牌时，如果所抓的牌正好是手中的一对牌，则必须将牌由手上放
	到桌面上；
	5.臭偎：忍碰之后，又偎牌，称为臭偎，臭偎必须明示；
	6.提牌：提牌时，如果所摸的牌正好是手中的一坎牌，则必须将牌由手上
	放到桌上；
	7.跑牌：当别人打或摸的牌自己手中有一坎，或者是已经偎的牌，则可以
	跑牌，跑牌后将牌放到桌面。或者当别人从墩上摸的牌，是自己已经碰的
	牌，则同样可以跑牌；
	8.重跑：当跑的牌超过1次时，称为八快。如跑了大伍再跑小六时，称为
	八块重跑，此时不用从手中打牌出去，而要让下家摸牌，不能忍偎和忍跑。
	9.过张：当有机会吃碰时，自己没有吃或者碰的牌，称为过张，过张后，
	不能再吃碰该牌。
	10.比牌：比牌：当吃的牌手中还有时，必须要将手中的这张牌再组合并
	放到桌面，称为比牌；如手中有小1.2.3.4.5，以4.5组合吃小3，那么
	手中的小3，必须以1.2.3的组合同时放到桌面；如果玩家符合吃牌的条
	件但达不到比牌的条件，即要比的牌无法和手上剩下的牌组成吃的牌型，
	则不允许吃牌；
	11.一方门子：比如一句话.一绞牌.一碰.一提.一偎，一跑称为1方门子；
	当有跑或提牌时，一对牌可以成为1方门子，叫做将，跑或提牌时，必须
	有一对将，否则就要单钓将；
	12.每进一张牌，必须打出一张，重跑除外。
														
	<size=32><color=#004f3c>三. 玩法名堂</color></size>
		
	多红对
	
	红胡：胡牌时大于或等于十张红字，每多一个红字多一番，起始2番
	乌胡：胡牌时，手中没有红字；6番
	点胡：胡牌时只有一张红字；4番
	对子胡：7方门子中全部是碰牌、提牌、跑牌、臭偎牌、对子组成的；6番
	海胡：玩家所胡的牌是墩中最后的一只牌，即海底胡；4番
	天胡：庄家起手胡牌（庄家起手三提五坎也算天胡）；4番
	地胡：闲家所胡的牌为亮张牌（闲家起手三提五坎也算天胡）；4番
	听胡：没有进牌就胡牌，重跑不算进字（天胡和地胡都是听胡）；4番
	
	<size=32><color=#004f3c>四．计分规则</color></size>
		
	   胡数计算：
		碰：大字3胡 ，小字1胡
		坎、偎、臭偎：大字6胡，小字3胡
		跑：大字9胡，小字6胡
		提：大字12胡，小字9胡
		壹贰叁 ：6胡
		一二三：3胡
		贰柒拾：6胡
		二七十：3胡
		
	<size=32><color=#004f3c>五. 结算规则</color></size>
		
	1.计分：基本单位为囤，最小单位为胡（息）；
	2.15胡起胡，3胡增加1囤；
	3.分数=囤数*番数；
	例：玩家以19胡息胡牌，那么囤数应为2（19-15-3余1，不足3，
	不算囤）。
]],
}

return ConfigChild
