return {
    'https://codeberg.org/andyg/leap.nvim',
    keys = {
        { "s",  "<Plug>(leap)",                          desc = "Leap",                          mode = { "n", "x", "o" } },
        { "S",  "<Plug>(leap-from-window)",              desc = "Leap from window",              mode = { "n" } },
        { "gs", "<Plug>(leap-remote)",                   desc = "Leap remote",                   mode = { "n", "o" } },
        { "gS", "<Plug>(leap-remote-linewise)",          desc = "Leap remote linewise",          mode = { "n", "o" } },
        { "ar", "<Plug>(leap-remote-text-object)",       desc = "Leap remote text object",       mode = { "x", "o" } },
        { "ir", "<Plug>(leap-remote-inner-text-object)", desc = "Leap remote inner text object", mode = { "x", "o" } },
        {
            "an",
            function()
                require("leap.treesitter").select()
                require("leap.treesitter").select {
                    opts = require("leap.user").with_traversal_keys('n', 'N')
                }
            end,
            desc = "Treesitter parent node selection",
            mode = { "x", "o" }
        }
    },
    config = function()
        require('leap').opts.preview = function(ch0, ch1, ch2)
            return not (
                ch1:match('%s')
                or (ch0:match('%a') and ch1:match('%a') and ch2:match('%a'))
            )
        end

        -- Enable the traversal keys to repeat the previous search without
        -- explicitly invoking Leap (`<cr><cr>...` instead of `s<cr><cr>...`):
        do
            local clever = require('leap.user').with_traversal_keys
            -- For relative directions, set the `backward` flags according to:
            -- local prev_backward = require('leap').state['repeat'].backward
            vim.keymap.set({ 'n', 'x', 'o' }, '<cr>', function()
                require('leap').leap {
                    ['repeat'] = true, opts = clever('<cr>', '<bs>'),
                }
            end)
            vim.keymap.set({ 'n', 'x', 'o' }, '<bs>', function()
                require('leap').leap {
                    ['repeat'] = true, opts = clever('<bs>', '<cr>'), backward = true,
                }
            end)
        end
    end
}
