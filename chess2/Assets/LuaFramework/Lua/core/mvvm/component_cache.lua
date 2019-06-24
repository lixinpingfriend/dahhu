local class = require("lib.middleclass")
local ComponentCache = class('ComponentCache')


function ComponentCache:initialize()

end


function ComponentCache:bindComponent(csComponentCache)
    local totalCount = 0;
    if(not csComponentCache)then
        return 0;
    end
    local count = csComponentCache.gameObjectList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        print(csComponentCache.gameObjectList[i].value.name)
        local name = string.format("go_%s",csComponentCache.gameObjectList[i].name); 
        self[name] = csComponentCache.gameObjectList[i].value;
    end

    count = csComponentCache.transformList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("tran_%s",csComponentCache.transformList[i].name); 
        self[name] = csComponentCache.transformList[i].value;
    end

    count = csComponentCache.rectTransformList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("rectTran_%s",csComponentCache.rectTransformList[i].name); 
        self[name] = csComponentCache.rectTransformList[i].value;
    end

    count = csComponentCache.imageList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("image_%s",csComponentCache.imageList[i].name); 
        self[name] = csComponentCache.imageList[i].value;
    end

    count = csComponentCache.textList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("text_%s",csComponentCache.textList[i].name); 
        self[name] = csComponentCache.textList[i].value;
    end

    count = csComponentCache.toggleList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("toggle_%s",csComponentCache.toggleList[i].name); 
        self[name] = csComponentCache.toggleList[i].value;
    end

    count = csComponentCache.toggleEventList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("toggleEvent_%s",csComponentCache.toggleEventList[i].name); 
        self[name] = csComponentCache.toggleEventList[i].value;
    end

    count = csComponentCache.buttonList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("button_%s",csComponentCache.buttonList[i].name); 
        self[name] = csComponentCache.buttonList[i].value;
    end
    
    count = csComponentCache.sliderList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("slider_%s",csComponentCache.sliderList[i].name); 
        self[name] = csComponentCache.sliderList[i].value;
    end
    
    count = csComponentCache.toggleGroupList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("toggleGroup_%s",csComponentCache.toggleGroupList[i].name); 
        self[name] = csComponentCache.toggleGroupList[i].value;
    end
    
    count = csComponentCache.inputFieldList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("inputField_%s",csComponentCache.inputFieldList[i].name); 
        self[name] = csComponentCache.inputFieldList[i].value;
    end
    
    count = csComponentCache.graphicList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("graphic_%s",csComponentCache.graphicList[i].name); 
        self[name] = csComponentCache.graphicList[i].value;
    end
    
    count = csComponentCache.scrollRectList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("scrollRect_%s",csComponentCache.scrollRectList[i].name); 
        self[name] = csComponentCache.scrollRectList[i].value;
    end
    
    count = csComponentCache.scrollbarList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("scrollBar_%s",csComponentCache.scrollbarList[i].name); 
        self[name] = csComponentCache.scrollbarList[i].value;
    end
    
    count = csComponentCache.dropdownList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("dropDown_%s",csComponentCache.dropdownList[i].name); 
        self[name] = csComponentCache.dropdownList[i].value;
    end
    
    count = csComponentCache.gridLayoutGroupList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("gridLayoutGroup_%s",csComponentCache.gridLayoutGroupList[i].name); 
        self[name] = csComponentCache.gridLayoutGroupList[i].value;
    end
    
    count = csComponentCache.rawImageList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("rawImage_%s",csComponentCache.rawImageList[i].name); 
        self[name] = csComponentCache.rawImageList[i].value;
    end
    
    count = csComponentCache.audioSourceList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("audioSource_%s",csComponentCache.audioSourceList[i].name); 
        self[name] = csComponentCache.audioSourceList[i].value;
    end
    
    count = csComponentCache.quickGridList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("quickGrid_%s",csComponentCache.quickGridList[i].name); 
        self[name] = csComponentCache.quickGridList[i].value;
    end
    
    count = csComponentCache.simpleScrollViewList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("simpleScrollView_%s",csComponentCache.simpleScrollViewList[i].name); 
        self[name] = csComponentCache.simpleScrollViewList[i].value;
    end
    
    count = csComponentCache.animationList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("anim_%s",csComponentCache.animationList[i].name); 
        self[name] = csComponentCache.animationList[i].value;
    end
    
    count = csComponentCache.animatorList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("animator_%s",csComponentCache.animatorList[i].name); 
        self[name] = csComponentCache.animatorList[i].value;
    end
    
    count = csComponentCache.spriteAtlasList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("spriteAtlas_%s",csComponentCache.spriteAtlasList[i].name); 
        self[name] = csComponentCache.spriteAtlasList[i].value;
    end
    
    count = csComponentCache.spriteHolderList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("spriteHolder_%s",csComponentCache.spriteHolderList[i].name); 
        self[name] = csComponentCache.spriteHolderList[i].value;
    end
    
    count = csComponentCache.uiStateSwitcherList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("uiStateSwitcher_%s",csComponentCache.uiStateSwitcherList[i].name); 
        self[name] = csComponentCache.uiStateSwitcherList[i].value;
    end
    
    count = csComponentCache.textWrapList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("textWrap_%s",csComponentCache.textWrapList[i].name); 
        self[name] = csComponentCache.textWrapList[i].value;
    end
    
    count = csComponentCache.uiImageAnimList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("uiImageAnim_%s",csComponentCache.uiImageAnimList[i].name); 
        self[name] = csComponentCache.uiImageAnimList[i].value;
    end
                
    count = csComponentCache.cacheList.Count;
    totalCount = totalCount + count;
    for i=0,count - 1 do
        local name = string.format("cache_%s",csComponentCache.cacheList[i].name); 
        self[name] = ComponentCache:new();
        totalCount = totalCount + self[name]:bindComponent(csComponentCache.cacheList[i].value)
    end
    return totalCount;
end

return ComponentCache