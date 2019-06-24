
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
local BaseView = require('package.public.module.chessmuseum.chessmuseum_base_view')
-- ==========================================================================

---@class ChessMuseumView2D : View
local ChessMuseumView2D = Class('chessMuseumView2D', BaseView)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentManager
local PlayerPrefsManager = ModuleCache.PlayerPrefsManager
local CSmartTimer = ModuleCache.SmartTimer.instance
local CustomImageManager = ModuleCache.CustomImageManager
local Application = UnityEngine.Application
local Vector2 = Vector2

function ChessMuseumView2D:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/chessmuseum/public_chessmuseum.prefab", "Public_ChessMuseum", 0)
    View.set_1080p(self)
    self:on_initialize_ui()

    self.museumListShowPosX = 589.3
    if ModuleCache.AppData.isFullScreen == true then
        self.museumListShowPosX = 680
    end
    self.museumListShow = PlayerPrefsManager.GetInt("museumListOpenState", 0) == 1   -- 1 展开  0 收回
    self:museumListState(self.museumListShow)
end

function ChessMuseumView2D:museumListState(show)
    self.museumListShow = show
    self.museumListShouHuiIcon1:SetActive(not show)
    self.museumListShouHuiIcon2:SetActive(  show)
    if show then
        self.museumListPanel.transform.localPosition = Vector3.New(self.anchor.left.localPosition.x +self.museumListShowPosX, self.museumListPanel.transform.localPosition.y, 0)
        PlayerPrefsManager.SetInt("museumListOpenState", 1)  -- 1 展开  0 收回
    else
        self.museumListPanel.transform.localPosition = Vector3.New(self.anchor.left.localPosition.x -20, self.museumListPanel.transform.localPosition.y, 0)
        PlayerPrefsManager.SetInt("museumListOpenState", 0)  -- 1 展开  0 收回
    end
end

function ChessMuseumView2D:museumPanelMove()
    self.museumListShow = not self.museumListShow
    if  self.museumListShow then
        PlayerPrefsManager.SetInt("museumListOpenState", 1)  -- 1 展开  0 收回
    else
        PlayerPrefsManager.SetInt("museumListOpenState", 0)
    end

    ModuleCache.GameManager.set_application_target_frame_rate(60)
    self.museumListShouHuiIcon1:SetActive(not self.museumListShow)
    self.museumListShouHuiIcon2:SetActive(  self.museumListShow)

    if  self.museumListShow then
        --self.museumListPanel.transform.localPosition = Vector3.New(self.anchor.left.localPosition.x +593.8, -1062.4, 0)
        self:do_positionX(self.museumListPanel.transform, nil, self.anchor.left.localPosition.x +self.museumListShowPosX)--*0.384)
    else
        self:do_positionX(self.museumListPanel.transform, nil,self.anchor.left.localPosition.x-20, function()

        end)
    end
    self:subscibe_time_event_on(1, function (t)
        ModuleCache.GameManager.set_application_target_frame_rate(30)
    end)
end

return ChessMuseumView2D