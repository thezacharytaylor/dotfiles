if not vim.g.vscode then
    return {{"farmergreg/vim-lastplace"}, {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end
    }, {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end
    }, {"AndrewRadev/tagalong.vim"}}
else
    return {{'farmergreg/vim-lastplace'}, {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end
    }, {"AndrewRadev/tagalong.vim"}}
end
