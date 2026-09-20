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

-- Detect helm project automatically and set filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  -- Track both standard YAML templates and generic Helm .tpl files
  pattern = { "*.yaml", "*.tpl" },
  callback = function(ev)
    -- Look upstream from the opened file for a Chart.yaml file
    local match = vim.fs.find('Chart.yaml', {
      path = vim.fs.dirname(ev.match),
      upward = true,
    })

    -- If Chart.yaml is found, this is a Helm project!
    if #match > 0 then
      vim.opt_local.filetype = "helm"
    end
  end,
})

