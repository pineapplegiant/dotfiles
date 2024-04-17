return {
	"fnune/recall.nvim",
	lazy = "false",
	version = "*",
	config = true,
	keys = {
		{ "<leader>mm", "<cmd>RecallToggle<CR>", desc = "Toggle setting mark" },
		{ "<leader>mn", "<cmd>RecallNext<CR>", desc = "Toggle setting mark" },
		{ "<leader>mp", "<cmd>RecallPrevious<CR>", desc = "Toggle setting mark" },
		{ "<leader>mc", "<cmd>RecallClear<CR>", desc = "Toggle setting mark" },
		{ "<leader>ml", "<cmd>Telescope recall<CR>", desc = "Toggle setting mark" },
	},
}
