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
                -- plain hover never shows these. Fall back to plain hover if
                -- the command isn't available (e.g. before the LSP attaches).
                if vim.bo.filetype == "rust" and pcall(vim.cmd.RustLsp, { "hover", "actions" }) then
                  return
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
