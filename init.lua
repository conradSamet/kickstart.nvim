--[[

=====================================================================
==================== read this before continuing ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         ||                    ||   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||   kickstart.nvim   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

what is kickstart?


  kickstart.nvim is *not* a distribution.

  kickstart.nvim is a starting point for your own configuration.
    the goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    once you've done that, you can start exploring, configuring and tinkering to
    make neovim your own! that might mean leaving kickstart just the way it is for a while
    or immediately breaking it into modular pieces. it's up to you!

    if you don't know anything about lua, i recommend taking some time to read through
    a guide. one possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    after understanding a bit more about lua, you can use `:help lua-guide` as a
    reference for how neovim integrates lua.
    - :help lua-guide
    - (or html version): https://neovim.io/doc/user/lua-guide.html

kickstart guide:

  todo: the very first thing you should do is to run the command `:tutor` in neovim.

    if you don't know what this means, type the following:
      - <escape key>
      - :
      - tutor
      - <enter key>

    (if you already know the neovim basics, you can skip this step.)

  once you've completed that, you can continue working through **and reading** the rest
  of the kickstart init.lua.

  next, run and read `:help`.
    this will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    this should be the first place you go to look when you're stuck or confused
    with something. it's one of my favorite neovim features.

    most importantly, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  i have left several `:help x` comments throughout the init.lua
    these are hints about where to find more information about the relevant settings,
    plugins or neovim features used in kickstart.

   note: look for lines like this

    throughout the file. these are for you, the reader, to help you understand what is happening.
    feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your neovim config.

if you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

i hope you enjoy your neovim journey,
- tj

p.s. you can delete this when you're done too. it's your config now! :)
--]]

-- set <space> as the leader key
-- see `:help mapleader`
--  note: must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- set to true if you have a nerd font installed
vim.g.have_nerd_font = true

-- [[ setting options ]]
-- see `:help vim.opt`
-- note: you can change these options as you wish!
--  for more options, you can see `:help option-list`

-- make line numbers default
vim.opt.number = true
-- you can also add relative line numbers, to help with jumping.
--  experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- sync clipboard between os and neovim.
--  remove this option if you want your os clipboard to remain independent.
--  see `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- enable break indent
vim.opt.breakindent = true

-- save undo history
vim.opt.undofile = true

-- case-insensitive searching unless \c or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- decrease update time
vim.opt.updatetime = 250

-- decrease mapped sequence wait time
-- displays which-key popup sooner
vim.opt.timeoutlen = 300

-- configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.wrap = true

-- configure the tab size
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.expandtab = false

-- sets how neovim will display certain whitespace characters in the editor.
--  see `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { eol = '↲', tab = '▷ ', trail = '·' }

-- preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- show which line your cursor is on
vim.opt.cursorline = true

-- minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.swapfile = false
-- [[ basic keymaps ]]
--  see `:help vim.keymap.set()`
-- move lines up and down
vim.keymap.set('n', '<a-j>', ':m .+1<cr>==', { desc = 'move line down', silent = true })
vim.keymap.set('n', '<a-k>', ':m .-2<cr>==', { desc = 'move line up', silent = true })
vim.keymap.set('v', '<a-j>', ":m '>+1<cr>gv=gv", { desc = 'move line down', silent = true })
vim.keymap.set('v', '<a-k>', ":m '<-2<cr>gv=gv", { desc = 'move line up', silent = true })
--
-- set highlight on search, but clear on pressing <esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>')

-- diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'go to previous [d]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'go to next [d]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'show diagnostic [e]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'open diagnostic [q]uickfix list' })

-- exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. otherwise, you normally need to press <c-\><c-n>, which
-- is not what someone will guess without a bit more experience.
--
-- note: this won't work in all terminal emulators/tmux/etc. try your own mapping
-- or just use <c-\><c-n> to exit terminal mode
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'exit terminal mode' })

-- tip: disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "use h to move!!"<cr>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "use l to move!!"<cr>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "use k to move!!"<cr>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "use j to move!!"<cr>')

-- keybinds to make split navigation easier.
--  use ctrl+<hjkl> to switch between windows
--
--  see `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<c-h>', '<c-w><c-h>', { desc = 'move focus to the left window' })
vim.keymap.set('n', '<c-l>', '<c-w><c-l>', { desc = 'move focus to the right window' })
vim.keymap.set('n', '<c-j>', '<c-w><c-j>', { desc = 'move focus to the lower window' })
vim.keymap.set('n', '<c-k>', '<c-w><c-k>', { desc = 'move focus to the upper window' })

-- [[ basic autocommands ]]
--  see `:help lua-guide-autocommands`

-- highlight when yanking (copying) text
--  try it with `yap` in normal mode
--  see `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('textyankpost', {
  desc = 'highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
  desc = 'start in insert mode if file is new or empty',
  group = vim.api.nvim_create_augroup('empty-file', { clear = true }),
  pattern = '*',
  callback = function()
    if vim.api.nvim_buf_line_count(0) == 1 and vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] == '' then
      vim.cmd 'startinsert!'
    end
  end,
})

-- [[ install `lazy.nvim` plugin manager ]]
--    see `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ configure and install plugins ]]
--
--  to check the current status of your plugins, run
--    :lazy
--
--  you can press `?` in this menu for help. use `:q` to close the window
--
--  to update plugins you can run
--    :lazy update
--
-- note: here is where you install your plugins.
require('lazy').setup({
  'tpope/vim-sleuth', -- detect tabstop and shiftwidth automatically
  { 'numToStr/Comment.nvim', opts = {} },
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      local tokyonight = require 'tokyonight'
      tokyonight.setup {
        transparent = true,
      }
      -- Load the colorscheme here
      vim.cmd.colorscheme 'tokyonight-night'
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'echasnovski/mini.nvim',
    config = function()
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },

  require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
