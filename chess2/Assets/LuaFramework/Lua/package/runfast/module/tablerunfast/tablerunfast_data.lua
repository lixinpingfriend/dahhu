local AppData = AppData
local TableData = {}

if(AppData.Const_App_Name == "BIGWINNER" or AppData.Const_App_Name == "HUANLE") then --欢乐,我是大赢家的配置
    print("====牌桌一些UI的配置:欢乐,我是大赢家")
    -----------欢乐跑得快的配置Start
    TableData.IsHave_RecordPoker = true
    TableData.IsCan_BuyRecordPoker = false
    TableData.MyselfClockIsUseCenter = true
    -----------欢乐跑得快的配置End
else--elseif(string.find(AppData.Const_App_Name, "DH") or true) then
    print("====牌桌一些UI的配置:大胡")
    -----------大胡跑得快的配置Start
    TableData.IsHave_RecordPoker = true      --是否有记牌功能
    TableData.IsCan_BuyRecordPoker = true    --是否能够购买记牌
    TableData.MyselfClockIsUseCenter = false --自己的闹钟使用的是本身头顶的还是中间的
    -----------大胡跑得快的配置End
end

TableData.Path_tablerunfast_sound = "package/runfast/module/tablerunfast/tablerunfast_sound"
TableData.Path_tablerunfast_helper = "package/runfast/module/tablerunfast/tablerunfast_helper"
TableData.Path_gamelogic_set  = "package/runfast/module/tablerunfast/gamelogic_set"
TableData.Path_gamelogic_common = "package/runfast/module/tablerunfast/gamelogic_common"
TableData.Path_gamelogic_pattern = "package/runfast/module/tablerunfast/gamelogic_pattern"
TableData.Path_card_logic = "package/runfast/module/tablerunfast/card_logic"

TableData.HeiTao2RepresentativeNum = 5    --黑桃2代表的数字
TableData.HeiTao3RepresentativeNum = 9    --黑桃3代表的数字
TableData.seatMaxCount = 4                --最多几个人玩
TableData.pokerSlotMaxCount = 16          --跑得快最多16张牌

return TableData