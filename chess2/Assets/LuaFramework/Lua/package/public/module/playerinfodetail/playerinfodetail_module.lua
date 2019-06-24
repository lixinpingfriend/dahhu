






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local PlayerInfoDetailModule = class("PlayerInfoDetailModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local Application = UnityEngine.Application
local CustomImageManager = ModuleCache.CustomImageManager



function PlayerInfoDetailModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "playerinfodetail_view", "playerinfodetail_model", ...)

    CustomImageManager.set_event_listener(function(fileid)
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@上次图片成功，发送消息","http://game.oss.sincebest.com/" ..fileid)
        self:saveRecordImg("http://game.oss.sincebest.com/" ..fileid)

    end,function(filePath)

    end)
end


function PlayerInfoDetailModule:on_show(data)
    if ModuleCache.GameManager.iosAppStoreIsCheck then
        self.view:hide();
        return
    end
    self.data = data
    self.view:hide();

    -- 请求获取用户信息协议
    self.model:getUserInfo(data);
end

-- 绑定model层事件，模块内交互    model层初始化结束后自动调用
function PlayerInfoDetailModule:on_model_event_bind()

    local onGetUserInfo = function(eventHead, eventData)

        self.view:init(eventData.showType, eventData.data, self);

        self:getRecordImg()
    end
    -- 监听获取用户信息事件
    self:subscibe_model_event("Event_PlayerInfo_GetUserInfo", onGetUserInfo);

    local onSaveSign = function(eventHead, eventData)

        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("签名保存成功");
    end
    -- 监听保存签名事件
    self:subscibe_model_event("Event_PlayerInfo_SaveSign", onSaveSign);
end


function PlayerInfoDetailModule:on_click(obj, arg)

    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "ButtonBack" then
        ModuleCache.ModuleManager.destroy_module("public", "playerinfodetail");

        -- 复制按钮
    elseif obj.name == "ButtonCopy" then
        local playerID = self.view.userInfo.userId
        if playerID then
            -- 复制玩家id到剪切板
            ModuleCache.FunctionManager.CopyToClipBoard(playerID);

            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("复制成功");
        end
        -- 退出游戏按钮
    elseif obj.name == "ButtonExitGame" then
        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("您确定要退出游戏？"), function()
            UnityEngine.Application.Quit()
        end , nil)
        -- 更换账号按钮
    elseif obj.name == "ButtonChangeAccount" then
        ModuleCache.GameManager.logout(true);
    elseif obj.name == "SpriteAvatar" then
        if self.modelData.roleData.agentUrl and self.modelData.roleData.agentUrl ~= "" then
            ModuleCache.ModuleManager.show_module("public", "agentpage",{link=self.modelData.roleData.agentUrl});
        end
    elseif obj.name == "ButtonReBindWechat" then
        ModuleCache.WechatManager.login(function(data)
            if data and data.token and data.token ~= "" then
                self.model:rebindingwx(data.token, function (retData)
                    if retData then
                        ModuleCache.GameManager.logout()
                    end
                end)
            end

        end)
    elseif obj.name == "ButtonBindingPhone" then
        ModuleCache.ModuleManager.show_module("public", "phonebinding", "Binding")
    elseif obj.name == "ButtonReBindingPhone" then
        ModuleCache.ModuleManager.show_module("public", "phonebinding", "ReBinding")

    elseif obj.name == "openPickBtn" then -- 上次图片
        if ModuleCache.GameManager.runtimePlatform == "OSXEditor" or ModuleCache.GameManager.runtimePlatform == "WindowsEditor" then
            local data
            if math.random()< 0.3 then
                data =ModuleCache.FileUtility.ReadAllBytes(Application.dataPath .. "/Resources/h.png")
            elseif math.random()< 0.6 then
                data =ModuleCache.FileUtility.ReadAllBytes(Application.dataPath .. "/Resources/w.png")
            else
                data =ModuleCache.FileUtility.ReadAllBytes(Application.dataPath .. "/Resources/xiaotu.png")
            end

            ModuleCache.CustomImageManager.upload_image_file(data)
        else
            local Json = {
                maxWidth = 1280,
                maxHeight = 720,
                compressQuality = 60
            }
            ModuleCache.SDKInterface():open_pick(ModuleCache.GameUtil.table_encode_to_json(Json))
        end

    elseif obj.name == "deleteBtn" then -- 上次图片
        local array = string.split(obj.transform.parent.gameObject.name, "_")
        if # array  >1 then
            ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("您确定要删除该照片吗？"), function()
                self:deleteRecordImg(self.view.dataList[tonumber(array[2]) ].id)
            end , nil)
        end

    elseif string.find(obj.name,"item_") then -- 打开图片
        local rawImg = ModuleCache.ComponentManager.GetComponentWithPath(obj.gameObject, "Mask/SpriteAvatar",ModuleCache.ComponentTypeName.RawImage)

        self.view.originalImg.texture = rawImg.texture

        self.view.originalImgObj:SetActive(true)
        self.view.originalImgRectTran.sizeDelta = ModuleCache.TextureCacheManager.GetTexture2dSize(self.view.originalImg.texture)--ModuleCache.CustomerUtil.GetTexture2dSize(self.view.originalImg.texture)
        self.view.originalImgGridLayoutGroup.cellSize = ModuleCache.TextureCacheManager.GetTexture2dSize(self.view.originalImg.texture)

        local array = string.split(obj.gameObject.name, "_")
        self.curOpenImgData = self.view.dataList[tonumber(array[2]) ]

    elseif (obj.name == "OriginalImg") then
        self.view.originalImgObj:SetActive(false)
    elseif (obj.name == "shareImgBtn") then
        print_table(self.curOpenImgData,"#################")
        if self.curOpenImgData then
            --local arr = string.split(self.curOpenImgData.imgUrl, "_")
            --local key = self.curOpenImgData.imgUrl
            --if #arr == 3 then
            --    key = arr[1]
            --end
            --
            --print("*******************", key, ModuleCache.CustomImageManager.CachesTexture[key])

            ModuleCache.WechatManager.share_image(0, "大胡亲友圈",self.curOpenImgData.savePath )--ModuleCache.CustomImageManager.CachesTexture[key])
        end
    end


