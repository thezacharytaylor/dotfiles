if not vim.g.vscode then
    return { -- add more treesitter parsers
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {{"nvim-treesitter/playground"}, {
            "nvim-treesitter/nvim-treesitter-textobjects",
            init = function()
                -- PERF: no need to load the plugin, if we only need its queries for mini.ai
                local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
                local opts = require("lazy.core.plugin").values(plugin, "opts", false)
                local enabled = false
                if opts.textobjects then
                    for _, mod in ipairs({"move", "select", "swap", "lsp_interop"}) do
                        if opts.textobjects[mod] and opts.textobjects[mod].enable then
                            enabled = true
                            break
                        end
                    end
                end
                if not enabled then
                    require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
                end
            end
        }, {"JoosepAlviste/nvim-ts-context-commentstring"}},
        opts = {
            ensure_installed = {"bash", "css", "git_config", "gitattributes", "gitignore", "graphql", "html",
                                "javascript", "json", "lua", "markdown", "markdown_inline", "php", "phpdoc", "query",
                                "regex", "sql", "scss", "tsx", "typescript", "vim", "yaml"},
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = 1000
            },
            highlight = {
                enable = true,
                disable = {"NvimTree"},
                additional_vim_regex_highlighting = true
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["if"] = "@function.inner",
                        ["af"] = "@function.outer",
                        ["ic"] = "@class.inner",
                        ["ac"] = "@class.outer",
                        ["ia"] = "@parameter.inner",
                        ["aa"] = "@parameter.outer"
                    }
                }
            },
            context_commentstring = {
                enable = true
            }
        }
    }, {
        "gbprod/php-enhanced-treesitter.nvim",
        dependencies = {{
            "derekstride/tree-sitter-sql",
            run = ":TSInstall sql"
        }}
    }}
else
    return {}
end
