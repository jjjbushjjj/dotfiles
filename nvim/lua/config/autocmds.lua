vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yankning (copying) text',
  group = vim.api.nvim_create_augroup('My-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- 3. Autocmd to refresh statusline on recording events
vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    vim.cmd("redrawstatus")
  end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    -- Slight delay ensures reg_recording() is cleared before redraw
    vim.defer_fn(function()
      vim.cmd("redrawstatus")
    end, 50)
  end,
})

-- follow open buffer directory
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local path = vim.fn.expand("%:p:h")
    if vim.fn.isdirectory(path) == 1 then
      vim.api.nvim_set_current_dir(path)
    end
  end,
})
