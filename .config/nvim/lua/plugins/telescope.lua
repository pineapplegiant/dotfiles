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
						return math.min(max_columns, 123)
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
	end,
	keys = {
		{ "<C-A>", "<cmd>Telescope<CR>", desc = "View Builtin Telescope Functions" },
		{ "<C-P>", "<cmd>Telescope find_files<CR>", desc = "Fuzzy Find Files in CWD" },
		{ "<C-C>", "<cmd>Telescope oldfiles<CR>", desc = "Fuzzy Find Recent Files" },
		{ "<C-F>", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({layout_config={width=0.5}, previewer=false})<CR>", desc = "Find String in Current Buffer" },
		{ "<C-G>", "<cmd> Telescope live_grep<CR>", desc = "Find string in CWD" },
		{ "<C-B>", "<cmd>lua require('telescope.builtin').buffers({layout_config={width=0.5}, previewer=false})<CR>", desc = "Show open buffers" },
	},
}
