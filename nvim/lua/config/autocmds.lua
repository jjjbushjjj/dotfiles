vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yankning (copying) text',
  group = vim.api.nvim_create_augroup('My-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
