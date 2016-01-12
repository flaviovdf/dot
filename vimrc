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

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 3

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <c-1> <Plug>AirlineSelectTab1
nmap <c-2> <Plug>AirlineSelectTab2
nmap <c-3> <Plug>AirlineSelectTab3
nmap <c-4> <Plug>AirlineSelectTab4
nmap <c-5> <Plug>AirlineSelectTab5
nmap <c-6> <Plug>AirlineSelectTab6
nmap <c-7> <Plug>AirlineSelectTab7
nmap <c-8> <Plug>AirlineSelectTab8
nmap <c-9> <Plug>AirlineSelectTab9


"  Modelines
set modeline
set modelines=5
