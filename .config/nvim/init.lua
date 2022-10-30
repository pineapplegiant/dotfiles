-- ________    ___      ___  ___   _____ ______    ________   ________
-- |\   ___  \ |\  \    /  /||\  \ |\   _ \  _   \ |\   __  \ |\   ____\
-- \ \  \\ \  \\ \  \  /  / /\ \  \\ \  \\\__\ \  \\ \  \|\  \\ \  \___|
--  \ \  \\ \  \\ \  \/  / /  \ \  \\ \  \\|__| \  \\ \   _  _\\ \  \
--   \ \  \\ \  \\ \    / /    \ \  \\ \  \    \ \  \\ \  \\  \|\ \  \____
--    \ \__\\ \__\\ \__/ /      \ \__\\ \__\    \ \__\\ \__\\ _\ \ \_______\
--     \|__| \|__| \|__|/        \|__| \|__|     \|__| \|__|\|__| \|_______|
--

-- Good starting reference: https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua

-- General Settings, mappings, etc.
require("plugins-conf")          -- $XDG_CONFIG_HOME/nvim/lua/plugins-conf.lua
require("core.base")             -- $XDG_CONFIG_HOME/nvim/lua/core/base.lua
require("core.maps")             -- $XDG_CONFIG_HOME/nvim/lua/core/maps.lua
require("core.colorscheme")      -- $XDG_CONFIG_HOME/nvim/lua/core/colorscheme.lua

-- PLUGINS
require("plugins.barbar")        -- $XDG_CONFIG_HOME/nvim/lua/plugins/barbar.lua
require("plugins.colorizer")     -- $XDG_CONFIG_HOME/nvim/lua/plugins/colorizer.lua
require("plugins.comment")       -- $XDG_CONFIG_HOME/nvim/lua/plugins/comment.lua
require("plugins.hop")           -- $XDG_CONFIG_HOME/nvim/lua/plugins/hop.lua
require("plugins.indent-blankline") -- $XDG_CONFIG_HOME/nvim/lua/plugins/indent-blankline.lua
require("plugins.lualine")       -- $XDG_CONFIG_HOME/nvim/lua/plugins/lualine.lua
require("plugins.neoscroll")     -- $XDG_CONFIG_HOME/nvim/lua/plugins/neoscroll.lua
require("plugins.nvim-cmp")      -- $XDG_CONFIG_HOME/nvim/lua/plugins/nvim-cmp.lua
require("plugins.nvim-surround") -- $XDG_CONFIG_HOME/nvim/lua/plugins/nvim-surround.lua
require("plugins.nvim-tree")     -- $XDG_CONFIG_HOME/nvim/lua/plugins/nvim-tree.lua
require("plugins.prettier")      -- $XDG_CONFIG_HOME/nvim/lua/plugins/prettier.lua
require("plugins.symbols")       -- $XDG_CONFIG_HOME/nvim/lua/plugins/symbols.lua
require("plugins.telescope")     -- $XDG_CONFIG_HOME/nvim/lua/plugins/telescope.lua
require("plugins.tmux")          -- $XDG_CONFIG_HOME/nvim/lua/plugins/tmux.lua
require("plugins.todo-comments") -- $XDG_CONFIG_HOME/nvim/lua/plugins/todo-comments.lua
require("plugins.zenmode")       -- $XDG_CONFIG_HOME/nvim/lua/plugins/zenmode.lua

-- LSP
require("plugins.lsp.mason-lsp-setup") -- $XDG_CONFIG_HOME/nvim/lua/plugins/lsp/mason-lsp-setup.lua
require("plugins.lsp.lspsaga")   -- $XDG_CONFIG_HOME/nvim/lua/plugins/lsp/lspsaga.lua
require("plugins.lsp.null-ls")   -- $XDG_CONFIG_HOME/nvim/lua/plugins/lsp/null-ls.lua

require("plugins.autopairs")     -- $XDG_CONFIG_HOME/nvim/lua/plugins/autopairs.lua
require("plugins.treesitter")    -- $XDG_CONFIG_HOME/nvim/lua/plugins/treesitter.lua
require("plugins.gitsigns")      -- $XDG_CONFIG_HOME/nvim/lua/plugins/gitsigns.lua
