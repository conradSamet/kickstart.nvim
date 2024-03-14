return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git statusbarbar
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    opts = {},
    init = function()
      vim.g.barbar_auto_setup = false

      local opts = { noremap = true, silent = true }
      local map = function(mode, lhs, rhs, options, additional_options)
        vim.keymap.set(mode, lhs, rhs, vim.tbl_extend('force', options, additional_options or {}))
      end

      -- Move to previous/next
      map('n', '<A-,>', ':BufferPrevious<CR>', opts)
      map('n', '<A-.>', ':BufferNext<CR>', opts)
      -- Re-order to previous/next
      map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
      map('n', '<A->>', ':BufferMoveNext<CR>', opts)
      -- Pin/unpin buffer
      map('n', '<A-p>', ':BufferPin<CR>', opts)
      -- Close buffer
      map('n', '<A-c>', ':BufferClose<CR>', opts)
      -- Wipeout buffer
      --                 :BufferWipeout
      -- Close commands
      --                 :BufferCloseAllButCurrent
      --                 :BufferCloseAllButPinned
      --                 :BufferCloseAllButCurrentOrPinned
      --                 :BufferCloseBuffersLeft
      --                 :BufferCloseBuffersRight
      -- Magic buffer-picking mode
      map('n', '<leader>bp', ':BufferPick<CR>', opts)
      -- Sort automatically by...
      map('n', '<leader>bb', ':BufferOrderByBufferNumber<CR>', opts, { desc = '[B]uffer order by [B]uffer number' })
      map('n', '<leader>bd', ':BufferOrderByDirectory<CR>', opts, { desc = '[B]uffer order by [D]irectory' })
      map('n', '<leader>bl', ':BufferOrderByLanguage<CR>', opts, { desc = '[B]uffer order by [L]anguage' })
      map('n', '<leader>bw', ':BufferOrderByWindowNumber<CR>', opts, { desc = '[B]uffer order by [W]indow number' })

      -- Other:
      -- :BarbarEnable - enables barbar (enabled by default)
      -- :BarbarDisable - very bad command, should never be used
    end,
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}
