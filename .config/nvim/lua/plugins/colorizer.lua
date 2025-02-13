-------------------------------------
-- nvim-colorizer.lua
-- See `:help colorizer`
-------------------------------------
return {
	-- PRETTY
	'norcalli/nvim-colorizer.lua', -- Display the pretty colors
    ft = {"markdown", "css", "html", "yaml"},
    config = function()
			require 'colorizer'.setup(nil, { css = true; })
    end
}
