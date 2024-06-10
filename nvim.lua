-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- LSP Support
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'hrsh7th/cmp-nvim-lsp-signature-help'},
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional
      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'} -- Optional
    }
  }

  -- Useful status updates for LSP
  use 'j-hui/fidget.nvim'

  -- Debug utils
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }

  -- General UI improvements
  -- colorschemes repository
  use 'flazz/vim-colorschemes'
  -- Fancier statusline
  use 'nvim-lualine/lualine.nvim'
  -- fancy devicons
  use 'kyazdani42/nvim-web-devicons'
  -- directory file system tree
  use 'scrooloose/nerdtree'
  -- make comments
  use 'scrooloose/nerdcommenter'

  -- treesitter doesn't support emblem, so syntax package is required
  use 'yalesov/vim-emblem'

  use {
    "nvim-neotest/neotest",
    requires = {
      'vim-test/vim-test',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'olimorris/neotest-rspec',
      'zidhuss/neotest-minitest',
      'jfpedroza/neotest-elixir',
      'weilbith/neotest-gradle'
    }
  }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }

  use {
    "olexsmir/gopher.nvim",
    requires = { -- dependencies
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  }

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})


-- [[General settings]]
vim.cmd [[syntax on]]

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

vim.o.updatetime=100

-- clipboard
vim.cmd([[
  if system('uname -s') == "Darwin\n"
    set clipboard=unnamed "OSX
  else
    set clipboard=unnamedplus "Linux
  endif
]])


-- Setting up the directories
vim.cmd([[
  set directory=$HOME/.vim/tmp/
  set nobackup
  set nowritebackup
]])


-- always show signcolumns
vim.o.signcolumn = 'yes'

--Set completeopt to have a better completion experience
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300)

-- [[Colorscheme]]
vim.o.termguicolors = true
vim.o.background    = 'dark'
vim.cmd [[colorscheme gruvbox]]
vim.cmd [[let g:gruvbox_italic=1]]

-- [[Formating]]

-- wrap long lines
vim.o.wrap = true

-- indent at the same level of the previous line
vim.o.autoindent = true

-- smart autoindenting for C programs
vim.o.smartindent = true

-- use indents of 2 spaces
vim.o.shiftwidth = 2

-- don't use tabs
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2

vim.cmd([[
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+$/
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
]])

vim.cmd([[autocmd FileType ruby setlocal indentkeys-=.]])

vim.cmd [[let g:python3_host_prog = "$HOME/.asdf/shims/python3"]]

-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox'
  },
}

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      n = {
        ['<c-d>'] = require('telescope.actions').delete_buffer
      }, -- n
      i = {
        ["<C-h>"] = "which_key",
        ['<c-d>'] = require('telescope.actions').delete_buffer
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })


vim.keymap.set('n', 'j', 'gj', { noremap = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true })

-- No more esc
vim.keymap.set('n', '<C-C>', '<Esc>', { noremap = true })

-- Fast saving
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true })

-- NERDTree
vim.keymap.set('n', '<leader>nt', ':NERDTreeToggle<CR>', { noremap = true })

-- Toggle theme
vim.keymap.set('n', '<leader>bg', ':let &background = (&background == "dark" ? "light" : "dark")<CR>', { noremap = true })

-- vim-test
vim.keymap.set('n', '<leader>t', ':TestNearest<CR>', { noremap = true })
vim.keymap.set('n', '<leader>tf', ':TestFile<CR>', { noremap = true })
vim.keymap.set('n', '<leader>ta', ':TestSuite<CR>', { noremap = true })
vim.keymap.set('n', '<leader>tl', ':TestLast<CR>', { noremap = true })
vim.keymap.set('n', '<leader>tg', ':TestVisit<CR>', { noremap = true })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'javascript', 'ruby', 'lua', 'elixir', 'rust', 'typescript', 'vimdoc', 'vim', 'go', 'zig', 'kotlin' },

  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

--- Setup LSP
local lsp_zero = require('lsp-zero')
lsp_zero.preset('recommended')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})

  local opts = {buffer = bufnr, remap = false}
  local bind = vim.keymap.set

  bind("n", "gd", function() vim.lsp.buf.definition() end, opts)
  bind("n", "K", function() vim.lsp.buf.hover() end, opts)
  bind("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
  bind("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
  bind("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  bind("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  bind("n", "<leader>ra", function() vim.lsp.buf.code_action() end, opts)
  bind("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
  bind("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  bind("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp_zero.format_on_save({
  format_opts = {
    async = true,
    timeout_ms = 10000,
  },
  servers = {
    ['rust_analyzer'] = {'rust'},
    ['tsserver'] = {'javascript', 'typescript'},
    ['standardrb'] = {'ruby'},
    ['ktlint'] = {'kotlin'},
    ['gopls'] = {'go', 'gomod', 'gotpml', 'gowork'}
  }
})

lsp_zero.setup()

-- nvim-cmp setup
local cmp = require('cmp')
local luasnip = require('luasnip')

require('luasnip.loaders.from_vscode').lazy_load()

local util = require("lspconfig/util")
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

----- Setup mason so it can manage external tooling
require('mason').setup()
require("mason-lspconfig").setup({
  ensure_installed = {'tsserver', 'rust_analyzer', 'ruby_lsp', 'standardrb', 'html', 'gopls'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
    html = function()
      require('lspconfig').html.setup({
        filetypes = {'html', 'erb', 'html-eex', 'eruby'},
      })
    end,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
    gopls = function()
      require('lspconfig').gopls.setup({
        capabilities = lsp_capabilities,
        filetypes = {'go', 'gomod', 'gotpml', 'gowork'},
        cmd = {"gopls"},
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true
            }
          }
        }
      })
    end
  },
})

local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-3),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip', keyword_length = 2 },
    {
      name = 'buffer',
      keyword_length = 3,
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    },
    { name = 'nvim_lua'},
    { name = 'path' },
    { name = 'treesitter' },
    { name = 'calc'}
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = {'menu', 'abbr', 'kind'},
    format = function(entry, item)
      local menu_icon ={
        nvim_lsp = '[LSP]',
        luasnip = '[Snip]',
        buffer = '[Buffer]',
        path = '[Path]',
      }
      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
})

-- Debug utils
require("dapui").setup()

-- neotest
require("neotest").setup({
  adapters = {
    require("neotest-rspec")({
      dap = { justMyCode = false },
    }),
  },
})

require("gopher").setup {
  commands = {
    go = "go",
    gomodifytags = "gomodifytags",
    gotests = "~/go/bin/gotests", -- also you can set custom command path
    impl = "impl",
    iferr = "iferr",
  },
}
