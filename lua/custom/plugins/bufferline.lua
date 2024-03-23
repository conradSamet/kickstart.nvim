return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      mode = 'buffers',
      numbers = 'none',
      sort_by = 'directory',
      middle_mouse_command = 'bdelete! %d',
      right_mouse_command = nil,
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Neo-Tree',
          text_align = 'center',
        },
      },
    },
  },
  init = function()
    vim.opt.termguicolors = true

    local opts = { noremap = true, silent = true }

    local map = function(mode, lhs, rhs, options, additional_options)
      vim.keymap.set(mode, lhs, rhs, vim.tbl_extend('force', options, additional_options or {}))
    end

    -- Tab/Buffers navigation
    map('n', '<A-.>', ':tabnext<CR>', opts, { desc = { '[T]ab Next' } })
    map('n', '<A-,>', ':tabprevious<CR>', opts, { desc = { '[T]ab Previous' } })
    map('n', '<A-<>', ':tabmove -1<CR>', opts, { desc = { '[T]ab Move Previous' } })
    map('n', '<A->>', ':tabmove +1<CR>', opts, { desc = { '[T]ab Move Next' } })
    map('n', '<A-c>', ':tabclose<CR>', opts, { desc = { '[T]ab Close' } })

    map('n', '<tab>', ':bnext<CR>', opts, { desc = { '[B]uffer Next' } })
    map('n', '<S-tab>', ':bprevious<CR>', opts, { desc = { '[B]uffer Previous' } })
    map('n', '<leader>bd', ':bdelete<CR>', opts, { desc = { '[B]uffer [D]elete' } })
    map('n', '<leader>bn', ':bnext<CR>', opts, { desc = { '[B]uffer [N]ext' } })
    map('n', '<leader>bp', ':bprevious<CR>', opts, { desc = { '[B]uffer [P]revious' } })

    require 'custom.utils.bufferline'
  end,
}
