-- Plugins.lua
-- Install packer bootstrap
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

local is_bootstrap = false

-- if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
-- 	is_bootstrap = true
-- 	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
-- 	vim.cmd [[packadd packer.nvim]]
-- end


-------------------------------------
-- Packer
-------------------------------------
require('packer').startup(function(use)

	-- REQUIRED
	use 'wbthomason/packer.nvim' -- Package manager


	-- COLORSCHEMES
	use 'folke/tokyonight.nvim' -- Tokynight Theme
	use 'rebelot/kanagawa.nvim' -- Kanagawa Theme?? :3
	use 'pineapplegiant/spaceduck' -- Spaceduck <33
	use 'rose-pine/neovim' -- RosePine
	use { 'catppuccin/nvim', as = 'catppuccin' }
	use 'Mofiqul/vscode.nvim' -- VSCODE Theme :')'


	-- PRETTY
	use 'nvim-lualine/lualine.nvim' -- Fancier statusline
	use { 'romgrk/barbar.nvim', requires = { 'kyazdani42/nvim-web-devicons' } } -- Buffers as tabs
	use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides
	use 'karb94/neoscroll.nvim' -- Smooth scrolling, but with lua
	use 'norcalli/nvim-colorizer.lua' -- Display the pretty colors


	-- TREESITTER
	use 'nvim-treesitter/nvim-treesitter' -- Highlight, edit, and navigate code
	use 'windwp/nvim-ts-autotag' -- Html autotag stuff
	use 'nvim-treesitter/nvim-treesitter-textobjects' -- Additional textobjects for treesitter
	use {
	  'folke/zen-mode.nvim',
		requires = { 'folke/twilight.nvim' }
	}

	-- FUNCTIONALITY
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
	use 'windwp/nvim-autopairs' -- Auto close brackets, etc.
	use { 'folke/todo-comments.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- Pretty Todo comments

	-- FILE TREE / MOVEMENT
	use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' }}
	use { 'phaazon/hop.nvim',
		branch = 'v2', -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
		end
	}

	-- OLD BUSTED
	use 'aserowy/tmux.nvim' -- Navigate tmux panes splits better
	use 'kylechui/nvim-surround' -- Vim surround
	use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- Add git related info in the signs columns and popups


	-- TELESCOPE <3
	use { 'nvim-telescope/telescope.nvim',
		-- tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }


	-- LSP
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}
	-- use { 'glepnir/lspsaga.nvim', branch = 'main', } --More Ui for completion
	use {'onsails/lspkind-nvim'} -- vscode-like pictograms for neovim lsp completion items
	use 'simrat39/rust-tools.nvim' -- rust-tools LSP stuff

	-- Autocompletion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lua'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use "andersevenrud/cmp-tmux"
	use 'David-Kunz/cmp-npm'
	use 'rafamadriz/friendly-snippets'
	use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client

	-- Diagnostics, code actions, and more via Lua
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
