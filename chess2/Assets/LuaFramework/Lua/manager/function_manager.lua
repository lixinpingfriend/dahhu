




local math = math
local next = next
local print = print
local require = require
local string = string
local tonumber = tonumber
local tostring = tostring
local type = type

---
local DG = DG
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine

local GameManager = ModuleCache.GameManager
local SmartTimer = ModuleCache.SmartTimer.instance
local ViewUtil = ModuleCache.ViewUtil

--- unity global
local AssetBundleManager = ModuleCache.AssetBundleManager
local GameObject = UnityEngine.GameObject
local PlayerPrefs = UnityEngine.PlayerPrefs

--- unity type
local BUTTON = "UnityEngine.UI.Button"
local CAMERA = "UnityEngine.Camera"
local CANVAS = "UnityEngine.Canvas"
local GRID = "UnityEngine.UI.GridLayoutGroup"
local IMAGE = "UnityEngine.UI.Image"
local INPUT = "UnityEngine.UI.InputField"
local RAWIMAGE = "UnityEngine.UI.RawImage"
local RECT = "UnityEngine.RectTransform"
local SLIDER = "UnityEngine.UI.Slider"
local SPRITEHOLDER = "SpriteHolder"
local TEXT = "UnityEngine.UI.Text"
local TOGGLE = "UnityEngine.UI.Toggle"


--- dotween
local DOTween = DG.Tweening.DOTween
local RotateMode = DG.Tweening.RotateMode

--- 声音
local SoundManager = require("manager.sound_manager")

--- sdk
local GameSDKInterface = ModuleCache.GameSDKInterface


---@class Manager
local Manager = {}

--------------------------------------------------------
--- begin --- SDK相关函数
--------------------------------------------------------

function Manager.ClearClipBoard()
    ModuleCache.GameSDKInterface:CopyToClipboard(" ")
end

function Manager.CopyToClipBoard(text)
    ModuleCache.GameSDKInterface:CopyToClipboard(text)
end

function Manager.GetTextFromClipboard()
    return ModuleCache.GameSDKInterface:GetTextFromClipboard() or ""
end



--------------------------------------------------------
--- begin --- Unity相关函数
--------------------------------------------------------

--- 是否编辑器模式
---@return boolean
function Manager.IsEditor()
    return UnityEngine.Application.isEditor
end

--- 查找 GameObject
---@param obj GameObject|Transform
---@param path string
---@return GameObject
function Manager.FindObject(obj, path)
    if not obj then
        return GameObject.Find(path)
    end
    return ModuleCache.ComponentUtil.Find(obj.gameObject, path)
end

--- 销毁GameObject
---@param obj GameObject|Transform
function Manager.DestroyObject(obj)
    GameObject.Destroy(obj.gameObject)
end

--- 获取GameObject上的组件
---@param obj GameObject|Transform
---@param type string
---@param path string
---@return GameObject
function Manager.GetComponent(obj, type, path)
    if path then
        return ModuleCache.ComponentManager.GetComponentWithPath(obj.gameObject, path, type)
    else
        return ModuleCache.ComponentManager.GetComponent(obj.gameObject, type)
    end
end

--- 获取GameObject子物体下的组件
---@param obj GameObject|Transform
---@param type string
---@return type[]
function Manager.GetComponentsInChildren(obj, type)
    return ModuleCache.ComponentUtil.GetComponentsInChildren(obj.gameObject, type)
end

--- 获取 Camera 组件
---@param obj GameObject|Transform
---@param path string
---@return UnityEngine.Camera
function Manager.GetCamera(obj, path)
    return Manager.GetComponent(obj.gameObject, CAMERA, path)
end

--- 获取 Canvas 组件
---@param obj GameObject|Transform
---@param path string
---@return UnityEngine.Canvas
function Manager.GetCanvas(obj, path)
    return Manager.GetComponent(obj.gameObject, CANVAS, path)
