local PlayerPrefs = UnityEngine.PlayerPrefs

---@class PlayerPrefsManager
local PlayerPrefsManager = {}
PlayerPrefsManager.cacheData = {}
-- 替换掉UnityEngine.PlayerPrefs中的指向
UnityEngine.PlayerPrefs = PlayerPrefsManager

function PlayerPrefsManager.GetInt(key, defaultVal)
    local getVal = PlayerPrefsManager.cacheData[key]
    if(getVal) then
        return getVal
    end
    if(defaultVal) then
        getVal = PlayerPrefs.GetInt(key, defaultVal)
    else
        getVal = PlayerPrefs.GetInt(key)
    end
    return getVal
end

function PlayerPrefsManager.GetString(key, defaultVal)
    local getVal = PlayerPrefsManager.cacheData[key]
    if(getVal) then
        return getVal
    end
    if(defaultVal) then
        getVal = PlayerPrefs.GetString(key, defaultVal)
    else
        getVal = PlayerPrefs.GetString(key)
    end
    return getVal
end

function PlayerPrefsManager.GetFloat(key, defaultVal)
    local getVal = PlayerPrefsManager.cacheData[key]
    if(getVal) then
        return getVal
    end
    if(defaultVal) then
        getVal = PlayerPrefs.GetFloat(key, defaultVal)
    else
        getVal = PlayerPrefs.GetFloat(key)
    end
    return getVal
end

function PlayerPrefsManager.SetInt(key, setVal)
    PlayerPrefs.SetInt(key, setVal)
    PlayerPrefsManager.cacheData[key] = setVal
end

function PlayerPrefsManager.SetString(key, setVal)
    PlayerPrefs.SetString(key, setVal)
    PlayerPrefsManager.cacheData[key] = setVal
end

function PlayerPrefsManager.SetFloat(key, setVal)
    PlayerPrefs.SetFloat(key, setVal)
    PlayerPrefsManager.cacheData[key] = setVal
end

function PlayerPrefsManager.Save()
    PlayerPrefs.Save()
end

function PlayerPrefsManager.HasKey(key)
    return PlayerPrefs.HasKey(key)
end

function PlayerPrefsManager.DeleteKey(key)
    PlayerPrefs.DeleteKey(key)
end

function PlayerPrefsManager.DeleteAll()
    PlayerPrefs.DeleteAll()
end

return PlayerPrefsManager