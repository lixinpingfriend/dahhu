



local DG = DG
local LuaBridge = LuaBridge
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine

local GameManager = ModuleCache.GameManager
local SmartTimer = LuaBridge.SmartTimer.instance
local ViewUtil = LuaBridge.ViewUtil

--- unity global
local AssetBundleManager = LuaBridge.AssetBundleManager.instance
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
local TEXT = "UnityEngine.UI.Text"
local TOGGLE = "UnityEngine.UI.Toggle"
local TEXTWRAPEX = "TextWrapEx"

--- system
local print = print
local require = require
local string = string
local tonumber = tonumber
local type = type
local math = math

--- dotween
local DOTween = DG.Tweening.DOTween
local RotateMode = DG.Tweening.RotateMode

--- 声音
local SoundManager = require("manager.sound_manager")

local Manager = {}



--------------------------------------------------------
--- begin --- Unity相关函数
--------------------------------------------------------

--- 是否编辑器模式
function Manager.IsEditor()
    return UnityEngine.Application.isEditor
end

--- 查找 GameObject
function Manager.FindObject(obj, path)
    if not obj then
        return UnityEngine.GameObject.Find(path)
    end
    return ModuleCache.ComponentUtil.Find(obj, path)
end

--- 销毁GameObject
function Manager.DestroyObject(obj)
    GameObject.Destroy(obj)
end

--- 获取GameObject上的组件
function Manager.GetComponent(obj, type)
    return ModuleCache.ComponentManager.GetComponent(obj, type)
end

--- 根据路径获取组件
function Manager.GetComponentWithPath(obj, path, type)
    return ModuleCache.ComponentManager.GetComponentWithPath(obj, path, type)
end

--- 获取GameObject子物体下所有的组件
function Manager.GetComponentsInChildren(obj, type)
    return ModuleCache.ComponentUtil.GetComponentsInChildren(obj, type)
end

--- 获取 Camera 组件
function Manager.GetCamera(obj, path)
    if not path then
        return Manager.GetComponent(obj, CAMERA)
    end

    return Manager.GetComponentWithPath(obj, path, CAMERA)
end

--- 获取 Canvas 组件
function Manager.GetCanvas(obj, path)
    if not path then
        return Manager.GetComponent(obj, CANVAS)
    end

    return Manager.GetComponentWithPath(obj, path, CANVAS)
end

--- 获取 Image 组件
function Manager.GetImage(obj, path)
    if not path then
        return Manager.GetComponent(obj, IMAGE)
    end

    return Manager.GetComponentWithPath(obj, path, IMAGE)
end

--- 获取RawImage组件
function Manager.GetRawImage(obj, path)
    if not path then
        return Manager.GetComponent(obj, RAWIMAGE)
    end

    return Manager.GetComponentWithPath(obj, path, RAWIMAGE)
end

--- 获取Text组件
function Manager.GetText(obj, path)
    if not path then
        return Manager.GetComponent(obj, TEXT)
    end
    
    return Manager.GetComponentWithPath(obj, path, TEXT)
end

--- 获取InputField组件
function Manager.GetInputField(obj, path)
    if not path then
        return Manager.GetComponent(obj, INPUT)
    end

    return Manager.GetComponentWithPath(obj, path, INPUT)
end

--- 获取Button组件
function Manager.GetButton(obj, path)
    if not path then
        return Manager.GetComponent(obj, BUTTON)
    end
    
    return Manager.GetComponentWithPath(obj, path, BUTTON)
end

--- 获取Toggle组件
function Manager.GetToggle(obj, path)
    if not path then
        return Manager.GetComponent(obj, TOGGLE)
    end
    
    return Manager.GetComponentWithPath(obj, path, TOGGLE)
end

--- 获取RectTransform组件
function Manager.GetRect(obj, path)
    if not path then
        return Manager.GetComponent(obj, RECT)
    end
    
    return Manager.GetComponentWithPath(obj, path, RECT)
