if vim.g.vscode then
    return {{
        "folke/trouble.nvim",
        enabled = false
    }, {
        'nvim-lspconfig',
        enabled = false
    }, {
        'nvim-treesitter/nvim-treesitter',
        enabled = false
    }, {
        'nvim-treesitter/nvim-treesitter-textobjects',
        enabled = false
    }, {
        'folke/neoconf.nvim',
        enabled = false
    }, {
        'folke/neodev.nvim',
        enabled = false
    }, {
        'williamboman/mason.nvim',
        enabled = false
    }, {
        'williamboman/mason-lspconfig.nvim',
        enabled = false
    }, {
        'cmp-hrsh7/cmp-nvim-lsp',
        enabled = false
    }, {
        'jose-elias-alvarez/null-ls.nvim',
        enabled = false
    }, {
        'hrsh7th/nvim-cmp',
        enabled = false
    }, {
        'nvim-neo-tree/neo-tree.nvim',
        enabled = false
    }, {
        'nvim-telescope/telescope.nvim',
        enabled = false
    }, {
        'lewis6991/gitsigns.nvim',
        enabled = false
    }, {
        'RRethy/vim-illuminate',
        enabled = false
    }, {
        'goolord/alpha-nvim',
        enabled = false
    }, {
        "echasnovski/mini.comment",
        enabled = false
    }, {
        'echasnovaski/mini.pairs',
        enabled = false
    }, {
        'echasnovski/mini.surround',
        enabled = false
    }}
else
    return {}
end
