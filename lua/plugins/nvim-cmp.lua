return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "petertriho/cmp-git",
    "L3MON4D3/LuaSnip", -- snippet plugin
    -- "rafamadriz/friendly-snippets",  -- VSCode-like snippets
    "saadparwaiz1/cmp_luasnip", -- snippet plugin
  },
  event = "InsertEnter",
  -- lazy = true,
  config = function()
    local cmp  =require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      performance = {
        max_view_entries = 5,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        {
          name = "nvim_lsp",
          priority = 1000,
        }, {
          name = "luasnip",
          priority = 750,
        },
      }, {
        { name = "buffer",
          option = {
            get_bufnrs = function()
              return { vim.api.nvim_get_current_buf() }
            end
          },
        },
        {name = "path"},
      }),

      -- git
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "git" },
        },{
          { name = "buffer" },
        })
        }),
      require("cmp_git").setup(),

      -- command line
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" }
        }
      }),

      -- extra command line
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" }
        },{
          { name = "cmdline" }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      }),
    })
  end,
}
