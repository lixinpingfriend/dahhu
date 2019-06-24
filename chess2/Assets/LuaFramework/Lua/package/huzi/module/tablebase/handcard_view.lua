








local class       = require("lib.middleclass")
local HandCardView = class('HandCardView')

local Manager = require("package.public.module.function_manager")
local TableUtilPaoHuZi = require("package.huzi.module.tablebase.table_util")


local Input = UnityEngine.Input

local LINE_COUNT = 11 -- 手牌最大列数
local ROW_COUNT = 4 -- 手牌最大行数
local DEFAULT_CARD_VALUE = -1 -- 默认值

--- 限制自由拖动一列可摆放的最大张数
--- 如果一列最多只能摆放3张，将此参数修改为3即可
local ONE_LINE_MOVE_COUNT = 4

local GRAY = Color.New(0.6, 0.6, 0.6, 1)
local WHITE = Color.New(1, 1, 1, 1)
local WHITE_ALPHA = Color.New(1, 1, 1, 0.5)

--- 初始化视图
---@param module TableModule 绑定module层
---@param view UnityEngine.GameObject 绑定手牌根节点
---@param cloneRoot UnityEngine.GameObject 克隆根节点
function HandCardView:bind_view(module, view, cloneRoot, line)
    self.module = module
	self.root = view
	self.root.gameObject:SetActive(false)
    local grid = Manager.FindObject(view, "Grid")
    --- 牌的父节点，用于排列牌的显示次序
    self.cardParent = {}
    for i = 1, 4 do
        self.cardParent[i] = Manager.FindObject(view, "CardsParent/" .. tostring(i)).transform
    end

    --- 初始化LINE_COUNT * ROW_COUNT的网格节点以及牌的空列表
    self.grid = {}
    self.card = {}
    for i = 1, LINE_COUNT do
        self.grid[i] = {}
        self.card[i] = {}
        for j = 1, ROW_COUNT do
            self.card[i][j] = {}
            self.card[i][j].id = DEFAULT_CARD_VALUE
            self.card[i][j].enable = false
            local obj = Manager.FindObject(grid, tostring(i) .. "/" .. tostring(j))
            self.grid[i][j] = obj.transform
        end
    end

    --- 计算节点的宽高
    self.gridWidth = (self.grid[2][1].position.x - self.grid[1][1].position.x) / 2
    self.gridHeight = (self.grid[1][2].position.y - self.grid[1][1].position.y) / 2

    --- 拖动时牌的显示
    self.dragImg = Manager.GetImage(view, "Drag/Image")
    self.dragSpriteHolder = Manager.GetComponent(self.dragImg.gameObject, "SpriteHolder")

    --- 手牌的本体
    self.clone = Manager.FindObject(cloneRoot, "ShouZhang")


    --- 左上、右下节点，用来判断出牌范围
    local lt = Manager.FindObject(view, "LT")
    local rb = Manager.FindObject(view, "RB")
    self.lt, self.rb = {}, {}
    self.lt.x, self.lt.y = lt.transform.position.x, lt.transform.position.y
    self.rb.x, self.rb.y = rb.transform.position.x, rb.transform.position.y

    --- 提示出牌动画
    self.readyOut = {
        obj = Manager.FindObject(view, "ReadyOut"),
        finger = Manager.FindObject(view, "ReadyOut/Finger")
    }
    self:set_line_obj(line)
end