end

--- 获取Slider组件
function Manager.GetSlider(obj, path)
    if not path then
        return Manager.GetComponent(obj, SLIDER)
    end

    return Manager.GetComponentWithPath(obj, path, SLIDER)
end

--- 径获取 GridLayout 组件
function Manager.GetGridLayout(obj, path)
    if not path then
        return Manager.GetComponent(obj, GRID)
    end

    return Manager.GetComponentWithPath(obj, path, GRID)
end

--- 获取 TextWrapEx 组件
function Manager.GetTextWrapEx(obj, path)
    if not path then
        return Manager.GetComponent(obj, TEXTWRAPEX)
    end

    return Manager.GetComponentWithPath(obj, path, TEXTWRAPEX)
end

--- 获取GameObject下的所有子物体
function Manager.GetAllChild(obj)
    return ModuleCache.ComponentUtil.GetAllChild(obj)
end

--- 销毁GameObject下除了exclude的所有子物体
function Manager.DestroyChildren(obj, exclude)
    local child = Manager.GetAllChild(obj)
    
    for i = 0, child.Length - 1 do
        if exclude ~= child[i].gameObject then
            Manager.DestroyObject(child[i].gameObject)
        end
    end
end

--- 从资源池加载一个物体
function Manager.InitViewGameObject(atlas, name, parent, layer)
    local layer = layer or 0
    local go = ViewUtil.InitViewGameObject(atlas, name, layer)
    Manager.SetParent(go, parent)

    return go
end

--- 从资源池加载一个物体
function Manager.Instantiate(atlas, name, parent, reset)
    local obj = AssetBundleManager:LoadAssetBundle(atlas):GetAsset(name, false).gameObject
    local go = Manager.CopyObject(obj, parent, reset)
    go.name = name

    return go
end

--- 拷贝GameObject，默认父物体为拷贝对象的父物体
function Manager.CopyObject(obj, parentObj, reset)
    local parent = parentObj or obj.transform.parent

    if reset then
        return ModuleCache.ComponentUtil.InstantiateLocal(obj, parent)
    else
        return ModuleCache.CustomerUtil.Instantiate(obj, parent.transform)
    end
end

-- 获取所有子物体
function Manager.get_all_child(parent)
    local childs = {}
    local index = 1
    for i = 1, parent.transform.childCount do
        local obj = parent.transform:GetChild(i - 1).gameObject
		childs[index] = obj
		index = index + 1
    end
    return childs
end

-- 克隆
function Manager.clone(obj, parent, pos)
    local target = ModuleCache.ComponentUtil.InstantiateLocal(obj, parent, pos)
    target.name = obj.name
    ModuleCache.ComponentUtil.SafeSetActive(target, true)
    return target
end

--- 设置GameObject的激活状态
function Manager.SetActive(obj, active)
    if obj then
        obj:SetActive(active)
    end
end

--- 获取GameObject的激活状态
function Manager.GetActive(obj)
    return obj.activeSelf
end

--- 设置GameObject的世界坐标
function Manager.SetPos(obj, x, y, z)
    ModuleCache.CustomerUtil.SetPos(obj, x, y, z)
end

--- 获取GameObject的世界坐标
function Manager.GetPos(obj)
    return obj.transform.position
end

--- 设置GameObject的本地坐标
function Manager.SetLocalPos(obj, x, y, z)
    ModuleCache.CustomerUtil.SetLocalPos(obj, x, y, z)
end

--- 获取GameObject的本地坐标
function Manager.GetLocalPos(obj)
    return obj.transform.localPosition
end

--- 设置GameObject的缩放比例
function Manager.SetScale(obj, x, y, z)
    ModuleCache.CustomerUtil.SetScale(obj, x, y, z)
end

--- 获取缩放比例
function Manager.GetScale(obj)
    return obj.transform.localScale
end

--- 设置角度
function Manager.SetRotate(obj, x, y, z)
    obj.transform.localEulerAngles = Manager.Vector3(x, y, z)
