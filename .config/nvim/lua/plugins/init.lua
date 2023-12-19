-- PLUGIN Init lua
return {
	-- COLORSCHEMES
	{ 'catppuccin/nvim', name = 'catppuccin' , lazy=false, priority = 1000 },
	{ 'Biscuit-Colorscheme/nvim', name='biscuit', event="VeryLazy"}, --Biscuit Colorscheme
  { 'folke/tokyonight.nvim', event = "VeryLazy" },
	{'rebelot/kanagawa.nvim', event = "VeryLazy"  }, -- Kanagawa Theme?? :3
	{'pineapplegiant/spaceduck', event = "VeryLazy" }, -- Spaceduck <33
	{'shaunsingh/solarized.nvim', event = "VeryLazy"}, --NeoSolorazide
	-- { "spaceduck-theme/nvim", branch = "dev" }, -- Spaceduck V2<33
	{'rose-pine/neovim', event = "VeryLazy"}, -- RosePine
	{'Mofiqul/vscode.nvim', event = "VeryLazy"}, -- VSCODE Theme :')'
	{'marko-cerovac/material.nvim', event = "VeryLazy"},
}
