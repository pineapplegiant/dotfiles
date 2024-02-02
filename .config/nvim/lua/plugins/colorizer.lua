-------------------------------------
-- nvim-colorizer.lua
-- See `:help colorizer`
-------------------------------------
return {
	-- PRETTY
	'norcalli/nvim-colorizer.lua', -- Display the pretty colors
    event = { "BufReadPre", "BufNewFile" },
    config = function()
			require 'colorizer'.setup(nil, { css = true; })
    end
}
