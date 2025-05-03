-- :help options
vim.opt.backup = false              -- creates a backup file
vim.opt.clipboard = "unnamedplus"   -- allows neovim to access the sys clipboard
vim.opt.cmdheight = 2               -- more space in the nvim cmd line for displaying msg
vim.opt.completeopt = { "menuone", "noselect" } -- mostly for cmp
vim.opt.conceallevel = 0            -- so that `` is visible in markdown
vim.opt.fileencoding = "utf-8"      -- encoding written to file
vim.opt.hlsearch = true             -- highlight all matches on search pattern
vim.opt.ignorecase = true           -- ignore case in search pattern
vim.opt.mouse = "a"                 -- allow the mouse to be used in nvim
vim.opt.pumheight = 10              -- pop up menu height
vim.opt.showcmd = true             -- don't show -- INSERT -- etc
vim.opt.showtabline = 2             -- always show tabs
vim.opt.smartcase = true            -- smart case
vim.opt.smartindent = true          -- smart indendt
vim.opt.splitbelow = true           -- force horizontal split below current window
vim.opt.splitright = true           -- force vertical split to right of current window
vim.opt.swapfile = true             -- creates swap file
vim.opt.termguicolors = true        -- set term gui colors
vim.opt.timeoutlen = 1000           -- keybind combo timeout (ms)
vim.opt.undofile = true             -- persistent undo
vim.opt.updatetime = 300            -- faster completion
vim.opt.writebackup = false         -- TODO
vim.opt.expandtab = true            -- convert tabs to spaces
vim.opt.shiftwidth = 2              -- number of spaces before each indent
vim.opt.tabstop = 2                 -- insert 2 spaces before tab
vim.opt.cursorline = true           -- highlight cursor line
vim.opt.number = true               -- numbered lines
vim.opt.relativenumber = true       -- relative lines
vim.optnumberwidth = 4              -- number col width
vim.opt.signcolumn = "yes"          -- always show sign column, otherwist it would shift
vim.opt.wrap = true                 -- display lines as 1 long line
vim.opt.showbreak = "󰘍 "
vim.opt.scrolloff = 8               -- TODO
vim.opt.sidescrolloff = 8           -- TODO
vim.opt.guifont = ""                -- font in nvim gui

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
--TODO: vim.cmd [[set formatoptions+=cro]] 

