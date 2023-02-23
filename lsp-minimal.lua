local on_windows = vim.loop.os_uname().version:match 'Windows'

local function join_paths(...)
  local path_sep = on_windows and '\\' or '/'
  local result = table.concat({ ... }, path_sep)
  return result
end

vim.cmd [[set runtimepath=$VIMRUNTIME]]

local temp_dir = vim.loop.os_getenv 'TEMP' or '/tmp'

vim.cmd('set packpath=' .. join_paths(temp_dir, 'nvim', 'site'))

local package_root = join_paths(temp_dir, 'nvim', 'site', 'pack')
local install_path = join_paths(package_root, 'packer', 'start', 'packer.nvim')
local compile_path = join_paths(install_path, 'plugin', 'packer_compiled.lua')

local function load_plugins()
  require('packer').startup {
    {
      'wbthomason/packer.nvim',
      'neovim/nvim-lspconfig',
      {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
      },
      'norcalli/nvim-colorizer.lua'
    },
    config = {
      package_root = package_root,
      compile_path = compile_path,
    },
  }
end

local load_config = function()
  vim.lsp.set_log_level 'trace'
  require('vim.lsp.log').set_format_func(vim.inspect)
  local nvim_lsp = require 'lspconfig'
  local on_attach = function(_, bufnr)
    local function buf_set_option(...)
      vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { buffer = bufnr, noremap = true, silent = true }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
  end

  -- Add the server that troubles you here
  local name = 'sumneko_lua'
  local cmd = { 'lua-language-server', '--stdio' } -- needed for elixirls, omnisharp, sumneko_lua
  if not name then
    print 'You have not defined a server name, please edit minimal_init.lua'
  end
  --if not nvim_lsp[name].document_config.default_config.cmd and not cmd then
  --  print [[You have not defined a server default cmd for a server
  --    that requires it please edit minimal_init.lua]]
  --end

  nvim_lsp[name].setup {
    cmd = cmd,
    on_attach = on_attach,
  }

  print [[You can find your log at $HOME/.cache/nvim/lsp.log. Please paste in a github issue under a details tag as described in the issue template.]]
end

if vim.fn.isdirectory(install_path) == 0 then
  vim.fn.system { 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path }
  load_plugins()
  require('packer').sync()
  local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
  vim.api.nvim_create_autocmd(
    'User',
    { pattern = 'PackerComplete', callback = load_config, group = packer_group, once = true }
  )
else
  load_plugins()
  require('packer').sync()
  load_config()
end


local options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 0, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 3, -- so that ``` is visible in markdown files
  -- colorcolumn = "80",
  -- colorcolumn = "120",
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 0, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = false, -- convert tabs to spaces
  shiftwidth = 3, -- the number of spaces inserted for each indentation
  tabstop = 3, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  laststatus = 0,
  showcmd = false,
  ruler = false,
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  scrolloff = 8, -- is one of my fav
  sidescrolloff = 8,
  guifont = "monospace:h17", -- the font used in graphical neovim applications
}
vim.cmd("set noarabicshape")
vim.o.mouse = "a"
vim.o.fillchars = "vert:▏,eob: "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--vim.opt.fillchars.eob="\\ "

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

require 'colorizer'.setup()
