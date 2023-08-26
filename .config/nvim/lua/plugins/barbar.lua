-------------------------------------
-- Barbar
-- See `:help barbar.txt`
-------------------------------------
--local status, barbar = pcall(require, 'barbar')
--if (not status) then return end

-- Set barbar's options
--vim.g.barbar_auto_setup = false -- disable auto-setup

return {
	"romgrk/barbar.nvim",
	event = "BufEnter",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		icons = {
			-- Configure the base icons on the bufferline. buffer_index = true,
			buffer_number = false,
			button = "×",
			-- Enables / disables diagnostic symbols
			diagnostics = {
				[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "ﬀ" },
				[vim.diagnostic.severity.WARN] = { enabled = false },
				[vim.diagnostic.severity.INFO] = { enabled = false },
				[vim.diagnostic.severity.HINT] = { enabled = false },
			},
			filetype = {
				-- Sets the icon's highlight group.
				-- If false, will use nvim-web-devicons colors
				custom_colors = false,

				-- Requires `nvim-web-devicons` if `true`
				enabled = true,
			},
			separator = { left = "▎", right = "" },

			-- Configure the icons on the bufferline when modified or pinned.
			-- Supports all the base icon options.
			modified = { button = "●" },
			pinned = { button = "車", filename = true, separator = { right = "" } },

			-- Configure the icons on the bufferline based on the visibility of a buffer.
			-- Supports all the base icon options, plus `modified` and `pinned`.
			alternate = { filetype = { enabled = false } },
			current = { buffer_index = true },
			inactive = { buffer_index = true, button = "" },
			visible = { modified = { buffer_number = false } },
		},
		-- If true, new buffers will be inserted at the start/end of the list.
		-- Default is to insert after current buffer.
		insert_at_end = true,
		insert_at_start = false,

		-- Sets the maximum padding width with which to surround each tab
		maximum_padding = 2,

		-- Sets the minimum padding width with which to surround each tab
		minimum_padding = 1,

		-- Sets the maximum buffer name length.
		maximum_length = 30,

		-- Set the filetypes which barbar will offset itself for
		sidebar_filetypes = {
			-- Use the default values: {event = 'BufWinLeave', text = nil}
			NvimTree = true,
			-- Or, specify the text used for the offset:
			undotree = { text = "undotree" },
			-- Or, specify the event which the sidebar executes when leaving:
			["neo-tree"] = { event = "BufWipeout" },
			-- Or, specify both
			Outline = { event = "BufWinLeave", text = "symbols-outline" },
		},
		-- New buffer letters are assigned in this order. This order is
		-- optimal for the qwerty keyboard layout but might need adjustement
		-- for other layouts.
		letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",

		-- Sets the name of unnamed buffers. By default format is "[Buffer X]"
		-- where X is the buffer number. But only a static string is accepted here.
		no_name_title = nil,
	},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
	keys = {
		{ "<leader>d", "<Cmd>BufferClose<CR>", desc = "Close current buffer in barbar" },
		{ "gL", "<Cmd>BufferCloseAllButCurrent<CR>", desc = "Close all but current buffer in barbar" },
		{ "gp", "<Cmd>BufferPrevious<CR>", desc = "Go to previous buffer in barbar" },
		{ "gn", "<Cmd>BufferNext<CR>", desc = "Go to next buffer in barbar" },
		{ "g1", ":BufferGoto 1<CR>", desc = "Go to 1st buffer in barbar" },
		{ "g2", ":BufferGoto 2<CR>", desc = "Go to 2nd buffer in barbar" },
		{ "g3", ":BufferGoto 3<CR>", desc = "Go to 3rd buffer in barbar" },
		{ "g4", ":BufferGoto 4<CR>", desc = "Go to 4th buffer in barbar" },
		{ "g5", ":BufferGoto 5<CR>", desc = "Go to 5th buffer in barbar" },
		{ "g6", ":BufferGoto 6<CR>", desc = "Go to 6th buffer in barbar" },
		{ "g7", ":BufferGoto 7<CR>", desc = "Go to 7th buffer in barbar" },
		{ "g8", ":BufferGoto 8<CR>", desc = "Go to 8th buffer in barbar" },
		{ "g9", ":BufferGoto 9<CR>", desc = "Go to 9th buffer in barbar" },
	},
}
