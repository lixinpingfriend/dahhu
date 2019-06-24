local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --扣点点
        {
            tag = {togglesTile = "局数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "",toggleType = 1,toggleTitle = "4局",toggleIsOn = false},
                    {disable = false,json = "",toggleType = 1,toggleTitle = "8局",toggleIsOn = true},
                    {disable = false,json = "",toggleType = 1,toggleTitle = "16局",toggleIsOn = false},
                },
            }
        },
        {
            tag = {togglesTile = "人数:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"PlayerNum\":4",toggleType = 1,toggleTitle = "4人玩法",toggleIsOn = true},
                    -- {disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "3人玩法",toggleIsOn = false},
                }
            }
        },
        {
            tag = { togglesTile = "玩法:", rowNum = 2},
            list =
            {
                {
                    { disable = false, json = "\"QingYiSeYiTiaoLongJiaFan\":true", toggleType = 2, toggleTitle = "清一色，一条龙加番", toggleIsOn = false},
                    { disable = false, json = "\"GaiTingBuGang\":true", toggleType = 2, toggleTitle = "改变听口不能杠", toggleIsOn = true,clickTip = "勾选此选项，听牌后，少听口或变听口都不可以杠。不勾选，听牌后，杠后牌型仍然成听，就能杠。"},
                    { disable = false, json = "\"BaoHuBaoGang\":true", toggleType = 2, toggleTitle = "包胡包杠", toggleIsOn = false,clickTip = "包胡的同时也包杠"},
                    { disable = false, json = "\"DaiZhuang\":true", toggleType = 2, toggleTitle = "带庄", toggleIsOn = false,clickSmallShow="3_2",clickTip = "勾选此项，庄家赢牌多得5分，输牌多出5分，坐庄规则和圈的规则相同。"},
                    { disable = false, json = "\"BaoGang\":true", toggleType = 2, toggleTitle = "包杠", toggleIsOn = false, clickTip = "未听牌时放杠必须包杠"},
                    { disable = false, json = "\"ZhuangFanBei\":true", toggleType = 2, toggleTitle = "自摸庄分翻倍", toggleIsOn = false,smallShow="3_2",smallShowType = 1,clickTip = "勾选后马分等于胡牌牌型分" },

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
            tag = {togglesTile = "支付:",rowNum = 3, isPay = true},
            list =
            {
                {
                    {disable = false,json = "\"PayType\":1",toggleType = 1,toggleTitle = "AA支付",toggleIsOn = true},
                    {disable = false,json = "\"PayType\":0",toggleType = 1,toggleTitle = "房主支付",toggleIsOn = false},
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price3(roundCount, playerCount, payType, bankerType)
        end,
        -- isSiHong = true,
        isTablePop = true,
        isMidTing = true,
        -- tingLocalJson = "KeJiaoTing",
        --view = "tablelvliangkdd_view",
        --controller = "tablelvliangkdd_controller"
    },
}

ConfigChild.HowToPlayTexts =
{
    [[<size=32><color=#004f3c>一、基本玩法</color></size>
<size=28><color=#7c5608>
1)牌总数136张，包含万 、饼（筒）、条（索）、风（东、南、西、北）
、字（中、发、白）全副牌共有5类。
 ◆ 万字牌：从一万至九万，各4张，共36张。
 ◆ 饼字牌：从一饼至九饼，各4张，共36张。
 ◆ 条字牌：从一条至九条，各4张，共36张。
 ◆ 东、南、西、北，各4张，共16张。
 ◆ 中、发、白，各4张，共12张。
2)四人游戏，开局庄家随机，赢了继续坐庄，流局下家做庄，输了由赢家
做家。
3)发牌后，轮流抓牌、出牌、碰、杠，最先胡牌的为胜利。
</color></size>
<size=32><color=#004f3c>二、胡牌规则</color></size>
<size=28><color=#7c5608>
1)听牌:
 ◆ 玩家胡牌前必须报听，报听的方式是准备听口者在听口时出的最后一
 张牌扣到牌的右边，报听者所扣的牌其它游戏者不得翻看。游戏者报听
 后，不能再碰牌和调牌，可以杠牌，但不能影响胡牌。
 ◆ 听牌点数必须在6点以上才能听牌。
2)截胡:家截下家胡，一炮不能三响，只能一家胡。
3)流局:直到把牌摸完扔无人胡牌算流局。
4)杠牌:先碰后杠为明杠，碰杠如被抢扛胡，则不算杠。同时四张牌为暗
杠，暗杠后不马上告知其它游戏者。开暗杠时必须轮到自己抓牌方可开杠
。如果自己听口了，然后接到了暗杠，杠后的那张牌正好是你要的，那就
算暗杠暗抠，如果是明杠就算点胡，不翻倍。
5)包杠:未听口时放杠要包杠，即由放杠人负责支付其余2人的杠分和自己
的杠分。
6)胡牌:胡牌条件是听牌后，必须有6点以上胡牌分数才能胡牌。点炮计一
倍，自摸计两倍，所以点炮5以下不能胡，自摸3以上即可。
7)包胡:
 ◆ 未报听者点炮，放炮者要包胡。即由点炮人负责支付其余2人的胡牌分
 数和自己的胡牌分数，叫“一包三”。已报听者点炮不包胡。
 ◆ 如果在自己没有听口时杠6以上的牌，听口者正好是要你杠的那张牌，
 也算包胡。如果三家都听口并且都要你杠的牌，那就算流局，不算包胡，
 但那种情况很少。
</color></size>
<size=32><color=#004f3c>三、计分规则</color></size>
<size=28><color=#7c5608>
1)基本点数:按胡牌牌面数来记分，胡的牌的点数是多少即记多少分，如
六万即记6分，东、南、西、北、中、发、白按10分记分，明杠按点数记
分，暗杠按点数翻倍记分(明杠:杠牌点数X1；暗杠，杠牌点数X2)。
2)庄家点数:根据开房选项来确定是否生效。庄家有一个5点庄家分，针对
庄家，赢了加5点，输了减5点，庄家和玩家自摸都翻倍。
3)奖励点数:摸，胡牌点数X2。
4)计算公式:
 ◆ 杠牌分 = 杠牌点X3 - 其他玩家杠牌点
 ◆ 游戏积分 = 杠牌分（杠牌点X3）+（胡牌点X3）X 房间基数
例：
玩家A明杠10点、B无杠、C暗杠6点、D无杠，B家听牌点炮给D家胡牌8点，房间基数为10，结算如下：
A =（10X3-0-12-0）- 8 = 10X10 = 100
B =（0X3-10-12-0）- 8 = -30X10 = -300
C =（12X3-10-0-0）- 8 = 18X10 = 180
D =（0X3-10-0-12）+ 24 = 2X10 = 20
</color></size>]],--长沙麻将
}

return ConfigChild
