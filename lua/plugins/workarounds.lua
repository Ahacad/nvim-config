-- Environment-specific workarounds for the Cloud Dev Desktop (old glibc, no
-- internet npm). Plain feature config lives in the other plugin files.
return {
  -- Pin nvim-treesitter to the legacy `master` branch. The new `main` branch
  -- shells out to the tree-sitter CLI to compile parsers, and Mason's
  -- tree-sitter-cli is built against glibc 2.39 (CDD has ~2.34). The master
  -- branch ships pre-built parsers via its own build pipeline.
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
  },

  -- blink.cmp's `default` preset binds <Left>/<Right> to select_prev/next,
  -- which eats mini.pairs' trailing <Left> when the menu is open (e.g. editing
  -- Cargo.toml via crates.nvim). Unbind them so the cursor moves normally.
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<Left>"] = {},
        ["<Right>"] = {},
      },
    },
  },
}
