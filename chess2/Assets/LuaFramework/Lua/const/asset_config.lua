local AppData = AppData

AppData.allPackageConfig = {
    ['public'] = {
        package_name = 'public',
        table_module_name = 'table',
        is_skynet_framework = false,
        short_game_name = '',
        game_name = '',
        get_full_game_name = function(t)
            return AppData.App_Name .. t.short_game_name
        end
    },
    ['doudizhu'] = {
        package_name = 'doudizhu',
        table_module_name = 'doudizhu_table',
        is_skynet_framework = true,
        short_game_name = '_DOUDIZHU_DOUDIZHU',
        game_name = 'DOUDIZHU',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
    ['guandan'] = {
        package_name = 'guandan',
        table_module_name = 'guandan_table',
        is_skynet_framework = true,
        short_game_name = '_GUANDAN_GD',
        game_name = 'GUANDAN',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
    ['runfast'] = {
        package_name = 'runfast',
        table_module_name = 'tablerunfast',
        is_skynet_framework = true,
        short_game_name = '_RUNFAST_RUNFAST',
        game_name = 'RUNFAST',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
	},
	['quickrun'] = {
        package_name = 'quickrun',
        table_module_name = 'tablerunfast',
        is_skynet_framework = true,
        short_game_name = '_RUNFASTDL_RUNFASTDL',
        game_name = 'RUNFASTDL',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
    ['zhajinhua'] = {
        package_name = 'zhajinhua',
        table_module_name = 'table_zhajinhua',
        is_skynet_framework = true,
        short_game_name = '_ZHAJINHUA_ZHAJINHUA',
        game_name = 'ZHAJINHUA',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
    ['biji'] = {
        package_name = 'biji',
        table_module_name = 'tablebiji',
        is_skynet_framework = true,
        short_game_name = '_BIJI_BJ',
        game_name = 'BIJI',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
    ['cowboy'] = {
        package_name = 'cowboy',
        table_module_name = 'table',
        is_skynet_framework = true,
        short_game_name = '_BULLFIGHT_BF',
        game_name = 'BULLFIGHT',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
    ['laoyancai'] = {
        package_name = 'laoyancai',
        table_module_name = 'table_laoyancai',
        is_skynet_framework = true,
        short_game_name = '_LAOYANCAI_LAOYANCAI',
        game_name = 'LAOYANCAI',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
    ['baibazhang'] = {
        package_name = 'baibazhang',
        table_module_name = 'tablebaibazhang',
        is_skynet_framework = true,
        short_game_name = '_BAIBAZHANG_BBZ',
        game_name = 'BAIBAZHANG',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
    ['shisanzhang'] = {
        package_name = 'shisanzhang',
        table_module_name = 'tableshisanzhang',
        is_skynet_framework = true,
        short_game_name = '_SHISANZHANG_SSZ',
        game_name = 'SHISANZHANG',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
    ['paohuzi'] = {
        package_name = 'paohuzi',
        table_module_name = 'table',
        is_skynet_framework = false,
        short_game_name = '',
        game_name = '',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
    ['huzi'] = {
        package_name = 'huzi',
        table_module_name = 'table',
        is_skynet_framework = false,
        short_game_name = '',
        game_name = '',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
    ['huazhipai'] = {
        package_name = 'huazhipai',
        table_module_name = 'table',
        is_skynet_framework = false,
        short_game_name = '',
        game_name = '',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
    ['changpai'] = {
        package_name = 'changpai',
        table_module_name = 'table',
        is_skynet_framework = false,
        short_game_name = '',
        game_name = '',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
    ['sangong'] = {
        package_name = 'sangong',
        table_module_name = 'table',
        is_skynet_framework = true,
        short_game_name = '_SANGONG_SANGONG',
        game_name = 'SANGONG',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
    ['daigoutui'] = {
        package_name = 'daigoutui',
        table_module_name = 'table',
        is_skynet_framework = true,
        short_game_name = '_DAIGOUTUI_DAIGOUTUI',
        game_name = 'DAIGOUTUI',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
    ['majiang'] = {
        package_name = 'majiang',
        table_module_name = 'table',
        is_skynet_framework = false,
        short_game_name = '',
        game_name = '',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
    ['majiang3d'] = {
        package_name = 'majiang3d',
        table_module_name = 'table3d',
        is_skynet_framework = false,
        short_game_name = '',
        game_name = '',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
    ['wushik'] = {
        package_name = 'wushik',
        table_module_name = 'table',
        is_skynet_framework = true,
        short_game_name = '_WUSHIK_WUSHIK',
        game_name = 'WUSHIK',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },

    ['huapai'] = {
        package_name = 'huapai',
        table_module_name = 'table',
        is_skynet_framework = false,
        short_game_name = '',
        game_name = '',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
    ['huazhipai'] = {
        package_name = 'huazhipai',
        table_module_name = 'table',
        is_skynet_framework = false,
        short_game_name = '',
        game_name = '',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
    ['jiaojiazi'] = {
        package_name = 'jiaojiazi',
        table_module_name = 'table',
        is_skynet_framework = true,
        short_game_name = '_JIAOJIAZI_JIAOJIAZI',
        game_name = 'JIAOJIAZI',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
    ['daqi'] = {
        package_name = 'daqi',
        table_module_name = 'table',
        is_skynet_framework = true,
        short_game_name = '_DAQI_DAQI',
        game_name = 'DAQI',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
    ['jinzhai80'] = {
        package_name = 'shengji',
        table_module_name = 'table',
        is_skynet_framework = true,
        short_game_name = '_JINZHAI80_JINZHAI80',
        game_name = 'JINZHAI80',
        get_full_game_name = function(t) return AppData.App_Name .. t.short_game_name end
    },
}