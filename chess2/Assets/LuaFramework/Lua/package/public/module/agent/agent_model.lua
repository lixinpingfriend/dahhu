---
--- Created by dengcheng.
--- DateTime: 2018/11/14 上午10:29
---
local Class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")
-- ==========================================================================
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine

---@class AgentModel
local AgentModel = Class("agentModel", Model)
local CSmartTimer = ModuleCache.SmartTimer.instance


function AgentModel:initialize(...)
    Model.initialize(self, ...)
    self.modelData.agentData = {}
end


--余额查询
function AgentModel:getAccountStatus(circle)
    print("start getAccountStatus")
    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
            gameId = self.modelData.gameId,
            --clientIp = self.modelData.ip,
            userAccountTypes = 2,
            agentsAccountTypes = 2,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/getNewAccountList?",
    }
    if circle then
        requestData.showModuleNetprompt = true
    end
    local onResponse = function(wwwOperation)
        --log_debug("receive getAccountStatus response")
        local www = wwwOperation.www
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            if #retData.data.userAccountList > 0 and retData.data.userAccountList[1] then
                self.modelData.agentData.userRemainCoin = retData.data.userAccountList[1].balance
            end
            if #retData.data.agentsAccountList > 0 and retData.data.agentsAccountList[1] then
                self.modelData.agentData.agentRemainCoin = retData.data.agentsAccountList[1].balance
            end
            Model.dispatch_event(self, "Event_Agent_GetAccountStatus",circle)
        else

        end
    end

    local onError = function(data)
        print(data.error)
    end

    self:http_get(requestData, onResponse, onError);
end
--商品信息
function AgentModel:getProductStatus(circle)

    local function callBack(tabid, tagid)
        if tabid == nil or tagid == nil then return  end
        print("==Params_tabId="..tabid," Params_tagId="..tostring(tagid))
        local requestData = {
            baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl.."product/getProductByTabIdAndTagId?",
            params = {
                tabId = tabid,
                tagId = tagid,
                uid = self.modelData.roleData.userID,
                gameId = self.modelData.gameId,
            }
        }
        if circle then
            requestData.showModuleNetprompt = true
        end
        self:http_get(requestData, function(wwwData)
            local retData = ModuleCache.Json.decode(wwwData.www.text)
            print_table(retData,"收到内容数据")
            if retData.ret and retData.ret == 0 then
                self.agentsProducts = retData.data
                Model.dispatch_event(self, "Event_Agent_GetAccountProduct",circle)
            end
        end, function(errorData)
            print(errorData.error)

        end)

    end
    if  self.tabDatas ~= nil then
        for i = 1, #self.tabDatas do
            if self.tabDatas[i].type == 6 then --推广员商城
                callBack(self.tabDatas[i].id, self.tabDatas[i].tagList[1].id)
            end 
        end
    else
        self:GetDataFromServer_GetBigTabs( function() self:getProductStatus(circle) end )
    end 
end
--通过Id获取商品
function AgentModel:getProductByRecord(recordData,callback)

    local function get_datas(tabid, tagid)
        if tabid == nil or tagid == nil then return  end
        print("==Params_tabId="..tabid," Params_tagId="..tostring(tagid))
        local requestData = {
            baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl.."product/getProductByTabIdAndTagId?",
            showModuleNetprompt = true,
            params = {
                tabId = tabid,
                tagId = tagid,
                uid = self.modelData.roleData.userID,
                gameId = recordData.gameId,
            }
        }

        self:http_get(requestData, function(wwwData)
            local retData = ModuleCache.Json.decode(wwwData.www.text)
            print_table(retData,"收到内容数据")
            if retData.ret == 0 then
                local productData = nil
                local agentsProducts = retData.data
                for i = 1, #agentsProducts do
                    print("id:"..agentsProducts[i].id..",productId:"..recordData.productId..",|"..agentsProducts[i].num ..","..recordData.productNum)
                    if agentsProducts[i].id == recordData.productId and agentsProducts[i].num  == recordData.productNum then
                        self.commissionAmount = retData.data.commissionAmount
                        productData = agentsProducts[i]
                        break
                    end
                end
                if callback then callback(productData) end
            end
        end, function(errorData)
            print(errorData.error)
            if callback then callback(nil) end
        end)
    end 

    if  self.tabDatas ~= nil then
        for i = 1, #self.tabDatas do
            if self.tabDatas[i].type == 6 then --推广员商城
                get_datas(self.tabDatas[i].id, self.tabDatas[i].tagList[1].id)
            end 
        end
    else
        self:GetDataFromServer_GetBigTabs( function() self:getProductByRecord(recordData,callback) end )
    end 
