local maps = { n = {}, i = {}, v = {}, x = {}, o = {} }

-- Editing
maps.n.n = { "nzzzv", desc = "Next result" }
maps.n.N = { "Nzzzv", desc = "Previous result" }
maps.x["<leader>p"] = { "\"_dP", desc = "Paste without coping" }
maps.n["<leader>y"] = { "\"+y", desc = "Yank to clipboard" }
maps.x["<leader>y"] = { "\"+y", desc = "Yank to clipboard" }
maps.n["<leader>Y"] = { "\"+Y", desc = "Yank line to clipboard" }
maps.x["<leader>d"] = { "\"_d", desc = "Cut" }
maps.n["<leader>d"] = { "\"_d", desc = "Cut" }

-- Editor behavior
maps.n["<leader>c"] = {
  function()
    local bufs = vim.fn.getbufinfo({ buflisted = true })
    require("astronvim.utils.buffer").close(0)
    if require("astronvim.utils").is_available("alpha-nvim") and not bufs[2] then require("alpha").start(true) end
  end,
  desc = "Close buffer",
}
maps.n["<leader>Q"] = { "<cmd>qa<CR>", desc = "Close all buffers" }

-- Disable AstroNvim mappings
maps.n["<leader>fa"] = false -- auto-save.nvim
maps.n["<leader>uu"] = false -- undotree.nvim
maps.n["<leader>ft"] = false -- todo-comments.nvim
maps.n["<leader>uh"] = false -- harpoon
maps.n["<leader>e"] = false  -- CamelCaseMotion
maps.n["<leader>w"] = false  -- CamelCaseMotion
maps.n["<leader>ud"] = false -- neo-tree-diagnostics.nvim

-- Disable Tabline mappings
maps.n["<leader>b"] = false
maps.n["<leader>bb"] = false
maps.n["<leader>bd"] = false
maps.n["<leader>b\\"] = false
maps.n["<leader>b|"] = false
maps.n["<leader>bl"] = false
maps.n["<leader>br"] = false
maps.n["<leader>bse"] = false
maps.n["<leader>bsi"] = false
maps.n["<leader>bsm"] = false
maps.n["<leader>bsp"] = false
maps.n["<leader>bsr"] = false

-- Just naming
maps.n["<leader>h"] = { name = "󱡅 Harpoon", desc = "󱡅 Harpoon" }

-- CamelCaseMotion
-- maps.n["<leader>w"] = { desc = "Next camel case word" }
-- maps.v["<leader>w"] = { desc = "Next camel case word" }
-- maps.v["<leader>e"] = { desc = "Next end of camel case word" }
-- maps.v["<leader>b"] = { desc = "Next start of camel case word" }
-- maps.n["<leader>ge"] = { desc = "Previous end of camel case word" }
-- maps.v["<leader>ge"] = { desc = "Previous end of camel case word" }

return maps
