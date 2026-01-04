return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup({
      filetypes = { "*" }, -- 全ファイルで有効化
      user_default_options = {
        RGB      = true,
        RRGGBB   = true,
        names    = false,
        RRGGBBAA = true,
        AARRGGBB = true,
        rgb_fn   = true, -- rgb(), rgba()
        hsl_fn   = true, -- hsl(), hsla()
        css      = true, -- css の色名
        css_fn   = true,
      },
    })
  end,
}
