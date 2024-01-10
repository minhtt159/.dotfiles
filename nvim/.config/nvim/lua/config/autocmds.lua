-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- match for docker compose file
function docker_fix()
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

vim.cmd([[au BufRead * lua docker_fix()]])
