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
vim.opt.clipboard = "unnamedplus"
vim.opt.path = vim.opt.path + "**"

-- LSP
vim.lsp.config("rust-analyzer", {
  cmd = {"rust-analyzer"},
  filetypes = {"rust"},
  root_markers = {"Cargo.toml", ".git"},
})

vim.lsp.enable("rust-analyzer")

-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = { 
        {
            "nvim-telescope/telescope.nvim", 
            tag = "v0.2.0",
            dependencies = {
                "nvim-lua/plenary.nvim"
            }
        },
        {
            "catppuccin/nvim",
            name = "catppuccin",
            priority = 1000
        },
    },
    checker = { enabled = true },
})

-- Colorscheme
vim.opt.termguicolors = true
vim.cmd[[colorscheme catppuccin-frappe]]

-- Keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>,", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Telescope LSP references" })
vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Telescope LSP implementations" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP definition" })
