
local ModuleCache = ModuleCache
local Util = Util
local class = require("lib.middleclass")
local list = require("list")
local ModuleBase = require('core.mvvm.module_base')
---@class GoldExchangeModule
---@field view GoldExchangeView
local GoldExchangeModule = class('GoldExchangeModule', ModuleBase)

function GoldExchangeModule:initialize(...)
	ModuleBase.initialize(self, 'goldexchange_view', nil, ...)
	self._productsConfigTable = {}

	self:subscibe_package_event("Event_Package_Refresh_Userinfo", function(eventHead, eventData)
		--msgType， diamond(1,"充值钻石"), hp(2,"充值体力值消息"),ingot(3,"充值元宝消息"),copper(4,"铜钱兑换消息"),gold(5,"金币兑换消息"),item(6,"购买物品");
		print_traceback("==Event_Package_Refresh_Userinfo=GoldExchangeModule=")
		local data = eventData
		if (data.msg) then
			if(self._curProduct)then
				if data.msgType == self._curProduct.productType then
					local preProduct = self._curProduct._pre_product
					if(preProduct)then
						local isEnoughPay, ownNum, salePrice = self:isOwnNumEnoughPay(preProduct)
						if(isEnoughPay)then
							self.view:show_exchange_window(false)
							local pre_product_exchange_fun = preProduct._exchange_fun
							if(pre_product_exchange_fun)then
								pre_product_exchange_fun(true)
							end
						end
					else
						self.view:show_exchange_window(false)
					end
				end
			end
		end



	end)
	--self:subscibe_package_event("Event_Package_Recharge_Success", function(eventHead, eventData)
	--	if self.isHide then
	--		return
	--	end
	--	ModuleCache.ModuleManager.destroy_module("public", "goldexchange")
	--	ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("充值成功")
	--end)
end

function GoldExchangeModule:on_show(intentData)
	self._intentData = intentData
	self.view:show_exchange_window(false)
	self.view:show_result_window(false)

	local productType = intentData.productType
	local payType = intentData.payType
	local productNum = intentData.productNum
	local isNumNotEnough = intentData.isNumNotEnough
	local productsConfig = intentData.productsConfig or self._productsConfigTable[productType]
	if(not productsConfig)then
		self:GetDataFromServer_GetBigTabs(productType, function(data)
			self._productsConfigTable[productType] = data
			productsConfig = data
			self:show_exchange(productType, productsConfig, productNum, isNumNotEnough)
		end)
	else
		self:show_exchange(productType, productsConfig, productNum, isNumNotEnough)
	end

end

function GoldExchangeModule:show_exchange(productType, productsConfig, productNum, isNumNotEnough)
	local product = self:select_right_product(productsConfig, productNum, productType)
	print_table(product, "找到标签数据！！！！")
	if(not product)then
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips('没有对应的兑换商品')
		local onCancelExchange =self._intentData.onCancelExchange
		if(onCancelExchange)then
			onCancelExchange()
		end
		return
	end
	local icon
	local salePrice = tonumber(product.salePrice)
	local goodsNum = product.num
	if(productType == 2)then		--钻石
		icon = self:get_diamond_icon(product)
	elseif(productType == 5)then	--购买体力
		icon = self:get_tili_icon(product)
	elseif(productType == 1)then		--金币
		icon = self:get_gold_icon(product)
	end
	local nextProductType
	local nextProductNum
	if(self._curProduct)then
		product._pre_product = self._curProduct
		self._curProduct._next_product = product
		nextProductType = self._curProduct.productType
		nextProductNum = self._curProduct.num
	end
	self._curProduct = product
	self.view:show_exchange_window(true, isNumNotEnough, productType, product.payType, icon, salePrice, goodsNum, nextProductType, nextProductNum)
end

function GoldExchangeModule:on_click(obj, arg)
	if(obj.name == 'CloseExchangeBtn')then
		local onCancelExchange =self._intentData.onCancelExchange
		ModuleCache.ModuleManager.destroy_module("public", "goldexchange")
		if(onCancelExchange)then
			onCancelExchange()
		end
		--self:dispatch_package_event('Event_GoldJump_error')
	elseif(obj.name == 'CloseResultBtn')then
		local onExchangeFinish =self._intentData.onExchangeFinish
		ModuleCache.ModuleManager.destroy_module("public", "goldexchange")
		if(onExchangeFinish)then
			onExchangeFinish()
		end
	elseif(obj.name == 'ButtonExchange')then
		self:on_click_exchange()
	elseif(obj.name == 'ButtonRecharge')then
		self:on_click_recharge()
	end
end

function GoldExchangeModule:select_right_product(productsConfig, needNum, productType)
	local products = productsConfig
	-- if(productsConfig.isBindInvite)then
	-- 	products = productsConfig.discountProducts
	-- end
	table.sort(products, function(p1, p2)
		return p1.num < p2.num
	end)
	for i = 1, #products do
		local product = products[i]
		product.show_index = i
		product.productType = productType
	end
	local maxProduct
	for i = 1, #products do
		local product = products[i]
		if(product.num >= needNum)then
			return product
		end
		maxProduct = product
	end
	return maxProduct
