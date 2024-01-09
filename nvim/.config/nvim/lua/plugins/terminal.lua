return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup({
        direction = "float",
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        insert_mappings = true, 
        terminal_mappings = true, 
        start_in_insert = true, 
        close_on_exit = true,
      })
    end, 
  },
}