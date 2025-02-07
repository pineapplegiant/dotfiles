return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim", branch = "master" },
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require('codecompanion').setup()
		-- Expand 'cc' into 'CodeCompanion' in the command line
		vim.cmd([[cab cc CodeCompanion]])
	end,

	keys = {
		{ "<C-S-x>", "<cmd>CodeCompanionActions<cr>", desc = "Toggle [X] CodeCompanion Actions" },
		{ "<C-x>", "<cmd>CodeCompanionChat Toggle<CR>", desc = "Toggle [X]-cute CodeCompanion Chat" },
		{ "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add To CodeCompanion Chat" },
	},
}
