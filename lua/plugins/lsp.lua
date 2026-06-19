return {
  {
    "neovim/nvim-lspconfig",
    -- Neovim 0.11+ installs a buffer-local `K -> vim.lsp.buf.hover()` whenever a
    -- hover-capable server attaches, but ONLY if no `K` map exists at that moment
    -- (it guards on `maparg('K','n') == ''`). Our movement map `K -> 5k` lives in
    -- config/keymaps.lua, which LazyVim loads on VeryLazy. A file opened directly
    -- (`nvim foo.py`) attaches its server *before* VeryLazy, so the guard sees no
    -- K and installs the buffer-local hover; being buffer-local it then shadows
    -- the global `5k` for the life of that buffer. K fires hover, and a server
    -- with nothing to say (pyright on a bare name) reports "No information
    -- available". Deleting the default after the fact is whack-a-mole: pyright
    -- registers hover via client/registerCapability, which re-runs the install
    -- after LspAttach. Instead, seed the global map here in `init` (runs at
    -- startup, before any buffer is read) so the guard always finds K bound and
    -- the default is never created. config/keymaps.lua re-asserts the same
    -- binding on VeryLazy; keep both in sync.
    init = function()
      vim.keymap.set({ "n", "x" }, "K", "5k", { desc = "Move 5 lines up" })
    end,
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
                -- Border + size: native float opts (vim.lsp.buf.hover.Opts
                -- extends open_floating_preview.Opts). Composes with Noice's
                -- markdown styling; the Rust hover-actions branch above is
                -- rustaceanvim's own float and is unaffected.
                return vim.lsp.buf.hover({ border = "rounded", max_width = 80, max_height = 25 })
              end,
              desc = "Hover",
            },
          },
        },
      },
    },
  },
}
