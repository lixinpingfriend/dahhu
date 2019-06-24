local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --杠上花
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
                    {disable = false,json = "\"PlayerNum\":3",toggleType = 1,toggleTitle = "3人玩法",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "起胡:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"QiHuFen\":1",toggleType = 1,toggleTitle = "无番可胡",toggleIsOn = true,clickTip = "无胡牌限制，自摸即可胡牌"},
                    {disable = false,json = "\"QiHuFen\":2",toggleType = 1,toggleTitle = "一番起胡",toggleIsOn = false,clickTip = "牌型分数必须大于2才可以胡牌"},
                }
            }
        },
        {
            tag = {togglesTile = "黄庄:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"HuangZhuang\":0",toggleType = 1,toggleTitle = "不爬坡不落庄",toggleIsOn = true},
                    {disable = false,json = "\"HuangZhuang\":1",toggleType = 1,toggleTitle = "爬坡",toggleIsOn = false,clickBigShow = "4_2"},
                    {disable = false,json = "\"HuangZhuang\":2",toggleType = 1,toggleTitle = "落庄",toggleIsOn = false,clickBigShow = "4_2"},
                }
            }
        },
        {
            tag = {togglesTile = "封顶:",rowNum = 3,bigShow = "4_2"},
            list =
            {
                {
                    {disable = false,json = "\"FengDing\":1",toggleType = 1,toggleTitle = "一坡/庄封顶",toggleIsOn = true,clickTip = "爬坡/落庄一次封顶"},
                    {disable = false,json = "\"FengDing\":2",toggleType = 1,toggleTitle = "两坡/庄封顶",toggleIsOn = false,clickTip = "爬坡/落庄两次封顶"},
                    {disable = false,json = "\"FengDing\":0",toggleType = 1,toggleTitle = "不封顶",toggleIsOn = false,clickTip = "爬坡/落庄升级无限制"},
                }
            }
        },
        {
            tag = {togglesTile = "玩法:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"YouFengPai\":false",toggleType = 2,toggleTitle = "无风牌",toggleIsOn = false,clickTip = "勾选后无东南西北"},
                    {disable = false,json = "\"GSHYaHu\":true",toggleType = 2,toggleTitle = "杠上花可压胡",toggleIsOn = false,clickTip = "勾选后杠上花也可以压胡"},
                    {disable = false,json = "\"Last10BaoPei\":true",toggleType = 2,toggleTitle = "最后十张包赔",toggleIsOn = false,clickTip = "勾选后最后十张未听牌玩家接杠杠上花，放杠玩家包赔"},
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
            return Config.caculate_price2(roundCount, playerCount, payType, bankerType)
        end,
        isXJGSH = true,
        --isMidTing = true,
        view = "tablexjgangshanghua_view",
        controller = "tablexjgangshanghua_controller"
    },
}

ConfigChild.HowToPlayTexts =
{
 [[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1）麻将共136张牌，包括:万、条、筒、风（东南西北中发白）;
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）可碰牌，可开杠，不可吃牌;
2）可自摸，不可接炮，不可以一炮多响;
3）坐庄:第一局房主坐庄，若流局则庄家连庄；之后谁胡谁庄;
4）杠后牌:牌堆最后一张牌会翻开，亮给所有玩家;若是风牌则放回原位
   ，继续翻下一张;
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）自摸:满足胡牌限制即可;
2）接炮:不可胡牌;
3）胡牌限制:必须听牌后，才可胡牌;杠上花除外;
</size>
<size=32><color=#004f3c>四.算分规则</color></size>
<size=28>
1）黄庄爬坡:
   ◆ 黄庄时，庄家不下庄，且下一局所有玩家赢牌+1番，为爬坡;
   ◆ 第二局若庄赢，仍为爬坡，第三局所有玩家仍赢牌翻+1番;
   ◆ 第二局若其余三家赢，则爬坡终止，第三局所有玩家赢牌不翻番;
   ◆ 第二局若继续黄庄，则爬坡升级，第三局所有玩家赢牌+2番;
2）黄庄落庄:
   ◆ 黄庄时，庄家不下庄，且下一局庄家赢牌+1番，为爬坡;
   ◆ 第二局若庄赢，仍为爬坡，第三局庄家仍赢牌+1番;
   ◆ 第二局若其余三家赢，则爬坡终止，第三局庄家赢牌不翻番;
   ◆ 第二局若继续黄庄，则爬坡升级，第三局庄家赢牌+2番;
3）压胡:
   ◆ 听牌自摸后不胡牌，选择压胡；不给别人看到扣住的牌并直接进入
      下一个玩家摸牌，此时该压胡玩家输赢+1番;
   ◆ 若压胡后，再次自摸并选中压胡，则该玩家输赢再+1番，压胡共+2
      番；以此类推，压胡3次，+3番;
</size>
<size=32><color=#004f3c>五.计分规则</color></size>
<size=28>
1）自摸:0番;
2）杠上花:1番;
3）杠中杠:2番;
4）杠中杠中杠:3番;
5）杠中杠中杠中杠:4番;
6）清一色:1番;
7）七对:1番;
8）豪七:2番;
9）字一色:2番;
10）十三幺:8番;
11）对对胡:1番;
</size>]],
}

return ConfigChild
