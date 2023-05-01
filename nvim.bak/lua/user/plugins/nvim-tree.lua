-- vim.g.nvim_tree_indent_markers = 1
-- vim.g.nvim_tree_git_hl = 1
return {require('nvim-tree').setup({
    git = {
        ignore = false
    },
    renderer = {
        highlight_opened_files = '1',
        group_empty = true,
        icons = {
            show = {
                folder_arrow = false
            }
        },
        indent_markers = {
            enable = true
            -- inline_arrows = false,
        }
    }
})}
