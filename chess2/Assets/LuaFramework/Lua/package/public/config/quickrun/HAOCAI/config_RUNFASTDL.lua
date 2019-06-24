local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --经典玩法
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
					{disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = true},
					{disable = false,json = "\"roundCount\":12",toggleType = 1,toggleTitle = "12局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":16",toggleType = 1,toggleTitle = "16局",toggleIsOn = false},
                },
            }
        },
         {
             tag = {togglesTile = "人数:",rowNum = 4},
             list =
             {
                 {
					{disable = false,json = "\"playerCount\":2",toggleType = 1,toggleTitle = "2人",toggleIsOn = true},
					{disable = false,json = "\"playerCount\":3",toggleType = 1,toggleTitle = "3人",toggleIsOn = false},
					{disable = false,json = "\"playerCount\":4",toggleType = 1,toggleTitle = "4人",toggleIsOn = false},
					{disable = false,json = "\"playerCount\":5",toggleType = 1,toggleTitle = "5人",toggleIsOn = false},
                 }
             }
         },
        {
            tag = {togglesTile = "玩法:",rowNum = 2},
            list =
            {
                {
                    {disable = true,json = "\"cover_single\":true",toggleType = 2,toggleTitle = "报单必出大",toggleIsOn = true},
					{disable = false,json = "\"allowClaimSpring\":true",toggleType = 2,toggleTitle = "报春",toggleIsOn = false},
					{disable = false,json = "\"notify_card_cnt\":true",toggleType = 2,toggleTitle = "显示剩余牌数",toggleIsOn = false},
					--{disable = false,json = "\"notify_card_cnt\":true",toggleType = 1,toggleTitle = "显示牌数",toggleIsOn = false},
                },
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
                    { disable = false, json = "\"CheckIPAddress\":true", toggleType = 2, toggleTitle = "相同IP检测", toggleIsOn = true },
                    { disable = false, json = "SafeDistance", toggleType = 2, toggleTitle = "GPS检测", toggleIsOn = true ,dropDown = "50,100,300", dropDefault = 2,dropAddStr = "米",addJson = "\"NeedOpenGPS\":true",clickTip = "距离小于X米的玩家不能加入房间"},
                }
            }
        },
        {
            tag = {togglesTile = "",rowNum = 4, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"payType\":0",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"payType\":1",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false},
                    {disable = false,json = "\"payType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return ConfigChild.caculate_price_guilin(roundCount, playerCount, payType, bankerType)
        end,
        configJson = "{\"game_type\":2,\"HallID\":0,\"GameType\":2,\"wanfa\":\"dali\",\"allow_pass\":\"true\","
    },
}

function ConfigChild.caculate_price_guilin(roundCount, playerNum, payType ,bankerType)
	local aaPrice
	if roundCount == 8 then
		aaPrice = 6
	elseif roundCount == 12 then
		aaPrice = 9
	else	--16局
		aaPrice = 12
	end
	local pay = aaPrice * playerNum

    if payType == 1 then
        pay = pay / playerNum
    end
    return pay
end

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一、基本规则</color></size>
<size=28><color=#7c5608>
1）参与人数:2人、3人、4人、5人.
2）首发：第一局拿最小的牌首发.
3）输赢条件：第一个出完手中所有牌的玩家本局获胜，每局只有1个赢家.
4）使用牌数：
	◆ 10张玩法：使用52张牌,扣除两张王牌.
5）出牌规则：
	◆ 游戏者逆时针轮流出牌，如果一轮之中其他游戏者都"要不起"，
则最后一次出牌者继续出牌.
	◆ 下家报单时,如果要出单张，那么必须出最大的单张，其余的牌
则不能选中.
</color></size>
<size=32><color=#004f3c>二、牌型介绍</color></size>
<size=28><color=#7c5608>
1）单张:可以是手中的任意一张牌.
2）对子:两张牌点相同的牌,两张牌的花色可以不同.
3）连对:三对或三对以上相连的牌,如:556677.
4）三张:三张牌点相同的牌
5）顺子:三张或三张以上牌点连续的牌.例如:345,QKA等.
6）炸弹,四张或四张以上牌点相同的牌,如:6666、8888
</color></size>
<size=32><color=#004f3c>三、牌型规则</color></size>
<size=28><color=#7c5608>
1）点数大小规则:2 > A > K > Q > J > 10 > 9 > 8 > 7 > 6 > 5 > 4 > 3
2）顺子从最小从3开始，到A结束，则最小的顺子是345，最大的顺子是QKA.
3）单张、对子、三同张、连对、顺子等牌型,直接根据牌点确定大小,但要求出牌的数量必须相同;例：上家出5张顺子，那么下家出的顺子也必须是5张并且最大的那张要大于上家最大的那张.
4）炸弹大于以上所有牌型,炸弹之间按点数比大小.
3）除炸弹外其余牌型不能互压,同种牌型比较点数大小,相同牌型出牌数量也必须一致.
</color></size>
<size=32><color=#004f3c>四、分数计算</color></size>
<size=28><color=#7c5608>
1）当玩家胜利时，根据输家手中剩余牌数计分，1张牌1分，剩余1张牌也要计分.
2）如果玩家在该局游戏中一张牌都没有出，则需要翻倍扣分，例：10张玩法，A玩家张牌都没有出，则需要在结算时扣除10*2=20分.
3）胜利者赢得所有输家的分数.
</color></size>
]],
}

return ConfigChild
