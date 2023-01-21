
-- Nvim Tree plugin
require("nvim-tree").setup()


-- Bufferline(tabs) plugin
vim.opt.termguicolors = true
require("bufferline").setup{
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "Files",
        highlight = "Directory",
        text_align = "center"
      }
    }
  }
}

-- Tabline plugin
-- require("tabline").setup({})

-- Buffer delete
require('bufdel').setup {
  quit = false,
}

require("flutter-tools").setup{}
