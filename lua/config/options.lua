-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.relativenumber = false -- absolute linu numbers
opt.tabstop = 4 --  number of space tabs count for
opt.shiftwidth = 4 -- size of a indent
opt.softtabstop = 4 -- number of columns the cursor moves right when pressing tab
opt.wrap = true -- wrap lines
vim.cmd("set guicursor=a:block") -- always use block in typing, block is better :)

vim.g.snacks_animate = false -- disable "smooth" scrolling, kind of unproductive

vim.g.python3_host_prog = '/usr/bin/python3' -- speed up python file loading, chat: https://chatgpt.com/share/67c6e7c6-cf20-800d-9b03-d03825872fa1
