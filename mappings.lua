---@alias Modes "n"|"i"|"v"|"x"|"o"|"c",

---@class Keymaps
---@field n table
---@field i table
---@field v table
---@field x table
---@field o table
---@field c table
---@field new fun(self: Keymaps, o?: Keymaps): Keymaps
---@field add fun(self: Keymaps, mode: Modes, lhs: string, value: table|false): nil
---@field create fun(self: Keymaps): table
local Keymaps = { n = {}, i = {}, v = {}, x = {}, o = {}, c = {} }

function Keymaps:new(o)
	local k = o or {}
	setmetatable(k, self)
	self.__index = self
	return k
end

function Keymaps:add(mode, lhs, value)
	self[mode][lhs] = value
end

function Keymaps:create()
	return { n = self.n, i = self.i, v = self.v, x = self.x, o = self.o, c = self.c }
end

local maps = Keymaps:new()

maps:add("n", "<leader>h", { name = "󱡅 Harpoon", desc = "󱡅 Harpoon" })

astronvim
	.user_opts("mappings.disable")
	:configure(maps, { astronvim = true, packages = true, tabline = true, trouble = true })
astronvim.user_opts("mappings.editing"):configure(maps)
if not vim.g.neovide then
	astronvim.user_opts("mappings.neovide"):configure(maps)
end

return maps:create()
