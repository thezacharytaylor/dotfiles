-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      autoformat = true, -- enable or disable auto formatting on start
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = false, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "php",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
      -- "blade",
    },
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      html = {
        filetypes = { "html", "php" },
      },
      cssls = {
        settings = {
          css = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
          scss = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
          less = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
          pcss = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
          postcss = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
        },
      }, -- clangd = { capabilities = { offsetEncoding = "utf-8" } },
      phpactor = {
        filetypes = { "php", "blade" },
        init_options = {
          ["language_server_phpstan.enabled"] = true,
          ["language_server_php_cs_fixer.enabled"] = true,
        },
      },
    },
    -- customize how language servers are attached
    handlers = {
      -- a function without a key is simply the default handler, functions take two parameters, the server name and the configured options table for that server
      -- function(server, opts) require("lspconfig")[server].setup(opts) end

      -- the key is the server that is being setup with `lspconfig`
      -- rust_analyzer = false, -- setting a handler to false will disable the set up of that language server
      -- pyright = function(_, opts) require("lspconfig").pyright.setup(opts) end -- or a custom handler function can be passed
      -- phpactor
      phpactor = function(_, opts)
        require("lspconfig").phpactor.setup {
          -- capabilities = capabilities,
          -- on_attach = function(client, bufnr)
          --   client.server_capabilities.completionProvider = false
          --   client.server_capabilities.hoverProvider = false
          --   client.server_capabilities.implementationProvider = false
          --   client.server_capabilities.referencesProvider = false
          --   client.server_capabilities.renameProvider = false
          --   client.server_capabilities.selectionRangeProvider = false
          --   client.server_capabilities.signatureHelpProvider = false
          --   client.server_capabilities.typeDefinitionProvider = false
          --   client.server_capabilities.workspaceSymbolProvider = false
          --   client.server_capabilities.definitionProvider = false
          --   client.server_capabilities.documentHighlightProvider = false
          --   client.server_capabilities.documentSymbolProvider = false
          --   client.server_capabilities.documentFormattingProvider = false
          --   client.server_capabilities.documentRangeFormattingProvider = false
          -- end,
          init_options = {
            ["language_server_phpstan.enabled"] = false,
            ["language_server_psalm.enabled"] = false,
          },
          handlers = {
            ["textDocument/publishDiagnostics"] = function() end,
          },
        }
      end,
      -- blade = function(_, opts)
      --   require("lspconfig").blade.setup {
      --     cmd = { "/Users/zacharytaylor/Documents/laravel-dev-tools", "lsp" },
      --     -- filetypes = { "blade" },
      --   }
      -- end,
      -- phpactor = function()
      --   require("lspconfig").phpactor.setup {
      --     filetypes = { "php", "blade" },
      --   }
      -- end,
      -- blade
      -- blade = function()
      --   require("lspconfig").blade.setup {
      --     cmd = { "~/Documents/laravel-dev-tools", "lsp" },
      --     filetypes = { "blade" },
      --   }
      -- end,
      -- intelphense for future reference
      -- intelephense = function()
      --   require("lspconfig").intelephense.setup {
      --     settings = {
      --       intelephense = {
      --         stubs = {
      --           "apache",
      --           "bcmath",
      --           "bz2",
      --           "calendar",
      --           "com_dotnet",
      --           "Core",
      --           "ctype",
      --           "curl",
      --           "date",
      --           "dba",
      --           "dom",
      --           "enchant",
      --           "exif",
      --           "FFI",
      --           "fileinfo",
      --           "filter",
      --           "fpm",
      --           "ftp",
      --           "gd",
      --           "gettext",
      --           "gmp",
      --           "hash",
      --           "iconv",
      --           "imap",
      --           "intl",
      --           "json",
      --           "ldap",
      --           "libxml",
      --           "mbstring",
      --           "meta",
      --           "mysqli",
      --           "oci8",
      --           "odbc",
      --           "openssl",
      --           "pcntl",
      --           "pcre",
      --           "PDO",
      --           "pdo_ibm",
      --           "pdo_mysql",
      --           "pdo_pgsql",
      --           "pdo_sqlite",
      --           "pgsql",
      --           "Phar",
      --           "posix",
      --           "pspell",
      --           "readline",
      --           "Reflection",
      --           "session",
      --           "shmop",
      --           "SimpleXML",
      --           "snmp",
      --           "soap",
      --           "sockets",
      --           "sodium",
      --           "SPL",
      --           "sqlite3",
      --           "standard",
      --           "superglobals",
      --           "sysvmsg",
      --           "sysvsem",
      --           "sysvshm",
      --           "tidy",
      --           "tokenizer",
      --           "xml",
      --           "xmlreader",
      --           "xmlrpc",
      --           "xmlwriter",
      --           "xsl",
      --           "Zend OPcache",
      --           "zip",
      --           "zlib",
      --           "wordpress",
      --           "woocommerce",
      --           "wordpress-globals",
      --           "wp-cli",
      --           "acf-pro",
      --         },
      --         -- ...
      --       },
      --     },
      --   }
      -- end,
    },
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      -- first key is the `augroup` to add the auto commands to (:h augroup)
      lsp_document_highlight = {
        -- Optional condition to create/delete auto command group
        -- can either be a string of a client capability or a function of `fun(client, bufnr): boolean`
        -- condition will be resolved for each client on each execution and if it ever fails for all clients,
        -- the auto commands will be deleted for that buffer
        cond = "textDocument/documentHighlight",
        -- cond = function(client, bufnr) return client.name == "lua_ls" end,
        -- list of auto commands to set
        {
          -- events to trigger
          event = { "CursorHold", "CursorHoldI" },
          -- the rest of the autocmd options (:h nvim_create_autocmd)
          desc = "Document Highlighting",
          callback = function() vim.lsp.buf.document_highlight() end,
        },
        {
          event = { "CursorMoved", "CursorMovedI", "BufLeave" },
          desc = "Document Highlighting Clear",
          callback = function() vim.lsp.buf.clear_references() end,
        },
      },
    },
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },
        -- a `cond` key can provided as the string of a server capability to be required to attach, or a function with `client` and `bufnr` parameters from the `on_attach` that returns a boolean
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        ["<Leader>uY"] = {
          function() require("astrolsp.toggles").buffer_semantic_tokens() end,
          desc = "Toggle LSP semantic highlight (buffer)",
          cond = function(client) return client.server_capabilities.semanticTokensProvider and vim.lsp.semantic_tokens end,
        },
      },
    },
    -- A custom `on_attach` function to be run after the default `on_attach` function
    -- takes two parameters `client` and `bufnr`  (`:h lspconfig-setup`)
    on_attach = function(client, bufnr)
      -- this would disable semanticTokensProvider for all clients
      -- client.server_capabilities.semanticTokensProvider = nil
    end,
  },
}
