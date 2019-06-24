local config = {}
local giftConfig = {
	['rose'] = {key = 'rose', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true, hasCoolTime = true},
	['ring'] = {key = 'ring', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true, hasCoolTime = true},
	['bomb'] = {key = 'bomb', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true, hasCoolTime = true},
	['egg'] = {key = 'egg', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true, hasCoolTime = true},
	['brick'] = {key = 'brick', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true, hasCoolTime = true},
	['kiss'] = {key = 'kiss', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true, hasCoolTime = true},

	['zhuoji'] = {key = 'zhuoji', times = 1, needGold = 0, enabledInCommonTable = false, enabledInGoldTable = false, hasCoolTime = false},
	['bingdong'] = {key = 'bingdong', times = 1, needGold = 0, enabledInCommonTable = false, enabledInGoldTable = false, hasCoolTime = false},
	['guilian'] = {key = 'guilian', times = 1, needGold = 0, enabledInCommonTable = false, enabledInGoldTable = false, hasCoolTime = false},

	['chat_coffee'] = {key = 'chat_coffee', spriteName = 'coffee', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true, hasCoolTime = true},
	['chat_naneki_neko'] = {key = 'chat_naneki_neko', spriteName = 'naneki_neko', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true, hasCoolTime = true},
	['chat_wash_hands'] = {key = 'chat_wash_hands', spriteName = 'wash_hands', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true, hasCoolTime = true},
	['chat_panda'] = {key = 'chat_panda', spriteName = 'panda', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true, hasCoolTime = true},
	['chat_god_of_wealth'] = {key = 'chat_god_of_wealth', spriteName = 'god_of_wealth', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true, hasCoolTime = true},

}

local chatFaceConfig = {
	{isCommonChatFace = true, key = '1', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true},
	{isCommonChatFace = true, key = '2', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true},
	{isCommonChatFace = true, key = '3', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true},
	{isCommonChatFace = true, key = '4', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true},
	{isCommonChatFace = true, key = '5', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true},
	{isCommonChatFace = true, key = '6', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true},
	{isCommonChatFace = true, key = '7', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true},
	{isCommonChatFace = true, key = '8', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true},
	{isCommonChatFace = true, key = '9', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true},
	{isCommonChatFace = true, key = '10', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true},
	{isCommonChatFace = true, key = '11', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true},
	{isCommonChatFace = true, key = '12', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true},
	{isCommonChatFace = true, key = '13', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true},
	{isCommonChatFace = true, key = '14', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true},
	{isCommonChatFace = true, key = '15', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true},
	{isCommonChatFace = true, key = '16', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true},
	{isCommonChatFace = true, key = '17', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true},
	{isCommonChatFace = true, key = '18', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true},
	{isCommonChatFace = true, key = '19', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true},
	{isCommonChatFace = true, key = '20', times = 1, needGold = 0, enabledInCommonTable = true, enabledInGoldTable = true},
}

config.get_gift_config = function(key)
	if(key)then
		return giftConfig[key]
	end
	return giftConfig
end

config.get_common_chatface_config = function(key)
	if(key)then
		for i, v in ipairs(chatFaceConfig) do
			if(v.key == key .. '')then
				return v
			end
		end
		return nil
	end
	return chatFaceConfig
end

return config