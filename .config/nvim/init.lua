vim.g.mapleader = " " ----------> <space> is leader key
require('globals') -------------> global vars
require('sets')    -------------> all set commands
require('plugins')

-- LSP SETTINGS
require('lsp')
require('lsp/ts-js-ls')
require('lsp/python-ls')
require('lsp/css-ls')
require('lsp/json-ls')
require('lsp/lua-ls')
require('lsp/latex-ls')
require('lsp/html-ls')
require('lsp/bash-ls')
require('lsp/yaml-ls')

require('completion')
require('treeshitter') ---------> beautiful plugin which works with AST
require('autopairs')
require('telescopeByTJ')
require('comment')
