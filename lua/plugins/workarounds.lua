return {
  -- Pin nvim-treesitter to legacy `master` branch. The new `main` branch
  -- shells out to the tree-sitter CLI to compile parsers, and Mason's
  -- tree-sitter-cli is built against glibc 2.39 (CDD has ~2.34). Master
  -- branch ships pre-built parsers via its own build pipeline.
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
  },
}

