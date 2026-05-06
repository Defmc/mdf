return {
    'nvim-lualine/lualine.nvim',
    after = "ellisonleao/gruvbox.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons', "onsails/lspkind.nvim" },
    config = function()
        -- Eviline config for lualine
        -- Author: shadmansaleh
        -- Credit: glepnir
        local lualine = require('lualine')

        -- Color table for highlights
        local color_theme = require("configs.theme").palette()
        local colors = {
            bg       = color_theme.dark0,
            fg       = color_theme.light3,
            yellow   = color_theme.bright_yellow,
            cyan     = color_theme.bright_cyan,
            darkblue = color_theme.neutral_blue,
            green    = color_theme.bright_green,
            orange   = color_theme.bright_orange,
            violet   = color_theme.faded_purple,
            magenta  = color_theme.neutral_red,
            blue     = color_theme.bright_blue,
            red      = color_theme.bright_red,
        }

        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
            end,
            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,
            check_git_workspace = function()
                local filepath = vim.fn.expand('%:p:h')
                local gitdir = vim.fn.finddir('.git', filepath .. ';')
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
        }

        -- Config
        local config = {
            options = {
                -- Disable sections and component separators
                component_separators = '',
                section_separators = '',
                theme = {
                    -- We are going to use lualine_c an lualine_x as left and
                    -- right section. Both are highlighted by c theme .  So we
                    -- are just setting default looks o statusline
                    normal = { c = { fg = colors.fg, bg = colors.bg } },
                    inactive = { c = { fg = colors.fg, bg = colors.bg } },
                },
            },
            sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                -- These will be filled later
                lualine_c = {},
                lualine_x = {},
            },
            inactive_sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                lualine_c = {},
                lualine_x = {},
            },
        }

        -- Inserts a component in lualine_c at left section
        local function ins_left(component)
            table.insert(config.sections.lualine_c, component)
        end

        -- Inserts a component in lualine_x at right section
        local function ins_right(component)
            table.insert(config.sections.lualine_x, component)
        end

        local mode_map = {
            ['n'] = 'NORMAL',
            ['no'] = 'N·OP',
            ['nov'] = 'N·OP',
            ['v'] = 'VISUAL',
            ['V'] = 'V·LINE',
            ['\22'] = 'V·BLCK',
            ['i'] = 'INSERT',
            ['ic'] = 'INSERT',
            ['ix'] = 'INSERT',
            ['R'] = 'REPLACE',
            ['Rv'] = 'V·RPLC',
            ['c'] = 'COMMAND',
            ['cv'] = 'EX',
            ['s'] = 'SELECT',
            ['S'] = 'S·LINE',
            ['\19'] = 'S·BLCK',
            ['t'] = 'TERM',
        }

        local mode_colors = {
            NORMAL     = "#51afef",
            INSERT     = "#98be65",
            VISUAL     = "#c678dd",
            ['V·LINE'] = "#c678dd",
            ['V·BLCK'] = "#c678dd",
            REPLACE    = "#ff6c6b",
            COMMAND    = "#ecbe7b",
            TERM       = "#98be65",
        }

        local colored_mode = function()
            local raw = vim.api.nvim_get_mode().mode
            local label = mode_map[raw] or raw:upper()
            return { bg = colors.bg, fg = mode_colors[label] or "#51afef", gui = "bold" }
        end

        ins_left {
            function()
                return '▊'
            end,
            color = colored_mode,              -- Sets highlighting of component
            padding = { left = 0, right = 1 }, -- We don't need space before this
        }

        ins_left {
            function()
                local raw = vim.api.nvim_get_mode().mode
                return mode_map[raw] or raw:upper()
            end,
            color = colored_mode,
            separator = { left = '', right = '' },
            padding = { right = 0 },
        }

        ins_left { 'location' }

        ins_left {
            'filename',
            cond = conditions.buffer_not_empty,
            color = { fg = colors.magenta, gui = 'bold' },
        }

        local navic = require("nvim-navic")
        ins_left {
            function()
                return "> " + navic.get_location({})
            end,
            cond = function()
                return navic.is_available()
            end
        }

        -- Insert mid section. You can make any number of sections in neovim :)
        -- for lualine it's any number greater then 2
        ins_left {
            function()
                return '%='
            end,
        }

        ins_right {
            'filetype',
            icon_only = true,
            colored = true,
            padding = { right = 0 }
        }

        ins_right {
            -- Lsp server name .
            function()
                local msg = ''
                local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
                local clients = vim.lsp.get_clients()
                if next(clients) == nil then
                    return msg
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                    end
                end
                return msg
            end,
            color = { fg = colors.yellow, gui = 'bold' },
            padding = { left = 0 }
        }

        ins_right {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ' },
            diagnostics_color = {
                error = { fg = colors.red },
                warn = { fg = colors.yellow },
                info = { fg = colors.cyan },
            },
        }

        ins_right {
            'branch',
            icon = '',
            color = { fg = colors.violet, gui = 'bold' },
        }

        ins_right {
            'diff',
            -- Is it me or the symbol for modified us really weird
            symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
            diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.orange },
                removed = { fg = colors.red },
            },
            cond = conditions.hide_in_width,
        }

        ins_right {
            function()
                return '▊'
            end,
            color = colored_mode,
            padding = { left = 1 },
        }

        -- Now don't forget to initialize lualine
        lualine.setup(config)
    end
}
