--
-- PLUGINS
--
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- is this redundant because of mini.nvim?
Plug 'RRethy/nvim-base16'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-lualine/lualine.nvim'

Plug 'glepnir/dashboard-nvim'
Plug 'ahmedkhalf/project.nvim'

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

Plug ('neoclide/coc.nvim', { branch = 'release' })

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'

Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'alvan/vim-closetag'

Plug 'lewis6991/gitsigns.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter'

-- Plug 'ThePrimeagen/vim-be-good'

-- Plug 'RishabhRD/popfix'
-- Plug 'RishabhRD/nvim-cheat.sh'
Plug 'folke/which-key.nvim'

-- Plug 'hkupty/iron.nvim'

Plug 'christoomey/vim-tmux-navigator'
Plug 'mboughaba/i3config.vim'

-- diy plugin playground
-- Plug 'C:/Users/zvm5w1b/repos/MakeCharBlob'
-- expand on this

vim.call('plug#end')

--
-- INITIALIZATION
--
require('telescope').setup{
    defaults = {
        file_ignore_patterns = {'node_modules', '.git', '.idea', 'dist'}
    },
    extensions = {
        file_browser = {
            hijack_netrw = true
        },
        ['ui-select'] = {
            require('telescope.themes').get_dropdown{}
        }
    }
}
require('telescope').load_extension('projects')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('ui-select')

require('gitsigns').setup{}
require('project_nvim').setup{}
require('nvim-web-devicons').setup{}
require('which-key').setup{}

-- lualine
require('lualine').setup{
    sections = {
        lualine_c = {},
        lualine_x = {'filetype'}
    }
}

-- treesitter
require('nvim-treesitter.configs').setup {
    -- these have to be explicitly enabled
    ensure_installed = {
        "go",
        "c",
        "javascript",
        "typescript",
        "lua",
        "java",
    },
    highlight = {
        enable = true
    }
}

-- bufferline
require('bufferline').setup {
    options = {
        mode = 'tabs'
    }
}

-- dashboard
local db = require('dashboard').setup({
    theme = 'doom',
    config = {
        header = {

    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣴⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⣿⣛⢻⡿⢛⡙⢿⣿⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⢹⣻⣾⡷⠸⠇⣼⣿⡄⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⢸⢿⣍⣤⣶⠟⢻⡟⣷⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⣤⡟⠀⠈⠁⠀⠀⠈⢿⣿⣧⡀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⢀⣾⡿⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣆⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⣾⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣄⠀⠀⠀',
    '⠀⠀⠀⠀⣼⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⠀⠀⠀',
    '⠀⠀⠀⢀⠟⢿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⠀⠀⠀',
    '⠀⡔⠒⠋⠀⠀⢻⣶⣄⠀⠀⠀⠀⠀⠀⠀⣶⣿⣿⣿⠟⠆⠀⠀',
    '⠀⣹⠀⠀⠀⠀⠀⢻⡟⠀⠀⠀⠀⠀⢀⣴⣿⠟⠛⠃⠀⠈⣀⠄',
    '⠰⠿⣴⣄⣄⣀⣀⣢⣿⣶⣦⣴⣶⣾⣿⣿⣿⢀⣠⣤⠴⠚⠁⠀',
    '⠀⠀⠀⠀⠉⠙⠛⠿⠛⠁⠀⠀⠀⠀⠀⠘⠻⠿⠛⠁⠀⠀⠀⠀',
    '                        '
        },
        center = {
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
        },
        footer = {
            '                               ',
            "<== Seth's custom config :3 ==>"
        }
    }
})


-- db.setup(); this is broken currently

