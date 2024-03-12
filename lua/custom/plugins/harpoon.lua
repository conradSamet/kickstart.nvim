return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()
    --
    -- stylua: ignore start
    vim.keymap.set('n', '<leader>ha', function() harpoon:list():append() end, { desc = '[H]arpoon: [A]dd'})
    vim.keymap.set('n', '<leader>hc', function() harpoon:list():clear() end, { desc = '[H]arpoon: [C]lear'})
    vim.keymap.set('n', '<leader>hm', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = '[H]arpoon: [M]enu'})
    -- vim.keymap.set('n', '<C-h>', function() harpoon:list():select(1) end)
    -- vim.keymap.set('n', '<C-t>', function() harpoon:list():select(2) end)
    -- vim.keymap.set('n', '<C-m>', function() harpoon:list():select(3) end)
    -- vim.keymap.set('n', '<C-s>', function() harpoon:list():select(4) end)

    vim.keymap.set('n', '<C-p>', function () harpoon:list():prev() end)
    vim.keymap.set('n', '<C-n>', function () harpoon:list():next() end)
    -- stylua: ignore end
  end,
}
