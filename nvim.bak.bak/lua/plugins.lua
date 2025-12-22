--
-- PLUGINS
--
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/AppData/Local/nvim-data/plugged')

Plug 'tomasr/molokai'
Plug 'itchyny/lightline.vim'

Plug 'glepnir/dashboard-nvim'
Plug 'ahmedkhalf/project.nvim'

Plug('neoclide/coc.nvim', { branch = 'release' })

Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/toggleterm.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'jiangmiao/auto-pairs'

Plug 'lewis6991/gitsigns.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-orgmode/orgmode'

Plug 'ThePrimeagen/vim-be-good'

vim.call('plug#end')

-- 
-- INITIALIZATION
--
require('telescope').setup{ 
    defaults = { 
        file_ignore_patterns = {'node_modules', '.git', '.idea'} 
    } 
}
require('telescope').load_extension('projects')
require('toggleterm').setup{}
require('gitsigns').setup{}
require('project_nvim').setup {}
require('nvim-web-devicons').setup{}
require('nvim-tree').setup{}

-- org TS parser
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = { 'src/parser.c', 'src/scanner.cc' },
  },
  filetype = 'org',
}

-- orgmode
-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/org/refile.org',
})

-- dashboard

local db = require('dashboard')

db.custom_header = {
 '                                                       ',
 ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
 ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
 ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
 ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
 ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
 ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
 '                                                       ',
 '                                                       '
}

db.custom_center = {
    {
        desc = 'Find a project          ',
        shortcut = 'SPC f p'
    },
    {
        desc = 'Edit my config          ',
        shortcut = 'SPC e c'
    },
    {
        desc = 'Blank buffer            ',
        shortcut = 'SPC e e'
    }
}

db.custom_footer = {
    '                               ',
    "<== Seth's custom config :p ==>"
}

