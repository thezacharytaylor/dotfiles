if not vim.g.vscode then
    return {{
        "williamboman/mason.nvim",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "prettierd")
            table.insert(opts.ensure_installed, "php-cs-fixer")
            table.insert(opts.ensure_installed, "phpcs")
            table.insert(opts.ensure_installed, "blade-formatter")
        end
    }}
else
    return {}
end