end

--- 获取 Image 组件
---@param obj GameObject|Transform
---@param path string
---@return UnityEngine.UI.Image
function Manager.GetImage(obj, path)
    return Manager.GetComponent(obj.gameObject, IMAGE, path)
end

--- 获取RawImage组件
---@param obj GameObject|Transform
---@param path string
---@return UnityEngine.UI.RawImage
function Manager.GetRawImage(obj, path)
    return Manager.GetComponent(obj.gameObject, RAWIMAGE, path)
end

--- 获取Text组件
---@param obj GameObject|Transform
---@param path string
---@return UnityEngine.UI.Text
function Manager.GetText(obj, path)
    return Manager.GetComponent(obj.gameObject, TEXT, path)
end

--- 获取InputField组件
---@param obj GameObject|Transform
---@param path string
---@return UnityEngine.UI.InputField
function Manager.GetInputField(obj, path)
    return Manager.GetComponent(obj.gameObject, INPUT, path)
end

--- 获取Button组件
---@param obj GameObject|Transform
---@param path string
---@return UnityEngine.UI.Button
function Manager.GetButton(obj, path)
    return Manager.GetComponent(obj.gameObject, BUTTON, path)
end

--- 获取Toggle组件
---@param obj GameObject|Transform
---@param path string
---@return UnityEngine.UI.Toggle
function Manager.GetToggle(obj, path)
    return Manager.GetComponent(obj.gameObject, TOGGLE, path)
end

--- 获取RectTransform组件
---@param obj GameObject|Transform
---@param path string
---@return UnityEngine.RectTransform
function Manager.GetRect(obj, path)
    return Manager.GetComponent(obj.gameObject, RECT, path)
end

--- 获取Slider组件
---@param obj GameObject|Transform
---@param path string
---@return UnityEngine.UI.Slider
function Manager.GetSlider(obj, path)
    return Manager.GetComponent(obj.gameObject, SLIDER, path)
end

--- 获取 GridLayout 组件
---@param obj GameObject|Transform
---@param path string
---@return UnityEngine.UI.GridLayoutGroup
function Manager.GetGridLayout(obj, path)
    return Manager.GetComponent(obj.gameObject, GRID, path)
end

--- 获取 SpriteHolder 组件
---@param obj GameObject|Transform
---@param path string
---@return SpriteHolder
function Manager.GetSpriteHoder(obj, path)
    return Manager.GetComponent(obj, SPRITEHOLDER, path)
end

--- 获取GameObject下的所有子物体
---@param obj GameObject|Transform
---@return GameObject[]
function Manager.GetAllChild(obj)
    return ModuleCache.ComponentUtil.GetAllChild(obj)
end

--- 销毁GameObject下除了exclude的所有子物体
---@param obj GameObject|Transform
---@param exclude GameObject|Transform|nil
function Manager.DestroyChildren(obj, exclude)
    local child = Manager.GetAllChild(obj.gameObject)
    
    for i = 0, child.Length - 1 do
        if not exclude then
            Manager.DestroyObject(child[i].gameObject)
        elseif exclude.gameObject ~= child[i].gameObject then
            Manager.DestroyObject(child[i].gameObject)
        end
    end
end

--- 从资源池加载一个物体
---@param atlas string
---@param name string
---@param parent GameObject|Transform
---@return GameObject
function Manager.InitGameObject(atlas, name, parent)
    local parentObj = parent.gameObject
    local go = ViewUtil.InitGameObject(atlas, name, parentObj)
    go.name = name

    return go
end

--- 从资源池加载一个物体，并设置层级
---@param altas string @资源打包路径
---@param name string
---@param layer int
---@return GameObject
function Manager.InitViewGameObject(atlas, name, layer)
    local go = ViewUtil.InitViewGameObject(atlas, name, layer or 0)

    return go
end

