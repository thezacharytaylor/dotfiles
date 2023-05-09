if not vim.g.vscode then
    return {{
        "jose-elias-alvarez/null-ls.nvim",
        opts = function(_, opts)
            local nls = require("null-ls")
            table.insert(opts.sources, nls.builtins.formatting.prettierd)
            table.insert(opts.sources, nls.builtins.formatting.phpcsfixer.with({
                command = "php-cs-fixer",
                args = {"--rules=@PSR12", "--using-cache=no", "-"},
                to_stdin = true
            }))
            -- table.insert(opts.sources, nls.builtins.formatting.phpcbf).with({
            --   command = "phpcs",
            --   args = { "--standard=psr12", "-" },
            --   to_stdin = true,
            -- })
            table.insert(opts.sources, nls.builtins.formatting.blade_formatter)
        end
    }}
else
    return {}
end
