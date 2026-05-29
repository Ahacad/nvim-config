-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Don't grey/underline "unused code" during dev — render it like normal code.
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("user_diag_unnecessary", { clear = true }),
  callback = function()
    vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", {})
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = false, underline = false })
  end,
})
-- Run once now in case the colorscheme is already loaded.
pcall(vim.cmd, "doautocmd ColorScheme")
