--
-- EDITOR SETTINGS
--
local opt = vim.opt
local cmd = vim.cmd

-- NOTE
-- need to port some basic settings to IntelliJ/VsCode rc's

opt.autochdir = true
opt.mouse = 'a'
opt.termguicolors = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true

opt.smartcase = true
opt.ignorecase = true
opt.incsearch = true
opt.hlsearch = false

opt.colorcolumn = '81'
opt.wrap = false
opt.scrolloff = 999

opt.number = true
opt.relativenumber = true
opt.guifont = 'FiraCode NF:h11'

-- NETRW SETTINGS FOR WITHOUT VINEGAR
cmd([[
    let g:netrw_liststyle = 3
    let g:netrw_browse_split = 4

    let g:netrw_winsize = 15
]])
