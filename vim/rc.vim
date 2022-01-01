" My Vimrc without plugins or any other function
"" Appearance
set number
set cursorline
set showmatch
syntax enable
"" Edit
set backspace=indent,eol,start
set mouse=a
"" Indent and Tab
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2
"" Search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
"" Status Line
set laststatus=2
set ruler
"" Command
set wildmenu
set showcmd