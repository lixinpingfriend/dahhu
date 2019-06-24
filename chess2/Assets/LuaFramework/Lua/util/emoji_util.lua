---
--- Created by dc-pc.
--- DateTime: 2019/2/15 10:43
---
---@class EmojiUtil
local EmojiUtil = {}
local ModuleCache = ModuleCache
local cEmojiUtil = ModuleCache.LuaBridge.EmojiUtil

local emojiTextType = ModuleCache.ComponentManager._getClassType("EmojiText")

function EmojiUtil.init()
    if EmojiUtil.inited then
        return
    end
    EmojiUtil.inited = true
    require("EmojiText")
    local bundle = ModuleCache.AssetBundleManager:LoadAssetBundle("single/emoji/material/uguiemoji.bytes");
    cEmojiUtil.emojiMaterial = bundle:GetAsset("UGUIEmoji", false)
end

function EmojiUtil.initCallback()
    if ModuleCache.CustomerUtil.VersionCompare(ModuleCache.GameManager.appVersion, "0.9.34") then
        if ModuleCache.CustomerUtil then
            ModuleCache.CustomerUtil.emojiEventCallback = EmojiUtil.customCall
        end
    end
end



function EmojiUtil.customCall(eventName, eventData)
    if eventName == "isEmojiCharacter" then
        return EmojiUtil.isEmojiCharacter(eventData)
    elseif eventName == "toUnicode" then
        return EmojiUtil.toUnicode(eventData)
    end
end

--判断字符是否是表情字符
function EmojiUtil.isEmojiCharacter(codePoint)
    --print("C 2 L isEmojiCharacter : "..codePoint)
    return false
end

--字符串转unicode
function EmojiUtil.toUnicode(emoji)
    --print("C 2 L toUnicode:"..emoji)
    return ""
end



---show_with_emoji_text
---@param uguiText table 必须为text组件
---@param text string 文本内容
---@param replaceCallback function 替换后的回调 参数为EmojiText
function EmojiUtil.show_with_emoji_text(textComponent, text, replaceCallback)

    if not emojiTextType then
        textComponent.text = text
    else
        local eTextCom = ModuleCache.ComponentManager.GetComponent(textComponent.gameObject, "EmojiText")
        if eTextCom then
            eTextCom.text = text
        else
            if not EmojiUtil.inited then
                textComponent.text = text
            end
            ModuleCache.PackageManager.update_package_version("single", function()
                EmojiUtil.init()
                eTextCom = cEmojiUtil.ReplaceComponentText(textComponent, text)
                if replaceCallback and eTextCom then
                    replaceCallback(eTextCom)
                end
            end)
        end
    end
end

return EmojiUtil