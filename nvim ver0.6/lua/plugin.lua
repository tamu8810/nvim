local status, packer = pcall(require, 'packer')
if (not status) then return end

vim.cmd [[ packadd packer.nvim ]]

packer.startup(function(use)
	-- Bootstrap
	use 'wbthomason/packer.nvim'

	-- Highlight support
	use 'nvim-treesitter/nvim-treesitter'

	-- Colorscheme
	use {
		'svrana/neosolarized.nvim',
		requires = { 'tjdevries/colorbuddy.nvim' }
	}

	-- Fuzzy finder
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-file-browser.nvim'
end)
