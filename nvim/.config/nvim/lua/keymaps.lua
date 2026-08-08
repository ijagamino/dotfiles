local map = vim.keymap.set

vim.g.mapleader = " "
map("n", "<C-d>", "<C-d>zz") -- Scroll down and center the cursor
map("n", "<C-u>", "<C-u>zz") -- Scroll up and center the cursor
map("n", "n", "nzzzv") -- Next and center the cursor
map("n", "N", "Nzzzv") -- Previous and center the cursor
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
