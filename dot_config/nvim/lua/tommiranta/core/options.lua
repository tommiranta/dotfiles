local opt = vim.opt -- for conciseness

opt.guicursor = ""

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Time in milliseconds to wait for a mapped sequence to complete,
-- see https://unix.stackexchange.com/q/36882/221410 for more info
opt.timeoutlen = 500

-- For CursorHold events
opt.updatetime = 300

-- Minimum lines to keep above and below cursor when scrolling
opt.scrolloff = 8

-- Ask for confirmation when handling unsaved or read-only files
opt.confirm = true

-- Do not use visual and errorbells
opt.visualbell = false
opt.errorbells = false

opt.isfname:append("@-@")

opt.colorcolumn = "80"
