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
