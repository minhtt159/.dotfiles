-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always sets
-- https://www.lazyvim.org/keymaps
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

local keymap = vim.keymap

-- General keymaps
keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Directory view" })

-- The Primeagen magic
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move this line down 1" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move this line up 1" })
-- NOTE: Telescope has Alt+J and Alt+K, but Aerospace uses it

-- Clear highlight
keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Clear highlight" })

-- Diagnostic keymaps
-- LazyVim -> <leader>cd
-- keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
-- keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- TIP: Disable arrow keys in normal mode
keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- https://www.lazyvim.org/keymaps
-- Delete any keymap if not needed
