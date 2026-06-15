return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- No inline type hints.
      inlay_hints = { enabled = false },
      -- LazyVim applies `servers["*"].keys` to every server on attach.
      -- K stays as 5k (movement, see config/keymaps.lua); hover moves to <leader>k.
      servers = {
        ["*"] = {
          keys = {
            { "K", false },
            {
              "<leader>k",
              function()
                -- In Rust buffers use rustaceanvim's "hover actions" (the
                -- VSCode-style popup: type + docs + jumps to impls/refs/run).
                -- rustaceanvim does NOT override vim.lsp.buf.hover, so the
                -- plain hover never shows these. Gate on an *attached*
                -- rust-analyzer, not on pcall(:RustLsp): the ftplugin creates
                -- :RustLsp the instant a .rs buffer opens, so pcall always
                -- succeeds and the request dispatches async — meaning a hover
                -- fired before rust-analyzer attaches silently does nothing
                -- and the fallback below never runs. Checking the client makes
                -- the fallback live during that startup window.
                if vim.bo.filetype == "rust" then
                  local clients = vim.lsp.get_clients({ bufnr = 0, name = "rust-analyzer" })
                  if #clients > 0 and pcall(vim.cmd.RustLsp, { "hover", "actions" }) then
                    return
                  end
                end
                return vim.lsp.buf.hover()
              end,
              desc = "Hover",
            },
          },
        },
      },
    },
  },
}
