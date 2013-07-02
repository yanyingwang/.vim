"ln -s ./vimrc ~/.vimrc
set nu                          "Auto line num
set hlsearch                    "Highlight Searching
set t_Co=256
<<<<<<< HEAD
"color pychimp
color molokai
"color distinguished
=======
colorscheme railscasts
hi Normal ctermbg=NONE
>>>>>>> 3c8ae171b4f918be020b0f832e7019ea575810d9
"set background=dark
"set background=light


" --------------------------------------------------------------------------------
"Pathogen
" --------------------------------------------------------------------------------
"""autoload Pathogen
execute pathogen#infect()

"""Code Folding
set foldmethod=indent
set foldlevel=99

"""maps for moving within splitting windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

nmap <F8> :TagbarToggle<CR>
nmap <F7> :NERDTreeToggle<CR>

"""Task lists
map <leader>td <Plug>TaskList


"""Revision History
map <leader>g :GundoToggle<CR>

"""Syntax Highlighting and Validation
syntax on
filetype on
"au BufNewFile,BufRead *.sh set filetype=zsh
filetype plugin on
filetype plugin indent on
set tabstop=8 expandtab shiftwidth=4 softtabstop=4
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

"""clipboard
set clipboard=unnamedplus
set mouse=a		" Enable mouse usage (all modes)


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
