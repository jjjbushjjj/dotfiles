vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>td', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true, desc = 'Toggle all diagnostics' })
-- Move between open buffers and close
vim.keymap.set('n', '[b', '<cmd>bp<CR>')
vim.keymap.set('n', ']b', '<cmd>bn<CR>')
vim.keymap.set('n', '<leader>q', '<cmd>bd<CR>')
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- Telescope keymaps
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[B] Find existing buffers' })
vim.keymap.set('n', '<leader>fh', builtin.git_bcommits, { desc = '[H] Show git history for open file' })
-- vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = '[H] Show makrs' })

-- Grapple Show Local marks  
vim.keymap.set("n", "<leader>fm", require("grapple").open_tags, { desc = "Grapple open local tags" })
-- Grapple Show Global marks
vim.keymap.set("n", "<leader>fM", function()
    require("grapple").open_tags({ scope = "global" })
end, { desc = "Grapple: Open global tags" })
-- Grapple Set Local mark
vim.keymap.set("n", "<leader>mm", require("grapple").toggle, { desc = "Toggle tag local scope" })
-- Grapple Set Global marks
vim.keymap.set("n", "<leader>mM", function()
  require("grapple").toggle({scope = "global"})
end, { desc = "Toggle tag global scope" })
-- Gitsigns
vim.keymap.set('n', '<leader>b', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = 'Toggle git [B]lame' })
-- LazyGit
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<CR>', { desc = 'Toggle LazyGit [G]lame' })
-- Oil
vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Toggle LazyGit [G]lame' })
-- Smart terminal <leader>tt switch between terminlal and buffer form we came
local term_buf = nil
local last_buf = nil

local function toggle_terminal()
  local cur_buf = vim.api.nvim_get_current_buf()

  -- Если мы в терминале — возвращаемся в файл
  if cur_buf == term_buf then
    if last_buf and vim.api.nvim_buf_is_valid(last_buf) then
      vim.api.nvim_set_current_buf(last_buf)
    else
      vim.cmd("bp") -- Если некуда, просто прошлый буфер
    end
  else
    -- Если в коде — запоминаем его и идем в терминал
    last_buf = cur_buf
    if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
      vim.api.nvim_set_current_buf(term_buf)
      vim.cmd("startinsert")
    else
      -- Создаем новый терминал
      vim.cmd("enew | term")
      term_buf = vim.api.nvim_get_current_buf()
      -- Скроем номера строк для красоты
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
      vim.cmd("startinsert")
    end
  end
end

-- Назначаем для обычного режима
vim.keymap.set('n', '<leader>tt', toggle_terminal, { silent = true })

-- Назначаем для режима терминала (используем функцию напрямую, а не строку)
vim.keymap.set('t', '<leader>tt', function()
  -- Сначала выходим в нормальный режим, потом вызываем переключение
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true), 'n', false)
  toggle_terminal()
end, { silent = true })

-- Exit terminal mode with Esc Esc
vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
