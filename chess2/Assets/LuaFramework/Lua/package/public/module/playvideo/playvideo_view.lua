
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local PlayVideoView = Class('playVideoView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName

function PlayVideoView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/playvideo/public_windowplayvideo.prefab", "Public_WindowPlayVideo", 1)

    local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath

    self.buttonClose = GetComponentWithPath(self.root, "BaseBackground/bg/closeBtn", ComponentTypeName.Button)
    self.roomNumTextArray = {}
    for i=1,6 do
        self.roomNumTextArray[i] = GetComponentWithPath(self.root, "Center/RoomNumInputPanel/RoomNum/InputedNums/text" .. i, ComponentTypeName.Text)
    end

    self.keyboardMap = {}
    for i=0,10 do
        self.keyboardMap[i] = GetComponentWithPath(self.root, "Center/RoomNumInputPanel/KeyBoard/Keys/Key" .. i, ComponentTypeName.Button)
    end
    self.keyboardMap.buttonClean = GetComponentWithPath(self.root, "Center/RoomNumInputPanel/KeyBoard/Keys/Key*", ComponentTypeName.Button)
    self.keyboardMap.buttonDelete = GetComponentWithPath(self.root, "Center/RoomNumInputPanel/KeyBoard/Keys/Key#", ComponentTypeName.Button)
end

function PlayVideoView:on_view_init()
     
end

function PlayVideoView:refreshRoomNumText(strRoomNum)    
    local len = #strRoomNum    
    for i=1, #self.roomNumTextArray do                
        if(i <= len) then
	        local strNum = string.sub(strRoomNum,i,i)            
            self.roomNumTextArray[i].text = strNum
            self.roomNumTextArray[i].gameObject:SetActive(true)
        else
            self.roomNumTextArray[i].gameObject:SetActive(false)
        end        
    end
end

return PlayVideoView