end

function GoldExchangeModule:get_gold_icon(data)
	local index = 1
	if data.num >= 50000 then
		index = 6
	elseif data.num >= 20000  then
		index = 5
	elseif data.num >= 10000  then
		index = 4
	elseif data.num >= 5000  then
		index = 3
	elseif data.num >= 2000  then
		index = 2
	else
		index = 1
	end
	return self.view.spriteHolder:FindSpriteByName('gold_' .. index)
end

function GoldExchangeModule:get_tili_icon(data)
	local index = data.show_index + 6
	return self.view.spriteHolder:FindSpriteByName('goods_' .. index)
end

function GoldExchangeModule:get_diamond_icon(data)
	local index = data.show_index
	return self.view.spriteHolder:FindSpriteByName('goods_' .. index)
end


function GoldExchangeModule:on_click_exchange()
	local product = self._curProduct
	local isEnoughPay, ownNum, salePrice = self:isOwnNumEnoughPay(product)
	local exchange_fun = function(auto)
		self:exchange_product(product, function(data)
			local content
			local productName = self.view:get_product_name(product.productType)
			if(auto)then
				local nextProduct = product._next_product
				if(nextProduct.payType == 99)then
					content = string.format('充值成功！已为您自动兑换<color=#FF821DFF>%d</color>%s', product.num, productName)
				else
					content = string.format('兑换成功！已为您自动兑换<color=#FF821DFF>%d</color>%s', product.num, productName)
				end
			else
				content = string.format('您已成功兑换<color=#FF821DFF>%d</color>%s', product.num, productName)
			end

			self.view:show_exchange_window(false)
			if(product._pre_product)then
				local pre_product_exchange_fun = product._pre_product._exchange_fun
				if(pre_product_exchange_fun)then
					pre_product_exchange_fun(true)
				end
				return
			end
			local icon = self:get_gold_icon(product)
			self.view:show_result_window(true, content, icon)
		end)
	end
	if(not isEnoughPay)then
		local needNum = salePrice - ownNum
		local productType = product.payType
		if(productType == 5)then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips('金币不足')
			return
		end
		local productsConfig = self._productsConfigTable[productType]
		if(not productsConfig)then
			self:GetDataFromServer_GetBigTabs(productType, function(data)
				self._productsConfigTable[productType] = data
				productsConfig = data
				self:show_exchange(productType, productsConfig, needNum, true)
				product._exchange_fun = exchange_fun
			end)
		else
			self:show_exchange(productType, productsConfig, needNum, true)
			product._exchange_fun = exchange_fun
		end
		return
	end
	exchange_fun()
end

function GoldExchangeModule:isOwnNumEnoughPay(product)
	local ownNum = 0
	if(product.payType == 1)then
		ownNum = self.modelData.roleData.cards
	elseif(product.payType == 2)then
		ownNum = self.modelData.roleData.coins
	elseif(product.payType == 5)then
		ownNum = self.modelData.roleData.gold
	end
	local needNum = tonumber(product.salePrice)
	return ownNum >= needNum, ownNum, needNum
end

function GoldExchangeModule:on_click_recharge()
	if(self._curProduct.payType == 99)then
		ModuleCache.PayManager().get_pay_type(self._curProduct)
	end
end

function GoldExchangeModule:exchange_product(product, onFinish)
	if(product.payType == 99)then
		ModuleCache.PayManager().get_pay_type(product)
		return
	end
	ModuleCache.PayManager().buy_gold(product.id, 0, onFinish)
end




--获取标签数据
function GoldExchangeModule:GetDataFromServer_GetBigTabs(postId, onFinish)
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
            for i = 1, #retData.data.list do
                if retData.data.list[i].type == postId then --金币商城
                    self:GetDataFromServer_GetContent(retData.data.list[i].id, retData.data.list[i].tagList[1].id, onFinish)
                end 
            end

        end
    end, function(errorData)
        print(errorData.error)
    end)
end

--通过标签ID 获取商城数据
function GoldExchangeModule:GetDataFromServer_GetContent(tabid, tagid, callBack)
    if tabid == nil or tagid == nil then return  end
    print("==Params_tabId="..tabid," Params_tagId="..tostring(tagid))
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl.."product/getProductByTabIdAndTagId?",
        showModuleNetprompt = true,
        params = {
            tabId = tabid,
            tagId = tagid,
            uid = self.modelData.roleData.userID,
        }
    }

    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData,"收到内容数据")
        if retData.ret == 0 then
            if retData.data  then
                if callBack ~= nil then  callBack(retData.data) end 
            end
		else
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
			ModuleCache.ModuleManager.destroy_module("public", "goldexchange")
        end
    end, function(errorData)
		ModuleCache.ModuleManager.destroy_module("public", "goldexchange")
    end)
end

return GoldExchangeModule