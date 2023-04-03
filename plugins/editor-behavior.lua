return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 40
      }
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
  { "ThePrimeagen/harpoon",   lazy = false }
}
