
local list = require("list")
local class = require("lib.middleclass")
local list = require('list')
local VideoMachine = class('VideoMachine')
local Time = UnityEngine.Time


function VideoMachine:initialize(module, data, fun_msg)
	self._module = module
	self._data = data
	self._curData = nil
	self._fun_msg = fun_msg
	self:stop()
	self:set_step_interval(1)
end

function VideoMachine:initWaitPlayData()
	self._waitPlayQueue = list:new()
	self._playedStack = list:new()
	for i=1,#self._data.list do
		self._waitPlayQueue:push(self._data.list[i])
	end
end

function VideoMachine:set_step_interval(interval)
	self._interval = interval or 1
end

function VideoMachine:update()
	if(not self.lastTime)then
		self:refreshLastTime()
	end
	if(not self._isPlaying)then
		return
	end
	self.time = self.time + Time.deltaTime
	if(self.time - self.lastTime > self._interval)then
		self:refreshLastTime()
		self:forward()
	end
end

function VideoMachine:refreshLastTime()
	self.lastTime = self.time
end

function VideoMachine:forward()
	local step = {
		state = 2,			--end
	}
	local data = self._waitPlayQueue:shift()
	if(data)then
		step.state = 1		--forward
		step.data = data
		self._playedStack:push(self._curData)
		self._curData = data
	else
		step.state = 2		--end
	end
	self._fun_msg(step)

end

function VideoMachine:back()
	local step = {
		state = -2		--at begin
	}
	local data = self._playedStack:pop()
	if(data)then
		step.state = -1
		step.data = data
		self._waitPlayQueue:unshift(self._curData)
		self._curData = data
	else
		step.state = -2
	end
	self._fun_msg(step)
end

--播放
function VideoMachine:play()
	self._isPlaying = true
end

--停止
function VideoMachine:stop()
	self.time = 0
	self.lastTime = nil
	self._isPlaying = false
	self._curData = nil
	self:initWaitPlayData()
end

--暂停
function VideoMachine:pause()
	self._isPlaying = false
end

--下一步
function VideoMachine:next_step()
	self:forward()
end

--上一步
function VideoMachine:pre_step()
	self:back()
end

return VideoMachine
