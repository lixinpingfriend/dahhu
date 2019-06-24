local class = require("lib.middleclass")
local ViewUtil = ModuleCache.ViewUtil

ViewBaseData = {}
ViewBaseData.TopScreenAdaptParam = 0.97
ViewBaseData.GameScreenAdaptParam = 0.93

local MVVMBase = require('core.mvvm.mvvm_base')
---@class View : MVVMBase
local View = class('View', MVVMBase)
local UnityEngine = UnityEngine
local ModuleCache = ModuleCache
local Tween = DG.Tweening
function View:initialize(assetBundleName, mainAssetName, sortingLayer, registerPreLoad)
	self:init_camera()
    MVVMBase.initialize(self)

    local layer = sortingLayer or 0
    if(self.packageName and self.moduleName)then
        if(registerPreLoad)then
            --ModuleCache.PreLoadManager.registerPreLoad(self.packageName, self.moduleName, assetBundleName, mainAssetName)
        end
    end
    --ModuleCache.Log.begin_counting()
    self.root = ViewUtil.InitViewGameObject(assetBundleName, mainAssetName, layer); --同步加载
    self.rootTransform = self.root.transform
    self.mainAssetName= mainAssetName
    self.canvas = ModuleCache.ComponentManager.GetComponent(self.root, "UnityEngine.Canvas");
    --ModuleCache.Log.end_counting("InitViewGameObject：" .. mainAssetName)
    --local rootComponentCache = ModuleCache.ComponentManager.GetComponent(self.root, "test");
    --if(rootComponentCache)then
    --    self._componentCache = (require('core.mvvm.component_cache')):new()
    --    self._componentCache:bindComponent(rootComponentCache)
    --end
    --self:hide()
    if self.on_inited then
        self:on_inited()
    end

end

function View:init_camera(bAdapt)
	if ModuleCache.AppData.isFullScreen ~= true then
		return
	end
	if self.AdaptScreen == nil then
		return 
	end
	if bAdapt == nil then
		bAdapt = self.AdaptScreen
	end
	local gameRoot = UnityEngine.GameObject.Find("GameRoot")
	local canvasScaler = ModuleCache.ComponentManager.GetComponentWithPath(gameRoot, "Game/UIRoot/UIWindowParent/Canvas/CanvasScaler", ComponentTypeName.RectTransform)
	local canvas = ModuleCache.ComponentManager.GetComponentWithPath(gameRoot, "Game/UIRoot/UIWindowParent/Canvas", ComponentTypeName.RectTransform)
	local camera = ModuleCache.ComponentManager.GetComponentWithPath(gameRoot, "Game/UIRoot/UICamera", ComponentTypeName.Camera)

	local objiPhoneXBlcok = UnityEngine.GameObject.Find("GameRoot/Game/UIRoot/UIWindowParent/Canvas/iPhoneBlock")
	if objiPhoneXBlcok and ModuleCache.GameManager.isEditor then
		objiPhoneXBlcok:SetActive(bAdapt == true)
	end
	canvasScaler.gameObject:SetActive(true)
	if bAdapt then
		camera.rect = UnityEngine.Rect(0, 0, 1, 1)
		canvas.sizeDelta = Vector2(ModuleCache.GameManager.canvasScalerSize.x, ModuleCache.GameManager.canvasScalerSize.y)
	else
		camera.rect = UnityEngine.Rect(0.05, 0, 0.90, 1)
		canvas.sizeDelta = Vector2(ModuleCache.GameManager.canvasScalerSize.x * 0.9, ModuleCache.GameManager.canvasScalerSize.y)
	end
	canvasScaler.gameObject:SetActive(false)
end

---InstantiateGameObjectAsync
---@param parentGameObject string 父物体
---@param assetBundleName string  AssetBundle路径
---@param mainAssetName string    主Asset
---@param instantiateCallback table
function View:InstantiateGameObjectAsync(parentGameObject, assetBundleName, mainAssetName, instantiateCallback)
    ModuleCache.AssetBundleManager:LoadAssetBundleAsync(assetBundleName, mainAssetName, function (loadAssetBundle)
        if not self.isDestroy then
            if loadAssetBundle then
                local asset = loadAssetBundle:GetAsset(mainAssetName, false)
                local gameRoot = ModuleCache.ComponentUtil.InstantiateLocal(asset, parentGameObject)
                gameRoot:SetActive(true)
            end
        end
    end)
end



-- 显示
function View:show(showTop)
    --ModuleCache.Log.begin_counting()
    if self.root then
        self._active = true
        self.rootTransform:SetAsLastSibling()
        ViewUtil.ShowTop(self.root)
    end
    --ModuleCache.Log.end_counting("View:show(showTop)")
end

function View:active()
    if self.root then
        self._active = true
        self.root:SetActive(true)
    end