--- 拷贝GameObject，默认父物体为拷贝对象的父物体
---@param obj GameObject|Transform
---@param parentObj GameObject|Transform
---@param vector3 Vector3
---@return GameObject
function Manager.CloneObject(o, parent, vector3)
    local obj = o.gameObject
    local parentObj = parent.gameObject or obj.transform.parent

    local go
    if vector3 then
        go = ModuleCache.ComponentUtil.InstantiateLocal(obj, parentObj, vector3)
    else
        go = ModuleCache.ComponentUtil.InstantiateLocal(obj, parentObj)
    end

    go.name = obj.name

    return go
end

--- 设置GameObject的激活状态
---@param obj GameObject|Transform
---@param active boolean
function Manager.SetActive(obj, active)
    ModuleCache.ComponentUtil.SafeSetActive(obj.gameObject, active)
end

--- 获取GameObject的激活状态
---@param obj GameObject|Transform
---@return boolean
function Manager.GetActive(obj)
    return obj.gameObject.activeSelf
end

--- 设置GameObject的世界坐标
---@param obj GameObject|Transform
---@param x float|Vector3|Vector2
---@param y float
---@param z float
function Manager.SetPos(obj, x, y, z)
    if not x then return end
    if "number" == type(x) then
        local posx = x
        local posy = y or 0
        local posz = z or 0
        ModuleCache.CustomerUtil.SetPos(obj.gameObject, posx, posy, posz)
    else
        local posx = x.x
        local posy = x.y
        local posz = x.z or 0
        ModuleCache.CustomerUtil.SetPos(obj.gameObject, posx, posy, posz)
    end
end

--- 获取GameObject的世界坐标
---@param obj GameObject|Transform
---@return Vector3
function Manager.GetPos(obj)
    return obj.transform.position
end

--- 设置GameObject的本地坐标
---@param obj GameObject|Transform
---@param x float|Vector3|Vector2
---@param y float
---@param z float
function Manager.SetLocalPos(obj, x, y, z)
    if not x then return end
    if "number" == type(x) then
        local posx = x
        local posy = y or 0
        local posz = z or 0
        ModuleCache.CustomerUtil.SetLocalPos(obj.gameObject, posx, posy, posz)
    else
        local posx = x.x
        local posy = x.y
        local posz = x.z or 0
        ModuleCache.CustomerUtil.SetLocalPos(obj.gameObject, posx, posy, posz)
    end
end

--- 获取GameObject的本地坐标
---@param obj GameObject|Transform
---@return Vector3
function Manager.GetLocalPos(obj)
    return obj.transform.localPosition
end

--- 设置GameObject的缩放比例
---@param obj GameObject|Transform
---@param x float|Vector3|Vector2
---@param y float
---@param z float
function Manager.SetScale(obj, x, y, z)
    if not x then return end

    if "number" == type(x) then
        local scalex = x
        local scaley = y or x
        local scalez = z or x
        ModuleCache.CustomerUtil.SetScale(obj.gameObject, scalex, scaley, scalez)
    else
        local scalex = x.x
        local scaley = x.y or 0
        local scalez = x.z or 0
        ModuleCache.CustomerUtil.SetScale(obj.gameObject, scalex, scaley, scalez)
    end
end

--- 获取缩放比例
---@param obj GameObject|Transform
---@return Vector3
function Manager.GetScale(obj)
    return obj.transform.localScale
end

--- 设置角度
---@param obj GameObject|Transform
---@param x float
---@param y float
---@param z float
function Manager.SetRotate(obj, x, y, z)
    if not x then return end

    if "number" == type(x) then
        local rotatex = x
        local rotatey = y or x
        local rotatez = z or x
        obj.transform.localEulerAngles = Manager.Vector3(rotatex, rotatey, rotatez)
    else
        local rotatex = x.x
        local rotatey = x.y
        local rotatez = x.z
        obj.transform.localEulerAngles = Manager.Vector3(rotatex, rotatey, rotatez)
    end
