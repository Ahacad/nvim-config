return {
  -- Ctrl-A / Ctrl-X increment/decrement in visual mode.
  { "triglav/vim-visual-increment" },

  -- Generate a table of contents for markdown.
  { "mzlogin/vim-markdown-toc" },

  -- Jump to definitions/references without an LSP.
  { "pechorin/any-jump.vim" },

  -- Add/change/delete surrounding pairs (cs, ds, ys).
  { "kylechui/nvim-surround" },

  -- Symbol outline window (functions, classes, ...).
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {},
  },

  -- VSCode-style code minimap (braille overview, float on the right).
  -- Configured via vim.g.neominimap in `init`, not opts/config. Must NOT be
  -- lazy-loaded — it self-manages enablement via auto_enable. Treesitter,
  -- gitsigns, and diagnostic integrations are on by default and light up from
  -- the plugins we already run.
  {
    "Isrothy/neominimap.nvim",
    version = "v3.x.x",
    lazy = false,
    keys = {
      { "<leader>nm", "<cmd>Neominimap toggle<cr>", desc = "Toggle minimap" },
      { "<leader>nf", "<cmd>Neominimap focus<cr>", desc = "Focus minimap" },
      { "<leader>nu", "<cmd>Neominimap unfocus<cr>", desc = "Unfocus minimap" },
    },
    init = function()
      vim.opt.wrap = false
      vim.opt.sidescrolloff = 36
      vim.g.neominimap = {
        auto_enable = true,
        -- No minimap in diff panes. Keys on window-local `diff`, so it covers
        -- diffview (gdv), native :diffthis / nvim -d, and git mergetool alike.
        win_filter = function(winid)
          return not vim.wo[winid].diff
        end,
        -- Skip diffview's own side panels (file tree / history list).
        exclude_filetypes = {
          "help",
          "DiffviewFiles",
          "DiffviewFileHistory",
        },
      }
    end,
  },

  -- Completion: use blink.cmp's `default` preset so accept/navigate stay on
  -- Ctrl keys (<C-y> accept, <C-n>/<C-p> move, <C-e> cancel) and <CR> is free.
  -- See lua/plugins/workarounds.lua for the <Left>/<Right> mini.pairs fix the
  -- default preset requires.
  {
    "saghen/blink.cmp",
    opts = {
      keymap = { preset = "default" },
    },
  },
}
