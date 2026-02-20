require("blink.cmp").setup()
require("mason").setup()
require("mini.surround").setup()
require("mini.statusline").setup()
require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "^.git" },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden"
    },
    mappings = {
      n = {
        ['<c-d>'] = require('telescope.actions').delete_buffer
      },
      i = {
        ["<C-h>"] = "which_key",
        ['<c-d>'] = require('telescope.actions').delete_buffer
      }
    }
  },
  pickers = {
    find_files = {
      hidden = true
    }
  }
})

require("oil").setup({
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
  }
})
