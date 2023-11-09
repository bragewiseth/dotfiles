local plugins = {
    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = false
    },
    {
        "tpope/vim-surround",
        lazy = false
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require "custom.configs.copilot"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "pyright",
                "prettier",
                "clangd",
            }
        }
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "jose-elias-alvarez/null-ls.nvim",
            config = function()
                require "custom.configs.null-ls"
            end,
        },
        config = function ()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end
    },
    {
        "NvChad/nvim-colorizer.lua",
        config = function ()
            require "custom.configs.colorizer"
            vim.defer_fn(function()
                require("colorizer").attach_to_buffer(0)
            end, 0)
        end

    },
    {
        "lewis6991/gitsigns.nvim",
        opts = function()
            return require("plugins.configs.others").gitsigns
        end,
        config = function(_,opts)
            dofile(vim.g.base46_cache .. "git")
            require("gitsigns").setup(opts)
            require "custom.configs.gitsigns"
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            {
                -- snippet plugin
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                    "iurimateus/luasnip-latex-snippets.nvim",
                opts = { history = true,
                    updateevents = "TextChanged,TextChangedI",
                    enable_autosnippets = true,
                },
                config = function(_, opts)
                    require("plugins.configs.others").luasnip(opts)
                end,
            },
        },
    },
    {
        "lervag/vimtex",
        ft = "tex",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                -- defaults 
                "vim",
                "lua",
                "python",
                --
                -- -- web dev 
                "html",
                "css",
                "javascript",
                "typescript",
                "tsx",
                "json",
                "vue", "svelte",

                -- low level
                "c",
                "rust",
            },
            highlight = {
                enable = false,
                disable = { },
            },
        },
    },
    {
        "folke/zen-mode.nvim",
        cmd = {'ZenMode'},
    },
    -- {
    --     "mwouts/jupytext.vim",
    --     ft = "json",
    -- }
   -- {
    --     "dccsillag/magma-nvim",
    --     build = {':UpdateRemotePlugins'},
    --     cmd = {'MagmaInit'},
    -- },
    -- {
    --     'edluffy/hologram.nvim',
    --     -- lazy = false,
    --     ft = { "markdown" },
    --     config = require('hologram').setup({
    --         auto_display = true -- WIP automatic markdown image display, may be prone to breaking
    --     })
    -- }
}
return plugins
