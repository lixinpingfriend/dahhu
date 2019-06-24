




local class = require("lib.middleclass")
---@type GoldResultComViewBase
local Base = require('package.majiang.module.goldgameresult.com.base.com_view_base')

---@class GoldResult_Common_view:GoldResultComViewBase
local GoldResult_Common_view = class('goldResult_common_view', Base)

local Util = Util
local ModuleCache = ModuleCache
local TableUtil = TableUtil
local ComponentUtil = ModuleCache.ComponentUtil
local TableManager = TableManager
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentTypeName = ModuleCache.ComponentTypeName
local Vector3 = Vector3
local Color = UnityEngine.Color

function GoldResult_Common_view:new()
    local view = {}
    setmetatable(view, { __index = GoldResult_Common_view })
    return view
end

function GoldResult_Common_view:onInit(rootObj)
    Base.onInit(self,rootObj)
    self.winerInfoRoot = GetComponentWithPath(rootObj, "Center/Child/WinerInfo", ComponentTypeName.Transform).gameObject
    self.zhaNiaoText = GetComponentWithPath(self.winerInfoRoot, "ZhaNiaoText", ComponentTypeName.Text)
    self.winerXiaMj = GetComponentWithPath(self.winerInfoRoot, "WinerXiaMj", ComponentTypeName.Transform).gameObject
    self.winerHandMj = GetComponentWithPath(self.winerInfoRoot, "WinerHandMj", ComponentTypeName.Transform).gameObject
    self.winerZhaNiaoMj = GetComponentWithPath(self.winerInfoRoot, "WinerZhaNiaoMj", ComponentTypeName.Transform).gameObject
    self.fufaParent = GetComponentWithPath(self.winerInfoRoot, "ScrollView/Viewport/Content", ComponentTypeName.Transform).gameObject


    self.fufaObjs = {}

    self.poorObjs = {}
    self:refresh_mj_color_scale()

    self.frontSpriteH = GetComponentWithPath(rootObj, "Holder/FrontSpriteH", "SpriteHolder")
    self.TagSpriteH = GetComponentWithPath(rootObj, "Holder/TagSpriteH", "SpriteHolder")

    self.ConfigData = self.mainView.ConfigData
end

function GoldResult_Common_view:on_init_players_info_holder()
    Base.on_init_players_info_holder(self)
    local totalSeat = TableManager.curTableData.totalSeat
    if 3 == totalSeat then
        local infoHolder2 = self.infoHolders[2]
        infoHolder2.gameObject.transform.localPosition = Vector3(-300,0,0)
        local infoHolder3 = self.infoHolders[3]
        infoHolder3.gameObject.transform.localPosition = Vector3(300,0,0)
    end
end

function GoldResult_Common_view:on_init_info_holder(root,infoHolder)
    Base.on_init_info_holder(self,root,infoHolder)
    infoHolder.diTag = GetComponentWithPath(root, "ImageDi", ComponentTypeName.Image).gameObject
    infoHolder.tuoTag = GetComponentWithPath(root, "ImageTuo", ComponentTypeName.Image).gameObject
    infoHolder.selfAddInfoText = GetComponentWithPath(root, "selfAddInfoText", ComponentTypeName.Text)
    infoHolder.otherAddInfoText = GetComponentWithPath(root, "otherAddInfoText", ComponentTypeName.Text)
end

---刷新玩家结算信息
function GoldResult_Common_view:on_refreshPlayerInfo(gameState)
    local totalSeat = TableManager.curTableData.totalSeat
    local ScoreSettles = gameState.ScoreSettle
    local winerIndex = 1
    for i=1,#gameState.Player do
        if #gameState.Player[i].HuPai ~= 0 then
            winerIndex = i
            break
        end
    end
    self.winerIndex = winerIndex

    local optIndexs = {}
    local curIndex = winerIndex
    for i=1,totalSeat do
        table.insert(optIndexs,curIndex)
        curIndex = curIndex + 1
        if curIndex > totalSeat then
            curIndex = 1
        end
    end

    local maxLen = #self.infoHolders
    for i=1,maxLen do
        local infoHolder = self.infoHolders[i]
        if i > totalSeat then
            ComponentUtil.SafeSetActive(infoHolder.gameObject,false)
        else
            ComponentUtil.SafeSetActive(infoHolder.gameObject,true)
            self:on_setPlayerInfo(optIndexs[i],infoHolder,gameState)
        end
    end

    self:setWinerInfo(winerIndex,gameState)