end

--- 获取角度
function Manager.GetRotate(obj)
    return obj.transform.localEulerAngles
end

--- 设置Text的文字字符串
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

function Manager.SetToggleOn(tog, on)
    tog.isOn = on
end

function Manager.GetToggleOn(tog)
    return tog.isOn
end

--- 添加Button的监听事件
function Manager.AddButtonListener(btn, callback)
    btn.onClick:AddListener(function() callback() end)
end

--- 添加Toggle的监听事件
function Manager.AddToggleListener(tog, callback)
    tog.onValueChanged:AddListener(function(on)
        callback(on)
    end)
end

--- 设置Image灰度
function Manager.SetImageGray(img, gray, children)
    ModuleCache.CustomerUtil.SetGray(img, gray, children)
end

--- 设置Image透明度
function Manager.SetImageAlpha(img, alpha)
    local col = img.color
    img.color = ModuleCache.CustomerUtil.ConvertColor(col.r, col.g, col.b, alpha)
end

--- 设置Button是否可用
function Manager.SetBtnEnable(btn, enable, gray)
    btn.interactable = enable
    if gray then
        Manager.SetImageGray(btn.image, not enable, true)
    end
end

--- 设置Toggle是否可用
function Manager.SetTogEnable(tog, enable, gray)
    tog.interactable = enable
    if gray then
        Manager.SetImageGray(tog.img, not enable, true)
    end
end

--- 图片恢复原大小
function Manager.SetNativeSize(imgOrRimg)
    if imgOrRimg then
        imgOrRimg:SetNativeSize()
    end
end

--- 设置文本颜色
function Manager.SetTextColor(txt, col)
    ModuleCache.LuaHelper.SetTextColor(txt, col)
end

--- 设置父物体
function Manager.SetParent(obj, parentObj)
    obj.transform:SetParent(parentObj.transform)
end

--- 转换Vector2
function Manager.Vector2(x, y)
    return ModuleCache.CustomerUtil.ConvertVector2(x, y)
end

--- 转换Vector3
function Manager.Vector3(x, y, z)
    return ModuleCache.CustomerUtil.ConvertVector3(x, y, z)
end

--- 颜色转换
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
function Manager.ShowModule(packageName, moduleName, intentData)
    return ModuleCache.ModuleManager.show_module(packageName, moduleName, intentData)
end

--- 隐藏模块
function Manager.HideModule(packageName, moduleName)
    ModuleCache.ModuleManager.hide_module(packageName, moduleName)
end

--- 销毁模块
function Manager.DestroyModule(packageName, moduleName)
    ModuleCache.ModuleManager.destroy_module(packageName, moduleName)
end

--- 获取模块
function Manager.GetModule(packageName, moduleName)
    return ModuleCache.ModuleManager.get_module(packageName, moduleName)
end

--- 增加模块
function Manager.AddModule(packageName, moduleName)
    return ModuleCache.ModuleManager.add_module(packageName, moduleName)
end

---
function Manager.ModuleActive(packageName, moduleName)
    return ModuleCache.ModuleManager.module_is_active(packageName, moduleName)
end

--- 只有一个确定按钮的弹窗
function Manager.ShowDialog(str, callback)
    ModuleCache.ModuleManager.show_public_module("windowdialog")
        :show_center_button(str, 
            function()
                if callback then
                    callback()
                end
            end)
end

function Manager.HideWindw()
    ModuleCache.ModuleManager.hide_public_module("windowdialog")
end

function Manager.ShowTextPrompt(str)
    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(str)
end

function Manager.ShowLoading(show)
    if show then
        ModuleCache.ModuleManager.show_public_module("loadingprompt")
    else
        ModuleCache.ModuleManager.hide_public_module("loadingprompt")
    end
end

--------------------------------------------------------
---  end  --- Module相关函数
--------------------------------------------------------



--------------------------------------------------------
--- begin --- System相关函数
--------------------------------------------------------

