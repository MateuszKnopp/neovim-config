return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        config = function()
          -- Tu jest magia: Ładujemy Twoje customowe snippety z lua/snippets/
          require("luasnip.loaders.from_lua").lazy_load({ paths = { vim.fn.stdpath("config") .. "/lua/snippets" } })
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
    },
    opts = {
      -- Ustawiamy preset na luasnip
      snippets = { preset = "luasnip" },

      keymap = {
        preset = "default",
        -- Możesz tu dostosować klawisze, np. akceptacja przez Ctrl+y
        ["<C-y>"] = { "select_and_accept" },
      },

      -- Co ma się wyświetlać na liście?
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },
}
