if not vim.g.vscode then
    return {{
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        opts = {
            suggestion = {
                enabled = true
            },
            panel = {
                enabled = true
            }
        }
    }}
else
    return {}
end
