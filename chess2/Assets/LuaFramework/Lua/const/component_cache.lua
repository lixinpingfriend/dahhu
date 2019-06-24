---@class ComponentCache
local ComponentCacheData = {}

function ComponentCacheData.init()
    local gameRoot = UnityEngine.GameObject.Find("GameRoot")
    ComponentCacheData.uiCamera = ModuleCache.ComponentManager.GetComponentWithPath(gameRoot, "Game/UIRoot/UICamera", "UnityEngine.Camera")
    ComponentCacheData.uiHallCameraCullingMask = ModuleCache.ComponentManager.GetComponentWithPath(gameRoot, "Game/UIRoot/UICamera/UIHallCameraCullingMask", "UnityEngine.Camera")
	ComponentCacheData.uiCameraCullingMaskValue = ComponentCacheData.uiCamera.cullingMask
	if ComponentCacheData.uiHallCameraCullingMask and ComponentCacheData.uiHallCameraCullingMask.cullingMask then
		ComponentCacheData.uiHallCameraCullingMaskValue = ComponentCacheData.uiHallCameraCullingMask.cullingMask
	end
end

return ComponentCacheData