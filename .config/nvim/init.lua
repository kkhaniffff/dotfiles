-- Options
vim.g.mapleader = " "
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

-- Theme
local colors = {
  foreground = "#d0d0d0",
  background = "#1e1e1e",
  selection = "#494e56",
  comment = "#a8a8a8",
  red = "#cc6766",
  orange = "#de945f",
  green = "#b6bd68",
  teal = "#8abeb7",
  purple = "#b294bc",
}

local hl = vim.api.nvim_set_hl
hl(0, "Normal", { fg = colors.foreground, bg = colors.background })
hl(0, "NormalFloat", { fg = colors.foreground, bg = colors.background })
hl(0, "LineNr", { fg = colors.selection })
hl(0, "Search", { fg = colors.background, bg = colors.orange })
hl(0, "Visual", { bg = colors.selection })
hl(0, "Directory", { fg = colors.teal })
hl(0, "WarningMsg", { fg = colors.red })
hl(0, "Folded", { fg = colors.comment })
hl(0, "QuickFixLine", { bg = colors.selection })
hl(0, "Type", { fg = colors.orange })
hl(0, "Comment", { fg = colors.comment, italic = true })
hl(0, "Identifier", { fg = colors.foreground })
hl(0, "Statement", { fg = colors.purple })
hl(0, "Function", { fg = colors.foreground })
hl(0, "Constant", { fg = colors.orange })
hl(0, "Character", { fg = colors.green })
hl(0, "String", { fg = colors.green })
hl(0, "Special", { fg = colors.foreground })
hl(0, "Structure", { fg = colors.foreground })
hl(0, "@function", { fg = colors.teal })
hl(0, "@lsp.type.variable", { fg = colors.foreground })
hl(0, "@lsp.type.struct", { fg = colors.orange })
hl(0, "@lsp.type.namespace", { fg = colors.foreground })
hl(0, "@lsp.type.enumMember", { fg = colors.foreground })
