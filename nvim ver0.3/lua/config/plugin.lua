local status, packer = pcall(require, 'packer')

if (not status) then
  print('Packer is not installed')
  return
end

vim.cmd [[ packadd packer.nvim ]]

packer.startup(function(use)
  -- bootstrap
  use 'wbthomason/packer.nvim'

  -- highlight support
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({
        with_sync = true
      })
    end
  }

  -- dependencies
  use 'nvim-lua/plenary.nvim'
  use 'nvim-tree/nvim-web-devicons'

  -- colorscheme
  use 'bluz71/vim-nightfly-colors'

  -- statusline
  use 'nvim-lualine/lualine.nvim'

  -- fuzzy finder
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- lsp support
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- auto completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'

  -- coding support
  use 'windwp/nvim-autopairs'
end)
