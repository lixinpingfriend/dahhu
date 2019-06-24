local TableSound = {}
local ModuleCache = ModuleCache
local Time = Time

function TableSound:Reset()
    self.preSoundName = nil
end

function TableSound:play_sound(_PakageName,_Path,_VoiceName)
    ModuleCache.SoundManager.play_sound(_PakageName,_Path, _VoiceName)--播放声音的接口
end

function TableSound:play_table_sound(_VoiceName)
    --print("==播放跑得快牌桌里面的声音")
    self:play_sound("runfast",string.format("runfast/sound/table/%s.bytes",_VoiceName), _VoiceName)
end

function TableSound:PlaySound_Btn()
    self:play_sound("public", "public/sound/button.bytes", "button")
end

function TableSound:PlaySound_ShotVocie(IsMale,Key)
    --print("====系统文本聊天的声音")
    local sexName = IsMale and "chat_male_" or "chat_female_"
    local voiceName = sexName .. Key
    self:play_sound("publictable","publictable/sound/tablepoker/"..voiceName..".bytes",voiceName)
end

function TableSound:PlaySound_ClockDown()
    --print("==倒计时")
    self:play_table_sound("pu_clockdown")
end

function TableSound:PlaySound_DaPai()
    --print("==打牌到桌上时的声音")
    self:play_table_sound("pu_dapai")
end

function TableSound:PlaySound_FlyGold()
    --print("==炸弹飞金币的声音")
    self:play_table_sound("pu_flygold")
end

function TableSound:PlaySound_FaPaiDongHua()
    --print("==发牌动画时的发牌声音")
    self:play_table_sound("pu_dealpoker")
end

function TableSound:PlaySound_OnlyOneWarning(IsMale)
    --print("==只剩一张牌报警")
    local sexName = IsMale and "male_" or "female_"
    self:play_table_sound(sexName.."shengyu1")
end

function TableSound:PlaySound_NotAfford(IsMale)
    --print("==要不起")
    local sexName = IsMale and "male_" or "female_"
    local soundName = "buyao" .. tostring(math.random(1, 2))
    self:play_table_sound(sexName..soundName)
    self.preSoundName = soundName
end

function TableSound:PlaySound_PokerType(IsMale,soundName)
    --print("==打出的牌的类型")
    if (self.preSoundName and self.preSoundName == soundName) then
        if(self.lastSoundThrowPokerTime and self.lastSoundThrowPokerTime + 0.2 > Time.realtimeSinceStartup) then
            print("==播放牌型声音时间间隔太短")--规避极限情况下两个相同的声音一起播放
            return
        end
        self.lastSoundThrowPokerTime = Time.realtimeSinceStartup

        if (soundName == "shunzi" or soundName == "sandaier" or soundName == "liandui" or soundName == "feiji") then
            soundName = "dashang" .. tostring(math.random(1, 3))
        end
    end
    self.preSoundName = soundName
    local sexName = IsMale and "male_" or "female_"
    self:play_table_sound(sexName..soundName)
end

function TableSound:PlayMusic_BG(soundName)
    --print("====背景音乐")
    ModuleCache.SoundManager.play_music("public", "public/sound/bgmmusic/" .. soundName .. ".bytes", soundName)
end

return  TableSound