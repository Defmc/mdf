options = {silent = true, noremap = true}
-- Line movement
vim.api.nvim_set_keymap("n", "<C-S-Up>", ":m-2<CR>", options)
vim.api.nvim_set_keymap("n", "<C-S-Down>", ":m+1<CR>", options)

-- Tabs
vim.api.nvim_set_keymap("n", "<Tab><Down>", ":tabn<CR>", options)
vim.api.nvim_set_keymap("n", "<Tab><Up>", ":tabp<CR>", options)
vim.api.nvim_set_keymap("n", "<Tab><Right>", ":tabmove +<CR>", options)
vim.api.nvim_set_keymap("n", "<Tab><Left>", ":tabmove -<CR>", options)
vim.api.nvim_set_keymap("n", "<Tab><BS>", ":tabclose<CR>", options)
vim.api.nvim_set_keymap("n", "<Tab>n", ":tabnew<CR>", options)

-- Nvim-Tree
vim.api.nvim_set_keymap("n", "<space>e", ":NvimTreeToggle<CR>", options)

-- Split Manager
vim.api.nvim_set_keymap("n", "<A-Left>", ":vertical resize -5<CR>", options)
vim.api.nvim_set_keymap("n", "<A-Right>", ":vertical resize +5<CR>", options)

-- LSP
vim.api.nvim_set_keymap("n", "<space>", ":lua vim.lsp.diagnostic.show_line_diagnostics()", options)