--- 获取数据格式
function Manager.Type(arg)
    return type(arg)
end

--- 格式化字符串
function Manager.StringFormat(...)
    return string.format(...)
end

--- 转化成数字
function Manager.ToNumber(...)
    return tonumber(...)
end

--- 随机数
--- 随机数的小数点位数，由min、max的小数点位数决定
function Manager.Random(max, min)
    if (not max) or (not min) then
        print("args error! default max = 100, default min = 0")
        return math.random(100)
    end

    if min < max then
        return math.random(min, max)
    else
        return math.random(max, min)
    end
end

--- table 是否空 true:不为空，nil:为空  如果传入的不是table，返回false
function Manager.IsTableEmpty(tab)
    if "table" == type(tab) then
        return next(tab)
    else
        return false
    end
end

--- 获取日期
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
function Manager.SetTimeDiff(time)
    local now = os.time()
    SmartTimer.serverTimeDiff = now - time
end

--- 注册SmartTimer事件，返回事件id
function Manager.GetSmartTimer(totalTime, realTime, timeType, intervalTime, updateCallback, completeCallback)
    local intervalTime = intervalTime or 1
    return SmartTimer:Subscribe(totalTime, realTime, timeType)
    :SetIntervalTime(intervalTime, nil)
    :OnUpdate(function(timeEvent)
        if updateCallback then updateCallback(timeEvent) end
    end)
    :OnComplete(function()
        if completeCallback then completeCallback() end
    end)
    :Start().id
end

--- 销毁SmartTimer事件
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


--- 延迟一段时间再执行相应函数
function Manager.Delay(time, callback, modelData)
    local seq = DOTween.Sequence()
    seq:InsertCallback(time, function()
        if callback then
            callback()
        end
    end)
    seq:SetAutoKill(true)
    seq:Play()
    if modelData then modelData.AddSequence(seq) end
end

--- 物体世界坐标移动
function Manager.Move(obj, endVector3, time)
    return obj.transform:DOMove(endVector3, time, false)
end

--- 物体本地坐标移动
function Manager.LocalMove(obj, endVector3, time)
    return obj.transform:DOLocalMove(endVector3, time, false)
end

--- 物体缩放
function Manager.DoScale(obj, endScale, time, callback)
    return obj.transform:DOScale(endScale, time)
end

--- x 轴缩放
function Manager.DoScaleX(obj, scale, time)
    return obj.transform:DOscaleX(scale, time)
end

--- 物体本地坐标旋转
function Manager.LocalRotate(obj, endVector3, time)
    return obj.transform:DOLocalRotate(endVector3, time, RotateMode.Fast)
end

--------------------------------------------------------
---  end  --- DOTween相关函数
--------------------------------------------------------



--------------------------------------------------------
--- start --- sdk相关函数
--------------------------------------------------------
local GameSDK = LuaBridge.GameSDKInterface.instance

--- 游戏 sdk
function Manager.GameSDK()
    return LuaBridge.GameSDKInterface.instance
end

---  end  --- sdk相关函数
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

function Manager.GetPlayerPrefs()
    return PlayerPrefs
end

--- 保存一个 int 值
function Manager.SetPlayerPrefsInt(name, value)
    PlayerPrefs.SetInt(name, value)
end

--- 获取一个保存的 int 值，默认值为 0
function Manager.GetPlayerPrefsInt(name)
    return PlayerPrefs.GetInt(name)
end

--------------------------------------------------------
--- end --- 保存相关函数
--------------------------------------------------------



--------------------------------------------------------
--- start --- 游戏相关函数
--------------------------------------------------------

--- 压缩图片
function Manager.CompressPngToJpg(path, width, height, compressRate)
    local width = width or UnityEngine.Screen.width
    local height = height or UnityEngine.Screen.height
    local compressRate = compressRate or 0.5
    return GameManager.CompressPngToJpg(path, width, height, compressRate)
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

return Manager