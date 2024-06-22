---@type LazySpec
return {
	{
		"okuuva/auto-save.nvim",
		cmd = { "ASToggle" },
		event = { "User AstroFile", "InsertLeave", "TextChanged" },
		keys = {
			{ "<leader>fa", "ASToggle", desc = "Toggle auto-save" },
		},
		opts = {
			execution_message = { enabled = false },
			condition = function(buffer)
				return require("auto-save.utils.data").not_in(
					vim.fn.getbufvar(buffer, "&filetype"),
					{ "harpoon" }
				)
			end,
		},
	},
	{
		"smoka7/multicursors.nvim",
		keys = {
			{
				"<M-n>",
				"<cmd>MCstart<cr>",
				desc = "Create a selection for selected text or word under the cursor",
				mode = { "v", "n" },
			},
		},
	},
	{
		"chrisgrieser/nvim-spider",
		keys = {
			{
				"<leader>w",
				"<cmd>lua require('spider').motion('w')<CR>",
				mode = { "n", "o", "x" },
				desc = "Next camel case word",
			},
			{
				"<leader>e",
				"<cmd>lua require('spider').motion('e')<CR>",
				mode = { "n", "o", "x" },
				desc = "Next end of camel case word",
			},
			{
				"<leader>b",
				"<cmd>lua require('spider').motion('b')<CR>",
				mode = { "n", "o", "x" },
				desc = "Next start of camel case word",
			},
			{
				"<leader>ge",
				"<cmd>lua require('spider').motion('ge')<CR>",
				mode = { "n", "o", "x" },
				desc = "Previous end of camel case word",
			},
		},
	},
	{
		"chrisgrieser/nvim-various-textobjs",
		opts = { useDefaultKeymaps = false },
		keys = {
			{
				"a<leader>w",
				'<cmd>lua require("various-textobjs").subword("outer")<CR>',
				mode = { "o", "x" },
			},
			{
				"i<leader>w",
				'<cmd>lua require("various-textobjs").subword("inner")<CR>',
				mode = { "o", "x" },
			},
		},
	},
}
