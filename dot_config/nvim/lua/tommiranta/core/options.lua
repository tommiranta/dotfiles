local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

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

opt.iskeyword:append("-") -- consider string-string as whole word

-- TextEdit might fail if hidden is not set.
-- opt.hidden = true

-- Display all matching files when we tab complete
-- opt.wildmenu = true

-- Enable undo file
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Disable creating swapfiles, see https://stackoverflow.com/q/821902/6064933
opt.swapfile = false

-- Some servers have issues with backup files, see #649.
opt.backup = false
opt.writebackup = false

-- Give more space for displaying messages.
-- opt.cmdheight = 2

-- Don't pass messages to |ins-completion-menu|.
--opt.shortmess+=c

-- Ignore certain files and folders when globing
-- opt.wildignore+=*.o,*.obj,*.dylib,*.bin,*.dll,*.exe
-- opt.wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
-- opt.wildignore+=*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico
-- opt.wildignore+=*.pyc,*.pkl
-- opt.wildignore+=*.DS_Store
-- opt.wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv
-- opt.wildignorecase  " ignore file and dir name cases in cmd-completion

-- Time in milliseconds to wait for a mapped sequence to complete,
-- see https://unix.stackexchange.com/q/36882/221410 for more info
opt.timeoutlen = 500

-- For CursorHold events
opt.updatetime = 300

-- File and script encoding settings for vim
-- opt.fileencoding = utf-8
-- opt.fileencodings = ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

-- List all matches and complete till longest common string
-- opt.wildmode=list:longest

-- Minimum lines to keep above and below cursor when scrolling
opt.scrolloff = 3

-- Disable showing current mode on command line since statusline plugins can show it.
-- opt.noshowmode = true

-- Ask for confirmation when handling unsaved or read-only files
opt.confirm = true

-- Do not use visual and errorbells
opt.visualbell = false
opt.errorbells = false
