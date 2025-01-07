-------------------------------------
-- Neoscroll
-- See `:help neoscroll.txt`
-------------------------------------
return {
	"karb94/neoscroll.nvim", -- Smooth scrolling, but with lua
	event = "BufEnter",
	config = function()
		neoscroll = require('neoscroll')

		neoscroll.setup({
			easing = "quadratic", -- Default easing function Set any other options as needed
			hide_cursor = true,
			-- All these keys will be mapped to their corresponding default scrolling animation
			mappings = { "<C-u>", "<C-d>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
		})

		local keymap = {
			-- Use the "sine" easing function
			["<C-u>"] = function() neoscroll.ctrl_u({ duration = 550 } ) end;
			["<C-d>"] = function() neoscroll.ctrl_d({ duration = 550 }) end;

			-- Use the "circular" easing function
			-- ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 450; easing = 'circular' }) end;
			-- ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 450; easing = 'circular' }) end;

			-- When no value is passed the `easing` option supplied in `setup()` is used
			["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor=false; duration = 100 }) end;
			["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor=false; duration = 100 }) end;

			["zz"]    = function() neoscroll.zz({ half_win_duration = 300 }) end;
			["zb"]    = function() neoscroll.zb({ half_win_duration = 300 }) end;

		}
		local modes = { 'n', 'v', 'x' }
		for key, func in pairs(keymap) do
				vim.keymap.set(modes, key, func)
		end
	end,
}
