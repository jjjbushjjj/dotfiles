local function get_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == "" then
    return ""
  else
    return "   @" .. recording_register -- Use any icon you like
  end
end
require("blink.cmp").setup()
require("mason").setup()
require("mini.surround").setup()

require("mini.statusline").setup({
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
      local git           = MiniStatusline.section_git({ trunc_width = 75 })
      local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
      local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
      local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
      local location      = MiniStatusline.section_location({ trunc_width = 75 })
      local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })
      -- Custom Macro Section
      local macro = get_macro_recording()

      return MiniStatusline.combine_groups({
        { hl = mode_hl, strings = { mode } },
        { hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
        '%<',
        { hl = 'MiniStatuslineFilename', strings = { filename } },
        -- Add macro indicator next to filename or in center
        { hl = 'MiniStatuslineModeVisual', strings = { macro } },
        '%=',
        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
        { hl = mode_hl, strings = { search, location } },
      })
    end
  }
})

require("telescope").setup({
  defaults = {
    layout_config = {
      horizontal = {
        width = 0.9,
        preview_width = 0.6,
      }
    },
    path_display = {
      "filename_first",
    },
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
require("telescope").load_extension("grapple")

require("oil").setup({
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
    actions = {
      cd = true,
    }
  }
})

