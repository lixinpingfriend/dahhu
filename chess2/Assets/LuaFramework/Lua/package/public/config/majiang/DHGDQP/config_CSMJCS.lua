local ConfigChild = {}

ConfigChild.createRoomTable = {
    { --潮汕麻将
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
                    { disable = false, json = "\"BuKeJiePao\":false", toggleType = 2, toggleTitle = "可接炮胡", toggleIsOn = true,clickTip = "勾选后可以接炮胡牌" },
                    { disable = false, json = "\"PengPengHu\":true", toggleType = 2, toggleTitle = "碰碰胡2倍", toggleIsOn = true,clickTip = "勾选后碰碰胡有额外加分" },
                    { disable = false, json = "\"HunYiSe\":true", toggleType = 2, toggleTitle = "混一色2倍", toggleIsOn = true,clickTip = "勾选后混一色有额外加分" },
                    { disable = false, json = "\"QingYiSe\":true", toggleType = 2, toggleTitle = "清一色2倍", toggleIsOn = true,clickTip = "勾选后清一色有额外加分" },
                    { disable = false, json = "\"QiXiaoDui\":true", toggleType = 2, toggleTitle = "七小对2倍", toggleIsOn = true,clickTip = "勾选后七小对有额外加分" },
                    { disable = false, json = "\"HaoHuaQiDui\":true", toggleType = 2, toggleTitle = "豪华七对4倍", toggleIsOn = true,clickTip = "勾选后豪华七对有额外加分" },
                    { disable = false, json = "\"ShuangHaoHuaQiDui\":true", toggleType = 2, toggleTitle = "双豪华七对6倍", toggleIsOn = true,clickTip = "勾选后双豪华七对有额外加分" },
                    { disable = false, json = "\"SanHaoHuaQiDui\":true", toggleType = 2, toggleTitle = "三豪华七对8倍", toggleIsOn = true,clickTip = "勾选后三豪华七对有额外加分" },
                    { disable = false, json = "\"ShiSanYao\":true", toggleType = 2, toggleTitle = "十三幺10倍", toggleIsOn = true,clickTip = "勾选后十三幺有额外加分" },
                    { disable = false, json = "\"ShiBaLuoHan\":true", toggleType = 2, toggleTitle = "十八罗汉10倍", toggleIsOn = true,clickTip = "勾选后十八罗汉有额外加分" },
                    { disable = false, json = "\"XiaoSanYuan\":true", toggleType = 2, toggleTitle = "小三元4倍", toggleIsOn = true,clickTip = "勾选后小三元有额外加分" },
                    { disable = false, json = "\"DaSanYuan\":true", toggleType = 2, toggleTitle = "大三元6倍", toggleIsOn = true,clickTip = "勾选后大三元有额外加分" },
                    { disable = false, json = "\"XiaoSiXi\":true", toggleType = 2, toggleTitle = "小四喜4倍", toggleIsOn = true,clickTip = "勾选后小四喜有额外加分"},
                    { disable = false, json = "\"DaSiXi\":true", toggleType = 2, toggleTitle = "大四喜6倍", toggleIsOn = true,clickTip = "勾选后大四喜有额外加分"},
                    { disable = false, json = "\"QiangGangHu\":true", toggleType = 2, toggleTitle = "抢杠胡2倍", toggleIsOn = true,clickTip = "勾选后抢杠胡有额外加分"},
                    { disable = false, json = "\"GangShangKaiHua\":true", toggleType = 2, toggleTitle = "杠上开花2倍", toggleIsOn = true,clickTip = "勾选后杠上开花有额外加分"},
                    { disable = false, json = "\"TianDiHu\":true", toggleType = 2, toggleTitle = "天地胡10倍", toggleIsOn = true,clickTip = "勾选后天胡/地胡有额外加分"},
                }
            }
        },
        {
            tag = { togglesTile = "鬼牌:", rowNum = 3 },
            list =
             {
                {
                    { disable = false, json = "\"GuiPai\":0", toggleType = 1, toggleTitle = "无鬼牌", toggleIsOn = true,clickTip = "勾选后牌局内没有鬼牌" },
                    { disable = false, json = "\"GuiPai\":1", toggleType = 1, toggleTitle = "白板做鬼", toggleIsOn = false,clickTip = "勾选后牌局内白板作为鬼牌" },
                    { disable = false, json = "\"GuiPai\":2", toggleType = 1, toggleTitle = "翻鬼", toggleIsOn = false,clickTip = "勾选后每局游戏开始前需要翻牌作鬼" },
                }
            }
        },
        {
            tag = { togglesTile = "马牌:", rowNum = 3 },
            list = {
                {
                    { disable = false, json = "\"JiangMa\":0", toggleType = 1, toggleTitle = "无奖马", toggleIsOn = true,clickTip = "勾选后没有奖马" },
                    { disable = false, json = "\"JiangMa\":1", toggleType = 1, toggleTitle = "抓马", toggleIsOn = false,clickTip = "勾选后自摸抓2马，接炮抓1马" },
                    { disable = false, json = "JiangMa", toggleType = 1, toggleTitle = "奖", toggleIsOn = false, dropDown = "2,4,6", dropDefault = 0, dropAddStr = "马",clickSmallShow="5_3",clickTip = "勾选后有奖马" },
                },
                {
                    { disable = false, json = "\"MaGDiFen\":true", toggleType = 2, toggleTitle = "马跟底分", toggleIsOn = false,smallShow="5_3",smallShowType = 1,clickTip = "勾选后马分等于胡牌牌型分" },
                    { disable = false, json = "\"MaGGang\":true", toggleType = 2, toggleTitle = "马跟杠", toggleIsOn = false,smallShow="5_3",smallShowType = 1,clickTip = "勾选后每个杠都要算马分" },
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
            return Config.caculate_price1(roundCount, playerCount, payType, bankerType)
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
3）坐庄:坐庄规则:第一局房主为庄，之后谁胡谁庄；一炮多响情况下，
   放炮玩家坐庄;流局庄家连庄;
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）自摸:满足胡牌牌型即可;
2）接炮:满足胡牌牌型即可;
</size>
<size=32><color=#004f3c>四.中码规则</color></size>
<size=28>
1）胡牌后进行奖马，胡牌者中马后赢取额外奖马分
 ◆ 庄家的马牌对应为1，5，9，东风
 ◆ 庄家下家的马牌对应为2，6，南风，红中
 ◆ 庄家对家的马牌对应为3，7，西风，发财
 ◆ 庄家上家的马牌对应为4，8，北风，白板
2）在结算计分时，只计算胡牌玩家的马，其他家的马不算，奖马2分1个
   ，如果出现通炮胡，奖马只奖给点炮的玩家，按照点炮玩家的中马数
   量来计算赢家的马分;
3）抓马:自摸抓2马，接炮抓1马;
4）马跟底分：胡牌底分为几分，每个马就为几分;
5）马跟杠：全部玩家中的马都会分别计算玩家身上的杠分，每中1马则
   杠牌分数翻倍，奖马的那个玩家也会跟着有杠的玩家同输同赢;
</size>
<size=32><color=#004f3c>五.鬼牌</color></size>
<size=28>
1）白板做鬼:白板当作鬼牌，可以当成任意牌使用;
2）翻鬼:翻一张牌后，那张牌后面的牌当作鬼牌;
</size>
<size=32><color=#004f3c>六.计分规则</color></size>
<size=28>
1）接杠:3分;
2）明杠:3分;
3）暗杠:6分;
4）自摸:6分;
5）点炮:3分;
</size>]]
}

return ConfigChild
