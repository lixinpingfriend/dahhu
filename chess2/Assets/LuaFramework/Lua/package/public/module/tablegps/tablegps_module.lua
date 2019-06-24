






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local TableGPSModule = class("tableGPSModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine

function TableGPSModule:initialize(...)
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "tablegps_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function TableGPSModule:on_module_inited()

end

-- 绑定module层的交互事件
function TableGPSModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function TableGPSModule:on_model_event_bind()
	

end

function TableGPSModule:on_click(obj, arg)	
	print_debug(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj == self.view.buttonClose.gameObject then
		ModuleCache.ModuleManager.hide_module("public", "tablegps")
	end
end

function TableGPSModule:on_show(data)
	if(type(data) == 'string')then
		local strs = string.split(data,",")
		self.view.textTip.text = strs[1]
		self.view.textDistance.text = strs[2]
	else
		local gpsWarnText,tipText,distanceText = self:get_gps_warn_text(data.seatInfoList)
		self.view.textTip.text = tipText
		self.view.textDistance.text = distanceText
	end
end


-- 计算距离
function TableGPSModule:caculate_distance(seatInfo1, seatInfo2)
    if(seatInfo1.locationData.latitude ~= 0 and seatInfo2.locationData.latitude ~= 0) then
        local distance = TableUtil.caculate_distance(seatInfo1.locationData.latitude,seatInfo1.locationData.longitude,
            seatInfo2.locationData.latitude,seatInfo2.locationData.longitude)
        
        local distanceShow = math.ceil(distance).."米"
        if distance<10 then
            distanceShow = "小于10米"
        end
        if distance >=1000 then
            distanceShow = string.format("%.0f",distance/1000) .."公里"
        end
        --print("距离：------- " .. distance)
        local tip = "玩家:<color=#b13a1f>"..seatInfo1.playerShowName.."</color>与<color=#b13a1f>"..seatInfo2.playerShowName.."</color>距离为:"..distanceShow.."\n"
        return tip
    end
    return ""
end

function TableGPSModule:get_gps_warn_text(seatInfoList)
    local showText = ""
    local tipText = ""
    local distanceText = ""
    local tip = ""
    if(#seatInfoList == 2) then
        local seatInfo1 = seatInfoList[1]
        local seatInfo2 = seatInfoList[2]
        seatInfo1.locationData = self:check_location_data(seatInfo1.locationData)
        if(seatInfo1.locationData.latitude == 0) then
            tip = "玩家:<color=#b13a1f>"..seatInfo1.playerShowName.."</color>".. seatInfo1.locationData.address .. "\n"
            showText = showText..tip
            tipText = tipText..tip
        end
        
        seatInfo2.locationData = self:check_location_data(seatInfo2.locationData)
        if(seatInfo2.locationData.latitude == 0) then
            tip = "玩家:<color=#b13a1f>"..seatInfo2.playerShowName.."</color>".. seatInfo2.locationData.address .. "\n"
            showText = showText..tip
            tipText = tipText..tip
        end

        if seatInfo1.ip == seatInfo2.ip then
            tip = "玩家:<color=#b13a1f>"..seatInfo1.playerShowName.."</color>与<color=#b13a1f>"..seatInfo2.playerShowName.."</color> IP地址相同\n"
            showText = showText..tip
            tipText = tipText..tip
        end
        tip = self:caculate_distance(seatInfo1, seatInfo2)
        distanceText = distanceText..tip
        showText = showText..tip

    elseif(#seatInfoList >= 3) then
        for i=1,#seatInfoList do
            local seatInfo1 = seatInfoList[i]
            seatInfo1.locationData = self:check_location_data(seatInfo1.locationData)
            if(seatInfo1.locationData.latitude == 0 and i == 2) then
                tip = "玩家:<color=#b13a1f>"..seatInfo1.playerShowName.."</color>".. seatInfo1.locationData.address .. "\n"
                showText = showText..tip
                tipText = tipText..tip
            end
            for j=i+1,#seatInfoList do
                local seatInfo2 = seatInfoList[j]
                seatInfo2.locationData = self:check_location_data(seatInfo2.locationData)
               
                if seatInfo1.ip == seatInfo2.ip then
                    tip = "玩家:<color=#b13a1f>"..seatInfo1.playerShowName.."</color>与<color=#b13a1f>"..seatInfo2.playerShowName.."</color> IP地址相同\n"
                    showText = showText..tip
                    tipText = tipText..tip
                end
                tip = self:caculate_distance(seatInfo1, seatInfo2)
                distanceText = distanceText..tip
                showText = showText..tip
            end
        end
    end
    if(tipText == "") then
        tipText = "没有IP地址相同的玩家\n所有玩家已开启位置信息。"
    end
    if(distanceText == "") then
        distanceText = "没有位置距离信息"
    end
    return showText,tipText,distanceText
end

function TableGPSModule:check_location_data(data)
    if(not data) then
        data = {}
    end
    if(not data.address) then
        data.address = "未开启获取位置功能"
        data.latitude = 0
        data.longitude = 0
    end
    return data
end

return TableGPSModule