end

--设置1080分辨率
function View:set_1080p()
    self.rootTransform.sizeDelta = self.rootTransform.sizeDelta * 1.5
    self.rootTransform.localScale = self.rootTransform.localScale * 0.666666
end

function View:do_positionX(trans, moveTime, targetX, func)
    if not trans then
        return
    end
    if not moveTime then
        moveTime = 0.3
    end
    trans.gameObject:SetActive(true)
    local sequence = self:create_sequence()
    sequence:Append(trans:DOLocalMoveX(targetX, moveTime)):SetEase(Tween.Ease.InQuad):OnComplete(function()
        if func then
            func()
        end
    end)
end

function View:do_positionY(trans, moveTime, targetX, func)
    if not trans then
        return
    end
    if not moveTime then
        moveTime = 0.3
    end
    trans.gameObject:SetActive(true)
    local sequence = self:create_sequence()
    sequence:Append(trans:DOLocalMoveY(targetX, moveTime)):SetEase(Tween.Ease.InQuad):OnComplete(function()
        if func then
            func()
        end
    end)
end

--ti 动画播放时间
--trans transform
--ts 目标scale（nil为关闭，缩小至0）其他为放大倍数
function View:do_scale(trans, moveTime, targetScale, func)
    if not trans then
        return
    end
    local minScale = 0
    if not moveTime then
        moveTime = 0.3
    end
    if not targetScale or targetScale == 0 then
        targetScale = minScale
    else
        trans.localScale = Vector3.New(minScale, minScale, minScale)
    end
    trans.gameObject:SetActive(true)
    local sequence = self:create_sequence()
    sequence:Append(trans:DOScale(Vector3.New(targetScale, targetScale, targetScale), moveTime)):SetEase(Tween.Ease.InQuad):OnComplete(function()
        if targetScale == minScale then
            trans.gameObject:SetActive(false)
        else
            trans.gameObject:SetActive(true)
        end
        if func then
            func()
        end
    end)
end

function View:do_fade(image, moveTime, targetValue, func)
    if not image then
        return
    end
    local minValue = 0
    if not moveTime then
        moveTime = 0.3
    end
    if not targetValue or targetValue == 0 then
        targetValue = minValue
    else
        image.alpha = 0
    end
    image.transform.gameObject:SetActive(true)
    local sequence = self:create_sequence()
    sequence:Append(image:DOFade(targetValue, moveTime)):SetEase(Tween.Ease.InQuad):OnComplete(function()
        if targetValue == minValue then
            image.transform.gameObject:SetActive(false)
        end
        if func then
            func()
        end
    end)
end


--设置image填满
function View:set_image_fill(image,size)
    --image.preserveAspect = true
    ----print("---------------image:",image.gameObject.name)
    ----print("---------------image.sprite:",image.sprite)
    ----print("---------------image.sprite.rect.width:",image.sprite.rect.width)
    --if image.sprite ~= nil  then
    --    local w = image.sprite.rect.width
    --    local h = image.sprite.rect.height
    --    local tectTransf = ModuleCache.ComponentManager.GetComponent(image.gameObject,"UnityEngine.RectTransform")
    --    if w > h then
    --        tectTransf.sizeDelta = Vector2.New( w/h *size,size)
    --    else
    --        tectTransf.sizeDelta = Vector2.New( size,h/w *size)
    --    end
    --end
end

--固定节点的尺寸 
function View:fixed_tran_size(tran, size)
	if size == nil then
		size = 0.95
	end
	if ModuleCache.AppData.isFullScreen ~= true then	--防止nil漏判断
		return
	end
	if tran == nil then
		return
	end
	local rTran = tran:GetComponent("RectTransform")
	if rTran == nil then
		return 
	end

	rTran.anchorMin = Vector2(0.5, 0.5)
	rTran.anchorMax = Vector2(0.5, 0.5)
	rTran.anchoredPosition = Vector2(0,0)

	--获取Root的尺寸
	local rootTran = self.root:GetComponent("RectTransform")
	rTran.sizeDelta = Vector2(rootTran.sizeDelta.x * size, rootTran.sizeDelta.y)
end

function View:hide()
--    print('self.root', self.root)
    self._active = false
    if self.root then
        self.canvas.sortingOrder = 0
        self.root:SetActive(false)
    end
end

function View:is_active()
    return self._active
end



--销
function View:destroy()
    MVVMBase.base_destroy(self)
    self.isDestroy = true

    if self.on_destroy then
        self:on_destroy()
    end
    self._is_destroyed = true
    if self.root then
        self.canvas.sortingOrder = 0
        --之前忘记隐藏预制件，就会有问题啊
        self.root:SetActive(false)
        UnityEngine.GameObject.Destroy(self.root)
    end
end



return View