-- Plugin Init lua
return {
	-- COLORSCHEMES
    { 'folke/tokyonight.nvim', priority = 1000 },
	{'rebelot/kanagawa.nvim', lazy = true}, -- Kanagawa Theme?? :3
	{'pineapplegiant/spaceduck', lazy=true}, -- Spaceduck <33
	{'shaunsingh/solarized.nvim', lazy=true}, --NeoSolorazide
	-- { "spaceduck-theme/nvim", branch = "dev" }, -- Spaceduck V2<33
	{'rose-pine/neovim', lazy=true}, -- RosePine
	{ 'catppuccin/nvim', as = 'catppuccin' , lazy=true},
	{'Mofiqul/vscode.nvim', lazy=true}, -- VSCODE Theme :')'
	{'marko-cerovac/material.nvim', lazy=true},

	-- 'windwp/nvim-ts-autotag', -- Html autotag stuff
	-- LSP

	-- {
	-- 	"williamboman/mason.nvim",
	-- 	"williamboman/mason-lspconfig.nvim",
	-- 	"neovim/nvim-lspconfig",
	-- },
	-- { 'glepnir/lspsaga.nvim', branch = 'main', }, --More LSP UI
	-- {'onsails/lspkind-nvim'}, -- vscode-like pictograms for neovim lsp completion items
	-- 'simrat39/rust-tools.nvim', -- rust-tools LSP stuff


	-- Autocompletion
	-- {"petertriho/cmp-git", dependencies = "nvim-lua/plenary.nvim"},
	-- use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client

	-- Diagnostics, code actions, formatting and more
	-- 'jose-elias-alvarez/null-ls.nvim',
	-- 'jay-babu/mason-null-ls.nvim',
}
