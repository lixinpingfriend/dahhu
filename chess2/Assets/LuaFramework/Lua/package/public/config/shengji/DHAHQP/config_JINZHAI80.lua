local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --打七
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":1",toggleType = 1,toggleTitle = "1局",toggleIsOn = true},
                },
            }
        },
        {
            tag = {togglesTile = "升级:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"jiPaiRangeType\":1",toggleType = 1,toggleTitle = "从2打到A",toggleIsOn = true},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = true,json = "\"canDropCards\":true",toggleType = 2,toggleTitle = "可甩牌",toggleIsOn = true},
                    {disable = true,json = "\"calcHalfDissolve\":true",toggleType = 2,toggleTitle = "中途解散(算分)",toggleIsOn = true},
                }
            }
        },
        {
            tag = { togglesTile = "高级:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"SameIpForbidden\":true", toggleType = 2, toggleTitle = "同IP限制", toggleIsOn = false },

                    { disable = false, json = "\"TableGiftForbidden\":true", toggleType = 2, toggleTitle = "禁止互动表情", toggleIsOn = true }, { disable = false, json = "\"VoiceChatForbidden\":true", toggleType = 2, toggleTitle = "禁止语音和聊天", toggleIsOn = true },
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
                    {disable = false,json = "\"payType\":0",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"payType\":1",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false},
                },
            }
        },
        configJson = '{"game_type":1, "GameType":1,\"playerCount\":4,\"HallID\":0,',
        caculPrice = function (roundCount, PlayerNum, PayType, bankerType)
            return Config.caculate_price_jinzhai80(roundCount, PlayerNum, PayType, bankerType)
        end,
        defLocationSetting = 1, ---默认的语言配置,0 或者不配置 普通话，1 方言，
        isOpenLocationSetting = false, ---打开方言设置
    },
}

ConfigChild.PlayRuleText = {
    [[打七]]
}

ConfigChild.HowToPlayTexts =
{
    [[
<size=32><color=#004f3c>一、基础规则</color></size>
<size=28>
1）需要4人才可进行游戏
2）使用2副牌，共108张
3）每个玩家25张牌，底牌8张
</size>
<size=32><color=#004f3c>二、庄家规则</color></size>
<size=28>
1）第一局第一个叫主的玩家为庄
2）后面赢方为庄家
</size>
<size=32><color=#004f3c>三、牌型规则</color></size>
<size=28>
3.1 牌型介绍
1）单张：任意1张单牌
2）对子：任意2张花色且点数相同的牌
3）拖拉机：相邻的2对或2对以上的牌
4）甩牌：同花色的大牌可甩出，称为甩牌，需保证其他人没有该花色中最大的牌。如甩错，则必须出甩出的牌中的最小牌

3.2 牌型大小规则
1）只有在牌型和张数一致时才可以比较大小
2）主花色：红心5＞大王>小王>A>K>Q>J>10>9>8>7>6>5>4>3＞2
3）副花色：A>K>Q>J>10>9>8>7>6>5>4>3＞2

</size>
<size=32><color=#004f3c>四、结算规则</color></size>
<size=28>
5.1 算分公式
1）中途解散为双方级数差值输赢分
2）打过A方+20分，输方-20分
</size>
    ]],
}

return ConfigChild
