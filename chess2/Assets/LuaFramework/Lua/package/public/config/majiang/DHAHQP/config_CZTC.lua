local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --天长麻将
        {
            tag = {togglesTile = "局数:",rowNum = 4},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":6",toggleType = 1,toggleTitle = "6局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = true,addJson = "\"isDoubleQuan\":false"},
                    {disable = false,json = "\"roundCount\":16",toggleType = 1,toggleTitle = "16局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8圈",toggleIsOn = false,addJson = "\"isDoubleQuan\":true",showType = {1},clickTip = [[园子打法，共打8圈，每个人坐过1次庄算1圈]]},
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
                }
            }
        },
        { 
            tag = {togglesTile = "补花:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"HuaPaiType\":1",toggleType = 1,toggleTitle = "小花",toggleIsOn = true,clickTip = [[每局在“东南西北”中按顺序选择1张为花牌，“中发白”为固定花牌]]},
                    {disable = false,json = "\"HuaPaiType\":2",toggleType = 1,toggleTitle = "全花",toggleIsOn = false,clickTip = [[“东南西北中发白”都算花牌]]},
                }
            }
        },
        {
            tag = {togglesTile = "底花:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"DiHuFen\":1",toggleType = 1,toggleTitle = "底胡1花",toggleIsOn = true,clickTip = [[胡牌后按“底胡1花”算分规则进行计算]]},
                    {disable = false,json = "\"DiHuFen\":3",toggleType = 1,toggleTitle = "底胡3花",toggleIsOn = false,clickTip = [[胡牌后按“底胡3花”算分规则进行计算]]},
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
            local prices =
            {
                ["6"] = {["13"] = 8,["14"] = 6,["03"] = 24,["04"] = 24,["23"] = 24,["24"] = 24},
                ["8"] = {["13"] = 10,["14"] = 8,["03"] = 30,["04"] = 30,["23"] = 30,["24"] = 30},
                ["16"] = {["13"] = 20,["14"] = 15,["03"] = 60,["04"] = 60,["23"] = 60,["24"] = 60},
                ["32"] = {["13"] = 40,["14"] = 30,["03"] = 120,["04"] = 120,["23"] = 120,["24"] = 120},
            }
            if(ruleTable.isDoubleQuan) then
                roundCount = 32
            end
            return prices[roundCount .. ""][payType .. "" .. playerCount]
        end,
        isMidTing = true,
        laigenTagTitle = "花牌",
        roundTitle = "圈",
        IsOpenStartNow = true, ---打开提前开局按钮
        totalResultshareTypeToggleDefState = 1,

    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一、基础规则</color></size>
<size=28>
1）万、条、饼（1-9各4张）+风牌（东南西北中发白各4张），共136张
2）可碰、杠，不可吃
</size>
<size=32><color=#004f3c>二、庄家规则</color></size>
<size=28>
1）第1局游戏房主为庄
2）庄胡则连庄，闲家胡则按座位顺序（东>南>西>北）轮庄
3）流局不换庄
</size>
<size=32><color=#004f3c>三、胡牌规则</color></size>
<size=28>
1）只能自摸不能点炮
2）必须先听牌才可以胡牌
3）若起手天胡自摸（摸第1张牌即组成胡牌牌型）可直接胡牌
</size>
<size=32><color=#004f3c>四、花牌规则</color></size>
<size=28>
4.1 花牌解释
1）“中/发/白”3张牌为固定花牌
2）勾选【小花】选项时，除中发白外，每局固定东南西北4张牌其中1张为花牌，按东>南>西>北的顺序，每局进行变化
3）勾选【全花】选项时，“东南西北中发白”均为花牌

4.2 算花规则
1）每摸到1张花牌算1花
2）点杠算2花
3）补杠算2花
4）暗杠算4花
5）每个暗刻算1花，例如：999万，777条（暗刻必须为独立牌型，若其中任意张牌在胡牌时跟其他牌组成牌型，则不算暗刻）
</size>
<size=32><color=#004f3c>五、算分规则</color></size>
<size=28>
5.1 算分公式
1）分数=底胡花数+特殊牌型花数+花牌数+杠花数
2）底胡花数根据选项确定，勾选选项【底胡1花】=1花，勾选选项【底胡3花】=3花
3）每个花牌=1分

5.2 【底胡1花】牌型算分
1）对倒胡2花，其他的牌已成型，还有两个对子，听其中任意一对的牌型为对倒胡
2）碰碰胡2花
3）混一色2花
4）清一色10花
5）清一色碰碰胡20花
6）穷胡5花，穷胡为听牌时门前没有中发白或指定的风花，且手牌中无暗刻，门前无明杠或者暗杠
7）胡一张2花，胡牌时只胡1张牌，比如单吊8条，3万和5万胡4万
8）一条龙2花，家里有123456789万/条/筒且独立成牌
9）七对2花
10）杠上开花2花
11）四喜2花，摸到四张同样的花，例如4个红中/白板/发财/指定风牌
12）大绝5花，胡的牌已经是桌面上可见的最后一张，剩余3张已经被打出或者被碰牌

5.3 【底胡3花】牌型算分
1）对倒胡3花，其他的牌已成型，还有两个对子，听其中任意一对的牌型为对倒胡
2）碰碰胡3花
3）混一色3花
4）清一色15花
5）清一色碰碰胡30花
6）穷胡10花，穷胡为听牌时门前没有中发白或指定的风花，且手牌中无暗刻，门前无明杠或者暗杠
7）胡一张3花，胡牌时只胡1张牌，比如单吊8条，3万和5万胡4万
8）一条龙3花，家里有123456789万/条/筒且独立成牌
9）七对10花
10）杠上开花3花
11）四喜3花，摸到四张同样的花，例如4个红中/白板/发财/指定风牌
12）大绝10花，胡的牌已经是桌面上可见的最后一张，剩余3张已经被打出或者被碰牌

5.4 杠花规则
1）点杠由放杠的玩家出花分，补杠/暗杠其他剩余玩家都要出花分
2）流局不算杠花分
3）手里有暗刻（例如3个九条），先碰了之后下一圈再明杠，这种情况算点杠，由放碰的玩家出杠花分
</size>
<size=32><color=#004f3c>六、8圈园子打法</color></size>
<size=28>
1）8圈园子打法选项为打8圈牌，玩家按位置顺序（东>南>西>北）轮流坐庄
2）庄胡或流局情况下庄家继续坐庄，东南西北位置玩家都坐过1次庄家算1圈，8圈打完后牌局结束
3）所有玩家起始手中持有100分
4）8圈内若玩家分数减少到0，可继续打牌，不再减分，若赢牌可加分
5）举例：ABCD4个人玩牌，A自摸三家，但是B已经是0分了，这个时候只收CD2个人的分数
</size>]]
}

return ConfigChild
