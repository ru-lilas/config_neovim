require("snacks").setup({
  dashboard = {
    enabled = true,

    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
      { section = "recent_files", padding = 1, limit = 5 },
      { section = "projects", padding = 1, limit = 5 },
    },
  },
})
