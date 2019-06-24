Config = {}

local ModuleCache = ModuleCache
---@class Config
local Config = Config
Config.chatShotTextList = {
        "你太牛啦！！！",
        "O(∩_∩)O哈哈哈~，手气真是好！",
        "快点出牌咯~！~",
        "今天真高兴~",
        "这口吃的好。",
        "你放炮，我不胡。",
        "你家里是开银行的吧！",
        "不好意思我有事，要先离开一会。",
        "你的牌打得太好啦！",
        "大家好！很高兴见到各位。",
        "怎么又断线了，网络怎么这么差啊",
}

---配置麻将是否开放3D模式
--- Is3D ：1 使用新框架,开启3D和2D切换， 2 使用新框架,不开启3D
--- def3dOr2d ：1 游戏默认设置为3D模式，2游戏默认设置为2D模式
Config.mj3dSetting =
{
    ["DHHUBEIQP_HZMJ"] = {Is3D = 2,def3dOr2d = 2},  ---湖北_红中麻将  hzmj_v2   DHHUBEIQP_HZMJ_HZ
    ["DHHUBEIQP_ZYXLCH"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},---湖北_血流成河  hbzy_xueliu   DHHUBEIQP_ZYXLCH_XL
    ["DHHUBEIQP_KWX"] = {Is3D = 1,def3dOr2d = 2},   ---湖北_极速卡五星 hbkwx_xiangyang|hbkwx_xiaogan|hbkwx_suizhou|hbkwx_shiyan DHHUBEIQP_KWX_XY|DHHUBEIQP_KWX_XG|DHHUBEIQP_KWX_SZ|DHHUBEIQP_KWX_SY
    ["DHHUBEIQP_HSHH"] = {Is3D = 1,def3dOr2d = 1},  ---湖北_黄石晃晃 hubei_hshh   DHHUBEIQP_HSHH_HH
    ["DHHUBEIQP_DYKKF"] = {Is3D = 1,def3dOr2d = 1}, ---湖北_大冶开口番  hubei_kkf  DHHUBEIQP_DYKKF_KKF
    ["DHHUBEIQP_HGXS"] = {Is3D = 1,def3dOr2d = 2},  ---湖北_浠水麻将  dhhg_xsmj   DHHUBEIQP_HGXS_XS
    ["DHHUBEIQP_HGLT"] = {Is3D = 1,def3dOr2d = 1},  ---湖北_罗田麻将
    ["DHHUBEIQP_ESLC"] = {Is3D = 1,def3dOr2d = 1},  ---湖北_利川麻将
    ["DHHUBEIQP_ESMJ"] = {Is3D = 1,def3dOr2d = 1},  ---湖北_恩施麻将
    ["DHHUBEIQP_XLCH"] = {Is3D = 1,def3dOr2d = 1},  ---湖北_大众血流成河
    ["DHHUBEIQP_YCXLCH"] = {Is3D = 1,def3dOr2d = 2},  ---湖北_宜昌血流成河
    ["DHHUBEIQP_HSYX"] = {Is3D = 1,def3dOr2d = 2},  ---湖北_阳新麻将
    ["DHHUBEIQP_EZHH"] = {Is3D = 1,def3dOr2d = 1},  ---湖北_鄂州晃晃



    ["DHAHQP_HZMJ"] = {Is3D = 1,def3dOr2d = 2},     ---安徽_红中麻将  hzmj_v2  DHAHQP_HZMJ_HZ
    ["DHAHQP_DZHH"] = {Is3D = 1,def3dOr2d = 2},     ---安徽_换换麻将  wbmj_huanhuan  DHAHQP_DZHH_HH
    ["DHAHQP_MASMJ"] = {Is3D = 1,def3dOr2d = 2},    ---安徽_含山麻将  masmj_hanshan  DHAHQP_MASMJ_HS
    ["DHAHQP_WHMJ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},     ---安徽_无为麻将  whmj_wuwei  DHAHQP_WHMJ_WW
    ["DHAHQP_WHMJ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},     ---安徽_南陵麻将  whmj_nanling DHAHQP_WHMJ_NL
    ["DHAHQP_BZMJ"] = {Is3D = 1,def3dOr2d = 2},     ---安徽_利辛麻将,涡阳麻将,蒙城麻将  bzmj_lixin|bzmj_guoyang|bzmj_mengcheng  DHAHQP_BZMJ_LX|DHAHQP_BZMJ_GY|DHAHQP_BZMJ_MC
    ["DHAHQP_CZMJ"] = {Is3D = 1,def3dOr2d = 2},     ---安徽_青阳平胡,青阳辣子 czmj_qyph|czmj_qylz   DHAHQP_CZMJ_QYPH|DHAHQP_CZMJ_QYLZ
    ["DHAHQP_CZLZ"] = {Is3D = 1,def3dOr2d = 2},     ---安徽_池州辣子
    ["DHAHQP_JHSPH"] = {Is3D = 1,def3dOr2d = 2},    ---安徽_九华山平胡
    ["DHAHQP_MQPH"] = {Is3D = 1,def3dOr2d = 2},     ---安徽_庙前平胡
    ["DHAHQP_CZDZ"] = {Is3D = 1,def3dOr2d = 2},     ---安徽_东至麻将  czmj_dz  DHAHQP_CZDZ_DZ
    ["DHAHQP_CZDZDPH"] = {Is3D = 1,def3dOr2d = 2},  ---安徽_东至点炮胡  czmj_dz  DHAHQP_CZDZDPH_DZ
    ["DHAHQP_BBMJ"] = {Is3D = 1,def3dOr2d = 2},     ---安徽_固镇推倒胡,五河推倒胡  bbmj_gztdh|bbmj_whtdh  DHAHQP_BBMJ_GZ|DHAHQP_BBMJ_WH
    ["DHAHQP_BBHY"] = {Is3D = 1,def3dOr2d = 2},     ---安徽_怀远推倒胡
    ["DHAHQP_BBBB"] = {Is3D = 1,def3dOr2d = 2},     ---安徽_蚌埠麻将  bbmj_bbmj  DHAHQP_BBBB_BB
    ["DHAHQP_CHUZMJ"] = {Is3D = 1,def3dOr2d = 2},   ---安徽_明光麻将  chuzmj_mgmj  DHAHQP_CHUZMJ_MG
    ["DHAHQP_CZTC"] = {Is3D = 1,def3dOr2d = 2},     ---安徽_天长麻将  ahcz_tcmj   DHAHQP_CZTC_TC
    ["DHAHQP_LAMJ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},     ---安徽_六安麻将  lamj_liuan  DHAHQP_LAMJ_LA
    ["DHAHQP_LAHQ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},     ---安徽_霍邱麻将  lamj_huoqiu     DHAHQP_LAHQ_HQ
    ["DHAHQP_LASC"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},     ---安徽_舒城麻将  lamj_shucheng   DHAHQP_LASC_SC
    ["DHAHQP_LAJZ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},     ---安徽_金寨麻将  lamj_jinzhai    DHAHQP_LAJZ_JZ
    ["DHAHQP_LAHS"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},     ---安徽_霍山麻将  
    ["DHAHQP_WJMJ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},     ---安徽_太湖麻将  aqmj_taihu      DHAHQP_WJMJ_TH
    ["DHAHQP_AQWJ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},     ---安徽_望江正宗  aqmj_wangjiang  DHAHQP_AQWJ_WJ
    ["DHAHQP_AQAQ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},     ---安徽_安庆正宗  aqmj_anqing     DHAHQP_AQAQ_AQ
    ["DHAHQP_AQSS"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},     ---安徽_宿松麻将  aqmj_susong     DHAHQP_AQSS_SS
    ["DHAHQP_AQYX"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},     ---安徽_岳西麻将  aqmj_yuexi      DHAHQP_AQYX_YX
    ["DHAHQP_AQQS"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},     ---安徽_潜山麻将  aqmj_qianshan   DHAHQP_AQQS_QS
    ["DHAHQP_AQHN"] = {Is3D = 2,def3dOr2d = 2},     ---安徽_怀宁麻将
    ["DHAHQP_FYMJ"] = {Is3D = 1,def3dOr2d = 2},     ---安徽_太和麻将  fymj_taihe      DHAHQP_FYMJ_TH
    ["DHAHQP_FNBJZ"] = {Is3D = 1,def3dOr2d = 2},    ---安徽_阜南掰夹子    wbmj_fnbjz      DHAHQP_FNBJZ_BJZ
    ["DHAHQP_FNSMH"] = {Is3D = 1,def3dOr2d = 2},    ---安徽_阜南三门胡    wbmj_fnsmh      DHAHQP_FNSMH_SMH
    ["DHAHQP_FYLQ"] = {Is3D = 1,def3dOr2d = 2},     ---安徽_临泉麻将      wbmj_fuyang     DHAHQP_FYLQ_LQ
    ["DHAHQP_WBYS"] = {Is3D = 1,def3dOr2d = 2},     ---安徽_颍上杠后翻     wbmj_yingshang      DHAHQP_WBYS_YS
    ["DHAHQP_SZMJXX"] = {Is3D = 1,def3dOr2d = 2},   ---安徽_萧县麻将      szmj_xiaoxian       DHAHQP_SZMJXX_XX
    ["DHAHQP_SZDS"] = {Is3D = 1,def3dOr2d = 2},     ---安徽_砀山麻将      szds_dangshan       DHAHQP_SZDS_DS
    ["DHAHQP_HFLJ"] = {Is3D = 1,def3dOr2d = 2},     ---安徽_庐江麻将      hfmj_lujiang        DHAHQP_HFLJ_LJ
    ["DHAHQP_WBHB"] = {Is3D = 1,def3dOr2d = 2},     ---安徽_淮北推到胡     wbmj_huaibei        DHAHQP_WBHB_HB
    ["DHAHQP_WBSUIX"] = {Is3D = 1,def3dOr2d = 2},   ---安徽_濉溪麻将      wbmj_suixi          DHAHQP_WBSUIX_SX
    ["DHAHQP_WBHN"] = {Is3D = 1,def3dOr2d = 2},     ---安徽_淮南麻将      wbmj_huainan    DHAHQP_WBHN_HN
    ["DHAHQP_WBSX"] = {Is3D = 1,def3dOr2d = 2},     ---安徽_寿县麻将      wbmj_shouxian   DHAHQP_WBSX_SX
    ["DHAHQP_HNFTMJ"] = {Is3D = 1,def3dOr2d = 2},   ---安徽_凤台麻将      ahqp_hnft   DHAHQP_HNFTMJ_FT
    ["DHAHQP_HNAF"] = {Is3D = 1,def3dOr2d = 2},     ---安徽_安丰麻将      ahqp_hnaf   DHAHQP_HNAF_AF

    ["DHHNQP_CDHZ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},     ---湖南_王麻将
    ["DHHNQP_CSMJ"] = {Is3D = 1,def3dOr2d = 1,goldRoomdef3dOr2d = 1},     ---湖南_长沙麻将
    ["DHHNQP_CSMJCS"] = {Is3D = 1,def3dOr2d = 1,goldRoomdef3dOr2d = 1},   ---湖南_长沙麻将
    ["DHHNQP_CSMJZZ"] = {Is3D = 1,def3dOr2d = 1},   ---湖南_转转麻将
    ["DHHNQP_HZMJ"] = {Is3D = 1,def3dOr2d = 1},     ---湖南_红中麻将
    ["DHHNQP_YYCG"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},     ---湖南_岳阳炒股

    ["DHZYQP_DZMJ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},     ---河南_邓州麻将

    ["DHGXQP_BHTDH"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},    ---广西_北海推倒胡
    ["DHGXQP_GXMJZZ"] = {Is3D = 1,def3dOr2d = 1},  ---广西_转转麻将
    ["DHGXQP_HZHZ"] = {Is3D = 1,def3dOr2d = 1},     ---广西_红中麻将
    ["DHGXQP_LZLZ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},     ---广西_柳州麻将
    ["DHGXQP_WZWZ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},      ---广西_梧州麻将
    ["DHGXQP_CZFS"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},      ---广西_扶绥麻将
    ["DHGXQP_NNNN"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},      ---广西_南宁麻将
    ["DHGXQP_GLQZ"] = {Is3D = 1,def3dOr2d = 1,goldRoomdef3dOr2d = 1},    ---广西_桂林麻将
    ["DHGXQP_GLGL"] = {Is3D = 1,def3dOr2d = 1,goldRoomdef3dOr2d = 1},    ---广西_桂柳麻将



    ["DHYNQP_QJMJFXJ"] = {Is3D = 1,def3dOr2d = 1,goldRoomdef3dOr2d = 1},  ---云南_飞小鸡
    ["DHYNQP_WSZMJ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---云南_砚山麻将
    ["DHYNQP_CXSWT"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---云南_楚雄45筒
    ["DHYNQP_YXWLT"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---云南_玉溪56筒
    ["DHYNQP_YXXJF"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---云南_玉溪小鸡飞

    ["DHYNQP_DLMJ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---云南_
    ["DHYNQP_HHGJ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---云南_
    ["DHYNQP_KMMJ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---云南_
    ["DHYNQP_KMXZDD"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---云南_
    ["DHYNQP_LCMJ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---云南_
    ["DHYNQP_LJKKW"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---云南_
    ["DHYNQP_PEKET"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---云南_
    ["DHYNQP_PEMJ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---云南_
    ["DHYNQP_ZTMJ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---云南_



    ["DHGDQP_CSMJCS"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---广东_潮汕麻将
    ["DHGDQP_PNMJ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---广东_普宁客家，普宁逼胡

    ["DHJSQP_HZMJ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---江苏_红中麻将
    ["DHJSQP_LYGMJ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---江苏_东海麻将
    ["DHJSQP_LYGMJXP"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---江苏_新浦麻将
    ["DHJSQP_SQMJ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---江苏_泗洪麻将
    ["DHJSQP_YZDDH"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---江苏_扬州麻将
    ["DHJSQP_NTHA"] = {Is3D = 2,def3dOr2d = 2},  ---江苏_南通海安麻将

    ["DHGZQP_HZMJ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---贵州_红中麻将

    ["DHJXQP_ZZMJ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---江西_转转麻将
    ["DHJXQP_HZMJ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---江西_红中麻将
    ["DHJXQP_JJHK"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---江西_湖口麻将

    ["DHSXQP_ZYHZ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1},  ---陕西_红中麻将

    ["DHSHXQP_KDDMJ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1}, ---山西_吕梁扣点点

    ["DHXJQP_XJGSH"] = {Is3D = 2,def3dOr2d = 2}, ---新疆_杠上花
    ["DHXJQP_XZDD"] = {Is3D = 2,def3dOr2d = 2}, ---新疆_血战到底


    ["DHSCQP_RSXZ"] = {Is3D = 1,def3dOr2d = 2,goldRoomdef3dOr2d = 1}, ---四川_仁寿血战

    ["HAOCAI_QJMJFXJ"] = {Is3D = 1,def3dOr2d = 1,goldRoomdef3dOr2d = 1},  ---好彩_飞小鸡
    ["HAOCAI_DLXZDD"] = {Is3D = 1,def3dOr2d = 1,goldRoomdef3dOr2d = 1},  ---好彩_大理血战
    ["HAOCAI_DLTDH"] = {Is3D = 1,def3dOr2d = 1,goldRoomdef3dOr2d = 1},  ---好彩_大理推倒胡


    ["DHLNQP_YKMJ"] = {Is3D = 1,def3dOr2d = 1,goldRoomdef3dOr2d = 1},  ---辽宁_营口麻将
}

--独立App用，用于解决有些老的牌友圈没有gameName的兼容性问题
Config.GameTypeToGameName = {}

Config.GameTypeToGameChineseName = {
    ["whmj_wuwei"] = "无为麻将",
    ["whmj_nanling"] = "南陵麻将",

    ["bzmj_lixin"] = "利辛麻将",
    ["bzmj_guoyang"] = "涡阳麻将",
    ["bzmj_mengcheng"] = "蒙城麻将",

    ["bbmj_gztdh"] = "固镇推倒胡",
    ["bbmj_whtdh"] = "五河推倒胡",

    ["czmj_qyph"] = "青阳平胡",
    ["czmj_qylz"] = "青阳辣子",
}

function Config.get_mj3dSetting(GameID)
    local setting = Config.mj3dSetting[GameID]
    if setting then
        if not setting.goldRoomdef3dOr2d then
            setting.goldRoomdef3dOr2d = setting.def3dOr2d
        end
        return setting
    end
    return { Is3D = 2 ,def3dOr2d = 2 ,goldRoomdef3dOr2d = 2}
end

function Config.GetWanfaIdxByRule(rule, appGameName)
    local ruleInfo = ModuleCache.GameUtil.json_decode_to_table(rule)
    if not ruleInfo then
        return
    end
    local gameType = ruleInfo.GameType or ruleInfo.gameType or ruleInfo.game_type or ruleInfo.bankerType or 3
    return Config.GetWanfaIdx(gameType, appGameName)
end


function Config.GetWanfaIdx(wanfa, appGameName)
    wanfa = wanfa .. ''
    local list
    if appGameName then
        local s = string.split(appGameName, "_")
        local config = ModuleCache.PlayModeUtil.getPlayModeConfigByAppName(s[1])
        if config then
            list = Config.get_list(s[2], nil, config)
        end
    else
        list = Config.get_list()
    end

    for i = 1, #list do
        if (wanfa == list[i].wanfaType) then
            return i, list[i].name or "", list[i].playModName or ''
        end
    end

    local goldlist = Config.get_gold_list()
    for i = 1, #goldlist do
        if (wanfa == goldlist[i].wanfaType) then
            return i, goldlist[i].name or "", goldlist[i].playModName or ''
        end
    end
    return 1,""
end

function Config.get_create_name_by_wanfatype(wanfaType)
    local list = Config.get_list()
    for i=1,#list do
       if(wanfaType == list[i].wanfaType) then
            return list[i].createName or ""
       end
    end
end

function Config.get_create_name_by_appGameName(index, appGameName)
    local s = string.split(appGameName, "_")
    local config = ModuleCache.PlayModeUtil.getPlayModeConfigByAppName(s[1])
    if config then
        return Config.get_create_name(index, config)
    end
end

function Config.get_create_name(index, config)
   local list = Config.get_list(nil, nil, config)
   for i=1,#list do
       if(i == index) then
            return list[i].createName or ""
       end
   end
end

function Config.get_wanfaType_name_by_appGameName(index, appGameName)
    local s = string.split(appGameName, "_")
    local config = ModuleCache.PlayModeUtil.getPlayModeConfigByAppName(s[1])
    if config then
        return Config.get_wanfaType_name(index, nil, nil, config)
    end
end

function Config.get_wanfaType_name(index,Game_Name, gameId, config)
    local list = Config.get_list(Game_Name, gameId, config)
    for i=1,#list do
        if(i == index) then
            return list[i].wanfaType or ""
        end
    end
end


--获取金币场数据
function Config.get_gold_list()
    return ModuleCache.PlayModeUtil.get_gold_playmodel_data(ModuleCache.AppData.Game_Name)
end
--获取金币场wanfaname
function Config.get_gold_wanfaType_name(index)
    local list = Config.get_gold_list()
    for i = 1, #list do
        if (i == index) then
            return list[i].wanfaType or ""
        end
    end
end

function Config.get_list(Game_Name, gameId, config)
    Game_Name = Game_Name or ModuleCache.AppData.Game_Name
    return ModuleCache.PlayModeUtil.get_playmodel_data(nil, Game_Name, gameId, config)
end

--roundCount:局数   playerNum:人数     payType:支付类型      bankerType:???      unitPrice:单人价格
function Config.CommonCaculatePrice(roundCount,playerNum,payType,bankerType,unitPrice)
    --print("==公共的计算价格的方法")
    print("roundCount="..roundCount .. " ,playerNum=" .. playerNum .. " ,payType="..payType ..  " ,unitPrice="..unitPrice)
    local perPlayerCost = unitPrice
    local totalCost = perPlayerCost

    if(payType == 1)then  --AA
        totalCost = perPlayerCost
    elseif(payType == 0)then --房主
        totalCost = perPlayerCost * playerNum
    elseif(payType == 2)then  --大赢家
        totalCost = perPlayerCost * playerNum
    end
    return totalCost
end

function Config.caculate_price(roundCount, playerNum, payType)
    -- 基础价格 7 12 20
    local basePrice = 0;
    if (roundCount == 4) then
        basePrice = 7
    elseif (roundCount == 8) then
        basePrice = 12
    elseif (roundCount == 16) then
        basePrice = 20
    end
    local totalCost = 0
    if(payType == 0) then
        totalCost = basePrice * playerNum
    elseif(payType == 1) then
        totalCost = basePrice
    elseif(payType == 2) then
        totalCost = basePrice * playerNum
    end
    return totalCost
end

-- 通用算法
function Config.caculate_price1(roundCount, playerNum, payType)
    local prices =
    {
        ["4"] = {["12"] = 10,["13"] = 7,["14"] = 5,["02"] = 20,["03"] = 20,["04"] = 20},
        ["8"] = {["12"] = 20,["13"] = 14,["14"] = 10,["02"] = 40,["03"] = 40,["04"] = 40},
        ["16"] = {["12"] = 40,["13"] = 27,["14"] = 20,["02"] = 80,["03"] = 80,["04"] = 80},
    }
    return prices[roundCount .. ""][payType .. "" .. playerNum]
end

-- 普宁逼胡、客家麻将
function Config.caculate_price1_1(roundCount, playerNum, payType)
    local prices =
    {
        ["4"] = {["13"] = 4,["14"] = 3,["03"] = 12,["04"] = 12},
        ["8"] = {["13"] = 8,["14"] = 6,["03"] = 24,["04"] = 24},
        ["16"] = {["13"] = 16,["14"] = 12,["03"] = 48,["04"] = 48},
    }
    return prices[roundCount .. ""][payType .. "" .. playerNum]
end

function Config.caculate_price2(roundCount, playerNum, payType)
    local prices =
    {
        ["4"] = {["12"] = 8,["13"] = 5,["14"] = 4,["02"] = 15,["03"] = 15,["04"] = 15},
        ["8"] = {["12"] = 15,["13"] = 10,["14"] = 8,["02"] = 30,["03"] = 30,["04"] = 30},
        ["16"] = {["12"] = 30,["13"] = 20,["14"] = 15,["02"] = 60,["03"] = 60,["04"] = 60},
    }
    return prices[roundCount .. ""][payType .. "" .. playerNum]
end

-- 曲靖飞小鸡
function Config.caculate_price2_1(roundCount, playerNum, payType)
    local prices =
    {
        ["4"] = {["13"] = 5,["14"] = 5,["03"] = 15,["04"] = 20},
        ["8"] = {["13"] = 9,["14"] = 9,["03"] = 27,["04"] = 36},
        ["12"] = {["13"] = 14,["14"] = 14,["03"] = 42,["04"] = 56},
    }
    return prices[roundCount .. ""][payType .. "" .. playerNum]
end

-- 扬州麻将
function Config.caculate_price2_2(roundCount, playerNum, payType)
    local prices =
    {
        ["4"] = 7,
        ["8"] = 12,
        ["16"] = 20,
    }
    local totalCost = prices[roundCount .. ""]
    if(payType == 1)then  --AA
        totalCost = totalCost
    elseif(payType == 0)then
        totalCost = totalCost * playerNum
    elseif(payType == 2)then  --大赢家
        totalCost = totalCost * playerNum
    end
    return totalCost
end

-- 连云港新浦麻将
function Config.caculate_price_lygxp(roundCount, playerNum, payType)
    local prices =
    {
        ["4"] = 4,
        ["8"] = 7,
        ["16"] = 14,
    }
    local totalCost = prices[roundCount .. ""]
    if(payType == 1)then  --AA
        totalCost = totalCost
    elseif(payType == 0)then
        totalCost = totalCost * playerNum
    elseif(payType == 2)then  --大赢家
        totalCost = totalCost * playerNum
    end
    return totalCost
end

-- 广西红中
function Config.caculate_price2_3(roundCount, playerNum, payType)
    local prices =
    {
        ["4"] = 5,
        ["8"] = 9,
        ["16"] = 18,
    }
    local totalCost = prices[roundCount .. ""]
    if(payType == 1)then  --AA
        totalCost = totalCost
    elseif(payType == 0)then
        totalCost = totalCost * playerNum
    elseif(payType == 2)then  --大赢家
        totalCost = totalCost * playerNum
    end
    return totalCost
end

-- 卡五星
function Config.caculate_price2_4(roundCount, playerNum, payType)
    local prices =
    {
        ["8"] = {["13"] = 10,["12"] = 15,["03"] = 30,["02"] = 30},
        ["16"] = {["13"] = 20,["12"] = 30,["03"] = 60,["02"] = 60},
    }
    return prices[roundCount .. ""][payType .. "" .. playerNum]
end

function Config.caculate_price2_5(roundCount, playerNum, payType)
    local prices =
    {
        ["4"] = {["13"] = 5,["14"] = 5,["03"] = 15,["04"] = 20,["23"] = 15,["24"] = 20},
        ["8"] = {["13"] = 7,["14"] = 7,["03"] = 21,["04"] = 30,["23"] = 21,["24"] = 30},
        ["16"] = {["13"] = 15,["14"] = 15,["03"] = 45,["04"] = 60,["23"] = 45,["24"] = 60},
    }
    return prices[roundCount .. ""][payType .. "" .. playerNum]
end

function Config.caculate_gxqp_lzlz_price(roundCount, playerNum, payType)
    local prices =
    {
        ["4"] =
        {
            ["12"] = 5, ["13"] = 5,["14"] = 5,
            ["02"] = 10,["03"] = 15,["04"] = 20,
            ["22"] = 10,["23"] = 15,["24"] = 20,
        },
        ["8"] =
        {
            ["12"] = 8, ["13"] = 8,["14"] = 8,
            ["02"] = 16,["03"] = 24,["04"] = 32,
            ["22"] = 16,["23"] = 24,["24"] = 32,
        },
        ["16"] =
        {
            ["12"] = 13, ["13"] = 13,["14"] = 13,
            ["02"] = 26,["03"] = 39,["04"] = 52,
            ["22"] = 26,["23"] = 39,["24"] = 52,
        },
    }
    return prices[roundCount .. ""][payType .. "" .. playerNum]
end

function Config.caculate_price3(roundCount, playerNum, payType)
    local totalCost = roundCount
    if(payType == 1)then  --AA
        totalCost = roundCount
    elseif(payType == 0)then
        totalCost = roundCount * playerNum
    elseif(payType == 2)then  --大赢家
        totalCost = roundCount * playerNum
    end
    return totalCost
end

---湖南长沙麻将扣费
function Config.caculate_hnqp_csmjcs(roundCount, playerNum, payType)
    local prices =
    {
        ["4"] =
        {
            ["12"] = 6, ["13"] = 4,["14"] = 4,
            ["02"] = 12,["03"] = 12,["04"] = 16,
        },
        ["8"] =
        {
            ["12"] = 12, ["13"] = 8,["14"] = 8,
            ["02"] = 24,["03"] = 24,["04"] = 32,
        },
        ["16"] =
        {
            ["12"] = 24, ["13"] = 16,["14"] = 16,
            ["02"] = 48,["03"] = 48,["04"] = 64,
        },
    }
    return prices[roundCount .. ""][payType .. "" .. playerNum]
end

-- 比鸡
function Config.caculate_price4(roundCount, playerNum, payType)
    local perPlayerCost = 10
    if(roundCount == 8)then
        perPlayerCost = 8
    elseif(roundCount == 16)then
        perPlayerCost = 16
    elseif(roundCount == 24)then
        perPlayerCost = 24
    end
    local totalCost = perPlayerCost
    if(payType == 1)then  --AA
        totalCost = perPlayerCost
    elseif(payType == 0)then
        totalCost = perPlayerCost * playerNum
    elseif(payType == 2)then  --大赢家
        totalCost = perPlayerCost * playerNum
    end
    return totalCost
end

-- 十三张
function Config.caculate_price_shi_san_zhang(roundCount, playerNum, payType)
    local perPlayerCost = 10
    if(roundCount == 8)then
        perPlayerCost = 8
    elseif(roundCount == 16)then
        perPlayerCost = 16
    elseif(roundCount == 24)then
        perPlayerCost = 24
    end
    local totalCost = perPlayerCost
    if(payType == 1)then  --AA
        totalCost = perPlayerCost
    elseif(payType == 0 or payType == 2)then
        if(roundCount == 8)then
            totalCost = 30
        elseif(roundCount == 16)then
            totalCost = 50
        elseif(roundCount == 24)then
            totalCost = 70
        end
    end
    return totalCost
end

-- 掼蛋
function Config.caculate_price5(roundCount, playerNum, payType)
    local perPlayerCost = 10
    if(roundCount == 4)then
        perPlayerCost = 10
    elseif(roundCount == 6)then
        perPlayerCost = 15
    elseif(roundCount == 12)then
        perPlayerCost = 30
    end
    local totalCost = perPlayerCost
    if(payType == 1)then  --AA
        totalCost = perPlayerCost
    elseif(payType == 0)then
        totalCost = perPlayerCost * playerNum
    elseif(payType == 2)then  --大赢家
        totalCost = perPlayerCost * playerNum
    end
    return totalCost
end

-- 跑得快
function Config.caculate_price6(roundCount, playerNum, payType,bankerType,unitPrice)
    local perPlayerCost = 10
    if(unitPrice) then
        perPlayerCost = unitPrice
    elseif(roundCount == 6 or roundCount == 8)then
        perPlayerCost = 10
    elseif(roundCount == 12)then
        perPlayerCost = 20
    elseif(roundCount == 18)then
        perPlayerCost = 30
    end
    local totalCost = perPlayerCost
    if(payType == 1)then  --AA
        totalCost = perPlayerCost
    elseif(payType == 0)then
        totalCost = perPlayerCost * playerNum
    elseif(payType == 2)then  --大赢家
        totalCost = perPlayerCost * playerNum
    end
    return totalCost
end

-- 斗牛
function Config.caculate_price7(roundCount, playerNum, payType, bankerType)
    local perPlayerCost = 10
    if(bankerType) then
        if(roundCount == 10)then
            perPlayerCost = 10
        elseif(roundCount == 20)then
            perPlayerCost = 20
        elseif(roundCount == 30)then
            perPlayerCost = 30
        end
    else
        if(roundCount == 8)then
            perPlayerCost = 12
        elseif(roundCount == 16)then
            perPlayerCost = 24
        elseif(roundCount == 10)then
            perPlayerCost = 10
        elseif(roundCount == 20)then
            perPlayerCost = 20
        elseif(roundCount == 30)then
            perPlayerCost = 30
        end
    end
    local totalCost = perPlayerCost
    if(payType == 1)then  --AA
        totalCost = perPlayerCost
    elseif(payType == 0)then
        totalCost = perPlayerCost * playerNum
    elseif(payType == 2)then  --大赢家
        totalCost = perPlayerCost * playerNum
    end
    return totalCost
end

-- 长牌
function Config.caculate_price8(roundCount, playerNum, payType, bankerType)
    local perPlayerCost = 10
    if(roundCount == 6)then
        perPlayerCost = 10
    elseif(roundCount == 9)then
        perPlayerCost = 15
    elseif(roundCount == 12)then
        perPlayerCost = 20
    end
    local totalCost = perPlayerCost
    if(payType == 1)then  --AA
        totalCost = perPlayerCost
    elseif(payType == 0)then
        totalCost = perPlayerCost * playerNum
    elseif(payType == 2)then  --大赢家
        totalCost = perPlayerCost * playerNum
    end
    return totalCost
end

--- 大冶字牌
function Config.caculate_price9(roundCount, playerNum, payType, bankerType)

    roundCount = roundCount or 8

    local perPlayerCost = 5

    if (roundCount == 8) then
        perPlayerCost = 5
    elseif (roundCount == 12) then
        perPlayerCost = 8
    elseif (roundCount == 18) then
        perPlayerCost = 12
    end

    local totalCost = perPlayerCost
    if (payType == 1) then
        --AA
        totalCost = perPlayerCost
    elseif (payType == 0) then
        totalCost = perPlayerCost * playerNum
    elseif (payType == 2) then
        --大赢家
        totalCost = perPlayerCost * playerNum
    end
    return totalCost
end



--- 大冶字牌
function Config.caculate_priceHuaPai(roundCount, playerNum, payType, bankerType)

    roundCount = roundCount or 8

    local perPlayerCost = 5

    if (roundCount == 8) then
        perPlayerCost = 10
    elseif (roundCount == 12) then
        perPlayerCost = 15
    elseif (roundCount == 16) then
        perPlayerCost = 20
    end

    local totalCost = perPlayerCost
    if (payType == 1) then
        --AA
        totalCost = perPlayerCost
    elseif (payType == 0) then
        totalCost = perPlayerCost * playerNum
    elseif (payType == 2) then
        --大赢家
        totalCost = perPlayerCost * playerNum
    end
    return totalCost
end







--斗地主
function Config.caculate_price10(roundCount, playerNum, payType, bankerType)
    local perPlayerCost = 10
    
    if(roundCount == 8)then
        perPlayerCost = 10
    elseif(roundCount == 12)then
        perPlayerCost = 16
    elseif(roundCount == 18)then
        perPlayerCost = 24
    end

    local totalCost = perPlayerCost
    if(payType == 1)then  --AA
        totalCost = perPlayerCost
    elseif(payType == 0)then
        totalCost = perPlayerCost * playerNum
    elseif(payType == 2)then  --大赢家
        totalCost = perPlayerCost * playerNum
    end
    return totalCost
end

-- 炸金花
function Config.caculate_price_zhajinhua(roundCount, playerNum, payType ,bankerType)
    local perPlayerCost = 10
    if(roundCount == 6 or roundCount == 8)then
        perPlayerCost = 10
    elseif(roundCount == 12)then
        perPlayerCost = 20
    elseif(roundCount == 18)then
        perPlayerCost = 30
    end
    local totalCost = perPlayerCost
    if(payType == 1)then  --AA
        totalCost = perPlayerCost
    elseif(payType == 0)then
        totalCost = perPlayerCost * playerNum
    elseif(payType == 2)then  --大赢家
        totalCost = perPlayerCost * playerNum
    end
    return totalCost
end

function Config.caculate_price_guilin(roundCount, playerNum, payType ,bankerType)
    if roundCount == 8 then
        roundCount = 10
    end

    if payType == 1 then
        return roundCount/10*9 

    elseif payType == 0 then
        return roundCount/10*9*playerNum
    end
    return 20
end


function Config.caculate_price_sangong(roundCount, playerNum, payType, bankerType)
    local totalCost = 0
    if(payType == 1)then  --AA
        if 10 == roundCount then
            totalCost = 10
        end
        if 20 == roundCount then
            totalCost = 20
        end
    else  ---房主和大赢家
        if 10 == roundCount then
            totalCost = 50
        end
        if 20 == roundCount then
            totalCost = 100
        end
    end
    return totalCost
end


--黄石晃晃
function Config.caculate_price_hshh(roundCount, playerNum, payType, bankerType)
    if 8 == roundCount then
        if 1 == payType then --AA制
            return 8
        else
            return 8 * playerNum
        end
    elseif 16 == roundCount then
        if 1 == payType then --AA制
            return 16
        else
            return 16 * playerNum
        end
    end
    return 0
end

--黄石晃晃
function Config.caculate_price_dykkf(roundCount, playerNum, payType, bankerType)
    if 6 == roundCount then
        if 1 == payType then --AA制
            return 8
        else
            return 8 * playerNum
        end
    elseif 12 == roundCount then
        if 1 == payType then --AA制
            return 16
        else
            return 16 * playerNum
        end
    end
    return 0
end


--逮狗腿
function Config.caculate_price_daigoutui(roundCount, playerNum, payType, bankerType)
    local perPlayerCost = 10

    if(roundCount == 5)then
        perPlayerCost = 12
    elseif(roundCount == 8)then
        perPlayerCost = 20
    elseif(roundCount == 12)then
        perPlayerCost = 30
    end

    local totalCost = perPlayerCost
    if(payType == 1)then  --AA
        totalCost = perPlayerCost
    elseif(payType == 0)then
        totalCost = perPlayerCost * playerNum
    elseif(payType == 2)then  --大赢家
        totalCost = perPlayerCost * playerNum
    end
    return totalCost
end

--50k
function Config.caculate_price_50k(roundCount, playerNum, payType, bankerType)
    local perPlayerCost = 8

    if(roundCount == 4)then
        perPlayerCost = 8
    elseif(roundCount == 8)then
        perPlayerCost = 16
    elseif(roundCount == 12)then
        perPlayerCost = 24
    end

    local totalCost = perPlayerCost
    if(payType == 1)then  --AA
        totalCost = perPlayerCost
    elseif(payType == 0)then
        totalCost = perPlayerCost * playerNum
    elseif(payType == 2)then  --大赢家
        totalCost = perPlayerCost * playerNum
    end
    return totalCost
end

--打七
function Config.caculate_price_daqi(roundCount, playerNum, payType, bankerType)
    local perPlayerCost = 8

    if(roundCount == 4)then
        perPlayerCost = 8
    elseif(roundCount == 6)then
        perPlayerCost = 12
    elseif(roundCount == 8)then
        perPlayerCost = 16
    end

    local totalCost = perPlayerCost
    if(payType == 1)then  --AA
        totalCost = perPlayerCost
    elseif(payType == 0)then
        totalCost = perPlayerCost * playerNum
    elseif(payType == 2)then  --大赢家
        totalCost = perPlayerCost * playerNum
    end
    return totalCost
end

--金寨80分
function Config.caculate_price_jinzhai80(roundCount, playerNum, payType, bankerType)
    local perPlayerCost = 20
    local totalCost = perPlayerCost
    if(payType == 1)then  --AA
        totalCost = perPlayerCost
    elseif(payType == 0)then
        totalCost = perPlayerCost * playerNum
    elseif(payType == 2)then  --大赢家
        totalCost = perPlayerCost * playerNum
    end
    return totalCost
end

--叫家子
function Config.caculate_price_jiaojiazi(roundCount, playerNum, payType, bankerType)
    local perPlayerCost = 6

    if(roundCount == 2)then
        perPlayerCost = 6
    elseif(roundCount == 3)then
        perPlayerCost = 8
    elseif(roundCount == 4)then
        perPlayerCost = 8
    elseif(roundCount == 8)then
        perPlayerCost = 16
    end

    local totalCost = perPlayerCost
    if(payType == 1)then  --AA
        totalCost = perPlayerCost
    elseif(payType == 0)then
        totalCost = perPlayerCost * playerNum
    elseif(payType == 2)then  --大赢家
        totalCost = perPlayerCost * playerNum
    end
    return totalCost
end

--九江湖口麻将
function Config.caculate_price_jjhk(roundCount, playerNum, payType, bankerType)
    if 1 == payType then  ---AA制
        if 4 == roundCount then
            return 5
        elseif 8 == roundCount then
            return 9
        elseif 16 == roundCount then
            return 18
        end
    elseif 0 == payType then ---房主支付
        if 4 == roundCount then
            return 5 * playerNum
        elseif 8 == roundCount then
            return 9 * playerNum
        elseif 16 == roundCount then
            return 18 * playerNum
        end
    elseif 2 == payType then ---大赢家支付
        if 4 == roundCount then
            return 5 * playerNum
        elseif 8 == roundCount then
            return 9 * playerNum
        elseif 16 == roundCount then
            return 18 * playerNum
        end
    end
end

--北海推倒胡消耗
function Config.caculate_price_bhtdh(roundCount, playerNum, payType, bankerType)
    if 1 == payType then  ---AA制
        if 4 == roundCount then
            return 4
        elseif 8 == roundCount then
            return 6
        elseif 16 == roundCount then
            return 12
        end
    elseif 0 == payType or 2 == payType then ---房主支付,大贏家支付
        if 4 == roundCount then
            return 4 * playerNum
        elseif 8 == roundCount then
            return 6 * playerNum
        elseif 16 == roundCount then
            return 12 * playerNum
        end
    end
end

--湖北浠水麻将
function Config.caculate_price_xsmj(roundCount, playerNum, payType, bankerType)
    if 1 == payType then  ---AA制
        if playerNum == 4 then
            if 8 == roundCount then
                return 8
            elseif 16 == roundCount then
                return 16
            end
        elseif playerNum == 3 then
            if 8 == roundCount then
                return 8
            elseif 16 == roundCount then
                return 16
            end
        elseif playerNum == 2 then
            if 8 == roundCount then
                return 8
            elseif 16 == roundCount then
                return 16
            end
        end
    elseif 0 == payType or 2 == payType then ---房主支付,大贏家支付
        if playerNum == 4 then
            if 8 == roundCount then
                return 8 * playerNum
            elseif 16 == roundCount then
                return 16 * playerNum
            end
        elseif playerNum == 3 then
            if 8 == roundCount then
                return 8 * playerNum
            elseif 16 == roundCount then
                return 16 * playerNum
            end
        elseif playerNum == 2 then
            if 8 == roundCount then
                return 8 * playerNum
            elseif 16 == roundCount then
                return 16 * playerNum
            end
        end
    end
end

--湖南转转麻将
function Config.caculate_price_HNQP_CSMJZZ(roundCount, playerNum, payType, bankerType)
    if 1 == payType then  ---AA制
        if 4 == roundCount then
            if 3 == playerNum then
                return 5
            elseif 4 == playerNum then
                return 4
            end
        elseif 8 == roundCount then
            if 3 == playerNum then
                return 10
            elseif 4 == playerNum then
                return 8
            end
        elseif 16 == roundCount then
            if 3 == playerNum then
                return 20
            elseif 4 == playerNum then
                return 15
            end
        end
    elseif 0 == payType or 2 == payType then ---房主支付,大贏家支付
        if 4 == roundCount then
            return 15
        elseif 8 == roundCount then
            return 30
        elseif 16 == roundCount then
            return 60
        end
    end
end
--湖南红中麻将
function Config.caculate_price_HNQP_HZMJ(roundCount, playerNum, payType, bankerType)
    if 1 == payType then  ---AA制
    if 4 == roundCount then
        if 3 == playerNum then
            return 5
        elseif 4 == playerNum then
            return 4
        end
    elseif 8 == roundCount then
        if 3 == playerNum then
            return 10
        elseif 4 == playerNum then
            return 8
        end
    elseif 16 == roundCount then
        if 3 == playerNum then
            return 20
        elseif 4 == playerNum then
            return 15
        end
    end
    elseif 0 == payType or 2 == payType then ---房主支付,大贏家支付
    if 4 == roundCount then
        return 15
    elseif 8 == roundCount then
        return 30
    elseif 16 == roundCount then
        return 60
    end
    end
end

--淮南安丰消耗计算
function Config.caculate_price_HNAF(roundCount, playerNum, payType)
    local prices =
    {
        ["4"] = {["12"] = 8,["13"] = 5,["14"] = 4,["02"] = 15,["03"] = 15,["04"] = 15},
        ["8"] = {["12"] = 15,["13"] = 10,["14"] = 8,["02"] = 30,["03"] = 30,["04"] = 30},
        ["16"] = {["12"] = 30,["13"] = 20,["14"] = 16,["02"] = 60,["03"] = 60,["04"] = 60},
    }
    return prices[roundCount .. ""][payType .. "" .. playerNum]
end
--甘肃平凉麻将消耗计算
function Config.caculate_price_GSQP_PLMJ(roundCount, playerNum, payType)
    if 1 == payType then  ---AA制
    if 4 == roundCount then
        return 5
    elseif 8 == roundCount then
        return 9
    elseif 16 == roundCount then
        return 18
    end
    elseif 0 == payType then  ---房主支付
    if 4 == playerNum then
        if 4 == roundCount then
            return 20
        elseif 8 == roundCount then
            return 36
        elseif 16 == roundCount then
            return 72
        end
    elseif 3 == playerNum then
        if 4 == roundCount then
            return 15
        elseif 8 == roundCount then
            return 27
        elseif 16 == roundCount then
            return 54
        end
    end
    end
end

function Config.caculate_price_AHQP_BBBB(roundCount, playerNum, payType)
    if 1 == payType then  ---AA制
    if 4 == roundCount then
        if 3 == playerNum then
            return 5
        elseif 4 == playerNum then
            return 4
        elseif 2 == playerNum then
            return 5
        end
    elseif 8 == roundCount then
        if 3 == playerNum then
            return 10
        elseif 4 == playerNum then
            return 8
        elseif 2 == playerNum then
            return 10
        end
    elseif 16 == roundCount then
        if 3 == playerNum then
            return 20
        elseif 4 == playerNum then
            return 15
        elseif 2 == playerNum then
            return 20
        end
    end
    elseif 0 == payType then ---房主支付,大贏家支付
    if 4 == roundCount then
        return 15
    elseif 8 == roundCount then
        return 30
    elseif 16 == roundCount then
        return 60
    end
    end
end
function Config.caculate_price_AHQP_BBMJ(roundCount, playerNum, payType)
    local prices =
    {
        ["4"] =
        {
            ["12"] = 5,["13"] = 5,["14"] = 4,
            ["02"] = 15,["03"] = 15,["04"] = 15
        },
        ["8"] =
        {
            ["12"] = 10,["13"] = 10,["14"] = 8,
            ["02"] = 30,["03"] = 30,["04"] = 30
        },
        ["16"] =
        {
            ["12"] = 20,["13"] = 20,["14"] = 15,
            ["02"] = 60,["03"] = 60,["04"] = 60
        },
    }
    return prices[roundCount .. ""][payType .. "" .. playerNum]
end
--五河推倒胡
function Config.caculate_price_AHQP_WHTDH(roundCount, playerNum, payType)
    local prices =
    {
        ["4"] =
        {
            ["12"] = 8,["13"] = 5,["14"] = 4,
            ["02"] = 15,["03"] = 15,["04"] = 15
        },
        ["8"] =
        {
            ["12"] = 15,["13"] = 10,["14"] = 8,
            ["02"] = 30,["03"] = 30,["04"] = 30
        },
        ["16"] =
        {
            ["12"] = 30,["13"] = 20,["14"] = 15,
            ["02"] = 60,["03"] = 60,["04"] = 60
        },
    }
    return prices[roundCount .. ""][payType .. "" .. playerNum]
end


--安徽红中消耗计算
function Config.caculate_price_AHQP_HZMJ(roundCount, playerNum, payType)
    if 2 == playerNum then
        local prices =
        {
            ["4"] = 5,
            ["8"] = 9,
            ["16"] = 18,
        }
        local totalCost = prices[roundCount .. ""]
        if(payType == 1)then  --AA
            if 4 ==  roundCount then
                return 8
            elseif 8 ==  roundCount then
                return 14
            elseif 16 ==  roundCount then
                return 27
            end
        elseif(payType == 0)then
            totalCost = totalCost * 3
        elseif(payType == 2)then  --大赢家
            totalCost = totalCost * 3
        end
        return totalCost
    else
        local prices =
        {
            ["4"] = 5,
            ["8"] = 9,
            ["16"] = 18,
        }
        local totalCost = prices[roundCount .. ""]
        if(payType == 1)then  --AA
            totalCost = totalCost
        elseif(payType == 0)then
            totalCost = totalCost * playerNum
        elseif(payType == 2)then  --大赢家
            totalCost = totalCost * playerNum
        end
        return totalCost
    end
end

function Config.caculate_price_ESMJ(roundCount, playerNum, payType)
    local prices =
    {
        ["4"] = {["14"] = 5,["04"] = 20,["13"] = 5,["03"] = 15},
        ["8"] = {["14"] = 10,["04"] = 40,["13"] = 10,["03"] = 30},
        ["16"] = {["14"] = 20,["04"] = 80,["13"] = 20,["03"] = 60},
    }
    return prices[roundCount .. ""][payType .. "" .. playerNum]
end

--恩施利川
function Config.caculate_price_ESLC(roundCount, playerNum, payType)
    local prices =
    {
        ["4"] = {["14"] = 4,["04"] = 16,["13"] = 4,["03"] = 12},
        ["8"] = {["14"] = 8,["04"] = 32,["13"] = 8,["03"] = 24},
        ["16"] = {["14"] = 16,["04"] = 64,["13"] = 16,["03"] = 48},
    }
    return prices[roundCount .. ""][payType .. "" .. playerNum]
end
--黄石罗田
function Config.caculate_price_HGTL(roundCount, playerNum, payType)
    local prices =
    {
        ["8"] =
        {
            ["14"] = 10,["04"] = 40,["24"] = 40,
            ["13"] = 10,["03"] = 30,["23"] = 30,
            ["12"] = 10,["02"] = 20,["22"] = 20,
        },
        ["16"] =
        {
            ["14"] = 20,["04"] = 80,["24"] = 80,
            ["13"] = 20,["03"] = 60,["23"] = 60,
            ["12"] = 20,["02"] = 40,["22"] = 40,
        },
    }
    return prices[roundCount .. ""][payType .. "" .. playerNum]
end

--安徽涡阳，蒙城，利辛
function Config.caculate_dhahqp_gymj(roundCount, playerNum, payType)
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
            ["12"] = 15,["13"] = 15,["14"] = 15,
            ["02"] = 30,["03"] = 45,["04"] = 60,
        },
    }
    return prices[roundCount .. ""][payType .. "" .. playerNum]
end


--[[ 配置说明
    clickBigShow = "xx" 此选项影响整个组的按钮显示与隐藏
    bigShow = "xx" 与clickBigShow一一对应 被受影响
    bigShowType = 1 上面的按钮显示 它就显示 反之就隐藏
    bigShowType = 2 上面的按钮显示 它就隐藏 反之就显示
    clickSmallShow = "xx" 此选项影响单个按钮显示与隐藏
    smallShow = "xx" 与clickSmallShow一一对应 被受影响
    smallShowType = 1 上面的按钮显示 它就显示 反之就隐藏
    smallShowType = 2 上面的按钮显示 它就隐藏 反之就显示
    addJson = "xxx" 选项额外需要匹配的json字段
    inverseJson = "xxx" 选项不勾选对应的json字段
    --------上述是选项内的
    isMidTing 是否牌局中报听
    isTablePop 是否弹出选飘选跑界面
    isShowPao 是否选跑
    isShowPiao 是否选飘
    PaoTitles 跑飘对应的按钮文字显示
    laiziTagTitle 癞子对应的特殊名称
    laiziTag 癞子对应不同角标图片
    headTag = {
            serverJson = "PiaoNum", 对应的服务器使用飘跑字段
            localJson =  "Piao", 规则控制是否开启的飘跑字段
            zeroJson = "不飘", 为0时的标题
            addJson = "分", 不为0时的后补充文本
            notZeroJson = "飘分" 不为0时的标题
            preJson = "分" 不为0时的前补充文本
            secondShow = true 是否显示在第二列
        },
    isDingQue 是否需要定缺
    dingQueLocalJson 定缺开启的规则选项
    tingLocalJson 牌局中听牌的规则选项
    pnShowResult 使用普宁结算方式显示
    caculPrice 计算价格方式
    configJson 创建房间规则json头替换
    wanfaCustomShow 普通显示结算算分文本
    showMulOne 结算显示x1
    showAddOne 结算显示+0
    configJson 规则json头 如果没有 用默认的
    addJson 规则json额外要添加的字段
    caculPrice 计算价格的公式 没有就用默认
    callback 根据返回的规则table额外添加条件构建一个新的规则table
    isOpenLocationSetting 是否开启方言设置
    defLocationSetting 方言配置默认值，如果不配置，则默认普通话
    soundPath 方言配置语音文件的路径
    chatShotTextList 方言配置的文本设置
    IsOpenStartNow 是否开启提前开局相关功能
    PreTabel 是否开启牌桌回看的功能
    goldResultType 金币场结算界面类型
    layout3dTypes 3D麻将桌面布局配置
    table3dStyles 3D麻将桌面样式配置
    --------上述是整个配置文件的
]]

return Config
