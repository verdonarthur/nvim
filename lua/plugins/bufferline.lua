require('bufferline').setup {
  options = {
    -- Enable/disable animations
    animation = false,

    numbers = "none",

    indicator = {
      style = 'underline',
    },

    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    separator_style = 'thin',

    -- Enables/disable clickable tabs
    --  - left-click: go to buffer
    --  - middle-click: delete buffer
    clickable = true,

    tab_size = 15,
    max_name_length = 10,
    max_prefix_length = 10,
    -- whether or not tab names should be truncated
    truncate_names = true,

    offsets = {
      {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "left",
          separator = true
      }
    }
  }
}
