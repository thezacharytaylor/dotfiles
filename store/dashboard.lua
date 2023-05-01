return {{
    'nvimdev/dashboard-nvim',
    lazy = false,
    priority = 999,
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            config = {
                header = {'', '', ' __           .__           ', '|  | _____  __|__|  _____   ',
                          '|  |/ /\\  \\/ /|  | /     \\  ', '|    <  \\   / |  ||  Y Y  \\ ',
                          '|__|_ \\  \\_/  |__||__|_|  / ', '     \\/                 \\/  ', ''},
                center = {{
                    icon = '  ',
                    desc = 'New file                       ',
                    action = 'enew'
                }, {
                    icon = '  ',
                    shortcut = 'SPC f',
                    desc = 'Find file                 ',
                    action = 'Telescope find_files'
                }, {
                    icon = '  ',
                    shortcut = 'SPC h',
                    desc = 'Recent files              ',
                    action = 'Telescope oldfiles'
                }, {
                    icon = '  ',
                    shortcut = 'SPC g',
                    desc = 'Find Word                 ',
                    action = 'Telescope live_grep'
                }},
                footer = {}
            }
        }

    end,
    dependencies = {{'nvim-tree/nvim-web-devicons'}}
}}
