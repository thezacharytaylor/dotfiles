return {
  {
    -- 'ellisonleao/gruvbox.nvim',
    "eddyekofo94/gruvbox-flat.nvim",
    config = function()
      vim.g.gruvbox_flat_style = "dark"
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      theme = "dragon",
      background = { -- map the value of 'background' option to a theme
        dark = "dragon", -- try "dragon" because "wave" is default !
        light = "lotus",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-flat",
      -- colorscheme = "kanagawa",
    },
  },
}
