require("nvim-tree").setup({
  sort_by = "case_sensitive",
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  git = {
    enable = false,
  },
  modified = {
    enable = true,
  },
  view = {
    adaptive_size = true,
    hide_root_folder = true,
  },
  filters = {
    dotfiles = false,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
    remove_file = {
      close_window = true,
    },
  },
  tab = {
    sync = {
      open = true,
      close = true,
    }
  }
})
