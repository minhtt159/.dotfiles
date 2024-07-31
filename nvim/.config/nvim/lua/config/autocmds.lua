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
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("disable-cmp-by-ft", { clear = true }),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    require("cmp").setup({ enabled = false })
  end,
})

-- match for docker compose file
function Docker_fix()
  local filename = vim.fn.expand("%:t")
  local compose_pattern = "%g?compose.ya?ml"
  local dockerfile_pattern = "%g?Dockerfile%g?"
  -- Loop
  if string.find(filename, compose_pattern) ~= nil then
    vim.bo.filetype = "yaml.docker-compose"
  elseif string.find(filename, dockerfile_pattern) ~= nil then
    vim.bo.filetype = "dockerfile"
  end
  -- debug
  -- print(filename, string.find(filename, dockerfile_pattern))
end

vim.cmd([[au BufRead * lua Docker_fix()]])

--  This function gets run when an LSP attaches to a particular buffer.
--    That is to say, every time a new file is opened that is associated with
--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
--    function will be executed to configure the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
  callback = function(event)
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end
    -- Fuzzy find all the symbols in your current document.
    --  Symbols are things like variables, functions, types, etc.
    map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

    -- Fuzzy find all the symbols in your current workspace
    --  Similar to document symbols, except searches over your whole project.
    map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

    -- Rename the variable under your cursor
    --  Most Language Servers support renaming across files, etc.
    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  end,
})
