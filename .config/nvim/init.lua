vim.opt.number = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildignorecase = true
vim.opt.wildignore:append(".git/*")
vim.opt.grepprg = "rg --vimgrep"
vim.opt.path:append("**")
vim.cmd[[color habamax]]
vim.keymap.set("n", "<Esc>", "<Esc>:nohlsearch<CR>", { silent = true })

vim.lsp.config("gopls", {
	cmd = {"gopls"},
	filetypes = {"go", "gomod", "gowork", "gotmpl"},
	root_markers = {"go.mod", "go.work", ".git"},
	settings = {
		gopls = {
			buildFlags = {"-tags=integration"},
		}
	}
})
vim.lsp.enable("gopls")
