return {
	"jakobkhansen/journal.nvim",
	lazy = false,
	config = function()
		require("journal").setup({
			filetype = "md", -- Filetype to use for new journal entries
			root = "~/Documents/Personal/Journal", -- Root directory for journal entries
			date_format = "%d/%m/%Y", -- Date format for `:Journal <date-modifier>`
			autocomplete_date_modifier = "end", -- "always"|"never"|"end". Enable date modifier autocompletion

			-- Configuration for journal entries
			journal = {
				-- Default configuration for `:Journal <date-modifier>`
				format = "%Y/%m-%B/daily/%d-%A",
				template = "# %A %B %d %Y\n",
				frequency = { day = 1 },

				-- Nested configurations for `:Journal <type> <type> ... <date-modifier>`
				entries = {
					day = {
						format = "%Y/%m-%B/daily/%d-%A", -- Format of the journal entry in the filesystem.
						template = "# %A %B %d %Y\n", -- Optional. Template used when creating a new journal entry
						frequency = { day = 1 }, -- Optional. The frequency of the journal entry. Used for `:Journal next`, `:Journal -2` etc
					},
					week = {
						format = "%Y/%m-%B/weekly/week-%W",
						template = "# Week %W %B %Y\n",
						frequency = { day = 7 },
						date_modifier = "monday", -- Optional. Date modifier applied before other modifier given to `:Journal`
					},
					month = {
						format = "%Y/%m-%B/%B",
						template = "# %B %Y\n",
						frequency = { month = 1 },
					},
					year = {
						format = "%Y/%Y",
						template = "# %Y\n",
						frequency = { year = 1 },
					},
				},
			},
		})
	end,
	keys = {
		{ "<leader>jj", "<CMD>Journal<CR>", { desc = "Create Journal Entry" } },
	}
}
