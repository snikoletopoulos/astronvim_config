return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 40
      },
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true
      },
    }
  },
  {
    "karb94/neoscroll.nvim",
    lazy = false,
    config = function()
      require("neoscroll").setup({})
    end
  },
  { "mg979/vim-visual-multi", lazy = false },
  {
    "pocco81/auto-save.nvim",
    lazy = false,
    config = function()
      require("auto-save").setup({
        debounce_delay = 1000,
        execution_message = { message = function() return "" end }
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    config = function()
      require("treesitter-context").setup({
        mode = "topline",
      })
    end
  },
  { "ThePrimeagen/harpoon",   lazy = false },
  {
    "s1n7ax/nvim-window-picker",
    opts = {
      show_prompt = false,
    }
  },
  { "cshuaimin/ssr.nvim" },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim"
        },
        opts = { lsp = { auto_attach = true } }
      }
    },
  },
  {
    "nvim-neorg/neorg",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    lazy = false,
    build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {
          config = {
            icon_preset = "diamond"
          }
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/notes",
            },
            default_workspace = "notes",
          },
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          }
        },
        ["core.integrations.nvim-cmp"] = {},
      },
    },
  }
}