end



function PlayerInfoDetailModule:on_update_per_second(t)
    if not self:view_is_active() then
        return
    end
    local MaxCount = 50
    local TextStr = self.view.inputSign.text
    local NewText,CurCount = self:Help_GetTextCount(TextStr,MaxCount)
    self.view.inputSign.text = NewText
    self.view.SignTextCount.text = "" .. CurCount .. "/" .. MaxCount
end


function PlayerInfoDetailModule:Help_GetTextCount(name, TextMaxCount)
    --print("==计算文字的字数")--汉字,英文,数字,特殊符号可以混写
    if(not name or type(name) ~= "string" or name == "") then
        return "",0
    end
    TextMaxCount = TextMaxCount or 50
    local newName = ""
    name = name or ""
    local lenInByte = #name
    local width = 0
    local inputLen = 0
    local i = 1
    local lastNewName = ""
    while (i<=lenInByte)
    do
        local curByte = string.byte(name, i)
        local byteCount = 1;
        local addLen = 0
        if curByte>0 and curByte<=127 then
            byteCount = 1                                               --1字节字符
            addLen = 1
        elseif curByte>=192 and curByte<223 then
            byteCount = 2                                               --双字节字符
            addLen = 2
        elseif curByte>=224 and curByte<239 then
            byteCount = 3                                               --汉字
            addLen = 2
        elseif curByte>=240 and curByte<=247 then
            byteCount = 4                                               --4字节字符
            addLen = 2
        else
            byteCount = 3
            addLen = 2
        end
        inputLen = inputLen + addLen
        local char = string.sub(name, i, i+byteCount-1)
        i = i + byteCount                                              -- 重置下一字节的索引
        width = width + 1                                             -- 字符的个数（长度）
        lastNewName = newName
        newName = newName .. char
        if(width > TextMaxCount) then
            return lastNewName , width
        end
    end
    return newName ,width
end

function PlayerInfoDetailModule:getRecordImg()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "room/getRecordImg?",
        showModuleNetprompt = true,
        params = {
            uid = self.data.uid,
        },
        cacheDataKey = string.format("room/getRecordImg?%s", self.data.uid),
        cacheDataImmediatelyCallbackAndSuccessCallback = true
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            --"data": [
            --{
            --    "createTime": "2018-12-05T02:44:13.800Z",
            --    "disabled": 0,
            --    "id": 0,
            --    "imgUrl": "string",
            --    "modifyTime": "2018-12-05T02:44:13.800Z",
            --    "userId": 0
            --}
            --],
            self.view:initLoopScrollViewList(retData.data)

            self.view:show();
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end

function PlayerInfoDetailModule:saveRecordImg(imgUrl)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "room/saveRecordImg?",
        showModuleNetprompt = true,
        params = {
            uid = self.data.uid,
            imgUrl = imgUrl,
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("图片上传成功")
            self:getRecordImg()

        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end

function PlayerInfoDetailModule:deleteRecordImg(imgId)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "room/deleteRecordImg?",
        showModuleNetprompt = true,
        params = {
            uid = self.data.uid,
            id = imgId
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("图片删除成功")
            self:getRecordImg()
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end

return PlayerInfoDetailModule;



