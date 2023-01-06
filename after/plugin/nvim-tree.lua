require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
  },
  filters = {
    dotfiles = true,
  },
  tab = {
    sync = {
      open = true,
      close = true,
    }
  }
})
