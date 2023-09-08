-- vim.opt.tabstop = 2
-- vim.opt.shiftwidth = 2
-- vim.opt.expandtab = true
-- vim.bo.softtabstop = 2
-- vim.cmd [[set mouse=a]]

-- vim.g.mapleader = ','

vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("n", "<leader>sh", ":Gitsigns stage_hunk<CR>", { noremap = true })

vim.keymap.set("n", "<leader>tO", ":OverseerToggle<CR>", { noremap = true })

vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
-- vim.keymap.set("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })
-- vim.keymap.set("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")

--vim.auto ColorScheme * hi CocUnusedHighlight ctermbg=NONE guibg=NONE guifg=#808080
-- vim.cmd([[nnoremap \ :Neotree<cr>]])
vim.keymap.set('n', '<C-s>', '<CMD>w<CR>', { desc = 'Save' })
-- vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
-- vim.keymap.set('n',  "<CR>" , "<CMD>Telescope <CR>", {desc ="Open Telescope" })
vim.keymap.set('n',  "<C-p>" , "<CMD>Telescope find_files hidden=false<CR>", {desc ="Find files" })
vim.keymap.set('n',  "<C-S-F>" , "<CMD>Telescope live_grep hidden=true<CR>", {desc ="Live grep" })
vim.keymap.set('n',  "<leader>fk" , "<CMD>Telescope keymaps<CR>", {desc ="Show keys" })
vim.keymap.set('n',  "<leader>fg" , "<CMD>Telescope git_commits<CR>", {desc ="Git commits" })
vim.keymap.set('n',  "<C-g>" , "<CMD>Telescope git_status<CR>", {desc ="Git status" })

vim.keymap.set('n',  "<C-e>" , "<CMD>Neotree toggle reveal<CR>", {desc ="Neotree toggle" })

require'lspconfig'.volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}

vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

return {}
