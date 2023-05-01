return {{
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = { -- {
    --     "<leader>ne",
    --     function()
    --         require("neo-tree.command").execute({
    --             toggle = true,
    --             dir = require("lazyvim.util").get_root()
    --         })
    --     end,
    --     desc = "Explorer NeoTree (root dir)"
    -- },
    {
        "<leader>nE",
        function()
            require("neo-tree.command").execute({
                toggle = true,
                dir = vim.loop.cwd()
            })
        end,
        desc = "Explorer NeoTree (cwd)"
    }, {
        "<leader>n",
        "<leader>ne",
        desc = "Explorer NeoTree (root dir)",
        remap = true
    }, {
        "<leader>E",
        "<leader>nE",
        desc = "Explorer NeoTree (cwd)",
        remap = true
    }},
    deactivate = function()
        vim.cmd([[Neotree close]])
    end,
    init = function()
        -- vim.g.neo_tree_remove_legacy_commands = 1
        if vim.fn.argc() == 1 then
            local stat = vim.loop.fs_stat(vim.fn.argv(0))
            if stat and stat.type == "directory" then
                require("neo-tree")
            end
        end
    end,
    opts = {
        filesystem = {
            bind_to_cwd = false,
            follow_current_file = true,
            use_libuv_file_watcher = true
        },
        -- window = {
        --     mappings = {
        --         ["<space>"] = "none"
        --     }
        -- },
        default_component_configs = {
            indent = {
                with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
                expander_collapsed = "",
                expander_expanded = "",
                expander_highlight = "NeoTreeExpander"
            }
        },
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
    },
    config = function(_, opts)
        require("neo-tree").setup(opts)
        vim.api.nvim_create_autocmd("TermClose", {
            pattern = "*lazygit",
            callback = function()
                if package.loaded["neo-tree.sources.git_status"] then
                    require("neo-tree.sources.git_status").refresh()
                end
            end
        })
        vim.cmd([[
      highlight NvimTreeIndentMarker guifg=#30323E
      augroup NvimTreeHighlights
        autocmd ColorScheme * highlight NvimTreeIndentMarker guifg=#30323E
      augroup end
    ]])

        -- vim.keymap.set('n', '<leader>n', ':NvimTreeFindFileToggle<CR>')

    end
}, -- search/replace in multiple files
{
    "nvim-pack/nvim-spectre",
    -- stylua: ignore
    keys = {{
        "<leader>sr",
        function()
            require("spectre").open()
        end,
        desc = "Replace in files (Spectre)"
    }}
}, {
    'nvim-telescope/telescope.nvim',
    dependencies = {{
        'nvim-lua/plenary.nvim',
        lazy = false
    }, {
        'nvim-tree/nvim-web-devicons',
        lazy = false
    }, {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = "make",
        lazy = false
    }, {
        'nvim-telescope/telescope-live-grep-args.nvim',
        lazy = false
    }},
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        telescope.setup({
            defaults = {
                path_display = {
                    truncate = 1
                },
                prompt_prefix = '   ',
                selection_caret = '  ',
                layout_config = {
                    prompt_position = 'top'
                },
                sorting_strategy = 'ascending',
                mappings = {
                    i = {
                        ['<esc>'] = actions.close,
                        ['<C-Down>'] = actions.cycle_history_next,
                        ['<C-Up>'] = actions.cycle_history_prev
                    }
                },
                file_ignore_patterns = {'.git/'}
            },
            pickers = {
                find_files = {
                    hidden = true
                },
                buffers = {
                    previewer = false,
                    layout_config = {
                        width = 80
                    }
                },
                oldfiles = {
                    prompt_title = 'History'
                },
                lsp_references = {
                    previewer = false
                }
            }
        })

        telescope.load_extension('fzf')
        telescope.load_extension('live_grep_args')
        vim.keymap.set('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
        vim.keymap.set('n', '<leader>F',
            [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]]) -- luacheck: no max line length
        vim.keymap.set('n', '<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
        vim.keymap.set('n', '<leader>g', [[<cmd>lua telescope.extensions.live_grep_args.live_grep_args()<CR>]])
        vim.keymap.set('n', '<leader>h', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
        vim.keymap.set('n', '<leader>s', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])

    end
}, {
    "RRethy/vim-illuminate",
    event = {"BufReadPost", "BufNewFile"},
    opts = {
        delay = 200
    },
    config = function(_, opts)
        require("illuminate").configure(opts)

        local function map(key, dir, buffer)
            vim.keymap.set("n", key, function()
                require("illuminate")["goto_" .. dir .. "_reference"](false)
            end, {
                desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference",
                buffer = buffer
            })
        end

        map("]]", "next")
        map("[[", "prev")

        -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                local buffer = vim.api.nvim_get_current_buf()
                map("]]", "next", buffer)
                map("[[", "prev", buffer)
            end
        })
    end,
    keys = {{
        "]]",
        desc = "Next Reference"
    }, {
        "[[",
        desc = "Prev Reference"
    }}
}, {
    'lewis6991/gitsigns.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    event = {"BufReadPre", "BufNewFile"},
    config = function()
        require('gitsigns').setup({
            sign_priority = 20,
            on_attach = function(bufnr)
                vim.keymap.set('n', ']h', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {
                    expr = true,
                    buffer = bufnr
                })
                vim.keymap.set('n', '[h', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {
                    expr = true,
                    buffer = bufnr
                })
            end
        })
    end
}, {
    'folke/trouble.nvim',
    dependencies = {{'nvim-tree/nvim-web-devicons'}},
    config = function()
        require('trouble').setup()
    end
}}
