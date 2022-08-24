-------------------------------------
-- Nvim-tree
-- See `:help nvim-tree.OPTION_NAME`
-------------------------------------
local status, n_tree = pcall(require, "nvim-tree")
if (not status) then return end

local nt_api = require "nvim-tree.api"

n_tree.setup {
	disable_netrw = true,
	-- sync_root_with_cwd = false,
	reload_on_bufenter = true,
	respect_buf_cwd = true,
	sort_by = "case_sensitive",
	view = {
		adaptive_size = false,
		mappings = {
			list = {
				{ key = "<CR>", action = "edit" },
				{ key = "<BS>", action = "dir_up" },
				{ key = "L", action = "cd" },
				{ key = "n", action = "create" },
				{ key = "x", action = "remove" },
				{ key = "h", action = "close_node" },
				{ key = "l", action = "dir_down" },
				{ key = "v", action = "vsplit" },
				{ key = "R", action = "refresh" },
			},
		},

	},
	filters = {
		dotfiles = false,
	},
	--    renderer = {
	--        group_empty = true,
	--    },
	git = {
		ignore = false,
		enable = true,
		timeout = 400 -- (in ms)
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
}

vim.keymap.set('n', '<C-n>', 
	function() 
		nt_api.tree.toggle(false, true) 
	end, 
	{ desc = 'Toggle Nvim tree lua with no focus' }
)

-- -- Ehh not really needed since I have telescope
-- local function toggle_replace()
--   local view = require"nvim-tree.view"
--   if view.is_visible() then
-- 	view.close()
--   else
-- 	require"nvim-tree".open_replacing_current_buffer()
--   end
-- end
--  

-- vim.keymap.set('n', '<leader>n', 
-- 		function() toggle_replace() end,
-- 	{ desc = 'Open Nvim tree centered in a floating window' }
-- )
--
