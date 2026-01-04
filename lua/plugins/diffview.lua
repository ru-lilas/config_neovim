return {
  "sindrets/diffview.nvim",
  config = function()
    require("diffview").setup({
      hg_cmd = nil,
    })
  end,
}

