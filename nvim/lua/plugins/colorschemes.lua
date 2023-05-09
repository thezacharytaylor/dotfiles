if not vim.g.vscode then
    return {{
        -- 'ellisonleao/gruvbox.nvim',
        "eddyekofo94/gruvbox-flat.nvim",
        config = function()
            vim.g.gruvbox_flat_style = "dark"
        end
    }, {"sainnhe/gruvbox-material"}, {"sainnhe/everforest"}, {"sainnhe/edge"}, {"sainnhe/sonokai"}, {
        "rebelot/kanagawa.nvim",
        opts = {
            theme = "dragon",
            background = { -- map the value of 'background' option to a theme
                dark = "dragon", -- try "dragon" because "wave" is default !
                light = "lotus"
            }
        }
    }, {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "gruvbox-material"
            -- colorscheme = "gruvbox-flat",
            -- colorscheme = "kanagawa",
        }
    }}
else
    return {{
        "LazyVim/LazyVim",
        opts = {
            colorscheme = ""
            -- colorscheme = "gruvbox-flat",
            -- colorscheme = "kanagawa",
        }
    }}
end
