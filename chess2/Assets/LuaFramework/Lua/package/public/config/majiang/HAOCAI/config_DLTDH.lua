local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --大理推倒胡
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":4",toggleType = 1,toggleTitle = "4局",toggleIsOn = true},
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":16",toggleType = 1,toggleTitle = "16局",toggleIsOn = false},
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
                    {disable = false,json = "\"PlayerNum\":2",toggleType = 1,toggleTitle = "2人玩法",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "封顶:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"FengDing\":4",toggleType = 1,toggleTitle = "4番",toggleIsOn = true},
                    {disable = false,json = "\"FengDing\":5",toggleType = 1,toggleTitle = "5番",toggleIsOn = false},
                    {disable = false,json = "\"FengDing\":0",toggleType = 1,toggleTitle = "不封顶",toggleIsOn = false},
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
                    --{disable = false,json = "\"PayType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType, ruleTable)
            local prices =
            {
                ["4"] = 
                {   
                    ["12"] = 4,["13"] = 4,["14"] = 4,
                    ["02"] = 8,["03"] = 12,["04"] = 16,
                },
                ["8"] = 
                {
                    ["12"] = 8,["13"] = 8,["14"] = 8,
                    ["02"] = 16,["03"] = 24,["04"] = 32,
                },
                ["16"] = 
                {
                    ["12"] = 16,["13"] = 16,["14"] = 16,
                    ["02"] = 32,["03"] = 48,["04"] = 64,
                },
            }
            return prices[roundCount .. ""][payType .. "" .. playerCount]
        end,
        isDingQue = true,
    },
}

ConfigChild.HowToPlayTexts =
{
    [[<size=32><color=#004f3c>一.麻将数量</color></size>
    <size=28>
    1）麻将共108张牌，包括：万、条、筒
    </size>
    
    <size=32><color=#004f3c>二.基础规则</color></size>
    <size=28>
    1）可碰，可杠，不可吃
    2）过碰惩罚：有过碰惩罚
    3）一炮多响
                 注：一炮多响时一对一结算分数
    4) 坐庄规则：第一局随机坐庄，庄家胡牌连庄，一炮多响放炮的下局坐庄，其他情况轮庄
    5) 定缺流程：每局摸牌后每位玩家必须选择一种花色3张作为该局游戏定缺的花色
    6) 定缺限制：该局游戏必须打完定缺的花色才能胡牌
    7）查大叫：
          ● 流局时，检查牌局内未胡牌玩家听牌状态
                       a）若未胡牌玩家已听牌，则无查大叫
                       b）若未胡牌玩家未听牌，则该玩家查大叫，需赔给未胡牌但听牌的玩家最大可能的牌型分
    
    8）查花猪：
              ● 流局时，未胡牌玩家手中有筒、万、条三种花色的牌就算查花猪，要赔给已听牌玩家当局最大胡牌分数
                       注：即被查叫，有被查花猪，只算查花猪 
    </size>
    
    <size=32><color=#004f3c>三.胡牌规则</color></size>
    <size=28>
    1）胡牌方式：可以自摸胡，也可以接炮胡
    2）抢杠胡：可胡
    3）杠后跑：可胡
    4) 过胡惩罚：一圈内对方打出的牌能胡却没有胡，则在未经过自己时再次出现可接炮胡的牌时也都不可以胡牌，过什么不能胡什么
    </size>
    
    <size=32><color=#004f3c>四.计分规则</color></size>
    <size=28>
    1）胡牌方式：
                ● 接炮：谁放炮谁出分
                ● 自摸：三家出分
                ● 1番只能自摸，2番以上可以接炮可以自摸
    
    2) 牌型番：（可叠加）
                ● 鸡胡：1番
            ● 碰碰胡：1番
                ● 清一色：2番
                ● 七对：2番
                ● 豪华七小对：3番
                ● 双豪华七小对：4番
                ● 三豪华七小对：5番
    
    3) 附加番：（可叠加）
                ● 杠上开花：1番
                ● 杠上炮：1番
                ● 抢杠胡：1番
                ● 海底捞：1番
                ● 海底炮：1番
                ● 杠：1番
    </size>]], 
}

return ConfigChild
