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

-- Inlay hints stay OFF globally (see lua/plugins/lsp.lua), but Rust infers so
-- much that the type/parameter hints are worth the noise. Turn the *display*
-- on for rust buffers only; rust-analyzer already sends them by default.
-- <leader>uh still toggles per-buffer if a given file gets too busy.
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user_rust_inlay_hints", { clear = true }),
  callback = function(args)
    if vim.bo[args.buf].filetype ~= "rust" then
      return
    end
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})
