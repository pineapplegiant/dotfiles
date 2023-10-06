-- Highlights.lua
vim.o.background = 'dark' -- Tell nvim we're using a dark theme

--set.winblend = 0 -- Transparency for floating window
--set.pumblend = 5 -- Pseudo transparency for popup-menus

-- SET COLORSCHEME HERE
	-- ex: {
		-- tokyonight: [dark, storm, light],
		-- catppuccin: [latte, frappe, macchiato, mocha],
		-- material:   [darker, lighter, oceanic, palenight, deep ocean]
	-- }
local gmos_colorscheme = 'tokyonight-night' -- catppuccin, tokyonight, vscode, material
local colorscheme_opts = ''

--Colorscheme Error Wrapper
local function try_color_scheme(theme, theme_opts)
	local color_theme_string = "colorscheme " .. theme

	-- Optional theme opts
	if theme_opts ~= nil then
		if theme == 'tokyonight' then
			vim.g.tokyonight_style = theme_opts
		end
		if theme == 'catppuccin' then
			vim.g.catppuccin_flavour = theme_opts
		end
		if theme == 'material' then
			vim.g.material_style = theme_opts
		end
	end

	vim.cmd(color_theme_string)
end

require('material').setup({

    contrast = {
        terminal = false, -- Enable contrast for the built-in terminal
        sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = false, -- Enable contrast for floating windows
        cursor_line = false, -- Enable darker background for the cursor line
        non_current_windows = false, -- Enable darker background for non-current windows
        filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
    },

    styles = { -- Give comments style such as bold, italic, underline etc.
        comments = { --[[ italic = true ]] },
        strings = { --[[ bold = true ]] },
        keywords = { --[[ underline = true ]] },
        functions = { --[[ bold = true, undercurl = true ]] },
        variables = {},
        operators = {},
        types = {},
    },

    plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        -- "dap",
        -- "dashboard",
        "gitsigns",
        "hop",
        "indent-blankline",
        "lspsaga",
        "mini",
        -- "neogit",
        -- "neorg",
        "nvim-cmp",
        "nvim-navic",
        "nvim-tree",
        "nvim-web-devicons",
        -- "sneak",
        "telescope",
        "trouble",
        "which-key",
    },

    disable = {
        colored_cursor = false, -- Disable the colored cursor
        borders = false, -- Disable borders between verticaly split windows
        background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = false -- Hide the end-of-buffer lines
    },

    high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = false -- Enable higher contrast text for darker style
    },

    lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

    async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

    custom_colors = nil, -- If you want to everride the default colors, set this to a function

    custom_highlights = {}, -- Overwrite highlights with your own
})

if pcall(try_color_scheme, gmos_colorscheme, colorscheme_opts) then
	--"no errors in loading colorscheme"
else
	print("Colorscheme", gmos_colorscheme, "is not installed")
end

