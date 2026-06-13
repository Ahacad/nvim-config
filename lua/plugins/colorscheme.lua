return {

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      transparent = true,
      styles = {
        sidebars = "transparent",
      },
      -- Diff highlights: tokyonight-moon's defaults are muted and, under
      -- `transparent`, wash out further. Give each change type a distinct,
      -- opaque hue (added=green, removed=red, modified=blue) and make the
      -- changed *word* (DiffText) bright so it pops out of its dimmer line
      -- (DiffChange). Opaque guibg also defeats the transparency washout.
      on_highlights = function(hl, c)
        -- Dark + saturated, not blended pastels. tokyonight's green/red are
        -- light, so blending them onto bg yields bands BRIGHTER than normal bg
        -- — which wrecks contrast for the (deliberately dim) Comment fg sitting
        -- on top. Dark hues keep luminance near the normal bg, so comments read
        -- as well as they normally do; saturation keeps them clearly green/red.
        hl.DiffAdd = { bg = "#16331f", fg = "NONE" } -- added line: dark green
        hl.DiffDelete = { bg = "#3a1d28", fg = "NONE" } -- removed line: dark wine
        hl.DiffChange = { bg = "#1c2438", fg = "NONE" } -- changed line: dim blue
        -- Changed words pop via boldness + a modest lift over DiffChange, NOT a
        -- bright bg — so an edited comment under it stays legible.
        hl.DiffText = { bg = "#29375e", fg = "NONE", bold = true }
        _ = c
      end,
    },
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    opts = {
      transparent = true,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
