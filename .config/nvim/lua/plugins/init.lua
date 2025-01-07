-- PLUGIN Init lua
return {
	-- COLORSCHEMES
	{ 'catppuccin/nvim', name = 'catppuccin' , lazy=false, priority = 1000 },

	-- {'pineapplegiant/spaceduck', event = 'VeryLazy' }, -- Spaceduck <33
	{ 'spaceduck-theme/nvim', event = 'VeryLazy', name='spaceduck-theme', branch = "dev" }, -- Spaceduck V2<33

	{ 'Biscuit-Colorscheme/nvim', name='biscuit', event="VeryLazy"}, --Biscuit Colorscheme
  { 'folke/tokyonight.nvim', event = "VeryLazy" },
	{'rebelot/kanagawa.nvim', event = "VeryLazy"  }, -- Kanagawa Theme?? :3
	{'shaunsingh/solarized.nvim', event = "VeryLazy"}, --NeoSolorazide
	{'rose-pine/neovim', event = "VeryLazy"}, -- RosePine
	{'Mofiqul/vscode.nvim', event = "VeryLazy"}, -- VSCODE Theme :')'
	{'marko-cerovac/material.nvim', event = "VeryLazy"},
}
