return {
  'mbbill/undotree',
  opts = {},
  config = function()
    vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true, silent = true, desc = '[U]ndoTree' })
  end,
}
