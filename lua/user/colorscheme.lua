

local colorscheme = "tokyonight"


vim.g.tokyonight_style = "storm"

local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status then
  vim.notify("Colorscheme not found")
  return
end

vim.cmd[[colorscheme tokyonight]]
