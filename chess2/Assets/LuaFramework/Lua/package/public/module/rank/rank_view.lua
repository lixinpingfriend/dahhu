
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local RankView = Class('rankView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local ComponentUtil = ModuleCache.ComponentUtil
local GetComponentWithSimple = ModuleCache.ComponentUtil.GetComponentWithSimple

function RankView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/rank/public_rank.prefab", "Public_Rank", 1);
    View.set_1080p(self)

	self.friendRoot = GetComponentWithSimple(self.root, "Root", ComponentTypeName.Transform).gameObject;
	self:fixed_tran_size(self.friendRoot.transform, 0.94)

    self.buttonBack = GetComponentWithSimple(self.root, "ButtonBack", ComponentTypeName.Button);
    self.buttonMask = GetComponentWithSimple(self.root, "SpriteMask", ComponentTypeName.Button);

    -- 好友模板
    self.friendItem = GetComponentWithSimple(self.root, "item", ComponentTypeName.Transform).gameObject;
    self.friendItem:SetActive(false);

    self.spriteHolder = GetComponentWithSimple(self.root, "SpriteHolder", "SpriteHolder");
end

function RankView:init(historyDataTemp, module)

    self.historyList = historyDataTemp;
    self.model = module.model;
    self.historyListPreviousList = { };

    -- 刷新排行榜视图
    self:updateRankView();
end

-- 刷新排行榜视图
function RankView:updateRankView()

    -- 重复利用模板
    local childCount = self.friendItem.transform.parent.childCount;
    for i = 0, childCount - 1 do
        self.friendItem.transform.parent:GetChild(i).gameObject:SetActive(false);
    end

    -- 去掉上一次的监听
    for key, friend in ipairs(self.historyListPreviousList) do
        local itemClone = self.friendItem.transform.parent:GetChild(key).gameObject;
        local buttonFriend = GetComponentWithSimple(itemClone, "SpriteRankBg", ComponentTypeName.Button);
        buttonFriend.onClick:RemoveListener(friend.onFriendDetailButton);
    end
    self.historyListPreviousList = self.historyList;

    for key, friend in ipairs(self.historyList) do

        -- 重复利用模板
        local itemClone = nil;
        if key > childCount - 1 then
            itemClone = self:clone(self.friendItem.gameObject, self.friendItem.transform.parent.gameObject, Vector3.zero);
            itemClone.name = itemClone.name .. key;
        else
            itemClone = self.friendItem.transform.parent:GetChild(key).gameObject;
            itemClone:SetActive(true);
        end

        -- 排行标签
        local labelRank = GetComponentWithSimple(itemClone, "LabelRank", ComponentTypeName.Text);
        -- 好友金币标签
        local labelFriendGold = GetComponentWithSimple(itemClone, "LabelFriendGold", ComponentTypeName.Text);
        -- 好友排行图标
        local spriteFriendRankIcon = GetComponentWithSimple(itemClone, "SpriteFriendRankIcon", ComponentTypeName.Image);
        -- 好友头像
        local spriteFriendIcon = GetComponentWithSimple(itemClone, "SpriteFriendIcon", ComponentTypeName.Image);
        -- 排行背景
        local spriteRankBg = GetComponentWithSimple(itemClone, "SpriteRankBg", ComponentTypeName.Image);
        --昵称
        local labelName = GetComponentWithSimple(itemClone, "LabelName", ComponentTypeName.Text);
        -- 好友详情按钮
        local buttonFriendDetail = GetComponentWithSimple(itemClone, "SpriteRankBg", ComponentTypeName.Button);
        local onFriendDetailButton = function()
            -- 点击好友详情按钮
            self:onFriendDetailButton(friend);
        end
        friend.onFriendDetailButton = onFriendDetailButton;
        buttonFriendDetail.onClick:AddListener(onFriendDetailButton);

        local onComplete = function(sprite)
            if not sprite then
                spriteFriendIcon.sprite = self.spriteHolder:FindSpriteByName("playerIconDefault");
            else
                -- 好友头像
                spriteFriendIcon.sprite = sprite;
            end
        end
        self:image_load_sprite(nil, friend.headImg, onComplete);
        labelName.text = Util.filterPlayerName(friend.nickName, 10)
        -- 好友金币
        local gold = Util.filterPlayerGoldNum(friend.balance);
        labelFriendGold.text = gold;

        local rankIconTemp = nil;
        local rank = friend.rank;
        -- 排行前三,显示图标,其他显示标签
        if rank <= 3 then

            if rank == 1 then
                rankIconTemp = self.spriteHolder:FindSpriteByName("rank1");
            elseif rank == 2 then
                rankIconTemp = self.spriteHolder:FindSpriteByName("rank2");
            elseif rank == 3 then
                rankIconTemp = self.spriteHolder:FindSpriteByName("rank3");
            end
        end
        labelRank.gameObject:SetActive(not friend.isShowRankIcon);
        spriteFriendRankIcon.gameObject:SetActive(friend.isShowRankIcon);
        -- 排行图标
        spriteFriendRankIcon.sprite = rankIconTemp;
        -- spriteFriendRankIcon:SetNativeSize();
        -- 排行标签
        labelRank.text = friend.rank;

        -- 玩家自己,高亮背景
        if friend.isPlayer then
            spriteRankBg.sprite = self.spriteHolder:FindSpriteByName("playerBg");
        else
            spriteRankBg.sprite = self.spriteHolder:FindSpriteByName("friendBg");
        end
    end
end

-- 点击好友详情按钮
function RankView:onFriendDetailButton(friend)
    local data =
    {
        showType = 2,
        uid = friend.userId,
    }
    -- 打开个人详情界面
    ModuleCache.ModuleManager.show_module("public", "playerinfodetail", data)
end


-- 克隆
function RankView:clone(obj, parent, pos)
    local target = ComponentUtil.InstantiateLocal(obj, parent, pos);
    target.name = obj.name;
    ComponentUtil.SafeSetActive(target, true);
    return target;
end

-- 通过uid获取历史数据
function RankView:getHistoryDataByUID(uid)

    local historyTemp = nil;
    for key, history in ipairs(self.historyListData.persons) do

        if history.userId == uid then
            historyTemp = history;
            return historyTemp;
        end
    end
    return historyTemp;
end

return RankView;