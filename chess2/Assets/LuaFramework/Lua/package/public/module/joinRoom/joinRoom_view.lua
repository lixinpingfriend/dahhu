
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local JoinRoomView = Class('joinRoomView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponent = ModuleCache.ComponentManager.GetComponent
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath

function JoinRoomView:initialize(...)
    -- 初始View

    self.modelData = require("package.public.model.model_data")
    -- 初始View
    --if self.modelData.joinRoomMuseum then
    --    View.initialize(self, "public/module/joinroom/public_windowjoinroom_museum.prefab", "Public_WindowJoinRoom_museum", 1)
    --    View.set_1080p(self)
    --    self.buttonClose = GetComponentWithPath(self.root, "BaseBackground/ImageClose", ComponentTypeName.Button)
    --
    --    self.wanfaTex = GetComponentWithPath(self.root, "Center/CreateMuseumPanel/selectGame/ChangeWanfa/Text", ComponentTypeName.Text)
    --else
        View.initialize(self, "public/module/joinroom/public_windowjoinroom.prefab", "Public_WindowJoinRoom", 1)
        View.set_1080p(self)

        --self.museumToggles= {}
        --self.museumToggles[1] = GetComponentWithPath(self.root, "Title_museum/1", ComponentTypeName.Toggle)
        --self.museumToggles[2] = GetComponentWithPath(self.root, "Title_museum/2", ComponentTypeName.Toggle)
        self.stateSwitcher = ModuleCache.ComponentManager.GetComponent(self.root, "UIStateSwitcher")
    --end


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
    self.goldTextNum = GetComponentWithPath(self.root, "Center/RoomNumInputPanel/RoomNum/TextNum", ComponentTypeName.Text)

    self.nameInput = GetComponentWithPath(self.root,"Center/CreateMuseumPanel/name/InputField",ComponentTypeName.InputField)
    self.idInput = GetComponentWithPath(self.root,"Center/CreateMuseumPanel/id/InputField",ComponentTypeName.InputField)
    self.wxNumInput = GetComponentWithPath(self.root,"Center/CreateMuseumPanel/wxNum/InputField",ComponentTypeName.InputField)
end

function JoinRoomView:on_view_init()

end


function JoinRoomView:refreshRoomNumText(strRoomNum)    
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

function JoinRoomView:refreshGoldNumText(strNum)
    self.goldTextNum.text = strNum
end


return JoinRoomView