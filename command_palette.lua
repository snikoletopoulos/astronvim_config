return {
  { "Servers",
    { "Restart eslint_d", ":! eslint_d restart" },
    { "Restart tsserver", ":LspRestart tsserver" },
  },
  { "File",
    { "save all files (C-A-s)", ':wa' },
    { "entire selection (C-a)", ':call feedkeys("GVgg")' },
    { "inspect types",          ":InspectTwoslashQueries", },
  },
  { "Packages",
    { "Update Plugins and Mason", ":AstroUpdatePackages" },
    { "Mason Update",             ":MasonUpdateAll" },
    { "Open Mason",               ":Mason" },
    { "Plugins Status",           ":lua require('lazy').home()" },
    { "Plugins Update",           ":lua require('lazy').update()" },
    { "Plugins Sync",             ":lua require('lazy').sync()" },
  },
  { "Vim",
    { "jumps (Alt-j)",             ":lua require('telescope.builtin').jumplist()" },
    { "commands",                  ":lua require('telescope.builtin').commands()" },
    { "command history",           ":lua require('telescope.builtin').command_history()" },
    { "registers (A-e)",           ":lua require('telescope.builtin').registers()" },
    { "vim options",               ":lua require('telescope.builtin').vim_options()" },
    { "search history (C-h)",      ":lua require('telescope.builtin').search_history()" },
    { "spell checker",             ':set spell!' },
    { "search highlighting (F12)", ':set hlsearch!' },
    { 'check health',              ":checkhealth" },
    { "colorshceme",               ":lua require('telescope.builtin').colorscheme()",    1 },
    { "reload vimrc",              ":source $MYVIMRC" },
  },
  { "AstroNvim",
    { "AstroNvim Version",   ":AstroVersion" },
    { "AstroNvim Changelog", ":AstroChangelog" },
    { "AstroNvim Update",    ":AstroUpdate" },
  }
}
