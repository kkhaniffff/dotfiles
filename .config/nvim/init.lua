vim.g.netrw_banner = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.fileignorecase = true
vim.opt.wildignorecase = true
vim.opt.wildignore:append({ ".git/*", "*/target/*", "*/node_modules/*", "*/dist/*", "*/build/*", "*.o", "*.class" })
vim.opt.grepprg = "rg --vimgrep"
vim.opt.path:append("**")
vim.cmd[[color habamax]]

vim.lsp.config("gopls", {
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_markers = {"go.mod", "go.work", ".git"},
})
vim.lsp.enable("gopls")

vim.keymap.set("n", "<space>,", ":buffers<CR>:buffer<space>")
vim.keymap.set("n", "]q", ":cnext<CR>")
vim.keymap.set("n", "[q", ":cprev<CR>")
vim.keymap.set("n", "<Esc>", "<Esc>:nohlsearch<CR>", { silent = true })
