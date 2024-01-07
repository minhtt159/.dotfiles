-- stylua: ignore
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

local keymap = vim.keymap

-- General keymaps
keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Directory view" })

-- The Primeagen magic
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move this line down 1" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move this line up 1" })

-- Clear highlight
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear highlight" })

-- Window magic
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically"})
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally"})
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current window"})
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal"})

-- Tab magic
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab"})
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab"})
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go to next tab"})
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab"})