end

--- 获取角度
---@param obj GameObject|Transform
---@return float
function Manager.GetRotate(obj)
    return obj.transform.localEulerAngles
end

--- 设置Text的text
function Manager.SetText(text, str)
    text.text = str
end

--- 设置Image的sprite
function Manager.SetSprite(img, sprite)
    img.sprite = sprite
end

--- 设置Rawimage的texture
function Manager.SetTexture(rawimage, texture)
    rawimage.texture = texture
end

function Manager.SetToggleOn(toggle, on)
    toggle.isOn = on
end

function Manager.GetToggleOn(toggle)
    return toggle.isOn
end

--- 添加Button的监听事件
---@param button UnityEngine.UI.Button
---@param callback function
function Manager.AddButtonListener(button, callback)
    button.onClick:AddListener(function()
        if callback then callback() end
    end)
end

--- 添加Toggle的监听事件
---@param toggle UnityEngine.UI.Toggle
---@param callback function
function Manager.AddToggleListener(toggle, callback)
    toggle.onValueChanged:AddListener(function(on)
        if callback then callback(on) end
    end)
end

--- 加载灰度材质球
---@return UnityEngine.Material|GameObject
function Manager.GetGrayMaterial()
    if not Manager.__GrayMaterial then
        Manager.__GrayMaterial = AssetBundleManager:LoadAssetBundle("public/material/gray.bytes"):GetAsset("Gray", false)
    end
    return Manager.__GrayMaterial
end

--- 设置Image材质
---@param obj GmaeObject|Transform
---@param material UnityEngine.Material
---@param penetrate boolean
function Manager.SetMaterial(obj, material, penetrate)
    local image = Manager.GetImage(obj.gameObject)
    if image then
        image.material = material
    end

    if penetrate then
        local components = Manager.GetComponentsInChildren(obj, "UnityEngine.UI.MaskableGraphic")
        local len = components.Length
        for i = 0, len - 1 do
            components[i].material = material
        end
    end
end

--- 设置Image透明度
---@param image UnityEngine.UI.Image
---@param alpha float
function Manager.SetImageAlpha(image, alpha)
    local color = image.color
    image.color = ModuleCache.CustomerUtil.ConvertColor(color.r, color.g, color.b, alpha)
end

--- 设置Button是否可用
---@param button UnityEngine.UI.Button
---@param enable boolean @按钮可用状态
---@param gray boolean @是否需要变灰
---@param penetrate boolean @是否应用到子物体
function Manager.SetButtonEnable(button, enable, gray, penetrate)
    button.interactable = enable

    if not enable and gray then
        if not Manager.__GrayMaterial then
            Manager.__GrayMaterial = Manager.GetGrayMaterial()
        end
        Manager.SetMaterial(button, Manager.__GrayMaterial, penetrate)
    elseif enable then
        Manager.SetMaterial(button, nil, true)
    end
end

--- 设置Toggle是否可用
---@param toggle UnityEngine.UI.Toggle
---@param enable boolean @按钮可用状态
---@param gray boolean @是否需要变灰
---@param penetrate boolean @是否应用到子物体
function Manager.SetToggleEnable(toggle, enable, gray, penetrate)
    toggle.interactable = enable

    if not enable and gray then
        Manager.SetMaterial(toggle, Manager.__GrayMaterial, penetrate)
    elseif enable then
        Manager.SetMaterial(toggle, nil, true)
    end
end

--- 图片恢复原大小
---@param imgOrRimg Image|RawImage
function Manager.SetNativeSize(imgOrRimg)
    if imgOrRimg then
        imgOrRimg:SetNativeSize()
    end
end

--- 设置文本颜色
---@param txt UnityEngine.UI.Text
---@param color UnityEngine.Color
function Manager.SetTextColor(txt, color)
    ModuleCache.LuaHelper.SetTextColor(txt, color)
end

