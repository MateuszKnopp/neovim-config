return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      strategies = {
        -- Tryb Czatu (otwiera osobne okno z prawej)
        chat = {
          adapter = "gemini",
        },
        -- Tryb Inline (pisze kod bezpośrednio w pliku)
        inline = {
          adapter = "gemini",
        },
        -- Tryb Agenta (może wykonywać komendy - dla odważnych)
        agent = {
          adapter = "gemini",
        },
      },
      adapters = {
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            env = {
              api_key = "cmd:echo $GEMINI_API_KEY", -- Czyta z Twojej zmiennej środowiskowej
            },
            schema = {
              model = {
                default = "gemini-1.5-flash", -- Używamy szybkiego modelu
              },
            },
          })
        end,
      },
    },
    keys = {
      -- Skróty klawiszowe (Workflow)
      { "<leader>aa", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "AI Actions" },
      { "<leader>ac", "<cmd>CodeCompanionChat<cr>", mode = { "n", "v" }, desc = "AI Chat" },
      { "<leader>ai", "<cmd>CodeCompanion<cr>", mode = { "n", "v" }, desc = "AI Inline" },
    },
  },
}
