-- Plugins.lua
-- Install packer bootstrap
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end


local keymap = vim.keymap

-------------------------------------
-- Packer
-------------------------------------
require('packer').startup(function(use)
  --Required
  use 'wbthomason/packer.nvim'                                                    -- Package manager

  --Style
  use 'folke/tokyonight.nvim'                                                     -- Tokynight Theme
  use "rebelot/kanagawa.nvim"                                                     -- Kanagawa Theme?? :3
  use 'nvim-lualine/lualine.nvim'                                                 -- Fancier statusline
  use { 'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'} }       -- Buffers as tabs

  --Grace
  use 'numToStr/Comment.nvim'                                                     -- "gc" to comment visual regions/lines
  use 'lukas-reineke/indent-blankline.nvim'                                       -- Add indentation guides even on blank lines
  use 'windwp/nvim-autopairs'                                                     -- Auto close brackets, etc.
  use {'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons'}}   -- File Tree
  use 'karb94/neoscroll.nvim'                                                     -- Smooth scrolling, but with lua

  --Old Busted
  use 'aserowy/tmux.nvim'                                                         -- Navigate tmux panes splits better
  use 'kylechui/nvim-surround'                                                    -- Vim surround
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }       -- Add git related info in the signs columns and popups

  --New Hotness
  use 'nvim-treesitter/nvim-treesitter'                                           -- Highlight, edit, and navigate code
  use 'nvim-treesitter/nvim-treesitter-textobjects'                               -- Additional textobjects for treesitter

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, don't execute the rest of the init.lua
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Restart nvim pls, k thx'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- PLUGIN CONFIGURATION -- START

-------------------------------------
-- Lualine:
-- See `:help lualine.txt`
-------------------------------------
require('lualine').setup {
  options = {
    icons_enabled = true,
    --theme = 'spaceduck',
    theme = 'tokyonight',
    section_separators = { left = '', right = ''},
    component_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {{'branch', icon = {""}}, 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {'fzf'}
}


-------------------------------------
-- Comment.nvim:
-- See `:help tbd `
-------------------------------------
require('Comment').setup()


-------------------------------------
-- Indent-Blankline
-- See `:help indent_blankline.txt`
-------------------------------------
require('indent_blankline').setup {
  show_trailing_blankline_indent = false,
}


-------------------------------------
-- Autopairs
-- See `:help nvim-autopairs.txt`
-------------------------------------
require("nvim-autopairs").setup()


-------------------------------------
-- Barbar
-------------------------------------
keymap.set('n', '<leader>d', '<Cmd>BufferClose<CR>', {desc = "Close current buffer in barbar"})
keymap.set('n', 'gL', '<Cmd>BufferCloseAllButCurrent<CR>',{desc = "Close all but current in barbar"})
keymap.set('n', 'gp', '<Cmd>BufferPrevious<CR>',{desc = "Go to previous buffer in barbar"})
keymap.set('n', 'gL', '<Cmd>BufferCloseAllButCurrent<CR>',{desc = "Close all but current in barbar"})

-------------------------------------
-- Nvim-tree
-- See `:help nvim-tree.OPTION_NAME`
-------------------------------------
require("nvim-tree").setup {
    sort_by = "case_sensitive",
    view = {
        adaptive_size = false,
        mappings = {
            list = {
                { key = "L", action = "cd" },
                { key = "h", action = "close_node" },
                { key = "l", action = "dir_down" },
                { key = "v", action = "vsplit" },
                { key = "R", action = "refresh" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
}

keymap.set("n", '<C-n>', ':NvimTreeFindFileToggle<CR>', {desc = "Open Nvim Tree with"} )

-------------------------------------
-- Nvim Surround
-- See `:help nvim-surround.txt`
-------------------------------------
require("nvim-surround").setup()

-------------------------------------
-- Tmux
-------------------------------------
require("tmux").setup {
    -- overwrite default configuration
    -- here, e.g. to enable default bindings
    copy_sync = {
        -- enables copy sync and overwrites all register actions to
        -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
        enable = true,
    },
    navigation = {
        -- enables default keybindings (C-hjkl) for normal mode
        enable_default_keybindings = true,
    },
    resize = {
        -- enables default keybindings (A-hjkl) for normal mode
        enable_default_keybindings = true,
    }
}

-------------------------------------
-- Gitsigns
-- See `:help gitsigns.txt`
-------------------------------------
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-------------------------------------
-- Neoscroll
-- See `:help neoscroll-nvim.txt`
-------------------------------------
require('neoscroll').setup()


-------------------------------------
-- Tresitter
-- Configure Treesitter
-- See `:help nvim-treesitter`
-------------------------------------
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'lua', 'typescript', 'rust', 'go', 'python' },

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      -- TODO: I'm not sure for this one.
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}


-- PLUGIN CONFIGURATION --END
