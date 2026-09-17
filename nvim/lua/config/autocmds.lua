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