end
--购买。商品信息、接受者类型、亲友圈ID
function AgentModel:buyProduct(productData,receiveType,guildId)
    local  receiverId,receiverType
    --如果是代理则不传receiver
    if receiveType == 2 then --玩家
        receiverId = self.modelData.roleData.userID
        receiverType = receiveType
        print("recharge2User "..receiverId..","..receiverType)
    elseif receiveType == 3 then --亲友圈
        if not guildId then
            ModuleCache.ModuleManager.show_public_module_textprompt():show_center_tips("未选择亲友圈,无法购买")
            return
        end
        receiverId = guildId
        receiverType = receiveType
        print("recharge2Palor "..receiverId..","..receiverType)
    else
        print("recharge2Agent ")
    end

    local intentData = {}
    intentData.receiverType = receiverType
    intentData.receiverId = receiverId

    ModuleCache.PayManager().get_pay_type(productData, function(intentData)
        intentData.commissionAmount = self.commissionAmount
        -- 是否可以代理购买
        intentData.canAgentsBuy = true
        ModuleCache.ModuleManager.show_module("public", "shoppaytype", intentData)
    end , nil, intentData)
end
--赠送
function AgentModel:giveProduct(productData,receiverType,receiverId,receiverName)
    if receiverType == 2 then
        print("give2User "..receiverId..","..receiverType)
        local intentData = {}
        intentData.receiverType = receiverType
        intentData.receiverId = receiverId
        local tips = "确认花费¥%0.2f元购买%s钻石赠送给[<color=#62AA04>%s</color>]吗？"
        tips = string.format(tips, productData.salePrice, productData.num, receiverName)
        ModuleCache.ModuleManager.show_public_module_alertdialog():show_common(tips,function ()
            ModuleCache.PayManager().get_pay_type(productData, function(intentData)
                intentData.commissionAmount = self.commissionAmount
                -- 是否可以代理购买
                intentData.canAgentsBuy = true
                ModuleCache.ModuleManager.show_module("public", "shoppaytype", intentData)
            end , nil, intentData)
        end)
    else
        print("赠送对象类型异常")
    end
end
--在充值记录中再购买一次
function AgentModel:giveNumAgain(recordData)
    --self:giveNum2User()
    local giveNum = recordData.coins
    local receiverId = recordData.receiverId
    local receiverType = recordData.receiverTargetType
    local receiverName = recordData.receiverName
    local tips = "empty"
    if receiverType == 2 then
        tips = "确认再次赠送给[<color=#62AA04>%s</color>]%s钻石吗？钻石将从您的推广员账户扣除。"
        tips = string.format(tips,receiverName,giveNum)
        ModuleCache.ModuleManager.show_public_module_alertdialog():show_common(tips,function ()
            print("确认赠送")
            self:giveNum2User(giveNum,receiverId)
        end)
    elseif receiverType == 3 then
        tips = "确认再次给亲友圈[<color=#62AA04>0%s</color>]转入%s钻石吗？钻石将从您的推广员账户扣除。"
        tips = string.format(tips,receiverName,giveNum)
        ModuleCache.ModuleManager.show_public_module_alertdialog():show_common(tips,function ()
            print("确认赠送")
            self:giveNum2Parlor(giveNum,receiverId)
        end)
    end
end
--在充值记录中再次购买
function AgentModel:buyProductAgain(recordData)
    local receiverId = recordData.receiverId
    local receiverType = recordData.receiverType
    print("receiverId:"..receiverId..",receiverType:"..receiverType)
    self:getProductByRecord(recordData,function (productData)
        if productData then
            self:buyProduct(productData, receiverType, receiverId)
        else
            print("未找到商品信息")
            ModuleCache.ModuleManager.show_public_module_textprompt():show_center_tips("该商品已经不存在,无法再次购买")
        end
    end)
end

--获取亲友圈列表
function AgentModel:getParlorList()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/getAgentsParlorList?",
        params = {
            uid = self.modelData.roleData.userID,
            boxGameId = AppData.get_app_and_game_name(),
        },
        showModuleNetprompt = true
    }
    local onResponse = function(wwwOperation)
        log_debug("receive getParlorList response")
        local www = wwwOperation.www
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            self.parlorList = retData.data
            Model.dispatch_event(self, "Event_Agent_GetParlorList",retData.data);
        else

        end
    end
    local onError = function(data)
        print(data.error)
    end
    self:http_get(requestData, onResponse, onError)
