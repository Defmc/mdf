options = {silent = true, noremap = true}
-- Line movement
vim.api.nvim_set_keymap("n", "<C-S-Up>", ":m-2<CR>", options)
vim.api.nvim_set_keymap("n", "<C-S-Down>", ":m+1<CR>", options)

-- Tabs
vim.api.nvim_set_keymap("n", "<Tab><Down>", ":BufferLineCycleNext<CR>", options)
vim.api.nvim_set_keymap("n", "<Tab><Up>", ":BufferLineCyclePrev<CR>", options)
vim.api.nvim_set_keymap("n", "<Tab><Right>", ":tabmove +<CR>", options)
vim.api.nvim_set_keymap("n", "<Tab><Left>", ":tabmove -<CR>", options)
vim.api.nvim_set_keymap("n", "<Tab><BS>", ":tabclose<CR>", options)
vim.api.nvim_set_keymap("n", "<Tab>n", ":tabnew<CR>", options)
vim.api.nvim_set_keymap("n", "<Tab>q", ":bdelete<CR>", options)

-- Nvim-Tree
vim.api.nvim_set_keymap("n", "<space>e", ":NvimTreeToggle<CR>", options)

-- Split Manager
vim.api.nvim_set_keymap("n", "<A-Left>", ":vertical resize -5<CR>", options)
vim.api.nvim_set_keymap("n", "<A-Right>", ":vertical resize +5<CR>", options)
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", options);