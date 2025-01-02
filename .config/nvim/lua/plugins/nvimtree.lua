return {
    "kyazdani42/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = { "kyazdani42/nvim-web-devicons" },
    keys = {
        { "E", "<cmd>NvimTreeToggle<CR>", desc = "toggle nvim tree" },
    },
    config = function()
        local icons = require("configs.theme").icons
        require("nvim-tree").setup({
            auto_reload_on_write = true,
            disable_netrw = true,
            hijack_cursor = true,
            hijack_netrw = true,
            hijack_unnamed_buffer_when_opening = false,
            open_on_tab = false,
            sort_by = "name",
            update_cwd = false,
            view = {
                width = 25,
                side = "left",
                preserve_window_proportions = false,
                number = false,
                relativenumber = false,
                signcolumn = "yes",
            },
            renderer = {
                indent_markers = {
                    enable = true,
                    icons = {
                        corner = "└ ",
                        edge = "│ ",
                        none = "  ",
                    },
                },
                icons = {
                    webdev_colors = true,
                    git_placement = "before",
                },
                root_folder_label = false,
            },
            hijack_directories = {
                enable = true,
                auto_open = true,
            },
            update_focused_file = {
                enable = false,
                update_cwd = false,
                ignore_list = {},
            },
            system_open = {
                cmd = "",
                args = {},
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                icons = {
                    error = icons.Error,
                    info = icons.Info,
                    hint = icons.Hint,
                    warning = icons.Warning,
                },
            },
            filters = {
                dotfiles = true,
                custom = {},
                exclude = {},
            },
            git = {
                enable = false,
                ignore = true,
                timeout = 400,
            },
            actions = {
                use_system_clipboard = true,
                change_dir = {
                    enable = true,
                    global = false,
                    restrict_above_cwd = false,
                },
                open_file = {
                    quit_on_open = true,
                    resize_window = false,
                    window_picker = {
                        enable = true,
                        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                        exclude = {
                            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                            buftype = { "nofile", "terminal", "help" },
                        },
                    },
                },
            },
            trash = {
                cmd = "trash",
                require_confirm = true,
            },
            log = {
                enable = false,
                truncate = false,
                types = {
                    all = false,
                    config = false,
                    copy_paste = false,
                    diagnostics = false,
                    git = false,
                    profile = false,
                },
            },
            on_attach = function(bufnr)
                local api = require("nvim-tree.api")
                local vim = require("vim")

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end
                api.config.mappings.default_on_attach(bufnr)
                -- custom mappings
                vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
                vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
                vim.keymap.del("n", "E", { buffer = bufnr })
            end,
        })
    end,
}
