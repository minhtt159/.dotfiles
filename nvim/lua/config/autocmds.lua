-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- disable completion on markdown files by default
-- vim.api.nvim_create_autocmd("FileType", {
--   group = vim.api.nvim_create_augroup("disable-cmp-by-ft", { clear = true }),
--   pattern = { "gitcommit", "markdown" },
--   callback = function()
--     require("cmp").setup({ enabled = false })
--   end,
-- })

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require("go.format").goimports() -- goimports + gofmt
  end,
  group = format_sync_grp,
})

-- require("lspconfig").terraformls.setup({})
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = { "*.tf", "*.tfvars" },
--   callback = function()
--     vim.lsp.buf.format()
--   end,
-- })

-- -- match for docker compose file
-- function Docker_fix()
--   local filename = vim.fn.expand("%:t")
--   local compose_pattern = "%g?compose.ya?ml"
--   local dockerfile_pattern = "%g?Dockerfile%g?"
--   -- Loop
--   if string.find(filename, compose_pattern) ~= nil then
--     vim.bo.filetype = "yaml.docker-compose"
--   elseif string.find(filename, dockerfile_pattern) ~= nil then
--     vim.bo.filetype = "dockerfile"
--   end
--   -- debug
--   -- print(filename, string.find(filename, dockerfile_pattern))
-- end
--
-- vim.cmd([[au BufRead * lua Docker_fix()]])

vim.filetype.add({
  extension = {
    jinja = "jinja",
    jinja2 = "jinja",
    j2 = "jinja",
  },
})

-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff", bg = "#1e1e1e" }) -- Customize border color
