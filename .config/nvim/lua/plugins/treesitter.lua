-------------------------------------
-- Tresitter
-- Configure Treesitter
-- See `:help nvim-treesitter`
-------------------------------------
--local status, ts = pcall(require, 'nvim-treesitter.configs')
-- if (not status) then return end

-- TBH Not sure what everything does rip
return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")
      local comment_string =  require('ts_context_commentstring').setup {}
      -- configure treesitter
      treesitter.setup({ -- enable syntax highlighting
        highlight = {
          enable = true,
        },
        -- enable indentation
        indent = { enable = true },

        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = { enable = true },

        -- ensure all language parsers are installed
        ensure_installed = "all",

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
        -- auto install above language parsers
        auto_install = true,
      })
    end,
  },
}
