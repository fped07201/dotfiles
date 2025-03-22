return {
  "nvimdev/dashboard-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local db = require("dashboard")

    -- 🎨 Logo ASCII personalizado
    db.setup({
      theme = "hyper",
      config = {
        header = {
          " ███╗   ██╗██╗   ██╗██╗███╗   ███╗ ",
          " ████╗  ██║██║   ██║██║████╗ ████║ ",
          " ██╔██╗ ██║██║   ██║██║██╔████╔██║ ",
          " ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
          " ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
          " ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
          "          🚀 Neovim Config 🚀      ",
        },

        -- 🛠️ Botones personalizados
        shortcut = {
          { desc = "🔍 Find File", group = "DashboardShortCut", key = "f", action = "Telescope find_files" },
          { desc = "🕘 Recent", group = "DashboardShortCut", key = "r", action = "Telescope oldfiles" },
          { desc = "📄 New File", group = "DashboardShortCut", key = "n", action = "ene | startinsert" },
          { desc = "⚙️ Config", group = "DashboardShortCut", key = "c", action = "e $MYVIMRC" },
          { desc = "❌ Quit", group = "DashboardShortCut", key = "q", action = "qa" },
        },

        -- ✨ Mensaje motivador
        footer = {
          "“Code is like humor. When you have to explain it, it’s bad.” - Cory House",
        },
      },
    })
  end
}

