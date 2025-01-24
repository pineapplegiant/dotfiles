return {
  "preservim/vim-pencil",
  ft = { "markdown" },
  lazy = true,
  init = function()
    vim.g["pencil#wrapModeDefault"] = "soft"
  end,
}
