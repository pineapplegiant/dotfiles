-------------------------------------
-- nvim-colorizer.lua
-- See `:help colorizer`
-------------------------------------
return {
	-- PRETTY
	'norcalli/nvim-colorizer.lua', -- Display the pretty colors
    event = { "BufReadPre", "BufNewFile" },
    config = true
}
