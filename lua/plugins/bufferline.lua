require('bufferline').setup {
  options = {
    animation = true,
    numbers = "none",
    mode = "tabs",
    indicator = {
      style = 'none',
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    separator_style = 'thin',
    clickable = true,
    tab_size = 0,
    max_name_length = 25,
    max_prefix_length = 10,
    truncate_names = true,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        separator = false
      }
    }
  }
}

require("scope").setup()
