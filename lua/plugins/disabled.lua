-- Plugins explicitly turned off.
return {
  -- LazyVim ships mini.ai; we don't use its extended text objects.
  { "nvim-mini/mini.ai", enabled = false },

  -- Breaks <Left> in insert/cmdline → mini.pairs cursor lands after the
  -- closing bracket. Not worth the regression.
  { "terryma/vim-multiple-cursors", enabled = false },
}
