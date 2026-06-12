return {
  -- :Git, :Gdiffsplit, :Gblame — the classic git porcelain.
  { "tpope/vim-fugitive" },

  -- diffview.nvim — full-file, editable diffs in a tabbed cockpit with a
  -- file-tree panel. The escalation target when delta in the pager runs out
  -- of context (an unfamiliar file) or you need to edit the new side in place:
  -- diffs are real buffers, so treesitter, LSP go-to-def, folds, and writes
  -- all work. diff3_mixed gives a base-in-the-middle 3-way merge view.
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewFileHistory",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
    },
    opts = {
      enhanced_diff_hl = true, -- intra-line word-level highlighting
      view = {
        merge_tool = { layout = "diff3_mixed" },
      },
    },
    keys = {
      { "<leader>gd", "", desc = "+diffview" },
      { "<leader>gdo", "<cmd>DiffviewOpen<cr>", desc = "Open (working tree vs HEAD)" },
      { "<leader>gdh", "<cmd>DiffviewFileHistory<cr>", desc = "Repo history" },
      { "<leader>gdf", "<cmd>DiffviewFileHistory %<cr>", desc = "Current file history" },
      { "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "Close" },
    },
  },
}
