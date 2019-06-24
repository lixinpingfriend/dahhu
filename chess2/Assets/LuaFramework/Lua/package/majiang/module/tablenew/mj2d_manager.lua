




local Mj2DManager = {}
Mj2DManager.mjCache = {}

--- mjType 0 普通 1 手牌 2 弃牌 3 下张 4 花牌
Mj2DManager.mjType =
{
    custom = 0,
    hand = 1,
    out = 2,
    down = 3,
    hua = 4,
}

--- 添加
function Mj2DManager.insert(mj, mjType, localSeat, gameObject)
    gameObject = gameObject or mj.gameObject
    local key = mj.gameObject:GetInstanceID() .. ""
    Mj2DManager.mjCache[key] =
    {
        type = mjType,
        mj = mj,
        gameObject = gameObject,
        localSeat = localSeat,
    }
end

--- 移除
function Mj2DManager.remove(mj, gameObject)
    gameObject = gameObject or mj.gameObject
    local key = gameObject:GetInstanceID() .. ""
    if(Mj2DManager.mjCache[key]) then
        Mj2DManager.mjCache[key] = nil
    end
end

--- 所有麻将
function Mj2DManager.all()
    return Mj2DManager.mjCache
end

--- 清除
function Mj2DManager.clear()
    Mj2DManager.mjCache = {}
end

--- 根据麻将类型获取
function Mj2DManager.get_mjs(mjType)
    local mjs = {}
    for key, vTable in pairs(Mj2DManager.mjCache) do
        if(vTable.type == mjType) then
            table.insert(mjs, vTable.mj)
        end
    end
    return mjs
end

--- 根据麻将类型以及座位获取
function Mj2DManager.get_seat_mjs(mjType, localSeat)
    local mjs = {}
    for key, vTable in pairs(Mj2DManager.mjCache) do
        if(vTable.type == mjType and vTable.localSeat == localSeat) then
            table.insert(mjs, vTable.mj)
        end
    end
    return mjs
end

--- 根据gameObject 获取麻将数据
function Mj2DManager.get_mj(obj)
    local key = obj:GetInstanceID() .. ""
    local cacheData = Mj2DManager.mjCache[key]
    if cacheData then
        return cacheData.mj
    end
    return nil
end

return Mj2DManager