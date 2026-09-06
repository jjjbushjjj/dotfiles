-- Set leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Plugins
vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/vague-theme/vague.nvim" },
  { src = 'https://github.com/nvim-telescope/telescope.nvim', tag = '*' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { src = 'https://github.com/nvim-pack/nvim-spectre' },
  { src = 'https://github.com/numToStr/Comment.nvim' },
  { src = 'https://github.com/sindrets/diffview.nvim' },
  { src = 'https://github.com/NeogitOrg/neogit' },
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
{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },

-- Default completion for neovim is omnicomplete
-- Main reason for this to exist, is that it could combine multipy sources for completions lsp,snippets,etc
{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("*") },
{ src = "https://github.com/mason-org/mason.nvim" },
{ src = "https://github.com/nvim-mini/mini.nvim" },
{ src = "https://github.com/nvim-mini/mini.statusline" },
{ src = "https://github.com/kdheepak/lazygit.nvim" },
{ src = "https://github.com/stevearc/oil.nvim.git" },
{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
{ src = "https://github.com/cbochs/grapple.nvim" },
{ src = "https://github.com/stefandtw/quickfix-reflector.vim" },
{ src = "https://github.com/immanuwell/droast.nvim.git" },
} )

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
require("config.treesitter")
Groovy_lspath = vim.fn.expand('$HOME/.local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server-all.jar')
require("core.lsp")
-- Unused because we use blink.cmp below for auto completions
-- require("core.autocompletion")

-- Here where all setup functions for plugins are
require("plugins")

vim.cmd("colorscheme vague")
