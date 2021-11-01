local keymap = {}

function keymap.setup()
    -- Line movement
    vim.api.nvim_set_keymap("n", "<C-S-Up>", ":m-2<CR>", {silent = true, noremap = true})
    vim.api.nvim_set_keymap("n", "<C-S-Down>", ":m+1<CR>", {silent = true, noremap = true})

    -- Tabs
    vim.api.nvim_set_keymap("n", "<Tab><Down>", ":tabn<CR>", {silent = true, noremap = true})
    vim.api.nvim_set_keymap("n", "<Tab><Up>", ":tabp<CR>", {silent = true, noremap = true})
    vim.api.nvim_set_keymap("n", "<Tab><Right>", ":tabmove +<CR>", {silent = true, noremap = true})
    vim.api.nvim_set_keymap("n", "<Tab><Left>", ":tabmove -<CR>", {silent = true, noremap = true})
    vim.api.nvim_set_keymap("n", "<Tab><BS>", ":tabclose<CR>", {silent = true, noremap = true})
    vim.api.nvim_set_keymap("n", "<Tab>n", ":tabnew<CR>", {silent = true, noremap = true})

    -- Nvim-Tree
    vim.api.nvim_set_keymap("n", "<space>e", ":NvimTreeToggle<CR>", {silent = true, noremap = true})

    -- Split Manager
    vim.api.nvim_set_keymap("n", "<A-Left>", ":vertical resize -5<CR>", {silent = true, noremap = true})
    vim.api.nvim_set_keymap("n", "<A-Right>", ":vertical resize +5<CR>", {silent = true, noremap = true})
end

return keymap
