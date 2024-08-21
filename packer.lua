vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'


	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- use { "ellisonleao/gruvbox.nvim" }
	-- use({ 'rose-pine/neovim', as = 'rose-pine' })
	-- use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
	-- use('nvim-treesitter/playground')
	use('nvim-lua/plenary.nvim')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { {"nvim-lua/plenary.nvim"} }
	}
end)
