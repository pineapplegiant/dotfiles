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
		--		layout_config = {
		--			prompt_position = 'top'
		--		}
	}
}
require('telescope').load_extension('fzf')

vim.keymap.set('n', '<leader>f',
	function() builtin.find_files({
			hidden = true,
			no_ignore = true,
		})
	end,
	{ desc = 'Find ALL files in Telescope' }
)

vim.keymap.set('n', '<C-p>',
	function() builtin.find_files({
			hidden = true,
			no_ignore = false,
		})
	end,
	{ desc = 'Find files in Telescope' }
)

vim.keymap.set('n', '<C-b>',
	function() builtin.buffers() end,
	{ desc = 'Search Buffers in Telescope' }
)

vim.keymap.set('n', '<C-f>',
	function() builtin.live_grep() end,
	{ desc = 'Grep for files in Telescope' }
)

vim.keymap.set('n', '<C-c>',
	function() builtin.oldfiles() end,
	{ desc = 'Fzf find old files' }
)
