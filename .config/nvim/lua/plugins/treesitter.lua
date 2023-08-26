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
      "windwp/nvim-ts-autotag",
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

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

        -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
        -- auto install above language parsers
        auto_install = true,
      })
    end,
  },
}
