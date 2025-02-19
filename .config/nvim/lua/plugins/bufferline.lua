return {
    "akinsho/bufferline.nvim",
    opts = {
        options = {
            mode = "buffers",
            numbers = "none",
            close_command = "bdelete! %d",
            right_mouse_command = "bdelete! %d",
            left_mouse_command = "buffer %d",
            middle_mouse_command = nil,
            indicator = {
                style = "icon",
                icon = "|>",
            },
            buffer_close_icon = "",
            modified_icon = "●",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            name_formatter = function(buf)
                if buf.name:match("%.md") then
                    return require("vim").fn.fnamemodify(buf.name, ":t:r")
                end
            end,
            max_name_length = 18,
            max_prefix_length = 15,
            tab_size = 18,
            diagnostics = "nvim_lsp",
            diagnostics_update_in_insert = false,
            diagnostics_indicator = function(count, level, _, _)
                local icon = level:match("error") and "" or ""
                return icon .. " " .. count
            end,
            offsets = { { filetype = "NvimTree", text = "File Explorer" } },
            color_icons = true,
            show_buffer_icons = true,
            show_buffer_close_icons = false,
            show_close_icon = false,
            show_tab_indicators = true,
            persist_buffer_sort = false,
            separator_style = "",
            enforce_regular_tabs = false,
            always_show_bufferline = true,
            sort_by = "insert_after_current",
            custom_areas = {
                right = function()
                    local result = {}
                    local icons = require("configs.theme").icons
                    local colors = require("configs.theme").get_current_colorscheme()
                    local seve = require("vim").diagnostic.severity
                    local diag = function(sv, icon, color)
                        local count = #require("vim").diagnostic.get(0, { severity = sv })
                        if count ~= 0 then
                            table.insert(
                                result,
                                { text = " " .. icon .. " " .. count, guifg = color, guibg = colors.bg }
                            )
                        end
                    end
                    diag(seve.ERROR, icons.Error, colors.red)
                    diag(seve.WARN, icons.Warn, colors.yellow)
                    diag(seve.HINT, icons.Hint, colors.green)
                    diag(seve.INFO, icons.Info, colors.fg)
                    return result
                end,
            },
            get_element_icon = function(buf)
                return require("nvim-web-devicons").get_icon(buf.name, { default = false })
            end,
        },
    }
}
