-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.xml" },
  -- { import = "astrocommunity.pack.blade" },
  { import = "astrocommunity.color.nvim-highlight-colors" },
  -- Themes
  -- { import = "astrocommunity.colorscheme.bamboo-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.colorscheme.cyberdream-nvim" },
  { import = "astrocommunity.colorscheme.dracula-nvim" },
  { import = "astrocommunity.colorscheme.everforest" },
  -- { import = "astrocommunity.colorscheme.fluoromachine-nvim" },
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  { import = "astrocommunity.colorscheme.nightfox-nvim" },
  { import = "astrocommunity.colorscheme.night-owl-nvim" },
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.colorscheme.sonokai" },
  -- Utilities
  { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },
  { import = "astrocommunity.media.img-clip-nvim" },
  -- { import = "astrocommunity.completion.avante-nvim" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  -- { import = "astrocommunity.media.vim-wakatime" }, -- In IDE time tracking
  { import = "astrocommunity.motion.hop-nvim" }, -- Better navigation
  { import = "astrocommunity.motion.nvim-surround" }, -- Wrapping words w/ '"[{( support
  { import = "astrocommunity.recipes.ai" }, -- AI Autocompletion?
  -- { import = "astrocommunity.ai.kurama622-llm-nvim" },
  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  { import = "astrocommunity.search.nvim-spectre" },
  -- { import = "astrocommunity.test.vim-test" },
  { import = "astrocommunity.workflow.hardtime-nvim" }, -- force better practices
}
