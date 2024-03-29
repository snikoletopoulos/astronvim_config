---@alias CommandPaletteEntry {[1]: string, [2]: string, [3]?: number}

---@type {[1]: string, [2]: CommandPaletteEntry }[]
return {
	-- {
	-- 	"Notes",
	-- 	{ "Close all notes", ":Neorg return" },
	-- 	{ "Open current directory workspace", ":Neorg workspace current_dir" },
	-- 	{ "Open notes index", ":Neorg workspace default" },
	-- },
	{
		"LSP",
		{ "Restart lua-ls", ":LspRestart lua-ls" },
		{ "Restart eslint_d", ":!eslint_d restart" },
		{ "Restart tsserver", ":LspRestart tsserver" },
	},
	{
		"File",
		{ "Explain RegEx", ":Hypersonic" },
		{ "Search and Replace", ":Sad", 1 },
		{ "Search and Replace current word", ":Sad" },
		{ "Inspect types", ":InspectTwoslashQueries" },
	},
	{
		"Packages",
		{ "AstroNvim Version", ":AstroVersion" },
		{ "AstroNvim Changelog", ":AstroChangelog" },
		{ "AstroNvim Update", ":AstroUpdate" },
		{ "Update Plugins and Mason", ":AstroUpdatePackages" },
		{ "Mason Update", ":MasonUpdateAll" },
		{ "Open Mason", ":Mason" },
		{ "Plugins Status", ":lua require('lazy').home()" },
		{ "Plugins Update", ":lua require('lazy').update()" },
		{ "Plugins Sync", ":lua require('lazy').sync()" },
	},
	{
		"Vim",
		{ "Commands", ":lua require('telescope.builtin').commands()" },
		{
			"Command history",
			":lua require('telescope.builtin').command_history()",
		},
		{ "Vim options", ":lua require('telescope.builtin').vim_options()" },
		{ "Check health", ":checkhealth" },
		{
			"Change colorshceme",
			":lua require('telescope.builtin').colorscheme({ enable_preview = true })",
		},
	},
}