--- 初始化手牌数据
--- @param data table 手牌数据
--- @param slowly boolean 是否开场慢慢显示
--- @param callback function 回调函数
function HandCardView:init_data(data, slowly, callback, bLiPai)
	self.bLiPai = bLiPai
	self.root.gameObject:SetActive(true)
    local dataList = {}
    for k, v in ipairs(data.cards) do
        for i, j in ipairs(v.pai) do
            table.insert(dataList, j.pai)
        end
    end

    table.sort(dataList, function(a, b) return a < b end)

    if self.oldDataList then
        TableUtilPaoHuZi.print("上次手牌长度，本次手牌长度", #self.oldDataList, #dataList)
        if #self.oldDataList > #dataList then
            local index = 0
            local tempList = {}
            for i = 1, #self.oldDataList do
                if not dataList[i - index] or dataList[i - index] and dataList[i - index] ~= self.oldDataList[i] then
                    table.insert(tempList, self.oldDataList[i])
                    index = index + 1
                end
            end

            TableUtilPaoHuZi.print("tempList长度", #tempList)
            if #tempList == 1 then
                TableUtilPaoHuZi.print("删除一张手牌", tempList[1])
                self:delete_card_by_xy(self.chupaiX, self.chupaiY, tempList[1])
            else
                for i = 1, #tempList do
                    TableUtilPaoHuZi.print("删除多张手牌", i, tempList[i])
                    self:delete_card_by_id(tempList[i])
                end
            end
            self.oldDataList = dataList
            self.gudingCount = data.count
            if callback then
                callback()
            end
            return
        elseif #self.oldDataList == #dataList then
            self.oldDataList = dataList
            self.gudingCount = data.count
            if callback then
                callback()
			end
			
			if bLiPai then	--理牌则刷新
				self.bLiPai = bLiPai
			else
				if not DataPaoHuZi.booIsLoadAll_ZiPai then
					return
				end
			end
            
		else
			if #self.oldDataList == #dataList -1 then
				self.bLiPai = true
			end
            self.oldDataList = dataList
            self.gudingCount = data.count
            slowly = false
        end
    end

    self:clear()
    self.dragEnable = false
    self.oldDataList = dataList
    self.gudingCount = data.count


    local realData = data.cards
    --local realData = data 
    


    for k, v in ipairs(realData) do
        for i, j in ipairs(v.pai) do
            if k > LINE_COUNT or i > ROW_COUNT then
                TableUtilPaoHuZi.print("越界了", k, i)
            end

            self.card[k][i].id = j.pai
            local go = Manager.CopyObject(self.clone, self.cardParent[i])

            if DataPaoHuZi.ZP_ZPPaiLei == 1 then
                local RectTransform = go.transform:Find("Image"):GetComponent("RectTransform")
                self.Vector2_113 = self.Vector2_113 or UnityEngine.Vector2.New(96, 113)
                RectTransform.sizeDelta = self.Vector2_113
            elseif DataPaoHuZi.ZP_ZPPaiLei == 2 then
                local RectTransform = go.transform:Find("Image"):GetComponent("RectTransform")

                self.Vector2_140 = self.Vector2_140 or UnityEngine.Vector2.New(96, 140)
                RectTransform.sizeDelta = self.Vector2_140
            elseif DataPaoHuZi.ZP_ZPPaiLei == 3 then
                local RectTransform = go.transform:Find("Image"):GetComponent("RectTransform")

                self.Vector2_140 = self.Vector2_140 or UnityEngine.Vector2.New(96, 140)
                RectTransform.sizeDelta = self.Vector2_140
            end

            local image = go.transform:Find("Image"):GetComponent("Image")
            self.nCardNum = nCardNum
            self.color_type = DataPaoHuZi.ZP_ZPPaiLei
            local bundlePath = "huzi/module/table/huzi_tablecards/type".. self.color_type ..".atlas"
            local assetName = Huzi_Card_SpriteName[Huzi_Card_Type.Hand] .. j.pai
            image.sprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle(bundlePath, assetName)

            if slowly then
                Manager.SetPos(go, self.grid[5][i].position.x, self.grid[k][i].position.y, self.grid[k][i].position.z)
            else
                Manager.SetPos(go, self.grid[k][i].position.x, self.grid[k][i].position.y, self.grid[k][i].position.z)
            end

            go:SetActive(false)
            self.card[k][i].obj = go
            self.card[k][i].enable = not j.is_gray
            self.card[k][i].cachePos = self.grid[k][i].position
        end
    end

    self:refresh_cards(
        slowly,
        function()
            self.dragEnable = true
            if callback then
                callback()
            end
        end
    )
end

function HandCardView:paixugaoqi(data)

    local key = "字牌是不是把固定坎放前面" .. AppData.Game_Name
    if not ModuleCache.PlayerPrefsManager.HasKey(key) then
        ModuleCache.PlayerPrefsManager.SetInt(key, 1)
	end
    local tableBg = ModuleCache.PlayerPrefsManager.GetInt(key)
    


    local tableNewCards = {}

    for k,v in pairs(data.cards) do
        local yihang = {}
        local pais = {}
        yihang.pai = pais
        tableNewCards[k] = yihang
        for i, j in ipairs(v.pai) do
            local pai = {}
            pai.pai = j.pai
            pai.is_gray = j.is_gray
            pais[i] = pai

            
        end

        local xuhao = v.pai[1].pai
        local xh = xuhao
        if xuhao % 2 == 0 then
            xh = xh - 1
        else
            xh = xh + 1
        end

        if tableBg == 2 and v.pai[1].is_gray == true then
            xh = xh - 100
        end

        yihang.xuhao = xh
    end

    table.sort(
        tableNewCards,
        function(a, b)
            return a.xuhao < b.xuhao
        end
    )

    local realData = tableNewCards



    return realData
end

function HandCardView:gandiaodanlie(tableNewCards)
    for k, v in ipairs(tableNewCards) do
        local cdi = #tableNewCards[k].pai
        if cdi == 1 then
            -- 找出这张牌  前后四列中找到最合适释放的位置   序号大于4  则一定不合适
            --首先 前后两列

            local index = {-1,1,-2,2}

            for i, vvs in ipairs(index) do
                local pa = tableNewCards[k + vvs]
                if pa then
                    local cd = #pa.pai
                    if cd < 3 and cd > 0 then
                        local p1 = pa.pai[1].pai
                        local p2 = v.pai[1].pai
                        if math.abs(p1 - p2) < 4 then
                            pa.pai[cd + 1] = v.pai[1]
                            v.gun = true
                            break
                        end
                    end
                end
            end
        end
    end


    for i=#tableNewCards, 1, -1 do
        if tableNewCards[i].gun then
            table.remove(tableNewCards,i)
        end
    end

    table.sort(
            tableNewCards,
            function(a, b)
                return a.xuhao < b.xuhao
            end
    )
end

--- 设置出牌提示的线
--- @param obj UnityEngine.GameObject
function HandCardView:set_line_obj(obj)
    self.line = obj
    self:show_line(false)
end

--- 显示出牌提示的线
--- @param show boolean
function HandCardView:show_line(show)
    if self.line then
        self.line:SetActive(show)
    end
end

--- 清除数据
function HandCardView:clear()
    self.gudingCount = 0
    self.oldDataList = nil
    self.dragEnable = false
    self.enable = false
    self.downFlag = false
    self.chupaiX = nil
    self.chupaiY = nil
    self.dragObj = nil
    self.dragImg.gameObject:SetActive(false)

    for i = 1, LINE_COUNT do
        for j = 1, ROW_COUNT do
            if self.card[i][j].obj then
                Manager.DestroyObject(self.card[i][j].obj)
            end
            self.card[i][j] = {}
            self.card[i][j].id = DEFAULT_CARD_VALUE
            self.card[i][j].obj = nil
            self.card[i][j].enable = false
        end
    end
    local zipaiz = ModuleCache.PlayerPrefsManager.GetInt("ZP_ZPPaiLei" .. AppData.Game_Name, 1)
	local bundlePath = "huzi/module/table/huzi_tablecards/type".. zipaiz ..".atlas"
	self.bundleCard = ModuleCache.AssetBundleManager:LoadAssetBundle(bundlePath)                      --进入牌桌会调用clear初始化数据 放在这里加载 C#层资源有引用计数 用成员变量记录
end

--- 设置是否能出牌
--- @param b boolean
function HandCardView:set_out_card_enable(b)
    self.enable = b
    self:show_ready_out(b)
end

--- 设置是否可拖动
--- @param b boolean
function HandCardView:set_drag_enable(b)
    self.dragEnable = b
end

--- 根据坐标和牌值删除手牌
--- @param x number 横坐标
--- @param y num 纵坐标
--- @param value number 牌值
function HandCardView:delete_card_by_xy(x, y, value)
    if not x or not y or value ~= self.card[x][y].id then
        TableUtilPaoHuZi.print("牌所在位置已发生改变，从手牌中找出一张该id的牌删除")
        self:delete_card_by_id(value)
    else
        Manager.DestroyObject(self.card[x][y].obj)
        self.card[x][y].id = DEFAULT_CARD_VALUE
        self.card[x][y].obj = nil
        self.card[x][y].enable = false

        self:refresh_one_line(x)
        self:refresh_cards()
    end
end

--- 删除手牌中所有与id相同的牌
--- @param id number
function HandCardView:delete_all_same_id_card(id)
    for i = 1, LINE_COUNT do
        local flag = false
        for j = 1, ROW_COUNT do
            if self.card[i][j].id == id then
                Manager.DestroyObject(self.card[i][j].obj)
                self.card[i][j].id = DEFAULT_CARD_VALUE
                self.card[i][j].obj = nil
                self.card[i][j].enable = false
                flag = true
            end
        end
        if flag then
            self:refresh_one_line(i)
        end
    end
    self:refresh_cards()
end

--- 根据id删除手 牌
--- 一次删除一张
--- @param id number
function HandCardView:delete_card_by_id(id)
    local paiYaoShan = {}
    for i = 1, LINE_COUNT do
        for j = 1, ROW_COUNT do
            if self.card[i][j].id == id then
                local a = 0
                for k,v in pairs(self.card[i]) do
                    if v.id and v.id ~= DEFAULT_CARD_VALUE then
                        a = a + 1
                    end
                end

                if self:is_col_shunzi(self.card[i]) then
                    a = 99      --顺子最后出掉
                end

                if (paiYaoShan.deletePai and paiYaoShan.hangshu > a) or not paiYaoShan.deletePai then
                    paiYaoShan.deletePai = self.card[i][j]
                    paiYaoShan.hangshu = a
                end
            end
        end
    end

    for i = 1, LINE_COUNT do
        local flag = false
        for j = 1, ROW_COUNT do
            if self.card[i][j] == paiYaoShan.deletePai then
                Manager.DestroyObject(self.card[i][j].obj)
                self.card[i][j].id = DEFAULT_CARD_VALUE
                self.card[i][j].obj = nil
                self.card[i][j].enable = false
                flag = true
                break
            end
        end
        if flag then
            self:refresh_one_line(i)
            break
        end
    end

    self:refresh_cards()
end

--判断一列是否是顺子
function HandCardView:is_col_shunzi(cards)
    local nIndex = 1
    local arr = {}
    for k,v in pairs(cards) do
        if v.id and v.id ~= DEFAULT_CARD_VALUE then
            arr[nIndex] = v.id
            nIndex = nIndex + 1
        end
    end

    if #arr ~= 3 then
        return false
    end
    table.sort(arr,function(a,b)
        if a < b then
            return true
        end
        return false
    end
    )
    if arr[2] - arr[1] == 2 and arr[3] - arr[2] == 2 then
        return true
    end

    if arr[1] == 3 and arr[2] == 13 and arr[3] == 19 then
        return true
    end

    if arr[1] == 4 and arr[2] == 14 and arr[3] == 20 then
        return true
    end
    return false
end

--- 显示出牌提示动画
--- @param b boolean
function HandCardView:show_ready_out(b)
    self.readyOut.obj:SetActive(b)

    if self.readyOut.seq then
        self.readyOut.seq:Kill(false)
        self.readyOut.seq = nil
    end

    self.readyOut.finger.transform.localPosition = Vector3.New(self.readyOut.finger.transform.localPosition.x, -40, 0)
    if b then
        self.readyOut.seq = self.module:create_sequence()
        local tw1 = self.readyOut.finger.transform:DOLocalMoveY(40, 1, false)
        local tw2 = self.readyOut.finger.transform:DOLocalMoveY(-40, 0.3, false)
        self.readyOut.seq:Append(tw1)
        self.readyOut.seq:AppendInterval(0.2)
        self.readyOut.seq:Append(tw2)
        self.readyOut.seq:SetAutoKill(true)
        self.readyOut.seq:OnComplete(
            function()
            end
        )
        self.readyOut.seq:SetLoops(-1)
        self.readyOut.seq:Play()
    --else
    --    self.readyOut.finger.transform.localPosition = Vector3.New(self.readyOut.finger.transform.localPosition.x, -40, 0)
    end
end

--- 设置拖动的牌
--- @param value number 牌值
function HandCardView:set_drag_img(value)
    local image = self.dragImg.transform:GetComponent("Image")
    self.color_type = DataPaoHuZi.ZP_ZPPaiLei
    local bundlePath = "huzi/module/table/huzi_tablecards/type".. self.color_type ..".atlas"
    local assetName = Huzi_Card_SpriteName[Huzi_Card_Type.Hand] .. value
    image.sprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle(bundlePath, assetName)
end

--- 开始拖动
--- @param obj UnityEngine.GameObject 单元格中的obj
function HandCardView:on_drag_begin(obj)
    if not self.dragEnable or self.dragObj or self.isFirstLoad then
        return
    end

    --- 根据点击选中的obj获取对应的单元格坐标
    local i, j = self:get_xy(obj)
    --- 对应单元格中存在牌且牌是可拖动状态才开始拖动
    if self.card[i][j].obj and self.card[i][j].enable then
        print("选中单元格", i, j)
        self.horizontal_id_old, self.yuanquxuhao = self:get_quhao(i, j)
        self:show_line(true)
        self.downFlag = true
        --- 记录当前点击位置
        self.downX, self.downY = i, j
        self.dragObj = self.card[i][j].obj
        --- 透明化选中的牌
        local img = Manager.GetImage(self.card[i][j].obj, "Image")
        img.color = WHITE_ALPHA
        self:set_drag_img(self.card[i][j].id)
        --- 这里必须先设置为显示状态再更新坐标，否则下次拖动会出现按下时坐标改变了，但显示位置还在原来的地方
        self.dragImg.gameObject:SetActive(true)
		self:on_drag_update()
		
		--显示听牌信息
		if self.module.Msg_Table_GameStateNTF.ke_chu ~= 0 and not self.module.bChuTag then
			local value = self.card[i][j].id
			self.module:ShowTingTips(value)
		end
    end
end

--- 更新拖动
function HandCardView:on_drag_update()
    if self.downFlag and self.dragObj then
        if Input.touchCount > 0 then
            self.dragImg.transform.position =
                self.module.view:get_world_pos(Input.GetTouch(0).position, self.dragImg.transform.position.z)
        else
            self.dragImg.transform.position =
                self.module.view:get_world_pos(Input.mousePosition, self.dragImg.transform.position.z)
        end
    end
end

--- 结束拖动
function HandCardView:on_drag_end()
    self:show_line(false)
    if self.downFlag and self.dragObj then
        --- 拖动物体不存在或不对应
        if not self.card[self.downX][self.downY].obj or self.dragObj ~= self.card[self.downX][self.downY].obj then
            self.downFlag = false
            self.dragObj = nil
            self:reset_drag_img()
            self:refresh_cards()
            return
        end

        --- 把拖动的牌的坐标值赋给选中的牌
        local pos = self.dragImg.transform.position
        Manager.SetPos(self.card[self.downX][self.downY].obj, pos.x, pos.y, pos.z)
        self:reset_drag_img()

		--- 出牌范围
		local value = self.card[self.downX][self.downY].id
        if pos.y > self.lt.y and value ~= 21 then

            local enable_ke_chu = DataPaoHuZi.Msg_Table_GameStateNTF.ke_chu ~= 0
            --- 可出牌
            if enable_ke_chu and self.card[self.downX][self.downY].obj and
					self.card[self.downX][self.downY].obj == self.dragObj then
						
                self.chupaiX, self.chupaiY = self.downX, self.downY

                --  这张要出的牌  刚好遍历所有玩家 发现 其余玩家手中居然有 喂牌 则必须提示才能出
                local boolf = false
                local data = DataPaoHuZi.Msg_Table_GameStateNTF
                for i = 1, #data.player do
                    local datap = data.player[i]
                    local xiazhangmen = datap.xia_zhang
                    for i=1,#datap.xia_zhang do
                        local xiazhang = xiazhangmen[i]
                        if xiazhang and xiazhang.pai and #xiazhang.pai == 3 and xiazhang.pai[2] == 0 and value == xiazhang.pai[1] and (AppData.Game_Name == 'XXZP' or AppData.Game_Name == 'LDZP') then
                            boolf = true
                        end
                    end
                end

				if not boolf then
					self.module.playersView[1]:ShowChu(value)
					self.module.model:request_chupai(value)
					self.module.bSelfChu = true
                else

					ModuleCache.ModuleManager.show_public_module("alertdialog"):show_other_confirm_cancel("该牌有玩家偎，打出该牌后将不能动张（不能吃碰），是否打出？", function()
						self.module.playersView[1]:ShowChu(value)
						self.module.model:request_chupai(value)
						self.module.bSelfChu = true
                    end, function() 
                        self.downFlag = false
                        self.dragObj = nil
                        self:reset_drag_img()
                        self:refresh_cards()
                    end, true, "确 认", "取 消")  

                end
                
            else
                self:refresh_cards()
            end
        else
            --- 根据当前拖动的牌的坐标获取单元格坐标
            local x, y = self:get_grid_xy(pos)
            local selectedCard = self.card[self.downX][self.downY]
            --- 拖动前后不在同一列且目标列有空闲位置放置
            self.horizontal_id_new, self.xinquxuhao = self:get_quhao(x, y, true)
            if
                x ~= self.downX and
                    (self.card[x][ONE_LINE_MOVE_COUNT - 1].id == DEFAULT_CARD_VALUE or
                        self.card[x][ONE_LINE_MOVE_COUNT - 1].enable) and
                    self.card[x][ONE_LINE_MOVE_COUNT].id == DEFAULT_CARD_VALUE
             then
                --- 拖动前后在同一列且和原来位置不一致
                self:request_pailie_shoupai()
                table.remove(self.card[self.downX], self.downY)
                local temp = {
                    id = DEFAULT_CARD_VALUE,
                    enable = false,
                    obj = nil
                }
                table.insert(self.card[self.downX], temp)
                self:refresh_one_line(self.downX)
                table.insert(self.card[x], y, selectedCard)
                self:refresh_one_line(x)
            elseif x == self.downX and y ~= self.downY then --and self.card[x][3].id == DEFAULT_CARD_VALUE then
                self:request_pailie_shoupai()
                table.remove(self.card[x], self.downY)
                table.insert(self.card[x], y, selectedCard)
                self:refresh_one_line(x)
            end
            self:refresh_cards()
        end
    end
    self:reset_drag_img()
    self.downFlag = false
    self.dragObj = nil
end

--- 重置拖动显示的牌
function HandCardView:reset_drag_img()
    self.dragImg.gameObject:SetActive(false)
    Manager.SetLocalPos(self.dragImg.gameObject, 0, 0, 0)
end

--- 根据世界坐标换算所在单元格坐标
--- @param pos Vector3
--- @return number, number
function HandCardView:get_grid_xy(pos)
    local x, y = 0, 0
    if pos.x < self.grid[1][1].position.x - self.gridWidth then
        x = 1
    elseif pos.x >= self.grid[LINE_COUNT][1].position.x + self.gridWidth then
        x = LINE_COUNT
    else
        for i = 1, LINE_COUNT do
            if
                pos.x >= self.grid[i][1].position.x - self.gridWidth and
                    pos.x < self.grid[i][1].position.x + self.gridWidth
             then
                x = i
                break
            end
        end
    end
    if pos.y < self.grid[1][1].position.y - self.gridHeight then
        y = 1
    elseif pos.y >= self.grid[1][ROW_COUNT].position.y + self.gridHeight then
        y = ROW_COUNT
    else
        for i = 1, ROW_COUNT do
            if
                pos.y >= self.grid[1][i].position.y - self.gridHeight and
                    pos.y < self.grid[1][i].position.y + self.gridHeight
             then
                y = i
                break
            end
        end
    end

    return x, y
end

function HandCardView:request_pailie_shoupai()
    if not self.horizontal_id_old or not self.yuanquxuhao or not self.horizontal_id_new or not self.xinquxuhao then
        return
    end

    local data = {
        horizontal_id_old = self.horizontal_id_old,
        vertical_id_old = self.yuanquxuhao,
        horizontal_id_new = self.horizontal_id_new,
        vertical_id_new = self.xinquxuhao
    }
    --self.module.model:request_pailie_shoupai(data)
    self.horizontal_id_old = nil
    self.yuanquxuhao = nil
    self.horizontal_id_new = nil
    self.xinquxuhao = nil
end

function HandCardView:get_quhao(x, y, xin)
    local a, b = 0, 0
    for i = 1, #self.card do
        if self.card[i][1].id ~= DEFAULT_CARD_VALUE then
            a = a + 1
            local findFlag = false
            if not xin then
                for j = 1, #self.card[i] do
                    if x == i and y == j then
                        b = j
                        findFlag = true
                        break
                    end
                end
            else
                if x == i then
                    for j = 1, #self.card[i] do
                        if self.card[i][j].id == DEFAULT_CARD_VALUE then
                            b = j
                            findFlag = true
                            break
                        end
                    end
                end
            end
            if findFlag then
                break
            end
        end
    end

    if b > 0 then
        a = a - 1 - self.gudingCount
    else
        if x < self.horizontal_id_old + 1 then
            a = 0
        else
            a = a - self.gudingCount
        end
    end
    b = b - 1
    if b == -1 then
        b = 0xffffffff
    end
    if a < 0 then
        a = 0
    end
    --print("###########", a, b, self.gudingCount)

    return a, b
end

--- 刷新某一列
--- @param x number
function HandCardView:refresh_one_line(x)
    local data = {}
    for i = 1, ROW_COUNT do
        if self.card[x][i].id ~= DEFAULT_CARD_VALUE then
            local index = #data + 1
            data[index] = {}
            data[index].id = self.card[x][i].id
            data[index].obj = self.card[x][i].obj
            data[index].enable = self.card[x][i].enable
        end
    end

    if #data > 0 then
        for i = 1, ROW_COUNT do
            if i <= #data then
                self.card[x][i].id = data[i].id
                self.card[x][i].obj = data[i].obj
                self.card[x][i].enable = data[i].enable
            else
                self.card[x][i].id = DEFAULT_CARD_VALUE
                self.card[x][i].obj = nil
                self.card[x][i].enable = false
            end
        end
    end
end

--- 刷新所有牌
--- @param slowly boolean
--- @param callback function
function HandCardView:refresh_cards(slowly, callback)
    local data = {}
    for i = 1, LINE_COUNT do
        if self.card[i][1].id ~= DEFAULT_CARD_VALUE then
            local index = #data + 1
            data[index] = {}
            for j = 1, ROW_COUNT do
                data[index][j] = {}
                data[index][j].id = self.card[i][j].id
                data[index][j].obj = self.card[i][j].obj
                data[index][j].enable = self.card[i][j].enable
            end
        end
    end

    if #data > 0 then
        local start = math.floor((LINE_COUNT - #data) / 2) + 1
        local ed = start + #data - 1
        for i = 1, LINE_COUNT do
            local flag = (i >= start and i <= ed)
            for j = 1, ROW_COUNT do
                if flag then
                    local x = i - start + 1
                    self.card[i][j].id = data[x][j].id
                    self.card[i][j].obj = data[x][j].obj
                    self.card[i][j].enable = data[x][j].enable
                else
                    self.card[i][j].id = DEFAULT_CARD_VALUE
                    self.card[i][j].obj = nil
                    self.card[i][j].enable = false
                end
            end
        end
    end

    self.dragEnable = false
    if self.refreshSeq then
        self.refreshSeq:Kill(false)
        self.refreshSeq = nil
    end
    self.refreshSeq = self.module:create_sequence()

	local time = 0.2
    if slowly then
        time = 0.3
	end

    if HandCardView.isFirstLoad then
        self:fapai()
		time = 0.5
        self.module:start_lua_coroutine(function ()
            for i=1,8 do
                local SoundManager = require("package.huzi.module.tablebase.sound_manager")
                SoundManager:play_nameroot('fapai')
            end
        end)
    end


    for i = 1, LINE_COUNT do
        for j = 1, ROW_COUNT do
            if self.card[i][j].id ~= DEFAULT_CARD_VALUE then
                self.card[i][j].obj.transform:SetParent(self.cardParent[j])
                Manager.SetScale(self.card[i][j].obj, 1, 1, 1)
				local pos = self.grid[i][j].position
				if self.bLiPai ~= nil and self.bLiPai then
					self.card[i][j].obj.transform.position = pos
				else
					local tw = self.card[i][j].obj.transform:DOMove(pos, time, false)
					if i == 1 and j == 1 then
						self.refreshSeq:Append(tw)
					else
						self.refreshSeq:Join(tw)
					end
				end

                if HandCardView.isFirstLoad then
                    --coroutine.wait(0)
                    if not self.module.view then
                        return
                    end
                    --self:fapai1(self.card[i][j].obj.transform.position)
				end
				if self.card[i][j].obj ~= nil then
					local img = Manager.GetImage(self.card[i][j].obj, "Image")
					--local color = img.color
					img.color = self.card[i][j].enable and WHITE or GRAY
					self.card[i][j].obj:SetActive(true) 
				end
                
            end
        end
    end

    if HandCardView.isFirstLoad then
        coroutine.wait(0.5)
    end 
    
    HandCardView.isFirstLoad = false
    TableUtilPaoHuZi.set_frame_rate(true, TableUtilPaoHuZi.playingAnim)
    self.refreshSeq:SetAutoKill(true)
    self.refreshSeq:OnComplete(
        function()
            self.dragEnable = true
            if callback then
                callback()
            end
            TableUtilPaoHuZi.set_frame_rate(false, TableUtilPaoHuZi.playingAnim)
        end
    )
	self.refreshSeq:Play()
    self.dragEnable = true
    self.bLiPai = false
end

function HandCardView:UpdateTingTag(tingData)
	self.tingData = tingData
	local tag1,tag2,tag3
	local type = ModuleCache.PlayerPrefsManager.GetInt("ZP_ZPPaiLei" .. AppData.Game_Name, -1)
	for i = 1, LINE_COUNT do
		for j = 1, ROW_COUNT do
			if self.card[i][j] ~= nil and self.card[i][j].obj ~= nil and self.card[i][j] ~= DEFAULT_CARD_VALUE then
				tag1 = self.card[i][j].obj.transform:Find("Image/ting_1").gameObject
				tag2 = self.card[i][j].obj.transform:Find("Image/ting_2").gameObject
				tag3 = self.card[i][j].obj.transform:Find("Image/ting_3").gameObject
				if self:is_Ting(self.card[i][j].id)then
					tag1:SetActive(type == 1)
					tag2:SetActive(type == 2)
					tag3:SetActive(type == 3)
				else
					tag1:SetActive(false)
					tag2:SetActive(false)
					tag3:SetActive(false)
				end
			end
		end
	end
end

function HandCardView:HideTingTag()
	local tag1,tag2,tag3
	for i = 1, LINE_COUNT do
		for j = 1, ROW_COUNT do
			if self.card[i][j].id ~= DEFAULT_CARD_VALUE then
				tag1 = self.card[i][j].obj.transform:Find("Image/ting_1").gameObject
				tag2 = self.card[i][j].obj.transform:Find("Image/ting_2").gameObject
				tag3 = self.card[i][j].obj.transform:Find("Image/ting_3").gameObject
				tag1:SetActive(false)
				tag2:SetActive(false)
				tag3:SetActive(false)
			end
		end
	end
end

function HandCardView:is_Ting(value)
	local nCount = 0
	if self.tingData ~= nil then
		nCount = #self.tingData
	end
	for i=1, nCount do
		if self.tingData[i].chu_pai == value then
			return true
		end
	end
	return false
end

function HandCardView:fapai1(endPos)
    
end

function HandCardView:fapai()
    
end

--- 获取父节点
--- @param obj UnityEngine.GameObject
--- @return UnityEngine.GameObject
function HandCardView:get_parent_obj(obj)
    local parent = obj.transform.parent.gameObject
    return parent
end

--- 根据单元格节点获取单元格坐标
--- @param obj UnityEngine.GameObject
--- @return number, number
function HandCardView:get_xy(obj)
    local x = tonumber(self:get_parent_obj(obj).name)
    local y = tonumber(obj.name)
    return x, y
end

return HandCardView
