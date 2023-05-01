return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "git_config",
        "gitattributes",
        "gitignore",
        "graphql",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "phpdoc",
        "query",
        "regex",
        "sql",
        "scss",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
}
