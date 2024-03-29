-- ________    ___      ___  ___   _____ ______    ________   ________
-- |\   ___  \ |\  \    /  /||\  \ |\   _ \  _   \ |\   __  \ |\   ____\
-- \ \  \\ \  \\ \  \  /  / /\ \  \\ \  \\\__\ \  \\ \  \|\  \\ \  \___|
--  \ \  \\ \  \\ \  \/  / /  \ \  \\ \  \\|__| \  \\ \   _  _\\ \  \
--   \ \  \\ \  \\ \    / /    \ \  \\ \  \    \ \  \\ \  \\  \|\ \  \____
--    \ \__\\ \__\\ \__/ /      \ \__\\ \__\    \ \__\\ \__\\ _\ \ \_______\
--     \|__| \|__| \|__|/        \|__| \|__|     \|__| \|__|\|__| \|_______|
--

-- $XDG_CONFIG_HOME/nvim/lua/plugins/init.lua
-- Good starting reference: https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua

require("core.base") -- $XDG_CONFIG_HOME/nvim/lua/core/base.lua

-------------------------------------
-- Install LazyNvim if not installed
-------------------------------------
vim.g.mapleader = " "
vim.g.localmapleader = "\\"

-- Bootstrap Lazy Plugin
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

-------------------------------------
-- Lazy Plugins
-------------------------------------

-- Lazy Lua Modules
require("lazy").setup({
	{ import = "plugins" },
	{ import = "plugins.lsp" },
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		-- notify = false,
	},
})

require("core.colorscheme") -- $XDG_CONFIG_HOME/nvim/lua/core/colorscheme.lua
require("core.maps") -- $XDG_CONFIG_HOME/nvim/lua/core/maps.lua
