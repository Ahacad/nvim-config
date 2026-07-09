-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.relativenumber = false -- absolute line numbers
opt.tabstop = 4 -- spaces a tab counts for
opt.shiftwidth = 4 -- size of an indent
opt.softtabstop = 4 -- columns the cursor moves when pressing <Tab>
opt.wrap = true -- wrap long lines

opt.guicursor = "a:block" -- block cursor in every mode, including insert

vim.g.snacks_animate = false -- no smooth scrolling

-- Diff filler regions render as a flat band, not rows of ╱ hatch ("zebra").
opt.fillchars:append({ diff = " " })

-- Diff mode resets wrap to off per window; followwrap keeps wrap=true in effect.
opt.diffopt:append("followwrap")

-- Pin the Python provider so nvim doesn't probe for an interpreter on startup.
vim.g.python3_host_prog = "/usr/bin/python3"
