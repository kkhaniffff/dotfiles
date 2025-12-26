-- Options
vim.g.mapleader = " "
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.fileignorecase = true
vim.opt.wildignorecase = true
vim.opt.clipboard = "unnamedplus"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.path:append("**")
vim.opt.termguicolors = true
vim.cmd[[colorscheme habamax]]

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    pattern = "[^l]*",
    command = "cwindow"
})

-- LSP
vim.lsp.config("rust-analyzer", {
  cmd = {"rust-analyzer"},
  filetypes = {"rust"},
  root_markers = {"Cargo.toml", ".git"},
})

vim.lsp.enable("rust-analyzer")

-- Keymaps
local map = vim.keymap.set
map("n", "<leader><leader>", ":find<space>", { desc = "Find files" })
map("n", "<leader>,", ":buffers<CR>:buffer<space>", { desc = "Show buffers" })
map("n", "<leader>/", ":silent grep<space>", { desc = "Live grep" })
map("n", "<leader>q", ":copen<CR>")
map("n", "]q", ":cnext<CR>")
map("n", "[q", ":cprev<CR>")
map("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Show implementations" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "ga", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<Esc>", "<Esc>:nohlsearch<CR>", { silent = true })
