return {
  {
    "nvim-mini/mini.ai",
    enabled = false,
  },
  {
    -- blink.cmp's default <Left>/<Right> are select_prev/next which eat
    -- mini.pairs' trailing <Left> when a completion menu is open
    -- (e.g. Cargo.toml via crates.nvim). Disable them so cursor moves.
    "Saghen/blink.cmp",
    opts = {
      keymap = {
        ["<Left>"] = {},
        ["<Right>"] = {},
      },
    },
  },
}
