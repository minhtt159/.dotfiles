-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use `opt` for short
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tab & indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true -- if you code in C

-- Personal choice
opt.wrap = true -- Wrap line like for not to scroll, f**k connection string
opt.scrolloff = 8 -- Minimum of rows

-- Search setting
opt.ignorecase = true -- hello == Hello
opt.smartcase = true -- Hello != hello
opt.hlsearch = true -- Highlight all?
opt.incsearch = true -- Search faster

-- Cursor line
opt.cursorline = false -- Noob?

-- Color setting
opt.termguicolors = true
opt.signcolumn = "yes"

-- Backspace behaviour
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- What is a word?
opt.iskeyword:append("-")

-- Other behaviours
opt.swapfile = false -- Do not want *.swp files
opt.backup = false -- Do not want backup
opt.undodir   = os.getenv("HOME") .. "/.vim/undodir" -- Undo directory
opt.undofile = true -- Undo file

-- CPU goes brr 🔥
opt.updatetime = 50