--- 设置父物体
---@param obj GameObject|Transform
---@param parentObj GameObject|Transform
function Manager.SetParent(obj, parentObj)
    obj.transform:SetParent(parentObj.transform)
end

--- 转换Vector2
---@param x float
---@param y float
function Manager.Vector2(x, y)
    return UnityEngine.Vector2.New(x, y)
end

--- 转换Vector3
---@param x float
---@param y float
---@param z float
function Manager.Vector3(x, y, z)
    return UnityEngine.Vector3.New(x, y, z)
end

--- 颜色转换
---@param x int
---@param y int
---@param z int
function Manager.Color32(r, g, b, a)
    return ModuleCache.CustomerUtil.ConvertColor32(r, g, b, a)
end

--- 颜色
function Manager.Color()
    return UnityEngine.Color
end


--------------------------------------------------------
---  end  --- Unity相关函数
--------------------------------------------------------



--------------------------------------------------------
--- begin --- Module相关函数
--------------------------------------------------------

--- 显示模块
---@param packageName string
---@param moduleName string
---@param intentData table
---@return ModuleBase
function Manager.ShowModule(packageName, moduleName, intentData)
    return ModuleCache.ModuleManager.show_module(packageName, moduleName, intentData)
end

--- 隐藏模块
---@param packageName string
---@param moduleName string
function Manager.HideModule(packageName, moduleName)
    ModuleCache.ModuleManager.hide_module(packageName, moduleName)
end

--- 销毁模块
---@param packageName string
---@param moduleName string
function Manager.DestroyModule(packageName, moduleName)
    ModuleCache.ModuleManager.destroy_module(packageName, moduleName)
end

--- 获取模块
---@param packageName string
---@param moduleName string
---@return ModuleBase
function Manager.GetModule(packageName, moduleName)
    return ModuleCache.ModuleManager.get_module(packageName, moduleName)
end

--- 增加模块
---@param packageName string
---@param moduleName string
---@return ModuleBase
function Manager.AddModule(packageName, moduleName)
    return ModuleCache.ModuleManager.add_module(packageName, moduleName)
end

--- 模块是否存在
---@param packageName string
---@param moduleName string
---@return boolean
function Manager.ModuleActive(packageName, moduleName)
    return ModuleCache.ModuleManager.module_is_active(packageName, moduleName)
end

--- 只有一个确定按钮的弹窗
---@param str string
---@param callback function
function Manager.ShowDialog(str, callback)
    ModuleCache.ModuleManager.show_public_module("windowdialog")
        :show_center_button(str, 
            function()
                if callback then
                    callback()
                end
            end)
end

--- 隐藏弹窗
function Manager.HideWindw()
    ModuleCache.ModuleManager.hide_public_module("windowdialog")
end

--- 提示弹窗
---@param str string
function Manager.ShowTextPrompt(str)
    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(str)
end

--------------------------------------------------------
---  end  --- Module相关函数
--------------------------------------------------------



--------------------------------------------------------
--- begin --- System相关函数
--------------------------------------------------------

--- 获取数据格式
---@param arg any
---@return type
function Manager.Type(arg)
    return type(arg)
end

--- 格式化字符串
---@return string
function Manager.StringFormat(...)
    return string.format(...)
end

--- 转化成数字
---@return number
function Manager.ToNumber(...)
    return tonumber(...)
end

--- 随机数 注：随机数的小数点位数，由min、max的小数点位数决定
---@param arg1 float
---@param arg2 float
---@return float
function Manager.Random(arg1, arg2)
    local max = arg1 or 100
    local min = arg2 or 0

    if min < max then
        return math.random(min, max)
    else
        return math.random(max, min)
    end
end

--- 找出最大值
---@param ... float
---@return float
function Manager.Max(...)
    return math.max(...)
end

--- 判断 table 是否空
---@param table table
---@return boolean @true:不为空，false:为空  如果传入的不是table，返回false
function Manager.IsTableEmpty(table)
    if "table" == type(table) then
        return next(table)
    else
        return false
    end
