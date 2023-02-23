vim.opt.termguicolors = true
--Orginal colors
--vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

-- Adopted for dark :)
vim.cmd("highlight IndentBlanklineIndent1 guifg=#823f44 gui=nocombine");
vim.cmd("highlight IndentBlanklineIndent2 guifg=#826d46 gui=nocombine");
vim.cmd("highlight IndentBlanklineIndent3 guifg=#668251 gui=nocombine");
vim.cmd("highlight IndentBlanklineIndent4 guifg=#3a7b82 gui=nocombine");
vim.cmd("highlight IndentBlanklineIndent5 guifg=#355f82 gui=nocombine");
vim.cmd("highlight IndentBlanklineIndent6 guifg=#744682 gui=nocombine");

--vim.opt.list = true
--vim.opt.listchars:append "space:⋅"
--vim.opt.listchars:append "eol:↴"
vim.g.indent_blankline_char = '▏'
require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
  },
}
