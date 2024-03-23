return {
  'zbirenbaum/copilot.lua',
  config = function()
    require('copilot').setup {
      panel = {
        auto_refresh = false,
        keymap = {
          accept = '<CR>',
          jump_prev = '[[',
          jump_next = ']]',
          refresh = 'gr',
          open = '<M-CR>',
        },
      },
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = '<C-j>',
          prev = '<C-A-,>',
          next = '<C-A-.>',
          dismiss = '<C-]>',
        },
      },
    }
  end,
}
