local map = vim.keymap.set

map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
map({ "i", "v" }, "<C-c>", "<Esc>", { noremap = true })
