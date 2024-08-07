-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.have_nerd_font = true

-- Use `opt` for short
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tab & indentation
-- opt.tabstop = 2
-- opt.softtabstop = 2
-- opt.shiftwidth = 2
-- opt.expandtab = true
opt.autoindent = true
opt.smartindent = true -- if you code in C
opt.breakindent = true

-- Personal choice
opt.scrolloff = 10 -- Minimum of rows
opt.textwidth = 100 -- Text width
opt.colorcolumn = "+1" -- Mark 1 column after textwidth
opt.wrap = true -- Wrap line like for not to scroll, f**k connection string
opt.linebreak = true -- Break line at word

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Search setting
opt.incsearch = true -- Search faster
opt.ignorecase = true -- hello == Hello
opt.smartcase = true -- Hello != hello
opt.hlsearch = true -- Highlight; to clear highlight use keymaps

-- Cursor line
opt.cursorline = true

-- -- Color setting
opt.termguicolors = true
opt.signcolumn = "yes"

-- -- Backspace behaviour
-- opt.backspace = "indent,eol,start"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
opt.clipboard = "unnamedplus"

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- -- What is a word?
opt.iskeyword:append("-")

-- Other behaviours
opt.swapfile = false -- Do not want *.swp files
opt.backup = false -- Do not want backup
-- opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Undo directory
opt.undofile = true -- Undo file

-- Mouse mode, useful for resizing windows
opt.mouse = "a"

-- -- CPU goes brr 🔥
opt.updatetime = 250
opt.timeoutlen = 300

-- Don't show the mode, since it's already in the status line
opt.showmode = false

-- Preview substitutions live, as you type!
opt.inccommand = "split"
