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

  -- VSCode-style code minimap (braille overview, split on the right).
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
      {
        "<leader>nw",
        function()
          local winid = vim.api.nvim_get_current_win()
          if vim.wo[winid].diff then
            vim.w[winid].neominimap_diff_show = not vim.w[winid].neominimap_diff_show
            require("neominimap.api").tab.refresh(vim.api.nvim_win_get_tabpage(winid))
          else
            require("neominimap.api").win.toggle(winid)
          end
        end,
        desc = "Toggle minimap (window)",
      },
    },
    init = function()
      vim.g.neominimap = {
        auto_enable = true,
        -- A real split window on the right edge: unlike the float layout, it
        -- can never cover buffer text.
        layout = "split",
        split = { close_if_last_window = true },
        -- Minimap defaults to off in diff panes; <leader>nw opts a window back
        -- in via the neominimap_diff_show window var. Keys on window-local
        -- `diff`, so it covers diffview (gdv), native :diffthis / nvim -d, and
        -- git mergetool alike.
        win_filter = function(winid)
          return not vim.wo[winid].diff or vim.w[winid].neominimap_diff_show == true
        end,
        -- The split is one column per tab: show it only in tabs where some
        -- window qualifies, so pure-diff tabs get no dead minimap column.
        tab_filter = function(tabid)
          return vim.iter(vim.api.nvim_tabpage_list_wins(tabid)):any(function(winid)
            return vim.api.nvim_win_get_config(winid).relative == ""
              and (not vim.wo[winid].diff or vim.w[winid].neominimap_diff_show == true)
              and require("neominimap.buffer").get_minimap_bufnr(vim.api.nvim_win_get_buf(winid)) ~= nil
          end)
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
