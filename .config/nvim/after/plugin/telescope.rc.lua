-------------------------------------
-- Telescope
-- See `:help Telescope`
-------------------------------------
local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.setup {
	defaults = {
		mappings = {
			i = {
				-- etc
				["<esc>"] = actions.close,

			},
			n = {
				-- etc
				["<esc>"] = actions.close,
			},
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		find_files = {
			hidden = true,
			previewer = false,
			winblend = 5,
			results_title = false,
			sorting_strategy = "ascending",
			layout_strategy = "center",
			layout_config = {
			  width = 78,
			  height = 24
			},
			border = true,
			borderchars = {
			  prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
			  results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
			  preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			},
		  },
		oldfiles = {
			hidden = true,
			previewer = false,
			winblend = 5,
			results_title = false,
			sorting_strategy = "ascending",
			layout_strategy = "center",
			layout_config = {
			  width = 78,
			  height = 24
			},
			border = true,
			borderchars = {
			  prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
			  results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
			  preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			},
		  },
	},
	-- Now the picker_config_key will be applied every time you call this
	-- builtin picker
}

require('telescope').load_extension('fzf')

-- TODO: https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#falling-back-to-find_files-if-git_files-cant-find-a-git-directory

vim.keymap.set('n', '<C-p>',
	function() builtin.find_files({
			no_ignore = false,
		})
	end,
	{ desc = 'Find files in Telescope' }
)

vim.keymap.set('n', '<C-S-P>',
	function() builtin.find_files({
			no_ignore = true,
		})
	end,
	{ desc = 'Find ALL the files in Telescope' }
)


vim.keymap.set('n', '<C-b>',
	function() builtin.buffers() end,
	{ desc = 'Search Buffers in Telescope' }
)

vim.keymap.set('n', '<C-S-F>',
	function() builtin.live_grep() end,
	{ desc = 'Grep for files in Telescope' }
)

vim.keymap.set('n', '<C-c>',
	function() builtin.oldfiles()
	end,
	{ desc = 'Fzf find old files' }
)
