local lsp_zero = require('lsp-zero')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local keymap = vim.keymap

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({})

require('mason-lspconfig').setup({
  ensure_installed = {
    'rust_analyzer',
    'dockerls',
    'docker_compose_language_service',
    'ruff_lsp',
    'bashls',
  },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

-- cmp configs are in ./nvim-cmp.lua file
