--此代码用于刘海屏幕适配

ScreenAdaptat = {}

ScreenAdaptat.OpenTag = false  --屏幕适配开关 true为开启 false 为关闭 默认关闭

emShiftType = 
{
	Right = 1,	--向右偏移
	Left  = 2,	--向左偏移
}

--这里初始化
function ScreenAdaptat:Init()
	self:CheckOpenTag()
end

--检查开关 按需开启
function ScreenAdaptat:CheckOpenTag()
	local UnityEngine = UnityEngine
	
	--先简单判断 后面需增加设备型号判断 特定全面屏设备有刘海屏
    if UnityEngine.Screen.width * 1.0 / UnityEngine.Screen.height > 1.8 then
        ScreenAdaptat.OpenTag = true
	end
end

--坐标偏移
--目前需要适配的范围 是左右刘海屏适配 游戏带有自动旋转 需要判断当前旋转 找到对应的偏移方向
--参数 tran:节点, shiftType:emShiftType类型,偏移类型 nPixel:偏移像素
function ScreenAdaptat:ShiftTran(tran, shiftType, nLeftShiftPixel, nRightShiftPixed)
	if ScreenAdaptat.OpenTag ~= true then	--防止nil漏判断
		return
	end
	--获取屏幕当前旋转的方向
	local screenRotaDirect = UnityEngine.Input.deviceOrientation

	local nPixel = nLeftShiftPixel
	if screenRotaDirect == UnityEngine.DeviceOrientation.LandscapeRight then --右转的旋转 则更改偏移类型
		if shiftType == emShiftType.Right  then
			shiftType = emShiftType.Left
		elseif shiftType == emShiftType.Left  then
			shiftType = emShiftType.Right
		end
	end
	
	if shiftType == emShiftType.Right then
		self:RightShiftTran(tran, nPixel)
	elseif shiftType == emShiftType.Left then
		self:LeftShiftTran(tran, nPixel)
	end
end

--右偏移坐标节点适配
--参数 tran:节点   nPixel:偏移像素量
function ScreenAdaptat:RightShiftTran(tran, nPixel)
	if tran == nil or tran.transform == nil then
		UnityLogError("ScreenAdaptat:RightShiftTran 错误的节点参数")
		return
	end

	--设置nPixed的默认参数
	if nPixel == nil then
		nPixel = 100
	end

	--基于UGUI 使用RectTransform
	local rTran = tran:GetComponent("RectTransform")
	local pos = rTran.anchoredPosition
	pos.x = pos.x + nPixel
	rTran.anchoredPosition = pos
end

--左偏移坐标节点适配
--参数 tran:节点   nPixel:偏移像素量
function ScreenAdaptat:LeftShiftTran(tran, nPixel)
	if tran == nil or tran.transform == nil then
		UnityLogError("ScreenAdaptat:RightShiftTran 错误的节点参数")
		return
	end

	--设置nPixed的默认参数
	if nPixel == nil then
		nPixel = 100
	end
	
	--基于UGUI 使用RectTransform
	local rTran = tran:GetComponent("RectTransform")
	local pos = rTran.anchoredPosition
	pos.x = pos.x - nPixel
	rTran.anchoredPosition = pos
end

