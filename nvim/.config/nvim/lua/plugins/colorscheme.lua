return {
  "Mofiqul/dracula.nvim",
  lazy = false, -- Cargarlo de inmediato
  priority = 1000, -- Asegurar que se carga antes que otros plugins
  config = function()
    vim.cmd.colorscheme("dracula")
  end
}

