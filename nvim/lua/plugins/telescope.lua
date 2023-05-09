if not vim.g.vscode then
    return { -- change some telescope options and a keymap to browse plugin files
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {{
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end
        }, {"nvim-lua/plenary.nvim"}, {
            "nvim-telescope/telescope-live-grep-args.nvim",
            config = function()
                require("telescope").load_extension("live_grep_args")
            end
        }},
        -- change some options
        opts = {
            defaults = {
                path_display = {
                    truncate = 1
                },
                layout_strategy = "horizontal",
                layout_config = {
                    prompt_position = "top"
                },
                sorting_strategy = "ascending",
                winblend = 0,
                file_ignore_patterns = {".git/"}
            }
        }
    }}
else
    return {}
end
