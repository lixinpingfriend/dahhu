local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --湘乡字牌
        {
            tag = {togglesTile = "结算:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":100",toggleType = 1,toggleTitle = "100胡息结算",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":200",toggleType = 1,toggleTitle = "200胡息结算",toggleIsOn = false},
                }
            }
        },

        {
            tag = {togglesTile = "人数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"PlayerNum\":2",toggleType = 1,toggleTitle = "2人",toggleIsOn = false},
                    {disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "3人",toggleIsOn = true, clickBigShow = "2_2"}
                },
            }
        },
        

        {
            tag = {togglesTile = "点炮:",rowNum = 3},
            list =
            {
                {
                    {disable = true,json = "\"dianpaohahahah\":1",toggleType = 2,toggleTitle = "可胡放炮",toggleIsOn = true},
                    {disable = true,json = "\"dianpaohahahah\":1",toggleType = 2,toggleTitle = "有炮必接",toggleIsOn = true},
                }
            }
        },  
      
        
        
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"DaTuo\":0",toggleType = 1,toggleTitle = "不打坨",toggleIsOn = true},
                    {disable = false,json = "\"DaTuoSanFan\":true",toggleType = 1,toggleTitle = "坨对坨3番",toggleIsOn = false,addJson = "\"DaTuo\":1"},
                    {disable = false,json = "\"DaTuoSanFan\":false",toggleType = 1,toggleTitle = "坨对坨4番",toggleIsOn = false,addJson = "\"DaTuo\":1"},
                }
            }
        },
        {
            tag = {togglesTile = "底分:",rowNum = 5},
            list =
            {
                {
                    {disable = false,json = "\"DiFen\":100",toggleType = 1,toggleTitle = "0.1",toggleIsOn = false,addJson="\"Ratio\":0.001"},
                    {disable = false,json = "\"DiFen\":200",toggleType = 1,toggleTitle = "0.2",toggleIsOn = false,addJson="\"Ratio\":0.001"},
                    {disable = false,json = "\"DiFen\":300",toggleType = 1,toggleTitle = "0.3",toggleIsOn = false,addJson="\"Ratio\":0.001"},
                    {disable = false,json = "\"DiFen\":500",toggleType = 1,toggleTitle = "0.5",toggleIsOn = false,addJson="\"Ratio\":0.001"},
                    {disable = false,json = "\"DiFen\":1000",toggleType = 1,toggleTitle = "1",toggleIsOn = true,addJson="\"Ratio\":0.001"},
                }
            }
        },
        {
            tag = {togglesTile = "换位:", bigShow="2_2", rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"SeatRule\":1",toggleType = 1,toggleTitle = "不换位",toggleIsOn = true},
                    {disable = false,json = "\"SeatRule\":2",toggleType = 1,toggleTitle = "每局换位",toggleIsOn = false},
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
            tag = {togglesTile = "",rowNum = 3, isPay = true},
            list =
            {
                
                {
                    {disable = false,json = "\"PayType\":1",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"PayType\":0",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false,clickTip = "扣除钻石数以牌局结算人数为准 "},
                    --{disable = false,json = "\"PayType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                },
            }
        },
        caculPrice = function(roundCount, playerNum, payType, bankerType)
            return ConfigChild.caculate_priceXX(roundCount, playerNum, payType, bankerType)
        end,
        addJson = "\"PlayerNum11\":3,\"LiPai\":2,"
    },
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

ConfigChild.HowToPlayTexts =
{

[[
    <size=32><color=#004f3c>一. 胡牌规则</color></size>
			
    1）满15胡息才能胡牌；
    
    2）手里的与桌上的牌组合有7方门子；
    
    3）可以胡过张、别人要碰或跑的牌；
    
    4）不能胡任何人提或偎的牌；
    
    5）有炮必接，点炮玩家独付；
    
    6）满100胡牌局结束，不论局数；
    
    7）打坨：坨对坨，总结算时，两玩家相减后得到的积分*4；
       坨对不打坨，总结算时，两玩家相减后得到的积分*2。

<size=32><color=#004f3c>二. 名堂玩法</color></size>
																		
    1）自摸：所胡那张牌是自己从牌墩上摸的，胡息加10；
    
    2）放炮：别人从手中打出来的牌，胡息加10；
    
    3）红胡：胡牌时大于等于10张红字，小于13张红字，胡息翻2倍；
    
    4）红乌：胡牌时大于等于13张红字，算百胡
      （放炮、自摸为110胡，平胡算100胡）；
    
    5）天胡：庄家胡的牌为亮张牌，算110胡
      （注：天胡100胡，自摸10胡）；
    
    6）地胡：庄家第一张牌放炮，闲家胡牌，算百胡；
    
    7）地胡：手牌未变动，胡牌，胡息翻2倍；
    
    8）黑胡：手牌全是黑字，算百胡；
    
    9）30胡息：30胡息以上胡牌，胡息翻2倍；
    
    10）30胡息（十红）：30胡息以上，且大于等于10个红字，算百胡；
    
    11）胡牌玩家自摸、接炮单局胡息小于等于110胡息，
       平胡单局胡息小于等于100胡息。


    <size=32><color=#004f3c>三. 牌型介绍</color></size>
										
    1）一句话：手中的牌依据规则组合成相连的三张，
       比如小三、四、五，称为一句话；
    
    2）一坎牌：手中3个相同的牌，一坎牌不能拆散与其它牌组合；
    
    3）一对牌：手中2个相同的牌为1对；
    
    4）一提牌：4张相同的牌为一提（不可拆散与其它牌组合），
       在进第一张牌之前，必须放到桌面示众；
    
    5）绞牌：当1对大牌与1张相同的小牌，
       或者1对小牌与1张相同的大牌组合时，成为绞牌。
       如1对小九与1张大玖。
    

    <size=32><color=#004f3c>四. 玩法规则</color></size>
											
    1）碰牌：当别人打或摸的牌自己手中有一对，则可碰，
       碰牌后将牌放到桌上明示给其他人；

    2）吃牌：上家出的或者自己摸的牌，明示后没有人碰牌或者跑牌，
       则自己与自己手中的牌组合成一句话，放到桌上，称为吃牌；

    3）忍碰：当有机会吃碰时，自己却没有碰的牌，称为忍碰，
       之后再不能碰该牌；调整牌序后可以胡；

    4）偎：抓牌时，如果所抓的牌正好是手中的一对牌，
       则必须将牌由手上放到桌面上；

    5）臭偎：忍碰之后，又偎牌，称为臭偎；

    6）提牌：提牌时，如果所摸的牌正好是手中的一坎牌，
       则必须将牌由手上放到桌上；

    7）跑牌：当别人打或摸的牌自己手中有一坎，或者是已经偎的牌，
       则可以跑牌，跑牌后将牌放到桌面。或者当别人从墩上摸的牌，
       是自己已经碰的牌，则同样可以跑牌，如果没有跑牌，称为走炮；

    8）重跑：当跑的牌超过1次时，称为八快。如跑了大伍再跑小六时，
       此时不用从手中打牌出去，而要让下家摸牌；

    9）过张：当有机会吃碰时，自己没有吃或者碰的牌，
       称为过张，过张后，不能再吃碰该牌；

    10）比牌：当吃的牌手中还有时，必须要将手中的这张'
        牌再组合并放到桌面，称为比牌；
        如手中有小12345，以45组合吃小3，
        那么手中的小3，必须以123的组合同时放到桌面；
        如果玩家符合吃牌的条件但达不到比牌的条件，
        即要比的牌无法和手上剩下的牌组成吃的牌型，则不允许吃牌；
        
    11）一方门子：比如一句话、一绞牌、一碰、一提、一偎，
        一跑称为1方门子；当有跑或提牌时，
        一对牌可以成为1方门子，叫做将，跑或提牌时，
        必须有一对将，否则就要单钓将；
    
    12）每进一张牌，必须打出一张，重跑除外。
									
											

]],
}

return ConfigChild