end

--- 获取一个table元素数量
---@param table table
---@return number
function Manager:getTableKeyCount(table)
    if "table" ~= Manager.Type(table) then
        return 0
    end

    local count = 0
    for k, v in pairs(table) do
        count = count + 1
    end

    return count
end

--- 获取日期
---@param timestamp int
---@return nil|table
function Manager.Date(timestamp)
    if "number" ~= type(timestamp) then
        return nil
    end

    if not timestamp then
        return os.date("*t")
    end
    
    return os.date("*t", timestamp)
end

--- 获取时间格式，年-月-日 时：分：秒
---@param timestamp number
---@return string
function Manager.GetTimeFormat_YMDHMS(timestamp)
    local date = Manager.Date(timestamp)

    if date then
        local str = string.format("%4d-%02d-%02d %02d:%02d:%02d", date.year, date.month, date.day, date.hour, date.min, date.sec)
        return str
    else
        return ""
    end
end

--- 获取时间格式，月-日 时：分：秒
---@param timestamp number
---@return string
function Manager.GetTimeFormat_MDHMS(timestamp)
    local date = Manager.Date(timestamp)

    if date then
        local str = string.format("%02d-%02d %02d:%02d:%02d", date.month, date.day, date.hour, date.min, date.sec)
        return str
    else
        return ""
    end
end

--- 获取时间格式，时：分
---@param timestamp number
---@return string
function Manager.GetTimeFormat_HM(timestamp)
    local date = Manager.Date(timestamp)

    if date then
        local str = string.format("%02d:%02d", date.hour, date.min)
        return str
    else
        return ""
    end
end

--- 获取时间格式 年-月-日 时：分-时：分
---@param startTime number
---@param endTime number
---@return string
function Manager.GetTimeFormat_YMDHMHM(startTime, endTime)
    local startT = Manager.Date(startTime)
    local endT = Manager.Date(endTime)

    if startT and endT then
        return string.format("%4d-%2d-%2d %2d:%2d-%2d:%2d", startT.year, startT.month, startT.day, startT.hour, startT.min, endT.hour, endT.min)
    else
        return ""
    end
end

--------------------------------------------------------
---  end  --- System相关函数
--------------------------------------------------------



--------------------------------------------------------
--- begin --- SmartTimer相关函数
--------------------------------------------------------

--- 获取 SmartTimer
function Manager.SmartTimer()
    return SmartTimer
end

--- 设置服务器与客户端时间差
---@param time number
function Manager.SetTimeDiff(time)
    local now = os.time()
    SmartTimer.serverTimeDiff = now - time
end

--- 注册SmartTimer事件，返回事件id
---@param totalTime float @总时长
---@param realTime boolean @计时类型 是否为真实时间
---@param timeType int @计时类型 true对应2，false对应0
---@param intervalTime float @刷新间隔
---@param updateCallback function @间隔时间回调
---@param completeCallback function @倒计时结束回调
---@return int
function Manager.GetSmartTimer(totalTime, realTime, timeType, intervalTime, updateCallback, completeCallback)
    local interval = intervalTime or 1
    return SmartTimer:Subscribe(totalTime, realTime, timeType)
    :SetIntervalTime(interval, nil)
    :OnUpdate(function(timeEvent)
        if updateCallback then updateCallback(timeEvent) end
    end)
    :OnComplete(function()
        if completeCallback then completeCallback() end
    end)
    :Start().id
end

--- 销毁SmartTimer事件
---@param arg table|int
function Manager.KillSmartTimer(arg)
    if type(arg) == "table" then
        for _, v in pairs(arg) do
            Manager.KillSmartTimer(v)
        end
    elseif type(arg) == "number" then
        SmartTimer:Kill(arg)
    else
        if not arg then print("type = ", type(arg)) end
    end
end

