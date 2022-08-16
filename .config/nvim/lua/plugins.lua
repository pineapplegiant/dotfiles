-- Plugins.lua
-- Install packer bootstrap
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end


local keymap = vim.keymap

-------------------------------------
-- Packer
-------------------------------------
require('packer').startup(function(use)

	-- Required
	use 'wbthomason/packer.nvim'                                                    -- Package manager

	-- Style
	use 'folke/tokyonight.nvim'                                                     -- Tokynight Theme
	use "rebelot/kanagawa.nvim"                                                     -- Kanagawa Theme?? :3
	use 'nvim-lualine/lualine.nvim'                                                 -- Fancier statusline
	use { 'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'} }       -- Buffers as tabs
	use { "folke/todo-comments.nvim", requires = {"nvim-lua/plenary.nvim" }}        -- Pretty Todo comments
	use 'norcalli/nvim-colorizer.lua'                                               -- Display the pretty colors

	-- Grace
	use 'numToStr/Comment.nvim'                                                     -- "gc" to comment visual regions/lines
	use 'lukas-reineke/indent-blankline.nvim'                                       -- Add indentation guides even on blank lines
	use 'windwp/nvim-autopairs'                                                     -- Auto close brackets, etc.
	use {'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons'}}   -- File Tree
	use 'karb94/neoscroll.nvim'                                                     -- Smooth scrolling, but with lua

	-- Old Busted
	use 'https://github.com/justinmk/vim-sneak.git'                                 -- Sneakin
	use 'aserowy/tmux.nvim'                                                         -- Navigate tmux panes splits better
	use 'kylechui/nvim-surround'                                                    -- Vim surround
	use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }       -- Add git related info in the signs columns and popups

	-- New Hotness
	use 'nvim-treesitter/nvim-treesitter'                                           -- Highlight, edit, and navigate code
	use 'nvim-treesitter/nvim-treesitter-textobjects'                               -- Additional textobjects for treesitter

	-- Telescope <3
	use {
			'nvim-telescope/telescope.nvim', 
			tag = '0.1.0', 
			requires = { {'nvim-lua/plenary.nvim' } }
	}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }               -- more fzf 

	-- LSP
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}
	use 'onsails/lspkind-nvim'                                                    -- vscode-like pictograms
	use 'hrsh7th/nvim-cmp'                                                        -- Completion 
	use 'hrsh7th/cmp-nvim-lsp'                                                    -- nvim-cmp source for neovim's built-in LSP
	use 'hrsh7th/cmp-buffer'                                                      -- nvim-cmp source for buffer words
	use 'MunifTanjim/prettier.nvim'                                               -- Prettier plugin for Neovim's built-in LSP client
	-- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	use 'jose-elias-alvarez/null-ls.nvim'                                         

	if is_bootstrap then
		require('packer').sync()
		end
end)


-- When we are bootstrapping a configuration, 
-- don't execute the rest of the init.lua
if is_bootstrap then
	print '=================================='
	print '    Plugins are being installed'
	print '    Restart nvim pls, k thx'
	print '=================================='
	return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })

vim.api.nvim_create_autocmd('BufWritePost', {
	command = 'source <afile> | PackerCompile',
	group = packer_group,
	pattern = vim.fn.expand '$MYVIMRC',
})

