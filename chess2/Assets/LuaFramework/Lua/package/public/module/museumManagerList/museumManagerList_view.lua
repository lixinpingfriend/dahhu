
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local MuseumManagerListView = Class('museumManagerListView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local PlayerPrefsManager = ModuleCache.PlayerPrefsManager

function MuseumManagerListView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/museummanagerlist/public_museummanagerlist.prefab", "Public_MuseumManagerList", 1)
    View.set_1080p(self)

    self.copyItem = GetComponentWithPath(self.root, "TopRight/Child/ItemPrefabHolder/CopyItem", ComponentTypeName.Transform).gameObject
    self.copyParent = GetComponentWithPath(self.root, "TopRight/Child/ListScrollView/Viewport/Content", ComponentTypeName.RectTransform)

    self.notDataObj = GetComponentWithPath(self.root, "Center/Child/notDataText", ComponentTypeName.Transform).gameObject
end


--初始化亲友圈列表
function MuseumManagerListView:initLoopScrollViewList(dataList)
    self.dataList = dataList

    if not dataList then
        return
    end

    self.notDataObj:SetActive(#dataList == 0)
    self:reset()

    if(#dataList > 0) then
        for i=1,#dataList do
            self:fillItem(self:get_item(dataList[i], i))
        end
    end
end

function MuseumManagerListView:fillItem(item)
    local itemObj = {}
    local data = item.data

    local imgTab = {
        GetComponentWithPath(item.gameObject, "bg", ComponentTypeName.Image),
        GetComponentWithPath(item.gameObject, "museumImg", ComponentTypeName.Image),
        GetComponentWithPath(item.gameObject, "tagIcon", ComponentTypeName.Image),
        GetComponentWithPath(item.gameObject, "typeIcon", ComponentTypeName.Image)
    }

    local spriteHolderTab = {
        GetComponentWithPath(item.gameObject, "bg", "SpriteHolder"),
        GetComponentWithPath(item.gameObject, "museumImg", "SpriteHolder"),
        GetComponentWithPath(item.gameObject, "tagIcon", "SpriteHolder"),
        GetComponentWithPath(item.gameObject, "typeIcon", "SpriteHolder")
    }

    local textTab = {}
    for i=1,4 do
        textTab[i] = GetComponentWithPath(item.gameObject, "Text"..i, ComponentTypeName.Text)
    end

    local imageHead = GetComponentWithPath(item.gameObject, "museumImg/Avatar/Image", ComponentTypeName.Image)
    local parlorName = GetComponentWithPath(item.gameObject, "chessName", ComponentTypeName.Text)
    local parlorNum = GetComponentWithPath(item.gameObject, "cheeNum", ComponentTypeName.Text)

    if(data) then

        local sprName = "join"
        if data.isShowRecommend then
            sprName = "tuijian"
            imgTab[3].gameObject:SetActive(true)
        else
            imgTab[3].gameObject:SetActive(PlayerPrefsManager.GetInt("museumIndex", 1) == data.parlorId)
        end
        for i=1,#imgTab do
            imgTab[i].sprite = spriteHolderTab[i]:FindSpriteByName(sprName)
        end


        if(data.parlorLogo) then
            data.imageHead = data.parlorLogo
        else
            data.imageHead = data.headImg
        end
        self:image_load_sprite(imageHead, data.imageHead)

        parlorName.text = Util.filterPlayerName(data.parlorName, 12)
        parlorNum.text  = "圈号:0"..data.parlorNum

        textTab[1].text = "<color=#805A32FF>圈  主:</color> ".. Util.filterPlayerName(data.nickname, 10)
        textTab[2].text = "<color=#805A32FF>圈主ID:</color> "..data.ownerUid
        textTab[3].text = "<color=#805A32FF>成员数:</color> "..data.playerNum .. "人"
        if data.boxGameNameList and #data.boxGameNameList > 0 then
            local wanfaStr = ""
            for i =1 , #data.boxGameNameList do
                if not string.find(wanfaStr, data.boxGameNameList[i].gameName)  then
                    if i ~= 1 then
                        wanfaStr = wanfaStr .. ", ".. data.boxGameNameList[i].gameName

                    else
                        wanfaStr = wanfaStr .. data.boxGameNameList[i].gameName
                    end


                end
            end
            textTab[4].text = "<color=#805A32FF>玩  法:</color> "..Util.filterPlayerName(wanfaStr, 50)
        else
            textTab[4].text = "<color=#805A32FF>玩  法:</color> ".. "未设置玩法"
        end
    end
end

function MuseumManagerListView:get_item(data, i)
    local obj = nil
    local item = {}
    if i<=#self.contents then
        obj = self.contents[i]
    else
        obj = TableUtil.clone(self.copyItem,self.copyParent.gameObject,Vector3.zero)
    end
    obj.name = "item_" .. i
    ComponentUtil.SafeSetActive(obj, true)
    item.gameObject = obj
    item.data = data
    return item
end

function MuseumManagerListView:reset()
    self.contents = TableUtil.get_all_child(self.copyParent.gameObject)
    for i=1,#self.contents do
        ComponentUtil.SafeSetActive(self.contents[i], false)
    end
end

return MuseumManagerListView