return {
  {
    "stevearc/conform.nvim",
    opts = {
      -- NOTE: the key is `formatters_by_ft` (plural). LazyVim's lang extras
      -- already register most of these; we override to add isort before black
      -- and to prefer the prettierd daemon over plain prettier.
      formatters_by_ft = {
        python = { "isort", "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        c = { "clang_format" },
        cpp = { "clang_format" },
      },
    },
  },
}
