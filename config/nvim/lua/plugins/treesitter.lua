-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "bash",
      "css",
      "diff",
      "dockerfile",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "markdown",
      "markdown_inline",
      "php",
      "rust",
      "scss",
      -- "tree-sitter-ssh-config",
      "toml",
      "typescript",
      "tsx",
      "vim",
      "vimdoc",
      "yaml",
    })
  end,
}