end

function GoldResult_Common_view:on_setPlayerInfo(index,infoHolder,gameState)
    Base.on_setPlayerInfo(self,index,infoHolder,gameState)
    local playerState = gameState.Player[index]
    local playerId = playerState.UserID
    local localSeat = TableUtil.get_local_seat(index - 1, TableManager.curTableData.SeatID, TableManager.curTableData.totalSeat)

    ComponentUtil.SafeSetActive(infoHolder.diTag, (gameState.ZhuangJia ~= index - 1) and playerState.DiTuo)
    ComponentUtil.SafeSetActive(infoHolder.tuoTag,(gameState.ZhuangJia == index - 1) and playerState.DiTuo)

    local actualAmount = gameState.ScoreSettle[index].ActualAmount
    infoHolder.selfAddInfoText.text = ""
    infoHolder.otherAddInfoText.text = ""
    if 1 == localSeat then
        infoHolder.selfAddInfoText.text = self:calculateAddInfo(index,gameState)
    else
        infoHolder.otherAddInfoText.text = self:calculateAddInfo(index,gameState)
    end
end

function GoldResult_Common_view:setWinerInfo(winerIndex,gameState)
    self:setWinerHandMj(winerIndex,gameState)
    self:setWinerAddInfo(winerIndex,gameState)
    self.infoHolders[1].locationText.text = self.infoHolders[1].locationText.text.."胜"
end

