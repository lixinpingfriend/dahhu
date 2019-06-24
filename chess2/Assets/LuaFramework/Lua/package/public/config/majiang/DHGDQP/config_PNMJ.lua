local ConfigChild = {}

ConfigChild.createRoomTable = {
    { --普宁逼胡
        {
            tag = { togglesTile = "局数:", rowNum = 3 },
            list =
            {
                {
                    { disable = false, json = "", toggleType = 1, toggleTitle = "4局", toggleIsOn = false },
                    { disable = false, json = "", toggleType = 1, toggleTitle = "8局", toggleIsOn = true },
                    { disable = false, json = "", toggleType = 1, toggleTitle = "16局", toggleIsOn = false },
                },
            }
        },
        {
            tag = { togglesTile = "人数:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"PlayerNum\":4", toggleType = 1, toggleTitle = "4人玩法", toggleIsOn = true },
                    { disable = false, json = "\"PlayerNum\":3", toggleType = 1, toggleTitle = "3人玩法", toggleIsOn = false },
                }
            }
        },
        {
            tag = { togglesTile = "玩法:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"GenZhuang\":true", toggleType = 2, toggleTitle = "跟庄", toggleIsOn = true },
                    { disable = false, json = "\"DieTou\":true", toggleType = 2, toggleTitle = "叠头", toggleIsOn = true },
                    { disable = false, json = "\"GangBaoFanBei\":true", toggleType = 2, toggleTitle = "杠爆翻倍", toggleIsOn = true },
                    { disable = false, json = "\"DuiDuiHu\":2", toggleType = 2, toggleTitle = "对对胡 2倍", toggleIsOn = true },
                    { disable = false, json = "\"HunDuiHu\":3", toggleType = 2, toggleTitle = "混对胡 3倍", toggleIsOn = true },
                    { disable = false, json = "\"QingDuiHu\":4", toggleType = 2, toggleTitle = "清对胡 4倍", toggleIsOn = true },
                    { disable = false, json = "\"HunYiSe\":2", toggleType = 2, toggleTitle = "混一色 2倍", toggleIsOn = true },
                    { disable = false, json = "\"QingYiSe\":3", toggleType = 2, toggleTitle = "清一色 3倍", toggleIsOn = true },
                    { disable = false, json = "\"QiXiaoDui\":3", toggleType = 2, toggleTitle = "七小对 3倍", toggleIsOn = true },
                    { disable = false, json = "\"HaoHuaQiDui\":5", toggleType = 2, toggleTitle = "豪华七对 5倍", toggleIsOn = true },
                    { disable = false, json = "\"ShuangHaoHuaQiDui\":7", toggleType = 2, toggleTitle = "双豪华 7倍", toggleIsOn = true },
                    { disable = false, json = "\"SanHaoHuaQiDui\":10", toggleType = 2, toggleTitle = "三豪华 10倍", toggleIsOn = true },
                    { disable = false, json = "ShiSanYao", toggleType = 2, toggleTitle = "十三幺", toggleIsOn = true, dropDown = "9,10,11,12,13", dropDefault = 1 },
                    { disable = false, json = "HuaYaoJiu", toggleType = 2, toggleTitle = "花幺九", toggleIsOn = true, dropDown = "3,4,5,6,7", dropDefault = 2 },
                    { disable = false, json = "HunYaoJiu", toggleType = 2, toggleTitle = "混幺九", toggleIsOn = true, dropDown = "5,6,7,8,9", dropDefault = 1 },
                    { disable = false, json = "ChunYaoJiu", toggleType = 2, toggleTitle = "纯幺九", toggleIsOn = true, dropDown = "6,8,10", dropDefault = 1 },
                    { disable = false, json = "ZiYiSe", toggleType = 2, toggleTitle = "字一色", toggleIsOn = true, dropDown = "6,8,10", dropDefault = 1 },
                    { disable = false, json = "ShiBaLuoHan", toggleType = 2, toggleTitle = "18罗汉", toggleIsOn = true, dropDown = "10,13,18", dropDefault = 2 },
                }
            }
        },
        {
            tag = { togglesTile = "封顶:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"FengDing\":0", toggleType = 1, toggleTitle = "不封顶", toggleIsOn = true },
                    { disable = false, json = "FengDing", toggleType = 1, toggleTitle = "封顶", toggleIsOn = false, dropDown = "2,4,6,8,10", dropDefault = 0 },
                },
            }
        },
        {
            tag = { togglesTile = "奖马:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"ZhaMa\":0", toggleType = 1, toggleTitle = "不奖马", toggleIsOn = false },
                    { disable = false, json = "ZhaMa", toggleType = 1, toggleTitle = "奖", toggleIsOn = true, dropDown = "2,4,6,8,10", dropDefault = 2, dropAddStr = "马" },
                },
                {
                    { disable = false, json = "\"MaGDahu\":true", toggleType = 2, toggleTitle = "马跟大胡", toggleIsOn = false },
                    { disable = false, json = "\"MaGGang\":true", toggleType = 2, toggleTitle = "马跟杠", toggleIsOn = false },
                    { disable = false, json = "\"MaJZiMo\":true", toggleType = 2, toggleTitle = "自摸截头马", toggleIsOn = true },
                },
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
            tag = { togglesTile = "支付:", rowNum = 3, isPay = true },
            list =
            {
                {
                    { disable = false, json = "\"PayType\":1", toggleType = 1, toggleTitle = "AA支付", toggleIsOn = true },
                    { disable = false, json = "\"PayType\":0", toggleType = 1, toggleTitle = "房主支付", toggleIsOn = false },
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price1_1(roundCount, playerCount, payType, bankerType)
        end,
        isTablePop = true,
        headTag = {
            serverJson = "PiaoNum",
            localJson =  "DieTou",
            zeroJson = "不叠",
            notZeroJson = "叠头",
        },
        pnShowResult = true,
        isShowPiao = true,
        PaoTitles = "不叠头|叠头",
        isPNBiHu = true,
    },
    { --普宁客家
        {
            tag = { togglesTile = "局数:", rowNum = 3 },
            list =
            {
                {
                    { disable = false, json = "", toggleType = 1, toggleTitle = "4局", toggleIsOn = false },
                    { disable = false, json = "", toggleType = 1, toggleTitle = "8局", toggleIsOn = true },
                    { disable = false, json = "", toggleType = 1, toggleTitle = "16局", toggleIsOn = false },
                },
            }
        },
        {
            tag = { togglesTile = "人数:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"PlayerNum\":4", toggleType = 1, toggleTitle = "4人玩法", toggleIsOn = true },
                    { disable = false, json = "\"PlayerNum\":3", toggleType = 1, toggleTitle = "3人玩法", toggleIsOn = false },
                }
            }
        },
        {
            tag = { togglesTile = "玩法:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"PengPaiBaoPai\":true", toggleType = 2, toggleTitle = "九章包牌", toggleIsOn = false,clickTip="落地九章，则最后一个喂章的玩家包牌" },
                    { disable = false, json = "\"JiePaoJianBan\":true", toggleType = 2, toggleTitle = "吃胡减半", toggleIsOn = false,clickTip="接炮胡牌牌型分减半" },
                }
            }
        },
        {
            tag = { togglesTile = "马牌:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"ZhaMa\":0", toggleType = 1, toggleTitle = "无马", toggleIsOn = false },
                    { disable = false, json = "ZhaMa", toggleType = 1, toggleTitle = "庄家带", toggleIsOn = true, dropDown = "2,4,6,8,10", dropDefault = 0, dropAddStr = "马",clickSmallShow="4_2",clickBigShow="4_2",addJson="\"MaGDahu\":false" },
                    { disable = false, json = "ZhaMa", toggleType = 1, toggleTitle = "胡牌开", toggleIsOn = false, dropDown = "2,4,6,8,10", dropDefault = 2, dropAddStr = "马",clickSmallShow="4_3",clickBigShow="4_3",addJson="\"MaGDahu\":true" },
                },
                {
                    { disable = false, json = "JiaMa", toggleType = 2, toggleTitle = "加马", toggleIsOn = true, dropDown = "2,4", dropDefault = 0, dropAddStr = "马",smallShow="4_2",smallShowType = 1 },
                    { disable = false, json = "JiaMa", toggleType = 2, toggleTitle = "加马", toggleIsOn = false, dropDown = "2,4", dropDefault = 0, dropAddStr = "马",smallShow="4_3",smallShowType = 1 },
                    { disable = false, json = "\"MaGGang\":true", toggleType = 2, toggleTitle = "马跟杠", toggleIsOn = true},
                }
            }
        },
        {
            tag = { togglesTile = "封顶:", rowNum = 3,bigShow = "4_2",bigShowType = 1 },
            list = {
                {
                    { disable = false, json = "\"MaShuFengDing\":0", toggleType = 1, toggleTitle = "不封顶", toggleIsOn = false },
                    { disable = false, json = "MaShuFengDing", toggleType = 1, toggleTitle = "封顶", toggleIsOn = true, dropDown = "10,14,16,20", dropDefault = 0, dropAddStr = "马" },
                },
            }
        },
        {
            tag = { togglesTile = "封顶:", rowNum = 3,bigShow = "4_3",bigShowType = 1 },
            list = {
                {
                    { disable = false, json = "\"MaShuFengDing\":0", toggleType = 1, toggleTitle = "不封顶", toggleIsOn = true },
                    { disable = false, json = "MaShuFengDing", toggleType = 1, toggleTitle = "封顶", toggleIsOn = false, dropDown = "10,14,16,20", dropDefault = 0, dropAddStr = "马" },
                },
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
            tag = { togglesTile = "支付:", rowNum = 3, isPay = true },
            list =
            {
                {
                    { disable = false, json = "\"PayType\":1", toggleType = 1, toggleTitle = "AA支付", toggleIsOn = true },
                    { disable = false, json = "\"PayType\":0", toggleType = 1, toggleTitle = "房主支付", toggleIsOn = false },
                },
            }
        },
        caculPrice = function (roundCount, playerCount, payType, bankerType)
            return Config.caculate_price1_1(roundCount, playerCount, payType, bankerType)
        end,
        pnShowResult = true,
    },
}

