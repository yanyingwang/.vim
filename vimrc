"ln -s ./vimrc ~/.vimrc

set nu                      "Auto line num
set hlsearch                "Highlight Searching
set t_Co=256
set fileencodings=utf-8,gb18030,gbk,gb2312,big5
"set ls=2
set tags=./tags;/
set tabstop=4 expandtab shiftwidth=2 softtabstop=2
set clipboard=unnamedplus   "murge vim clipboard to system clipboard
set mouse=a		            "Enable mouse usage (all modes)
set foldmethod=indent       "Code Folding
set foldlevel=99

syntax on                   
filetype on
filetype plugin on
filetype plugin indent on
hi Normal ctermbg=NONE
"au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
"au BufNewFile,BufRead *.sh set filetype=zsh
colorscheme jellybeans
"colorscheme molokai
"set background=dark

                            "autoload Pathogen
execute pathogen#infect() 


                            "maps for moving within splitting windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <F8> :TagbarToggle<CR>
map <F7> :NERDTreeToggle<CR>
map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<CR>


" configure expanding of tabs for various file types
"au BufRead,BufNewFile *.py set expandtab
"au BufRead,BufNewFile *.c set noexpandtab
"au BufRead,BufNewFile *.h set noexpandtab
"au BufRead,BufNewFile Makefile* set noexpandtab

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
"set expandtab           " enter spaces when tab is pressed
"set textwidth=120       " break lines when line length increases
"set tabstop=4           " use 4 spaces to represent tab
"set softtabstop=4
"set shiftwidth=4        " number of spaces to use for auto indent
"set autoindent          " copy indent from current line when starting a new line

" make backspaces more powerfull
"set backspace=indent,eol,start

"set ruler                           " show line and column number
"syntax on                " syntax highlighting
"set showcmd              " show (partial) command in status line
"set wildmode=longest,list
