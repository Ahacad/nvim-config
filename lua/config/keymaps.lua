-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local map = Util.safe_keymap_set

-- J/K move the cursor 5 lines at a time (faster vertical motion).
map({ "n", "x" }, "J", "5j", { desc = "Move 5 lines down" })
map({ "n", "x" }, "K", "5k", { desc = "Move 5 lines up" })

-- Q quits the window fast.
map("n", "Q", ":q<CR>", { desc = "Quit window" })

-- F saves without autoformatting (:noautocmd write).
map("n", "F", ":noa w<CR>", { desc = "Save (no autoformat)" })

-- Noice message controls.
map("n", "<leader>nd", "<cmd>Noice disable<cr>", { desc = "Disable Noice" })
map("n", "<leader>ne", "<cmd>Noice enable<cr>", { desc = "Enable Noice" })
map("n", "<leader>nl", "<cmd>Noice last<cr>", { desc = "Last Noice message" })
map("n", "<leader>nh", "<cmd>Noice history<cr>", { desc = "Noice history" })
map("n", "<leader>ni", "<cmd>Noice dismiss<cr>", { desc = "Dismiss Noice messages" })

map("n", "<c-/>", function()
  Snacks.terminal()
end, { desc = "Terminal (cwd)" })
