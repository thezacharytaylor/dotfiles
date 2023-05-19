-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
-- Theme
lvim.plugins = {{
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
        require("everforest").setup({
            -- Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
            -- Default is "medium".
            background = "dark",
            -- How much of the background should be transparent. Options are 0, 1 or 2.
            -- Default is 0.
            --
            -- 2 will have more UI components be transparent (e.g. status line
            -- background).
            transparent_background_level = 0,
            -- Whether italics should be used for keywords, builtin types and more.
            italics = false,
            -- Disable italic fonts for comments. Comments are in italics by default, set
            -- this to `true` to make them _not_ italic!
            disable_italic_comments = false
        })
    end
}}

-- Settings
lvim.builtin.lualine.options.theme = 'everforest'
