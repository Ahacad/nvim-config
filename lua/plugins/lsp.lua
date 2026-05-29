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
