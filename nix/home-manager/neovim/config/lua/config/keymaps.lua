-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "<C-a>", "<Home>", { desc = "Move to beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move to end of line" })
map("i", "<C-b>", "<Left>", { desc = "Move left" })
map("i", "<C-f>", "<Right>", { desc = "Move right" })
map("i", "<C-p>", "<Up>", { desc = "Move up" })
map("i", "<C-n>", "<Down>", { desc = "Move down" })
map("i", "<C-d>", "<Del>", { desc = "Delete char forward" })
map("i", "<C-k>", "<C-o>D", { desc = "Kill to end of line" })
