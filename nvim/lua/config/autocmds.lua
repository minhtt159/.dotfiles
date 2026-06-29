-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- disable completion on markdown files by default
-- vim.api.nvim_create_autocmd("FileType", {
--   group = vim.api.nvim_create_augroup("disable-cmp-by-ft", { clear = true }),
--   pattern = { "gitcommit", "markdown" },
--   callback = function()
--     require("cmp").setup({ enabled = false })
--   end,
-- })

-- Go + Terraform format-on-save is handled by LazyVim/conform; only templ
-- needs a custom hook (templ fmt has no conform formatter).
local format_sync_grp = vim.api.nvim_create_augroup("TemplFormat", { clear = true })

-- Custom format for Templ
local custom_format = function()
  if vim.bo.filetype == "templ" then
    local bufnr = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local cmd = "templ fmt " .. vim.fn.shellescape(filename)

    vim.fn.jobstart(cmd, {
      on_exit = function()
        -- Reload the buffer only if it's still the current buffer
        if vim.api.nvim_get_current_buf() == bufnr then
          vim.cmd("e!")
        end
      end,
    })
  else
    vim.lsp.buf.format()
  end
end

vim.api.nvim_create_autocmd(
  "BufWritePre",
  { pattern = { "*.templ" }, callback = custom_format, group = format_sync_grp }
)

vim.filetype.add({
  extension = {
    templ = "templ",
    jinja = "jinja",
    jinja2 = "jinja",
    j2 = "jinja",
  },
})

vim.filetype.add({
  pattern = {
    ["%.gitlab%-ci%.ya?ml"] = "yaml.gitlab",
  },
})

-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff", bg = "#1e1e1e" }) -- Customize border color