end
function AgentModel:checkUserID(playerId)
    log_debug("checkUserID__:"..playerId)
    if not playerId or playerId == "" then
        ModuleCache.ModuleManager.show_public_module_textprompt():show_center_tips("请输入正确的玩家ID")
        return
    end
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "agents/player/getHasBindPlayerPage?",
        params = {
            uid = self.modelData.roleData.userID,
            playerId = playerId,
        }
    }
    local onResponse = function(wwwOperation)
        log_debug("receive checkUserID response")
        local www = wwwOperation.www
        local retData = ModuleCache.Json.decode(www.text)
        if retData.success then
            log_debug("receive checkUserID result "..(#retData.data.list))
            if retData.data.list and #retData.data.list > 0 then
                Model.dispatch_event(self,"Event_Agent_CheckUserResult",retData.data.list[1])
                self.checkedUserID = retData.data.list[1].playerId
                self.checkedUserName = retData.data.list[1].playerNickName
            else
                ModuleCache.ModuleManager.show_public_module_textprompt():show_center_tips("只能赠送给下级玩家,请检查输入的玩家ID")
            end
        else
            ModuleCache.ModuleManager.show_public_module_textprompt():show_center_tips(retData.errMsg)
        end
    end
    local onError = function(data)
        print(data.error)
    end
    self:http_get(requestData, onResponse, onError)
end

function AgentModel:giveNum2UserWithTip(num,playerId,receiverName)
    local tips = "确认赠送给[<color=#62AA04>%s</color>]%s钻石吗？"
    tips = string.format(tips, receiverName, num)
    ModuleCache.ModuleManager.show_public_module_alertdialog():show_common(tips,function ()
        self:giveNum2User(num,playerId)
    end)
end

function AgentModel:giveNum2User(num,playerId)
    print("giveNum2User player:"..playerId..",num:"..num..","..playerId)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "agents/player/giveCoins?",
        params = {
            uid = self.modelData.roleData.userID,
            coins = num,
            gameId = self.modelData.gameId,
            playerId = playerId,
        }
    }
    local onResponse = function(wwwOperation)
        log_debug("receive giveNum2User response")
        local www = wwwOperation.www
        local retData = ModuleCache.Json.decode(www.text)
        if retData.msg == "SUCCESS" then
            Model.dispatch_event(self,"Event_Agent_GetGiveSuccess")
            ModuleCache.ModuleManager.show_public_module_textprompt():show_center_tips("赠送成功")
            self:getAccountStatus() --赠送刷新剩余钻石
        else

        end
    end
    local onError = function(data)
        print(data.error)
    end
    self:http_get(requestData, onResponse, onError)
end
function AgentModel:giveNum2Parlor(num,parlorId)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "/agents/player/giveParlor?",
        params = {
            uid = self.modelData.roleData.userID,
            coins = num,
            gameId = self.modelData.gameId,
            parlorId = parlorId,
        }
    }
    local onResponse = function(wwwOperation)
        print("receive giveNum2Parlor response")
        local www = wwwOperation.www
        local retData = ModuleCache.Json.decode(www.text)
        if retData.msg == "SUCCESS" then
            ModuleCache.ModuleManager.show_public_module_textprompt():show_center_tips("赠送成功")
            self:getAccountStatus() --赠送刷新剩余钻石
        else

        end
    end
    local onError = function(data)
        print(data.error)
    end
    self:http_get(requestData, onResponse, onError)
end

function AgentModel:getRechargeRecord(pageNum)
    print("getRechargeRecord")
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "/agents/info/queryOrderHistory?",
        params = {
            uid = self.modelData.roleData.userID,
            pageNum = pageNum,
        },
        showModuleNetprompt = true
    }
    local onResponse = function(wwwOperation)
        log_debug("receive getRechargeRecord response")
        local www = wwwOperation.www
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            Model.dispatch_event(self,"Event_Agent_GetRechargeRecord",retData.data)
            self.curPage = retData.data.page
        else

        end
    end
    local onError = function(data)
        print(data.error)
    end
    self:http_get(requestData, onResponse, onError)
end

function AgentModel:getGiveRecord(pageNum)
    print("getGiveRecord")
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "/agents/info/queryChargeHistory?",
        params = {
            uid = self.modelData.roleData.userID,
            pageNum = pageNum,
        },
        showModuleNetprompt = true
    }
    local onResponse = function(wwwOperation)
        log_debug("receive getGiveRecord response")
        local www = wwwOperation.www
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            Model.dispatch_event(self,"Event_Agent_GetGiveRecord",retData.data)
            self.curPage = retData.data.page
        else

        end
    end
    local onError = function(data)
        print(data.error)
    end
    self:http_get(requestData, onResponse, onError)
end



--获取标签数据
function AgentModel:GetDataFromServer_GetBigTabs(callBack)
    print("==获取数据:获取标签")
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl.."product/getShopingTabs?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData,"收到大标签数据")
        if retData.ret == 0 then
            self.commissionAmount = retData.data.commisionAccount --代理佣金
            self.tabDatas = retData.data.list
            if callBack ~= nil then callBack() end 
        end
    end, function(errorData)
        print(errorData.error)
    end)
end

return AgentModel