-- import lspsaga safely
local ok, saga = pcall(require, "lspsaga")
if not ok then return end

saga.setup({
	-- keybinds for navigation in lspsaga window
	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
	-- use enter to open file with finder
	finder_action_keys = {
		open = "<CR>",
	},
	-- use enter to open file with definition preview
	definition_action_keys = {
		edit = "<CR>",
	},
	ui = {
		-- This option only works in Neovim 0.9
		title = true,
		-- Border type can be single, double, rounded, solid, shadow.
		border = "single",
		winblend = 0,
		expand = "",
		collapse = "",
		code_action = "💡",
		incoming = " ",
		outgoing = " ",
		hover = ' ',
		kind = {},
	},
	symbol_in_winbar = {
		enable = false,
		separator = " ",
		ignore_patterns={},
		hide_keyword = true,
		show_file = true,
		folder_level = 2,
		respect_root = false,
		color_mode = true,
	},
})