--------------------------------------------------------
--- end --- SmartTimer相关函数
--------------------------------------------------------



--------------------------------------------------------
--- begin --- DOTween相关函数
--------------------------------------------------------

--- DOTween 队列
---@return DOTween.Sequence

--- 延迟一段时间再执行相应函数，自动执行，自动回收
---@param time float
---@param callback function
function Manager.Delay(time, callback)
    local seq = DOTween.Sequence()
    seq:InsertCallback(time, function()
        if callback then
            callback()
        end
    end)
    seq:SetAutoKill(true)
    seq:Play()
end

--- 物体世界坐标移动
---@param obj GameObject|Transform
---@param endVector3 Vector3
---@param time float
---@return GameObject
function Manager.Move(obj, endVector3, time)
    return obj.transform:DOMove(endVector3, time, false)
end

--- 物体本地坐标移动
---@param obj GameObject|Transform
---@param endVector3 Vector3
---@param time float
---@return GameObject
function Manager.LocalMove(obj, endVector3, time)
    return obj.transform:DOLocalMove(endVector3, time, false)
end

--- 物体缩放
---@param obj GameObject|Transform
---@param endVector3 Vector3
---@param time float
---@return GameObject
function Manager.DoScale(obj, endScale, time)
    return obj.transform:DOScale(endScale, time)
end

--- x 轴缩放
---@param obj GameObject|Transform
---@param scale float
---@param time float
---@return GameObject
function Manager.DoScaleX(obj, scale, time)
    return obj.transform:DOscaleX(scale, time)
end

--- 物体本地坐标旋转
---@param obj GameObject|Transform
---@param endVector3 Vector3
---@param time float
---@return GameObject
function Manager.LocalRotate(obj, endVector3, time)
    return obj.transform:DOLocalRotate(endVector3, time, RotateMode.Fast)
end

--------------------------------------------------------
---  end  --- DOTween相关函数
--------------------------------------------------------



--------------------------------------------------------
--- start --- 声音相关函数
--------------------------------------------------------

--- 设置静音
function Manager.SetMusicMute(b)
    SoundManager.set_music_mute(b)
end

--- 设置静音
function Manager.SetVoiceMute(b)
    SoundManager.set_voice_mute(b)
end

--- 获取音乐设置
function Manager.GetMusicVolume()
    return SoundManager.get_music_volume()
end

--- 设置音乐开关
function Manager.SetMusicVolume(volume)
    SoundManager.set_music_volume(volume)
end

--- 获取音效设置
function Manager.GetSoundVolume()
    return SoundManager.get_sound_volume()
end

--- 设置音效开关
function Manager.SetSoundVolume(volume)
    SoundManager.set_sound_volume(volume)
end

--- 播放音乐
function Manager.PlayMusic(package, atlas, name)
    SoundManager.play_music(package, atlas, name)
end

--- 播放音效
function Manager.PlaySound(package, atlas, name)
    SoundManager.play_sound(package, atlas, name)
end

--------------------------------------------------------
--- end --- 声音相关函数
--------------------------------------------------------



--------------------------------------------------------
--- start --- 保存相关函数
--------------------------------------------------------

--- 保存一个 int 值
---@param name string
---@param value int
function Manager.SetPlayerPrefsInt(name, value)
    PlayerPrefs.SetInt(name, value)
end

--- 获取一个保存的 int 值，默认值为 0
---@return int
function Manager.GetPlayerPrefsInt(name,def)
    if(def==nil) then
        def = 0
    end
    return PlayerPrefs.GetInt(name,def)
end

function Manager.DelPlayerPrefsInt(name)
    PlayerPrefs.DeleteKey(name)
end

--------------------------------------------------------
--- end --- 保存相关函数
--------------------------------------------------------



--------------------------------------------------------
--- start --- 游戏相关函数
--------------------------------------------------------

