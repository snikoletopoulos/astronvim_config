---@class Timer
---@field handle uv.uv_timer_t
---@field callback fun()
local Timer = {}
Timer.__index = Timer

---@param callback fun()
---@return Timer
function Timer.new(callback)
	return setmetatable({
		handle = vim.uv.new_timer(),
		callback = callback,
	}, Timer)
end

---@param delay integer
function Timer:start(delay)
	self.handle:stop()
	self.handle:start(delay, 0, vim.schedule_wrap(self.callback))
end

function Timer:stop() self.handle:stop() end

function Timer:close()
	self.handle:stop()
	self.handle:close()
end

return Timer
