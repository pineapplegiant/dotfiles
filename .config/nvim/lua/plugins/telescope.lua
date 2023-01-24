-------------------------------------
-- Telescope
-- See `:help Telescope`
-------------------------------------
local status, telescope = pcall(require, 'telescope')
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
	  height = 28
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
local buffers_opts = generateOpts({})
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
			return math.min(max_columns, 122)
		  end,

		  height = function(_, _, max_lines)
			return math.min(max_lines, 28)
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
		buffers = buffers_opts,
	},
	-- Now the picker_config_key will be applied every time you call this
	-- builtin picker
}

require('telescope').load_extension('fzf')


vim.keymap.set('n', '<C-a>',
	function() builtin.builtin()
	end,
	{ desc = 'Call Telescope' }
)

vim.keymap.set('n', '<C-p>',
	function() builtin.find_files({
			no_ignore = false,
		})
	end,
	{ desc = 'Find files in Telescope' }
)

vim.keymap.set('n', '<C-b>',
	function() builtin.current_buffer_fuzzy_find()
	end,
	{ desc = 'Search in File' }
)

-- Tmux wont let me map shift unfortunately, so normal this for now -> vim.keymap.set('n', '<C-S-f>',
vim.keymap.set('n', '<C-f>',
	function() builtin.live_grep() end,
	{ desc = 'Grep for files in Telescope' }
)

vim.keymap.set('n', '<C-c>',
	function() builtin.oldfiles()
	end,
	{ desc = 'Fzf find old files' }
)