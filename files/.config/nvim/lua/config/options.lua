-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

-- Language provider setup
vim.g.python3_host_prog = "~/.local/share/mise/installs/python/latest/bin/python3"
vim.g.ruby_host_prog = "~/.local/share/mise/installs/ruby/latest/bin/neovim-ruby-host"
vim.g.node_host_prog = "~/.local/share/mise/installs/node/latest/bin/neovim-node-host"
