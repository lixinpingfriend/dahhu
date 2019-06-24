local ConfigChild = {}

ConfigChild.createRoomTable =
{
    { --六安
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
            tag = {togglesTile = "庄分:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ZhuangFen\":2",toggleType = 1,toggleTitle = "2分",toggleIsOn = true},
                    {disable = false,json = "\"ZhuangFen\":5",toggleType = 1,toggleTitle = "5分",toggleIsOn = false},
                    {disable = false,json = "\"ZhuangFen\":10",toggleType = 1,toggleTitle = "10分",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "包牌:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"BaoPai\":false",toggleType = 1,toggleTitle = "平分承包",toggleIsOn = true},
                    {disable = false,json = "\"BaoPai\":true",toggleType = 1,toggleTitle = "后碰者承包",toggleIsOn = false},
                }
            }
        },
        {
            tag = {togglesTile = "嘴分:",rowNum = 3},
            list =
            {
                {
                    {disable = false,json = "\"ZuiFen\":1",toggleType = 1,toggleTitle = "1分",toggleIsOn = true},
                    {disable = false,json = "\"ZuiFen\":2",toggleType = 1,toggleTitle = "2分",toggleIsOn = false},
                    {disable = false,json = "\"ZuiFen\":5",toggleType = 1,toggleTitle = "5分",toggleIsOn = false},
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
        IsOpenStartNow = true, ---打开提前开局按钮
        layout3dTypes = { 2,1 }, ---游戏内可使用的3D麻将布局,如果不设置，则默认为Type1布局
        totalResultshareTypeToggleDefState = 1,

    },
}

ConfigChild.HowToPlayTexts =
{
[[<size=32><color=#004f3c>一.麻将数量</color></size>
<size=28>
1）麻将共136张牌，包括：万、条、筒、风（东南西北中发白）;
</size>
<size=32><color=#004f3c>二.基础规则</color></size>
<size=28>
1）可碰牌，可开杠，但不能吃牌;
2）不可以一炮多响;
3）不可以接炮胡，只能自摸胡牌;
4）坐庄:开局房主坐庄;庄家胡牌或荒庄时，由庄家连庄;闲家胡牌则闲家
   坐庄;
5）宝牌:
 ◆ 发牌后随机翻一张牌。这张牌的下一个数，就是宝牌;
 ◆ 宝牌可以当任何牌来用，但不可充当某张牌去碰杠，宝牌不可
以碰杠宝牌，宝牌只允许在摸第一张牌时打出;
6）假宝:
 ◆ 在宝牌不是“东南西北中发白”的时候，红中可以当成宝牌的本身来
    用;
 ◆ 假宝只能替代宝牌成为顺子，不可以替代宝牌去碰杠，假宝本身
    可以碰杠，也可以当普通牌打出;
7）抬头宝:只有在玩家打第一张牌时，才可以选中打宝牌，其他任何时候
   都不允许打出宝牌;
8）杠牌:
 ◆ 明杠:手牌中有3张相同的牌，杠其他玩家打出的最后一张;已经
    碰出去，自己摸到最后一张形成的杠;
 ◆ 暗杠:手牌中有3张相同的牌，自己摸到最后一张形成杠;
9）出分:一家自摸时，三家出分;
10）包牌:在某位玩家碰/明杠3对、碰/明杠4对时，其他玩家胡牌，则该
   玩家要包付三家所输的分;
11）多人包牌:若有多个人碰三对、四对，则这几个人平摊所三家所输的
    分数;
12）特殊牌型:
 ◆ 开牌:即胡牌;
 ◆ 杠后花:开杠时，抓牌后胡牌;
 ◆ 无宝:胡牌时手里无宝牌;
 ◆ 四宝:胡牌时手里有4张宝牌;
 ◆ 无宝独子:胡牌时手中没有宝牌，且只听一张牌;
 ◆ 缺门:胡牌时，筒万条里必须缺一门;
 ◆ 断幺:胡牌时无1、9和风牌；若红中当宝牌本身使用，且宝牌不是风
    牌或1、9时，也算断幺;
 ◆ 幺头:胡牌时，风牌、幺或九做一对将，且不可以用宝牌代替;
 ◆ 四合:有4张一样的牌且未开杠，3张做刻子或碰，剩余一张做顺子;
 ◆ 坎子:三张一样的在手算一坎，碰的和有宝牌代替的不算;
 ◆ 板板高:即一色二顺，例：112233，若2为宝牌则可以有红中;
 ◆ 门清:没有任何吃碰杠，暗杠算门清;
 ◆ 单吊宝:听牌后，手上有一个宝牌，摸任意牌都能胡;
 ◆ 双吊宝:听牌后，手上有两个宝牌，摸任意牌都能胡;
 ◆ 宝归位:宝牌代替本身用，如2条是宝，则条123算宝归位;
 ◆ 混一色:胡牌时，只有筒万条其中一门且必须有风牌;
 ◆ 七对子:全是对子，没有碰杠、也没有刻子和顺子;
 ◆ 十三烂:即手中14张牌都是间隔大于2且没有相同的牌;
 ◆ 七风全:十三烂基础上，东南西北中发白都有，宝牌不能替代风牌，
    宝牌是风牌且做本身才算;
 ◆ 十三烂门缺:十三烂基础上，胡牌缺条、万、筒其中一种;
 ◆ 十三烂七风全门缺:十三烂、七分全、门缺都有，宝牌变换的牌算缺
    门;
 ◆ 清一色:胡牌时，全是筒万条其中一种颜色;
 ◆ 通天:万筒条其中一种1-9都有，可以宝牌代替;
 ◆ 天胡:庄家开局摸牌即胡;
 ◆ 地胡:闲家开局摸牌即胡牌，无任何吃碰杠行为，暗杠算;
 ◆ 碰三对:玩家碰牌、明杠牌3次;
 ◆ 碰四对:玩家碰牌、明杠牌4次;
 ◆ 红中:胡牌时有红中;
 ◆ 清风:胡牌时手中的牌都是风牌;
 ◆ 抬头宝:玩家出第一张牌时，打了宝牌;
</size>
<size=32><color=#004f3c>三.胡牌规则</color></size>
<size=28>
1）自摸:满足胡牌牌型即可;
2）接炮:不可接炮胡;
3）其它牌型：满足胡牌牌型即可;
</size>
<size=32><color=#004f3c>四.计分规则</color></size>
<size=28>
1）明杠:1嘴;
2）暗杠:2嘴;
3）连庄分:每连庄1次2嘴;
4）开牌:1嘴;
5）杠后花:8嘴（6嘴）;
 ◆ 括号里为选中庄家分2分时的嘴数;
6）无宝:2嘴;
7）四宝:30嘴（20嘴）;
8）无宝独子:8嘴（5嘴）;
9）缺门:2嘴;
10）断幺:2嘴（1嘴）;
11）幺头:2嘴;
12）四活:2嘴;
13）坎子:每一坎1嘴;
14）板板高:2嘴（1嘴）;
15）门清:4嘴（3嘴）;
16）单吊宝:4嘴（3嘴）;
17）双吊宝:8嘴（6嘴）;
18）宝归位:2嘴;
19）混一色:8嘴（6嘴）;
20）七对子:8嘴（6嘴）;
21）十三烂:5嘴（4嘴）;
22）七风全:12嘴（10嘴）;
23）十三烂门缺:12嘴（10嘴）;
24）十三烂七风全门缺:46嘴（30嘴）;
25）清一色:16嘴（10嘴）;
26）通天:8嘴（5嘴）;
27）天胡:30嘴（20嘴）;
28）地胡:30嘴（20嘴）;
29）碰三对无宝:12嘴（10嘴）;
30）碰三对有宝:8嘴（5嘴）;
31）碰四对无宝:30嘴（20嘴）;
32）碰四对有宝:12嘴（10嘴）;
33）红中:每1个红中2嘴;
34）清风:46嘴（30嘴）;
35）抬头宝:15嘴（10嘴）;
</size>]],--六安
}

return ConfigChild
