return {
	"Darazaki/indent-o-matic",
	config = function()
		require("indent-o-matic").setup({
			-- The values indicated here are the defaults

			-- Number of lines without indentation before giving up (use -1 for infinite)
			max_lines = 2048,

			-- Space indentations that should be detected
			standard_widths = { 2, 4, 8 },

			-- Skip multi-line comments and strings (more accurate detection but less performant)
			skip_multiline = true,
		})
	end,
	-- "nmac427/guess-indent.nvim",
	-- config = function()
	-- 	require("guess-indent").setup({
	-- 		-- This is the default configuration
	-- 		auto_cmd = true, -- Set to false to disable automatic execution
	-- 		override_editorconfig = false, -- Set to true to override settings set by .editorconfig
	-- 		filetype_exclude = { -- A list of filetypes for which the auto command gets disabled
	-- 			"netrw",
	-- 			"tutor",
	-- 		},
	-- 		buftype_exclude = { -- A list of buffer types for which the auto command gets disabled
	-- 			"help",
	-- 			"nofile",
	-- 			"terminal",
	-- 			"prompt",
	-- 		},
	-- 	})
	-- end,
}
