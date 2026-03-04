return {
    'nvim-lualine/lualine.nvim',
    after = "ellisonleao/gruvbox.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local icons = require("configs.theme").icons
        local color_theme = require("configs.theme").palette()

        local diff_config = {
            "diff",
            colored = true, -- Displays a colored diff status if set to true
            diff_color = {
                -- Same color values as the general color option can be used here.
                added = { fg = color_theme.bright_green },                                                              -- Changes the diff's added color
                modified = { fg = color_theme.bright_yellow },                                                          -- Changes the diff's modified color
                removed = { fg = color_theme.bright_red },                                                              -- Changes the diff's removed color you
            },
            symbols = { added = icons.Added .. " ", modified = icons.Modified .. " ", removed = icons.Removed .. " " }, -- Changes the symbols used by the diff.
            source = function()
                local gitsigns = require("vim").b.gitsigns_status_dict
                if gitsigns then
                    return {
                        added = gitsigns.added,
                        modified = gitsigns.changed,
                        removed = gitsigns.removed,
                    }
                end
            end, -- A function that works as a data source for diff.
            -- It must return a table as such:
            --   { added = add_count, modified = modified_count, removed = removed_count }
            -- or nil on failure. count <= 0 won't be displayed.
            color = { gui = "bold" },
        }

        local navic = require("nvim-navic")
        local navic_config = {
            function()
                return navic.get_location({})
            end,
            cond = navic.is_available,
        }

        local lspprog_config = {
            function()
                local messages = require("vim").lsp.util.get_status()
                if #messages == 0 then
                    return ""
                end
                local status = {}
                for _, msg in pairs(messages) do
                    table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
                end
                local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
                local ms = require("vim").loop.hrtime() / 1000000
                local frame = math.floor(ms / 120) % #spinners
                return (table.concat(status, " | ") .. " " .. spinners[frame + 1]) or ""
            end,
            color = { fg = color_theme.bright_yellow },
            separator = "",
        }

        local lspname = {
            function()
                local msg = "󰟢"
                local buf_ft = require("vim").api.nvim_buf_get_option(0, "filetype")
                local clients = require("vim").lsp.get_clients()
                if next(clients) == nil then
                    return msg
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and require("vim").fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                    end
                end
                return msg
            end,
            color = { fg = color_theme.bright_yellow },
        }

        local vim = require("vim")
        -- local mode_symbols = {
        --     ['n']  = 'n',  -- Normal
        --     ['no'] = 'no', -- Operator-pending
        --     ['v']  = 'v',  -- Visual
        --     ['V']  = 'V',  -- Visual Line
        --     ['^V'] = '^V', -- Visual Block (Ctrl+v)
        --     ['i']  = 'i',  -- Insert
        --     ['ic'] = 'ic', -- Insert completion
        --     ['R']  = 'R',  -- Replace
        --     ['Rv'] = 'Rv', -- Virtual Replace
        --     ['c']  = 'c',  -- Command
        --     ['cv'] = 'cv', -- Vim Ex mode
        --     ['s']  = 's',  -- Select
        --     ['S']  = 'S',  -- Select Line
        --     ['t']  = 't',  -- Terminal
        -- }
        local mode_highlight_config = {
            function()
                local mode = vim.api.nvim_get_mode().mode
                return mode
            end,
            color = { gui = "bold" },
        }

        local buffers_config = {
            "buffers",
            use_mode_colors = false,
            symbols = {
                modified = " ●",
                alternate_file = "",
                directory = " "
            },
            buffers_color = {
                inactive = { bg = '#282828' },
                active = { bg = "#1d2021", gui = "bold", fg = "#fbf1c7" }
            }
        }

        local custom_theme = require("lualine.themes.auto")
        vim.print(
            custom_theme.command.a.fg)
        custom_theme.normal.c.bg = "#282828"
        custom_theme.insert.c.bg = "#282828"
        custom_theme.visual.c.bg = "#282828"
        custom_theme.replace.c.bg = "#282828"
        custom_theme.inactive.c.bg = "#282828"
        custom_theme.command.c.bg = "#282828"
        -- custom_theme.back1.c.bg = "#282828"
        -- custom_theme.fore.c.bg = "#282828"
        -- custom_theme.back2.c.bg = "#282828"

        require("lualine").setup({
            options = { theme = custom_theme },
            globalstatus = true,
            always_show_tabline = true,
            extensions = { "nvim-tree" },
            sections = {
                lualine_a = { mode_highlight_config },
                lualine_b = { { "b:gitsigns_head", icon = "󰘬" }, diff_config, "diagnostics" },
                lualine_c = { navic_config },
                lualine_x = { lspprog_config, lspname, { "filetype", color = { gui = "bold" } } },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            tabline = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { buffers_config },
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'branch' }
            }
        })
    end
}
