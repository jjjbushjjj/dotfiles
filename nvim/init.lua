-- Set leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Plugins
vim.pack.add({
  { src = "https://github.com/vague-theme/vague.nvim" },
  { src = 'https://github.com/nvim-telescope/telescope.nvim', tag = '*' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { src = 'https://github.com/nvim-pack/nvim-spectre' },
  { src = 'https://github.com/numToStr/Comment.nvim' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
{ src = 'https://github.com/rafamadriz/friendly-snippets' },

-- Default completion for neovim is omnicomplete
-- Main reason for this to exist, is that it could combine multipy sources for completions lsp,snippets,etc
{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("*") },
{ src = "https://github.com/mason-org/mason.nvim" },
{ src = "https://github.com/nvim-mini/mini.nvim" },

})

vim.diagnostic.config ({
  virtual_lines = false,
  virtual_text = false,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  }
})

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("core.lsp")
-- Unused because we use blink.cmp below for auto completions
-- require("core.autocompletion")
require("blink.cmp").setup() --Some mistery here this thing needs to be setup explicity. To work properly
require("mason").setup() --Some mistery here this thing needs to be setup explicity. To work properly
require("mini.surround").setup()
vim.cmd("colorscheme vague")