function GoldResult_Common_view:setWinerHandMj(winerIndex,gameState)
    local playerState = gameState.Player[winerIndex]
    local xOffset = 80
    local xlastOffset = 20
    local xAddOffset = 9

    local leftChilds = TableUtil.get_all_child(self.winerXiaMj)
    local xzCount = 0
    for i=1,#playerState.XiaZhang do
        xzCount = xzCount + #playerState.XiaZhang[i].Pai
    end
    local leftWidth = 0
    for i=1,#playerState.XiaZhang do --下张摆放位置更新
        local xiaZhangData = playerState.XiaZhang[i]
        if(#xiaZhangData.Pai <= 4) then
            local needGray = false
            local pais = {}
            if(i > #leftChilds) then
                local mj = nil
                mj = TableUtil.poor("1_4MJ",self.winerXiaMj, Vector3.New(leftWidth, 0 , 0), self.poorObjs, self.clones, Vector3.New(1, 1, 1))
                local mjChilds = TableUtil.get_all_child(mj)
                for j=1,#mjChilds do
                    if(j <= #playerState.XiaZhang[i].Pai) then
                        xzCount = xzCount - 1
                        ComponentUtil.SafeSetActive(mjChilds[j], true)
                        --table.insert(colorMj, mjChilds[j])
                        local pai = nil
                        pai = playerState.XiaZhang[i].Pai[j]
                        if(pai == 0) then
                            TableUtil.set_mj_bg(2, mjChilds[j], self.mjColorSet)
                        else
                            TableUtil.set_mj_bg(1, mjChilds[j], self.mjColorSet)
                        end
                        --self:insert_mj_by_pai(colorMj, pai, mjChilds[j])
                        TableUtil.set_mj(pai, mjChilds[j], self.mjScaleSet, self.frontSpriteH)
                        if(self:is_laizi(pai, gameState)) then
                            TableUtil.set_laizi_tag(mjChilds[j], self.TagSpriteH, self.ConfigData)
                        else
                            TableUtil.set_mj_white(mjChilds[j])
                        end
                        if(j - 1 == xiaZhangData.JinZhang) then
                            if(#xiaZhangData.Pai > 2) then
                                needGray = true
                            end
                        end
                        table.insert(pais, {pai = pai, obj = mjChilds[j]})
                    else
                        ComponentUtil.SafeSetActive(mjChilds[j], false)
                    end
                end
                if(needGray) then
                    local xiaZhangSeat = TableUtil.get_local_seat(xiaZhangData.Seat, winerIndex - 1, TableManager.curTableData.totalSeat)
                    local mj = nil
                    local pai = 0
                    if(xiaZhangSeat == 2) then
                        if(#xiaZhangData.Pai == 4) then
                            mj = pais[3].obj
                            pai = pais[3].pai
                        else
                            mj = pais[#pais].obj
                            pai = pais[#pais].pai
                        end
                    elseif(xiaZhangSeat == 3) then
                        if(#xiaZhangData.Pai == 4) then
                            mj = pais[4].obj
                            pai = pais[4].pai
                        else
                            mj = pais[2].obj
                            pai = pais[2].pai
                        end
                    elseif(xiaZhangSeat == 4) then
                        mj = pais[1].obj
                        pai = pais[1].pai
                    else

                    end
                    if(mj) then
                        if(not self:is_laizi(pai, gameState)) then
                            TableUtil.set_mj_white(mj, Color.gray)
                        else
                            TableUtil.set_laizi_tag(mj, self.TagSpriteH, self.ConfigData, true)
                        end
                    end
                end
            end
            local num = math.min(3, #playerState.XiaZhang[i].Pai)
            leftWidth = leftWidth + xOffset * num + xAddOffset
        else
            for j=1,#xiaZhangData.Pai do
                xzCount = xzCount - 1
                local mj = TableUtil.poor("1_4MJ",self.winerXiaMj, Vector3.New(leftWidth, 0 , 0), self.poorObjs, self.clones, Vector3.New(1, 1, 1))
                local showIndex = 1
                local pai = xiaZhangData.Pai[j]
                local mjChilds = TableUtil.get_all_child(mj)
                for k=1,#mjChilds do
                    ComponentUtil.SafeSetActive(mjChilds[k], k == showIndex)
                    if(k == showIndex) then
                        if(pai == 0) then
                            TableUtil.set_mj_bg(2, mjChilds[showIndex], self.mjColorSet)
                        else
                            TableUtil.set_mj_bg(1, mjChilds[showIndex], self.mjColorSet)
                        end
                        --self:insert_mj_by_pai(colorMj, pai, mjChilds[showIndex])
                        TableUtil.set_mj(pai, mjChilds[showIndex], self.mjScaleSet, self.frontSpriteH)
                        if(self:is_laizi(pai, gameState)) then
                            TableUtil.set_laizi_tag(mjChilds[showIndex], self.TagSpriteH, self.ConfigData)
                        else
                            TableUtil.set_mj_white(mjChilds[showIndex])
                        end
                    end
                end
                local num = 1
                leftWidth = leftWidth + xOffset * num
            end
            leftWidth = leftWidth + xAddOffset
        end
    end

    self.winerHandMj.transform.localPosition = self.winerHandMj.transform.localPosition + Vector3.New(leftWidth, 0 , 0)

    local paiGridChilds = TableUtil.get_all_child(self.winerHandMj)
    for i=1, #playerState.ShouZhang do
        local mj = nil
        local pai = playerState.ShouZhang[i].Pai
        if(i <= #paiGridChilds) then
            mj = paiGridChilds[i]
        else
            mj = TableUtil.poor("MJ", self.winerHandMj, Vector3.zero, self.poorObjs, self.clones)
        end
        mj.transform.localPosition = Vector3.New(xOffset * (i - 1), 0, 0)
        TableUtil.set_mj_bg((pai == 0) and 2 or 1, mj, self.mjColorSet)
        TableUtil.set_mj(pai, mj, self.mjScaleSet, self.frontSpriteH)
        TableUtil.set_mj_color(mj, Color.white)
        ComponentUtil.SafeSetActive(mj, true)
        local tag = GetComponentWithPath(mj, "Tag", ComponentTypeName.Transform).gameObject
        local tagImage = GetComponentWithPath(mj, "Tag", ComponentTypeName.Image)
        local showHu = #playerState.HuPai ~= 0 and i > (#playerState.ShouZhang - #playerState.HuPai) and playerState.HuPai[1] ~= 0
        ComponentUtil.SafeSetActive(tag, false)
        if(self:is_laizi(pai, gameState)) then
            TableUtil.set_laizi_tag(mj, self.TagSpriteH,self.ConfigData)
        end
        if(showHu) then
            ComponentUtil.SafeSetActive(tag, true)
            tagImage.sprite = self.TagSpriteH:FindSpriteByName("2")
            mj.transform.localPosition = mj.transform.localPosition + Vector3.New(xlastOffset, 0, 0)
        end
    end
end

function GoldResult_Common_view:setWinerAddInfo(winerIndex,gameState)
    local fuFaTable = self:calculateFuFaTable(winerIndex,gameState)
    local childs = TableUtil.get_all_child(self.fufaParent)
    for i=1,#fuFaTable do
        local hufaInfo = fuFaTable[i]
        local infoObj = nil
        if(i <= #childs) then
            infoObj = childs[i]
        else
            infoObj = TableUtil.poor("Template",self.fufaParent, Vector3.zero, self.fufaObjs, self.clones)
        end
        local titelText = GetComponentWithPath(infoObj, "", ComponentTypeName.Text)
        titelText.text = hufaInfo
    end

    local playerState = gameState.Player[winerIndex]
    self.zhaNiaoText.text = ""
    if playerState.ZhongNiao > 0 then
        self.zhaNiaoText.text = "扎鸟：x"..tostring(playerState.ZhongNiao)
    elseif #gameState.MaiMa > 0 then
        self.zhaNiaoText.text = "扎马："
        local xOffset = 80
        local MaiMaMjs = {}
        local paiGridChilds = TableUtil.get_all_child(self.winerZhaNiaoMj)
        for i=1, #gameState.MaiMa do
            local mj = nil
            local pai = gameState.MaiMa[i]
            if(i <= #paiGridChilds) then
                mj = paiGridChilds[i]
            else
                mj = TableUtil.poor("MJ", self.winerZhaNiaoMj, Vector3.zero, self.poorObjs, self.clones)
            end
            mj.transform.localPosition = Vector3.New(xOffset * (i - 1), 0, 0)
            TableUtil.set_mj_bg((pai == 0) and 2 or 1, mj, self.mjColorSet)
            TableUtil.set_mj(pai, mj, self.mjScaleSet, self.frontSpriteH)
            TableUtil.set_mj_color(mj, Color.white)
            ComponentUtil.SafeSetActive(mj, true)
            local tag = GetComponentWithPath(mj, "Tag", ComponentTypeName.Transform).gameObject
            ComponentUtil.SafeSetActive(tag, false)
            table.insert(MaiMaMjs,mj)
        end
        local idx
        for i=1, #gameState.ZhongMa do
            idx = gameState.ZhongMa[i]+1
            GetComponentWithPath(MaiMaMjs[idx], "HighLight", ComponentTypeName.Transform).gameObject:SetActive(true)
        end
    end
end

function GoldResult_Common_view:calculateAddInfo_old(index,gameState)
    local playerState = gameState.Player[index]
    local localSeat = TableUtil.get_local_seat(index - 1, TableManager.curTableData.SeatID, TableManager.curTableData.totalSeat)
    local seatHolder = TableManager.curTableData.seatHolderArray[localSeat]
    local tex = seatHolder.showAdd1Text.text.." ".. seatHolder.showAdd2Text.text
    return tex
end

function GoldResult_Common_view:calculateAddInfo(index,gameState)
    local hufaTable = {}
    local playerState = gameState.Player[index]
    for i=1,#playerState.HuFa do
        local hufa = playerState.HuFa[i]
        if 0 == hufa.SymbolType then
            if(not self.ConfigData.isDengZhou) then
                local addStr = ""
                if(hufa.Jia) then
                    if(hufa.showfen) then
                        if(hufa.Fen >= 0) then
                            addStr =  addStr ..hufa.Fen
                        elseif(hufa.Fen < 0) then
                            addStr = addStr ..hufa.Fen
                        end
                    elseif(hufa.Fen > 0) then
                        addStr =  addStr ..hufa.Fen
                    elseif(hufa.Fen < 0) then
                        addStr = addStr ..hufa.Fen
                    end
                else
                    if(hufa.showfen) then
                        addStr = addStr ..hufa.Fen
                    elseif(hufa.Fen ~= 1) then
                        addStr = addStr ..hufa.Fen
                    end
                end
                addStr = hufa.Name.." "..addStr
                table.insert(hufaTable,addStr)
            else
                local strFuFa = ""
                if(hufa.Name == "前" or hufa.Name == "后") then
                    strFuFa =  hufa.Name..hufa.Fen
                elseif(hufa.Name == "胡牌" or hufa.Name == "放炮胡" or hufa.Name == "自摸胡") then
                    if(hufa.Fen <= 0) then
                        strFuFa =  "胡牌"..tostring(hufa.Fen)
                    else
                        strFuFa =  "胡牌 +"..tostring(hufa.Fen)
                    end
                    if(hufa.Name ~= "胡牌") then
                        strFuFa = "添加"..tostring(hufa.Name)
                    else
                        strFuFa = "添加"
                    end
                elseif(hufa.Name == "逮胡") then
                    if(hufa.Fen <= 0) then
                        strFuFa = "逮胡"..tostring(hufa.Name)
                    else
                        strFuFa = "逮胡 +"..tostring(hufa.Fen)
                    end
                elseif(hufa.Name == "漂") then
                    if(hufa.Fen <= 0) then
                        strFuFa = "漂"..tostring(hufa.Name)
                    else
                        strFuFa = "漂 +"..tostring(hufa.Fen)
                    end
                end
                table.insert(hufaTable,strFuFa)
            end
        else
            local addStr = ""
            local opeStr =  ""
            local unitStr = hufa.Unit
            local opeStr = ""
            if 1 == hufa.SymbolType then
                opeStr = ""
                addStr = opeStr..tostring(hufa.Fen)..unitStr
                if 0 == hufa.Fen then
                    addStr = ""
                end
            elseif 2 == hufa.SymbolType then
                if hufa.Fen > 0 then
                    opeStr = "+"
                end
                addStr = opeStr..tostring(hufa.Fen)..unitStr
            elseif 3 == hufa.SymbolType then
                opeStr = "x"
                addStr = opeStr..tostring(hufa.Fen)..unitStr
            end
            addStr =  hufa.Name..addStr
            table.insert(hufaTable,addStr)
        end
    end

    local tex = ""
    for i=1,#hufaTable do
        local fufa = hufaTable[i]
        local needDep = false
        if string.find(fufa, '漂')
                or string.find(fufa, '杠')
                or string.find(fufa, '亮倒')
                or string.find(fufa, '放炮') then
            needDep = true
        end
        if needDep then
            tex = tex..fufa.." "
        end
    end
    return tex
end

function GoldResult_Common_view:refresh_mj_color_scale()
    local config = TableManager.curTableData.playModelData
    local defaultScale = 0
    local defaultColor = 0
    if(config.cardTheame) then
        local strs = string.split(config.cardTheame, "|")
        defaultScale = tonumber(strs[1])
        defaultColor = tonumber(strs[2])
    end
    self.mjScaleSet = ModuleCache.PlayerPrefsManager.GetInt(string.format("%s_MJScale",TableManager.curTableData.ruleJsonInfo.GameType), defaultScale)
    self.mjColorSet = ModuleCache.PlayerPrefsManager.GetInt(string.format("%s_MJColor",TableManager.curTableData.ruleJsonInfo.GameType), defaultColor)
end

function GoldResult_Common_view:is_laizi(pai, newGameState)
    return pai ~= 0 and (newGameState.LaiZi == pai or (self.ConfigData.isWuZhou and newGameState.LaiGen == pai and TableManager.curTableData.ruleJsonInfo.GuiPai == 2))
end

function GoldResult_Common_view:calculateFuFaTable(index,gameState)
    local hufaTable = {}
    local playerState = gameState.Player[index]
    for i=1,#playerState.HuFa do
        local hufa = playerState.HuFa[i]
        if 0 == hufa.SymbolType then
            if(not self.ConfigData.isDengZhou) then
                local addStr = ""
                if(hufa.Jia) then
                    if(hufa.showfen) then
                        if(hufa.Fen >= 0) then
                            addStr =  addStr .. string.format("<color=#e03e0c>%s</color>", " +" .. hufa.Fen)
                        elseif(hufa.Fen < 0) then
                            addStr = addStr .. string.format("<color=#e03e0c>%s</color>", " " .. hufa.Fen)
                        end
                    elseif(hufa.Fen > 0) then
                        addStr =  addStr .. string.format("<color=#e03e0c>%s</color>", " +" .. hufa.Fen)
                    elseif(hufa.Fen < 0) then
                        addStr = addStr .. string.format("<color=#e03e0c>%s</color>", " " .. hufa.Fen)
                    end
                else
                    if(hufa.showfen) then
                        addStr = addStr .. string.format("<color=#e03e0c>%s</color>", " x" .. hufa.Fen)
                    elseif(hufa.Fen ~= 1) then
                        addStr = addStr .. string.format("<color=#e03e0c>%s</color>", " x" .. hufa.Fen)
                    end
                end
                addStr = hufa.Name.." "..addStr
                table.insert(hufaTable,addStr)
            else
                local strFuFa = ""
                if(hufa.Name == "前" or hufa.Name == "后") then
                    strFuFa =  string.format("%s<color=#e03e0c>%s</color>", hufa.Name, hufa.Fen)
                elseif(hufa.Name == "胡牌" or hufa.Name == "放炮胡" or hufa.Name == "自摸胡") then
                    if(hufa.Fen <= 0) then
                        strFuFa =  "胡牌"..tostring(hufa.Fen)
                    else
                        strFuFa =  "胡牌 +"..tostring(hufa.Fen)
                    end
                    if(hufa.Name ~= "胡牌") then
                        strFuFa = "添加"..tostring(hufa.Name)
                    else
                        strFuFa = "添加"
                    end
                elseif(hufa.Name == "逮胡") then
                    if(hufa.Fen <= 0) then
                        strFuFa = "逮胡"..tostring(hufa.Name)
                    else
                        strFuFa = "逮胡 +"..tostring(hufa.Fen)
                    end
                elseif(hufa.Name == "漂") then
                    if(hufa.Fen <= 0) then
                        strFuFa = "漂"..tostring(hufa.Name)
                    else
                        strFuFa = "漂 +"..tostring(hufa.Fen)
                    end
                end
                table.insert(hufaTable,strFuFa)
            end
        else
            local addStr = ""
            local opeStr =  ""
            local unitStr = hufa.Unit
            local opeStr = ""
            if 1 == hufa.SymbolType then
                opeStr = ""
                addStr = opeStr..tostring(hufa.Fen)..unitStr
                if 0 == hufa.Fen then
                    addStr = ""
                end
            elseif 2 == hufa.SymbolType then
                if hufa.Fen > 0 then
                    opeStr = "+"
                end
                addStr = opeStr..tostring(hufa.Fen)..unitStr
            elseif 3 == hufa.SymbolType then
                opeStr = "x"
                addStr = opeStr..tostring(hufa.Fen)..unitStr
            end
            addStr = string.format("%s<color=#e03e0c>%s</color>", hufa.Name, addStr)
            --addStr = hufa.Name.." "..addStr
            table.insert(hufaTable,addStr)
        end
    end
    return hufaTable
end

return GoldResult_Common_view