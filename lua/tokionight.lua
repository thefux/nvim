require("tokyonight").setup({
  -- use the night style
  style = "night",
  -- disable italic for functions
  transparent = true,
  styles = {
    functions = { italic = true }
  },
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  on_colors = function(colors)
    colors.hint = colors.orange
    colors.error = "#ff0000"
    colors.functions = "#00BCD4"
    colors.number = "#ff0000"
  end
})
