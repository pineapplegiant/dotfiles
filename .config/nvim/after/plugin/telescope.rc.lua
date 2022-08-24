-------------------------------------
-- Telescope
-- See `:help Telescope`
-------------------------------------
local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')


-- Generate Some Common Settings for telescope
local function generateOpts(opts)
  local common_opts = {
	previewer = false,
	winblend = 3,
	results_title = false,
	sorting_strategy = "ascending",
	layout_strategy = "center",
	layout_config = {
	  width = 80,
	  height = 25
	},
	border = true,
	borderchars = {
	  prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
	  results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
	  preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		}
	}

  return vim.tbl_extend("force", common_opts, opts)
end

local oldfiles_opts = generateOpts({})
local git_files_opts = generateOpts({})
local find_files_opts = generateOpts({hidden=false})


telescope.setup {
	defaults = {
		winblend = 3,
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
			preview_cutoff = 1, -- Preview should always show (unless previewer = false)

		  width = function(_, max_columns, _)
			return math.min(max_columns, 115)
		  end,

		  height = function(_, _, max_lines)
			return math.min(max_lines, 25)
		  end,
		},
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
		find_files = find_files_opts,
		oldfiles = oldfiles_opts,
		git_files = git_files_opts,
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

vim.keymap.set('n', '<C-b>',
	function() builtin.buffers() end,
	{ desc = 'Search Buffers in Telescope' }
)

-- Tmux wont let me map shift unfortunately
-- vim.keymap.set('n', '<C-S-f>',
vim.keymap.set('n', '<C-g>',
	function() builtin.live_grep() end,
	{ desc = 'Grep for files in Telescope' }
)

vim.keymap.set('n', '<C-c>',
	function() builtin.oldfiles()
	end,
	{ desc = 'Fzf find old files' }
)
