" Common options
set nocompatible
set encoding=utf-8
set nobackup		" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		" do incremental searching
set scrolloff=3
set showmode
set hidden
set t_Co=256
set mouse=a

" Syntax options
syntax on
set hlsearch
colorscheme neon
set background=dark

" tab options
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set backspace=indent,eol,start

" Pathogen
set nocp
execute pathogen#infect()

" indent options
set autoindent
filetype plugin indent on
autocmd FileType text setlocal textwidth=80 " 80 cols in text files

" these lines makes vim return the cursor to last file position
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" line numbers
set number
highlight LineNr ctermfg=white
set numberwidth=1
set cpoptions+=n

" Make Vim to handle long lines nicely.
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80

" Helper for python code
autocmd BufRead *.py set smartindent 
    \ cinwords=if,elif,else,for,while,try,except,finally,def,class

" Helper for latex
autocmd BufRead,BufNewFile *.tex set spell
autocmd BufRead,BufNewFile *.tex set spell spelllang=en_us

" NERDTree
set modifiable
autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | wincmd p | endif
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * 
    \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | 
    \    q | 
    \ endif

" Tags
map <F3> :TagbarToggle<CR>
let g:tagbar_width=23

" Autocomplete
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
set completeopt-=preview

" vim-go
let g:go_fmt_autosave = 0
let g:go_doc_keywordprg_enabled = 0

" Buffers
map <c-d> :Bdelete<CR>

" Airline
let g:bufferline_echo = 0
autocmd VimEnter *
    \ let &statusline='%{bufferline#refresh_status()}'
    \ .bufferline#get_status_string()

"  Modelines
set modeline
set modelines=5