---压缩图片，返回压缩图片的路径
---@param path string @ 图片路径
---@param width int @ 压缩后的宽度，默认为屏幕高度
---@param height int @ 压缩后的高度，默认为屏幕高度
---@param compressRate float @ 压缩比例，默认0.5
function Manager.CompressPngToJpg(path, width, height, compressRate)
    local w = width or UnityEngine.Screen.width
    local h = height or UnityEngine.Screen.height
    local rate = compressRate or 0.5
    return GameManager.CompressPngToJpg(path, w, h, rate)
end

--------------------------------------------------------
---  end  --- 游戏相关函数
--------------------------------------------------------

-- 分享回调 模版
--ModuleCache.WechatManager.onSendMessageToWXResp = function(data)
--    print(data, "onSendMessageToWXResp")
--    local retData = ModuleCache.Json.decode(data)
--    if (retData.errCode == 0 and self._shareAppDownloadLinkUrlToTimeline) then
--        local activity = self:getActivityByCode("share");
--        if activity ~= nil then
--            -- 未领取奖励
--            if activity.isReceive == 0 then
--
--                local callback = function(args)
--
--                    local onGetAwards = function()
--
--                        self.modelData.shareData.isShare = false;
--                        self.modelData.hallData.activityList = nil;
--                        self:dispatch_module_event("hall", "Event_refresh_userinfo")
--                        --self.hallView:refreshPlayerInfo(self.modelData.roleData)
--                    end
--                    -- 请求领取活动奖励协议
--                    self:getAwards(activity.activityId, onGetAwards);
--                end
--                -- local message = string.format("分享成功,获得<color=#AA391FFF>%d</color>钻石奖励!", activity.appAwards.amount);
--                ModuleCache.ModuleManager.show_public_module("alertdialog"):show_receive("分享成功，点击领取即可获得钻石奖励", callback)
--            end
--        end
--    end
--    print_table(retData, "onSendMessageToWXResp")
--end

--------------------------------------------------------
--- start --- SDK相关函数
--------------------------------------------------------
--- 获取当前运行环境
---@return string @"WindowsEditor" "Android" "IPhonePlayer"
function Manager.GetPlatform()
    return GameSDKInterface:GetPlatformName()
end

---压缩图片，返回压缩图片的路径
---@param path string @ 图片路径
---@param width int @ 压缩后的宽度，默认为屏幕高度
---@param height int @ 压缩后的高度，默认为屏幕高度
---@param compressRate float @ 压缩比例，默认0.5
function Manager.CompressPngToJpg(path, width, height, compressRate)
    local w = width or UnityEngine.Screen.width
    local h = height or UnityEngine.Screen.height
    local rate = compressRate or 0.5
    return GameManager.CompressPngToJpg(path, w, h, rate)
end

--------------------------------------------------------
---  end  --- SDK相关函数
--------------------------------------------------------



--------------------------------------------------------
---  start  --- File相关函数
--------------------------------------------------------
--- 删除对应路径的文件
---@param path string
---@param b boolean
function Manager.DeleteDirectory(path, b)
    if not path then return end

    if "string" ~= Manager.Type(path) then return end

    ModuleCache.FileUtility.DirectoryDelete(path, b)
end

--- 创建文件
---@param path string
function Manager.DirectoryCreate(path)
    if not path then return end

    if "string" ~= Manager.Type(path) then return end

    ModuleCache.FileUtility.DirectoryCreate(path)
end
--------------------------------------------------------
---  end  --- File相关函数
--------------------------------------------------------



--------------------------------------------------------
---  start  --- 暂无归类
--------------------------------------------------------
local Application = UnityEngine.Application
--- 获取应用信息
---@param Application
function Manager.GetApplication()
    return Application
end

--- 获取当前路径
---@return string
function Manager.GetPersistentDataPath()
    return Application.persistentDataPath
end

--------------------------------------------------------
---  end  --- 暂无归类
--------------------------------------------------------




return Manager