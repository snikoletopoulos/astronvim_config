---@type LazySpec
return {
	"AstroNvim/astrolsp",
	---@type AstroLSPOpts
	opts = {
		features = {
			autoformat = true,
			codelens = true,
			inlay_hints = true,
			semantic_tokens = true,
		},
		formatting = {
			format_on_save = { enabled = false },
			timeout_ms = 2000,
			filter = function(client) return client.name == "null-ls" end,
		},
		---@diagnostic disable: missing-fields
		config = {
			lua_ls = { settings = { Lua = { hint = { enable = true, arrayIndex = "Disable" } } } },
			emmet_ls = {
				init_options = {
					jsx = {
						options = {
							["jsx.enabled"] = true,
							["output.selfClosingStyle"] = "xhtml",
							["bem.enabled"] = true,
						},
					},
				},
			},
			["typescript-tools"] = {
				on_attach = function(client, bufnr) require("twoslash-queries").attach(client, bufnr) end,
				settings = {
					expose_as_code_action = "all",
					disable_member_code_lens = false,
				},
			},
		},
		autocmds = {
			eslint_fix_on_save = false,
			mappings = {
				n = {
					["<Leader>uY"] = false,
					["<Leader>lG"] = false,
					["<Leader>lR"] = false,
				},
				v = { ["<leader>uY"] = false },
			},
		},
	},
}