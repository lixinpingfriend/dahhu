local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --柳州麻将
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"roundCount\":4",toggleType = 1,toggleTitle = "4局",toggleIsOn = false},
                    {disable = false,json = "\"roundCount\":8",toggleType = 1,toggleTitle = "8局",toggleIsOn = true},
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
            tag = { togglesTile = "钓法:", rowNum = 3},
            list =
            {
                {
                    { disable = false, json = "\"DiaoYuType\":1", toggleType = 1, toggleTitle = "一五九钓鱼", toggleIsOn = true,clickBigShow = "4_2"},
                    { disable = false, json = "\"DiaoYuType\":2", toggleType = 1, toggleTitle = "跟庄钓鱼", toggleIsOn = false,clickBigShow = "4_2"},
                    { disable = false, json = "\"DiaoYuType\":3", toggleType = 1, toggleTitle = "爆炸鱼", toggleIsOn = false},
                }
            }
        },
        {
            tag = { togglesTile = "钓鱼:", rowNum = 3,bigShow = "4_2",bigShowType = 1},
            list =
            {
                {
                    { disable = false, json = "MaiMaShu", toggleType = 1, toggleTitle = "钓", toggleIsOn = true, dropDown = "2,4,6,8,10", dropDefault = 0, dropAddStr = "鱼"},
                },
            }
        },
        {
            tag = { togglesTile = "封顶:", rowNum = 3},
            list =
            {
                {
                    { disable = false, json = "\"FengDing\":2", toggleType = 1, toggleTitle = "自摸2封顶", toggleIsOn = true,clickTip = "不管自摸胡任何大胡叠加牌型，都只算自摸2分，点炮6分封顶"},
                    { disable = false, json = "\"FengDing\":4", toggleType = 1, toggleTitle = "自摸4封顶", toggleIsOn = false,clickTip = "自摸不足4分，按实际牌型分算，超过4分都只算4分，点炮6分封顶"},
                    { disable = false, json = "\"FengDing\":6", toggleType = 1, toggleTitle = "自摸6封顶", toggleIsOn = false,clickTip = "自摸不足6分，按实际牌型分算，超过6分都只算6分，点炮6分封顶"},
                    { disable = false, json = "\"FengDing\":0", toggleType = 1, toggleTitle = "无限番", toggleIsOn = false},
                }
            }
        },
        {
            tag = { togglesTile = "可选:", rowNum = 3},
            list =
            {
                {
                    { disable = false, json = "\"MenQing\":true", toggleType = 2, toggleTitle = "门清", toggleIsOn = false,clickTip = "门清自摸才算，点炮不算门清"},
                }
            }
        },
        IsOpenStartNow = true, ---打开提前开局按钮
        {
            tag = { togglesTile = "少人:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"StartNow\":true", toggleType = 2, toggleTitle = "允许少人时提前开局", toggleIsOn = true },
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
                    {disable = false,json = "\"PayType\":1",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = false},
                    {disable = false,json = "\"PayType\":0",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = true},
                    {disable = false,json = "\"PayType\":2",toggleType = 1,toggleTitle = "大赢家支付",toggleIsOn = false},
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_gxqp_lzlz_price(roundCount, playerCount, payType, bankerType)
        end,
        isLiuZhou = true,
        pnShowResult = true,
        wanfaCustomShow = true,
        view = "tableliuzhoumajiang_view",
        controller = "tableliuzhoumajiang_controller",

        soundPath = "lzlz",
        chatShotTextList = {
            "麻烦你速度点，得咩!",
            "我得胡了蛮多盘了北!",
            "盘盘都是我挨，没来了",
            "你胡大点得咩？",
            "你总放炮给人家北",
            "好久没见你了北",
            "你的牌打得算好了",
            "哦哟，你的牌嫩子打得更好的!",
        },
        defLocationSetting = 1, ---默认的语言配置,0 或者不配置 普通话，1 方言，
        isOpenLocationSetting = true, ---打开方言设置
        isOpenTableToHall = true,
    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一、基础规则</color></size>
<size=28>
1）万、条、饼（1-9各4张）+风牌（东南西北中发白各4张），共136张
2）可吃、碰、杠
3）可过碰，过碰后没过手之前不可再碰
4）吃牌不可以吃什么打什么
</size>
<size=32><color=#004f3c>二、庄家规则</color></size>
<size=28>
1）第1局游戏房主为庄，后续胡牌为庄
2）一炮双响时，按出牌顺序，优先出牌的为庄
3）一炮三响时点炮者为庄
4）流局情况下庄家继续坐庄
</size>
<size=32><color=#004f3c>三、胡牌规则</color></size>
<size=28>
1）可自摸和点炮胡
2）可以过胡，过胡未过手之前不可胡
3）可以一炮多响
</size>
<size=32><color=#004f3c>四、胡牌牌型和特殊方式</color></size>
<size=28>
4.1 牌型
1）平胡、清一色、小七对、对对胡、门清
2）无豪华小七对，算作小七对胡牌
3）自摸才算门清，点炮不算门清

4.2 特殊胡牌方式
1）抢杠胡、杠上花、杠上炮、全求人
2）点杠杠上花算点炮，碰杠杠上花算自摸
3）全求人可点炮可自摸
</size>
<size=32><color=#004f3c>五、计分规则</color></size>
<size=28>
5.1 算分公式
1）胡牌分=（底分的N次方+门清分）*（鱼牌数+1）*三比倍数+杠分
2）点炮底分为3分，自摸底分为2分
3）N为番数

5.2 番数
1）平胡0番
2）清一色1番
3）七对1番
4）对对胡1番
5）抢杠胡1番
6）杠上炮1番
7）杠上花1番
8）全求人1番

5.3 三比倍数
1）A和B形成三比关系，A点炮B、B点炮A都要给2倍分数
2）三比关系中，1家自摸，另外1家给3倍分数，其余不是三比关系的2家给正常分数

5.4 杠分
1）暗杠：三家各出1分
2）明杠/补杠：点杠/点碰者出1分
3）流局杠依然算分

5.5 门清
1）清一色/七对/对对胡，这3个牌型胡牌时门清分为2分
2）其余胡牌门清为1分
</size>
<size=32><color=#004f3c>六、钓鱼规则</color></size>
<size=28>
6.1 一五九钓鱼
1）鱼牌：一/五/九/东/中
2）胡牌后翻相应张数的牌，有几张鱼牌则计分增加几倍

6.2 跟庄钓鱼
1）庄家鱼牌：一五九东中
2）庄下家鱼牌：二六南发
3）庄对家鱼牌：三七西白
4）庄上家鱼牌：四八北
</size>
<size=32><color=#004f3c>七、吃三比规则</color></size>
<size=28>
1）A吃B三比，A点炮B、B点炮A都给2倍分数
2）A吃B三比、B吃C三比，C点炮A，C和B都要给A分（形成三口关系的两人，1人胡牌，另1人跟赔相同分数）
</size>
<size=32><color=#004f3c>八、封顶规则</color></size>
<size=28>
8.1 无限番
1）叠加大胡翻倍，无限制
2）点炮同样叠加，勾选门清后，门清胡牌分不受封顶限制

8.2 自摸2封顶
1）不管自摸胡任何大胡叠加牌型，胡牌分都只算2分
2）门清不受封顶限制
3）点炮胡牌分6分封顶

8.3 自摸4封顶
1）不管自摸胡任何大胡叠加牌型，胡牌分都只算4分
2）门清不受封顶限制
3）点炮胡牌分6分封顶

8.4 自摸6封顶
1）不管自摸胡任何大胡叠加牌型，胡牌分都只算6分
2）门清不受封顶限制
3）点炮胡牌分6分封顶
</size>]],--柳州麻将
}

return ConfigChild
