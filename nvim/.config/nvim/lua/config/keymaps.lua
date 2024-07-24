-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

local keymap = vim.keymap

-- General keymaps
keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Directory view" })

-- The Primeagen magic
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move this line down 1" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move this line up 1" })

-- Clear highlight
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear highlight" })
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlight" })

-- Diagnostic keymaps
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Window magic
-- keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically"})
-- keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally"})
-- keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current window"})
-- keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal"})

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
-- keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Tab magic
-- keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab"})
-- keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab"})
-- keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go to next tab"})
-- keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab"})

-- TIP: Disable arrow keys in normal mode
keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- https://www.lazyvim.org/keymaps
-- Delete any keymap if not needed
