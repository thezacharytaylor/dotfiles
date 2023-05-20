if not vim.g.vscode then
    return {{
        "airblade/vim-rooter",
        setup = function()
            vim.g.rooter_manual_only = 1
        end,
        config = function()
            vim.cmd("Rooter")
        end
    }}
else
    return {}
end
