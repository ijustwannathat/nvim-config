return {
  'nvim-lualine/lualine.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function ()
    local status_ok, lualine = pcall(require, 'lualine')
    if not status_ok then return end

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = 'seoul256',
        globalstatus = false,
      },
      sections = {
        lualine_a = {
          {
            'filename',
            path = 1,
          },
        },
        lualine_c = {
          {
            'tabs',
            tab_max_length = 40,
            max_length = vim.o.columns / 3,
            mode = 0,
            path = 0,
            use_mode_colors = false,
            tabs_color = {
              active = 'lualine_c_normal',
              inactive = 'lualine_c_inactive',
            },
            show_modified_status = false, -- disables [+]
            -- removed symbols = { modified = '[+]' }
            -- removed custom `fmt` that adds ' +'
          },
          {
            'lsp_status',
            icon = '',
            symbols = {
              spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
              done = '✓',
              separator = ' ',
            },
            ignore_lsp = {},
          },
        },
      },
    })
  end
}