ConfigChild.HowToPlayTexts = {
[[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1）麻将共136张牌，包括:万、条、筒、风（东南西北中发白）;
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）可碰牌，可开杠，不可吃牌;
2）可自摸，可接炮，可以一炮多响;
3）坐庄:第一局房主为庄，之后谁胡谁庄，一炮多响情况下，放炮的为庄，流局时摸最后一张牌的人为庄;
4）过碰惩罚:一圈内对方打出的牌能碰却没有碰，则在未经过自己时再
 次出现该牌时也都不可以碰;
6) 过胡惩罚:一圈内对方打出的牌能胡却没有胡，则在未经过自己时再
 次出现可接炮胡的牌时也都不可以胡牌;
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）自摸:满足胡牌牌型即可;
2）接炮:满足胡牌牌型即可;
</size>
<size=32><color=#004f3c>四.中码规则</color></size>
<size=28>
1）胡牌后进行奖马，胡牌者中马后赢取额外奖马分
 ◆ 庄家的马牌对应为1，5，9，东风，红中
 ◆ 庄家下家的马牌对应为2，6，南风，发财
 ◆ 庄家对家的马牌对应为3，7，西风，白板
 ◆ 庄家上家的马牌对应为4，8，北风
2）自摸截头码:自摸胡牌时，额外随机奖励2-3个马;
3）马跟大胡：每中1马额外赢得本局胡牌的分数，常规模式为1马2分;
4）马跟杠：根据中码数量分别再次额外计算杠分;
</size>
<size=32><color=#004f3c>五.叠头</color></size>
<size=28>
1）第一局发牌前，所有玩家可选择是否叠头;
2）结算时一方叠头胡牌分数*2倍，双方叠头胡牌分数*3倍
</size>
<size=32><color=#004f3c>六.计分规则</color></size>
<size=28>
1）自摸赢三家，谁放炮谁出分;
2）底分：2分;
3）平胡=1倍;
4）对对胡=2倍;
5）混对胡=3倍;
6）清对胡=4倍;
7）七小对=3倍;
8）混七对=4倍;
9）清七对=5倍;
10）豪华七对=5倍;
11）混豪华七对=6倍;
12）清豪华七对=7倍;
13）双豪华=7倍;
14）混双豪华=8倍;
15）清双豪华=9倍;
16）三豪华=10倍;
17）混三豪华=11倍;
18）清三豪华=12倍;
19）十三幺=9-13倍;
20）花幺九=3-7倍可选;
21）混幺九=5-9倍可选
22）纯幺九=6,8,10倍可选;
23）字一色=6,8,10倍可选;
24）十八罗汉=10,13,18倍可选;
25）杠上开花=2倍;
26）混一色=2倍;
27）清一色=3倍;
28）接杠2分，明杠1分，暗杠2分，杠了就有，流局失效;
</size>]],
[[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1）麻将共136张牌，包括:万、条、筒、风（东南西北中发白）;
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）可碰牌，可开杠，不可吃牌;
2）可自摸，可接炮，可以一炮多响;
3）坐庄:第一局房主庄，之后谁胡谁庄，流局时摸最后一张牌的人为庄;
4）过碰惩罚:一圈内对方打出的牌能碰却没有碰，则在未经过自己时再
 次出现该牌时也都不可以碰;
6) 过胡惩罚:一圈内对方打出的牌能胡却没有胡，则在未经过自己时再
 次出现可接炮胡的牌时也都不可以胡牌;
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）自摸:满足胡牌牌型即可;
2）接炮:满足胡牌牌型即可;
</size>
<size=32><color=#004f3c>四.中码规则</color></size>
<size=28>
1）胡牌后进行奖马，胡牌者中马后赢取额外奖马分
 ◆ 庄家的马牌对应为1，5，9，东风，红中
 ◆ 庄家下家的马牌对应为2，6，南风，发财
 ◆ 庄家对家的马牌对应为3，7，西风，白板
 ◆ 庄家上家的马牌对应为4，8，北风
2）马跟底分：胡牌牌型底分为几分，则中一个马为几分;
3）马跟杠：根据中码数量分别再次额外计算杠分;
</size>
<size=32><color=#004f3c>五.计分规则</color></size>
<size=28>
1）自摸赢三家，谁放炮谁出分;
2）底分：2分;
3）平胡=1倍;
4）碰碰胡=3倍;
5）混色=3倍;
6）清一色=5倍;
7）字一色=13倍;
8）混一色碰碰胡=6倍;
9）清一色碰碰胡=8倍;
10）花幺九=9倍;
11）混幺九=11倍;
12）纯幺九=13倍;
13）十三幺=13倍;
14）七小对=4倍;
15）混色七对=7倍;
16）清一色七对=9倍;
17）豪华七对=7倍;
18）双豪华七对=10倍;
19）三豪华七对=13倍;
20）混豪华七对=10倍;
21）混双豪华七对=13倍;
22）混三豪华七对=16倍;
23）清豪华七对=12倍;
24）清双豪华七对=15倍;
25）清三豪华七对=18;
26）幺九七对=13倍;
27）纯字七对=13倍;
28) 十八罗汉=18倍;
29）接杠2分，明杠1分，暗杠2分，杠了就有，流局失效;
</size>]],
}

return ConfigChild
