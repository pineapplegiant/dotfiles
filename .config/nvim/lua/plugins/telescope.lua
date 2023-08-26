-------------------------------------
-- Telescope
-- See `:help Telescope`
-------------------------------------
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- import telescope plugin safely
		local telescope = require("telescope")

		-- import telescope actions safely
		local actions = require("telescope.actions")

		-- import telescope-ui-select safely
		local themes = require("telescope.themes")

		-- configure telescope
		telescope.setup({
			-- configure custom mappings
			defaults = {
				path_display = { "truncate" },
				winblend = 3,
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
					preview_cutoff = 1, -- Preview should always show (unless previewer = false)

					width = function(_, max_columns, _)
						return math.min(max_columns, 122)
					end,

					height = function(_, _, max_lines)
						return math.min(max_lines, 28)
					end,
				},
				mappings = {
					i = {
						["<esc>"] = actions.close,
						["<C-p>"] = actions.move_selection_previous, -- move to prev result
						["<C-n>"] = actions.move_selection_next, -- move to next result
					},
					n = {
						["<esc>"] = actions.close,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					themes.get_dropdown({}),
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
		-- telescope.load_extension("harpoon")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<C-A>", "<cmd>Telescope<cr>", { desc = "Call Telescope in general" }) -- find files within current working directory, respects .gitignorejjjj
		keymap.set("n", "<C-P>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" }) -- find files within current working directory, respects .gitignore
		keymap.set("n", "<C-C>", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" }) -- find previously opened files
		keymap.set(
			"n",
			"<C-F>",
			"<cmd>Telescope current_buffer_fuzzy_find<cr>",
			{ desc = "Find string in current buffer" }
		) -- find string in current working directory as you type
		keymap.set("n", "<C-G>", "<cmd>Telescope live_grep<cr>", { desc = "Find string under cursor in cwd" }) -- find string under cursor in current working directory
		keymap.set("n", "<C-B>", "<cmd>Telescope buffers<cr>", { desc = "Show open buffers" }) -- list open buffers in current neovim instance
		-- keymap.set("n", "<C-a>h", "<cmd>Telescope harpoon marks<cr>", { desc = "Show harpoon marks" }) -- show harpoon marks
		-- keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Show git commits" }) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
		-- keymap.set( "n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", { desc = "Show git commits for current buffer" }) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
		-- keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Show git branches" }) -- list git branches (use <cr> to checkout) ["gb" for git branch]
		-- keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Show current git changes per file" }) -- list current changes per file with diff preview ["gs" for git status]
	end,
}
