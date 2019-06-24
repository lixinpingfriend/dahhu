





local table3d_def = {}

table3d_def.uvOffset =
{
    [-1] = {x = -10,y = -10},
    [0] = {x = -10,y = -10},

    [1] = {x = 0.14, y = -0.33},
    [2] = {x = 0.284,y = -0.33},
    [3] = {x = 0.426,y = -0.33},
    [4] = {x = 0.57, y = -0.33},
    [5] = {x = 0.713,y = -0.33},
    [6] = {x = 0.856,y = -0.33},
    [7] = {x = 0,y = -0.5},
    [8] = {x = 0.145,y = -0.5},
    [9] = {x = 0.286,y = -0.5},

    [10] = {x = 0.715,y = -0.665},
    [11] = {x = 0.86,y = -0.665},
    [12] = {x = 0,y = -0.83},
    [13] = {x = 0.145,y = -0.83},
    [14] = {x = 0.285,y = -0.83},
    [15] = {x = 0.43,y = -0.83},
    [16] = {x = 0.57,y = -0.83},
    [17] = {x = 0.715,y = -0.83},
    [18] = {x = 0.86,y = -0.83},

    [19] = {x = 0.428,y = -0.5},
    [20] = {x = 0.57, y = -0.5},
    [21] = {x = 0.713,y = -0.5},
    [22] = {x = 0.856,y = -0.5},
    [23] = {x = 0,y = -0.665},
    [24] = {x = 0.145,y = -0.665},
    [25] = {x = 0.285,y = -0.665},
    [26] = {x = 0.43,y = -0.665},
    [27] = {x = 0.57,y = -0.665},

    [28] = {x = 0.14,y = -0.164},
    [29] = {x = 0.28,y = -0.164},
    [30] = {x = 0.42,y = -0.164},
    [31] = {x = 0.57,y = -0.164},
    [32] = {x = 0.705,y = -0.164},
    [33] = {x = 0.855,y = -0.164},
    [34] = {x = 0,y = -0.33},

    [35] = {x = 0,y = 0},
    [36] = {x = 0.145,y = 0},
    [37] = {x = 0.285,y = 0},
    [38] = {x = 0.43,y = 0},

    [39] = {x = 0.57,y = 0},
    [40] = {x = 0.715,y = 0},
    [41] = {x = 0.86,y = 0},
    [42] = {x = 0,y = -0.175},
}

function table3d_def:getMj3dUvOffset(pai)
    pai = pai or 0
    return self.uvOffset[pai]
end

---根据牌面值获取3D麻将的预制名
function table3d_def:getMj3dPrefabName(pai)
    local prefabName = "Majong_"
    if pai == 42 then
        prefabName = prefabName.."Hua_ju"
    elseif pai == 41 then
        prefabName = prefabName.."Hua_zhu"
    elseif pai == 40 then
        prefabName = prefabName.."Hua_lan"
    elseif pai == 39 then
        prefabName = prefabName.."Hua_mei"
    elseif pai == 38 then
        prefabName = prefabName.."Hua_dong"
    elseif pai == 37 then
        prefabName = prefabName.."Hua_qiu"
    elseif pai == 36 then
        prefabName = prefabName.."Hua_xia"
    elseif pai == 35 then
        prefabName = prefabName.."Hua_chun"
    elseif pai == 34 then
        prefabName = prefabName.."Feng_baiban"
    elseif pai == 33 then
        prefabName = prefabName.."Feng_fa"
    elseif pai == 32 then
        prefabName = prefabName.."Feng_zhong"
    elseif pai == 31 then
        prefabName = prefabName.."Feng_bei"
    elseif pai == 30 then
        prefabName = prefabName.."Feng_xi"
    elseif pai == 29 then
        prefabName = prefabName.."Feng_nan"
    elseif pai == 28 then
        prefabName = prefabName.."Feng_dong"
    elseif (19 <= pai) and (pai <= 27) then
        prefabName = prefabName.."Tong_"..(pai - 18)  ---筒
    elseif (10 <= pai) and (pai <= 18) then
        prefabName = prefabName.."Wan_"..(pai - 9) ---万
    elseif (1 <= pai) and (pai <= 9) then
        prefabName = prefabName.."Tiao_"..pai ---条
    elseif -1 == pai then
        return prefabName.."Back"  ---背面
    else
        prefabName = prefabName.."0"
    end
    return prefabName
end

return table3d_def