return {
	"fnune/recall.nvim",
	lazy = "false",
	version = "*",
	config = true,
	keys = {
		{ "<leader>mm", "<cmd>RecallToggle<CR>", desc = "Toggle setting [M]ark" },
		{ "<leader>mn", "<cmd>RecallNext<CR>", desc = "Navigate to [N]ext [M]ark" },
		{ "<leader>mp", "<cmd>RecallPrevious<CR>", desc = "Navigate to [P]revious [M]ark" },
		{ "<leader>mc", "<cmd>RecallClear<CR>", desc = "Clear All [M]arks" },
		{ "<c-m>", "<cmd>Telescope recall theme=ivy<CR>", desc = "Toggle setting mark" },
	},
}
