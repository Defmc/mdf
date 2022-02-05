require('bufferline').setup {
  options = {
    numbers = "none",
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    name_formatter = function(buf)
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "left"}},
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = false,
    show_tab_indicators = false,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "slant",
    enforce_regular_tabs = true,
    always_show_bufferline = false,
    custom_areas = {
      right = function()
        local result = {}
        local error = vim.diagnostic.get("Error")
        local warning = vim.diagnostic.get("Warning")
        local info = vim.diagnostic.get("Information")
        local hint = vim.diagnostic.get("Hint")

        if error ~= 0 then
          table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
        end

        if warning ~= 0 then
          table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
        end

        if hint ~= 0 then
          table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
        end

        if info ~= 0 then
          table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
        end
        return result
      end,
    },
    sort_by = function(buffer_a, buffer_b)
      -- add custom logic
      return buffer_a.id > buffer_b.id
    end,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
  }
}
