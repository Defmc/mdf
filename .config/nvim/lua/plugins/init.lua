local plugins = {
    require("plugins.gruvbox"),
    require("plugins.noice"),
    require("plugins.dapui"),
    require("plugins.dap"),
    require("plugins.lsp.mason_lspconfig"),
    require("plugins.which-key"),
    {
        "lewis6991/gitsigns.nvim",
        opts = {}
    },
    require("plugins.conform"),
    require("plugins.bufferline"),
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    require("plugins.lsp.mason"),
    {
        "onsails/lspkind.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("lspkind").init({
                symbol_map = require("configs.theme").icons,
            })
        end,
    },
    require("plugins.cmp"),
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "hrsh7th/nvim-cmp" },
    },
    {
        "saadparwaiz1/cmp_luasnip",
        dependencies = {
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
        },
    },
    { "mg979/vim-visual-multi" },
    require("plugins.treesitter"),
    require("plugins.trouble"),
    require("plugins.telescopenvim"),
    {
        "numToStr/Comment.nvim",
        opts = {}
    },
    {
        "startup-nvim/startup.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        opts = {
            theme = "bad"
        }
    },
    require("plugins.lsp.navic"),
    {
        "nvim-lualine/lualine.nvim",
        after = { "onsails/lspkind.nvim" },
    },
    require("plugins.statusline"),
    {
        "norcalli/nvim-colorizer.lua",
        opts = {}
    },
    {
        dependencies = { "nvim-telescope/telescope.nvim" },
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").load_extension("ui-select")
        end
    },
    require("plugins.snacks")
}
if vim.env.PROF then
    -- example for lazy.nvim
    -- change this to the correct path for your plugin manager
    local snacks = vim.fn.stdpath("data") .. "/lazy/snacks.nvim"
    vim.opt.rtp:append(snacks)
    require("snacks.profiler").startup({
        startup = {
            event = "VimEnter", -- stop profiler on this event. Defaults to `VimEnter`
            -- event = "UIEnter",
            -- event = "VeryLazy",
        },
    })
end
local lazypath = require("vim").fn.stdpath("data") .. "/lazy/lazy.nvim"
if not require("vim").loop.fs_stat(lazypath) then
    require("vim").fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
    require("vim").fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" }) -- last stable release
end
require("vim").opt.rtp:prepend(lazypath)

local opts = {
    root = require("vim").fn.stdpath("data") .. "/lazy", -- directory where plugins will be installed
    defaults = {
        lazy = false,                                    -- should plugins be lazy-loaded?
        version = nil,
        -- version = "*", -- enable this to try installing the latest stable versions of plugins
    },
    lockfile = require("vim").fn.stdpath("config") .. "/lazy-lock.json", -- lockfile generated after running update.
    concurrency = nil, ---@type number limit the maximum amount of concurrent tasks
    git = {
        -- defaults for the `Lazy log` command
        -- log = { "-10" }, -- show the last 10 commits
        log = { "--since=3 days ago" }, -- show commits from the last 3 days
        timeout = 120,                  -- kill processes that take more than 2 minutes
        url_format = "https://github.com/%s.git",
    },
    dev = {
        -- directory where you store your local plugin projects
        path = "~/dev",
        ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
        patterns = {}, -- For example {"folke"}
    },
    install = {
        -- install missing plugins on startup. This doesn't increase startup time.
        missing = true,
        -- try to load one of these colorschemes when starting an installation during startup
        colorscheme = { "" },
    },
    ui = {
        -- a number <1 is a percentage., >1 is a fixed size
        size = { width = 0.8, height = 0.8 },
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "rounded",
        icons = {
            loaded = "●",
            not_loaded = "○",
            cmd = " ",
            config = "",
            event = "",
            ft = " ",
            init = " ",
            keys = " ",
            plugin = " ",
            runtime = " ",
            source = " ",
            start = "",
            task = "✔ ",
            lazy = "鈴 ",
            list = {
                "●",
                "➜",
                "★",
                "‒",
            },
        },
        -- leave nil, to automatically select a browser depending on your OS.
        -- If you want to use a specific browser, you can define it here
        browser = nil, ---@type string?
        throttle = 20, -- how frequently should the ui process render events
        custom_keys = {
            -- you can define custom key maps here.
            -- To disable one of the defaults, set it to false

            -- open lazygit log
            ["<localleader>l"] = function(plugin)
                require("lazy.util").open_cmd({ "lazygit", "log" }, {
                    cwd = plugin.dir,
                    terminal = true,
                    close_on_exit = true,
                    enter = true,
                })
            end,

            -- open a terminal for the plugin dir
            ["<localleader>t"] = function(plugin)
                require("lazy.util").open_cmd({ require("vim").go.shell }, {
                    cwd = plugin.dir,
                    terminal = true,
                    close_on_exit = true,
                    enter = true,
                })
            end,
        },
    },
    diff = {
        -- diff command <d> can be one of:
        -- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
        --   so you can have a different command for diff <d>
        -- * git: will run git diff and open a buffer with filetype git
        -- * terminal_git: will open a pseudo terminal with git diff
        -- * diffview.nvim: will open Diffview to show the diff
        cmd = "git",
    },
    checker = {
        -- automatically check for plugin updates
        enabled = false,
        concurrency = nil, ---@type number? set to 1 to check for updates very slowly
        notify = true,    -- get a notification when new updates are found
        frequency = 3600, -- check for updates every hour
    },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = true,
        notify = true, -- get a notification when changes are found
    },
    performance = {
        cache = {
            enabled = true,
            path = require("vim").fn.stdpath("cache") .. "/lazy/cache",
            -- Once one of the following events triggers, caching will be disabled.
            -- To cache all modules, set this to `{}`, but that is not recommended.
            -- The default is to disable on:
            --  * VimEnter: not useful to cache anything else beyond startup
            --  * BufReadPre: this will be triggered early when opening a file from the command line directly
            disable_events = { "VimEnter", "BufReadPre" },
            ttl = 3600 * 24 * 5, -- keep unused modules for up to 5 days
        },
        reset_packpath = true,   -- reset the package path to improve startup time
        rtp = {
            reset = true,        -- reset the runtime path to $VIMRUNTIME and your config directory
            ---@type string[]
            paths = {},          -- add any custom paths here that you want to indluce in the rtp
            ---@type string[] list any plugins you want to disable here
            disabled_plugins = {
                -- "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                -- "tarPlugin",
                -- "tohtml",
                -- "tutor",
                -- "zipPlugin",
            },
        },
    },

    -- lazy can generate helptags from the headings in markdown readme files,
    -- so :help works even for plugins that don't have vim docs.
    -- when the readme opens with :help it will be correctly displayed as markdown
    readme = {
        root = require("vim").fn.stdpath("state") .. "/lazy/readme",
        files = { "README.md" },
        -- only generate markdown helptags for plugins that dont have docs
        skip_if_doc_exists = true,
    },
}

require("lazy").setup(plugins, opts)
