-- Bootstrap - https://github.com/wbthomason/packer.nvim#bootstrapping 
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope to find stuffs
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  
  -- Color scheme
  use({ 'rose-pine/neovim', as = 'rose-pine'})
  use({ 'decaycs/decay.nvim', as = 'decay' })

  -- tmux & split window navigation
  use({ "christoomey/vim-tmux-navigator" })

  -- The magic of treesitter
  use (
  'nvim-treesitter/nvim-treesitter',
  { run = ':TSUpdate' }
  )
  use ( 'nvim-treesitter/playground' )

  -- Freaking Primeagen
  use ( 'theprimeagen/harpoon' )

  -- Undo but with git
  use ( 'mbbill/undotree' )

  -- Illegal git wrapper
  use ( 'tpope/vim-fugitive' )

  -- Nvim plugins
  use ( "nvim-tree/nvim-tree.lua" )
  use ( "nvim-tree/nvim-web-devicons" )

  -- statusline
  use ( "nvim-lualine/lualine.nvim" )

  -- LSP-Zero
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment these if you want to manage LSP servers from neovim
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-cmdline'},
		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
      {'saadparwaiz1/cmp_luasnip'}, -- check check
	  }
  }

  -- Plugins after mason
  -- use ({  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

