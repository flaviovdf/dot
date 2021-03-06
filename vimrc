call plug#begin('~/.local/share/nvim/plugged')
Plug 'anntzer/vim-cython'
Plug 'bling/vim-airline'
Plug 'craigemery/vim-autotag'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'flazz/vim-colorschemes'
Plug 'majutsushi/tagbar'
Plug 'moll/vim-bbye'
Plug 'nanotech/jellybeans.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'zchee/deoplete-go'
Plug 'zchee/deoplete-jedi'
call plug#end()

" Common options
set nocompatible
set encoding=utf-8
set nobackup    " do not keep a backup file, use versions instead
set history=50  " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch   " do incremental searching
set scrolloff=3
set showmode
set hidden

" Mouse options
set mouse=

" Syntax options
syntax on
set hlsearch
set background=dark
if $TERM !~# "konsole.*"
    let base16colorspace=256
endif
colorscheme Tomorrow-Night

" Tab options
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set backspace=indent,eol,start

" Buffers
map <c-d> :Bdelete<CR>

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
highlight LineNr ctermbg=none
set numberwidth=1
set cpoptions+=n

" Make Vim to handle long lines nicely.
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=79
set formatoptions-=t
set colorcolumn=80
hi ColorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" hi Pmenu cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" Helper for python code
autocmd BufRead,BufNewFile *.py,*.pyx,*.pxd set tabstop=4
autocmd BufRead,BufNewFile *.py,*.pyx,*.pxd set softtabstop=4
autocmd BufRead,BufNewFile *.py,*.pyx,*.pxd set shiftwidth=4
autocmd BufRead,BufNewFile *.py,*.pyx,*.pxd set textwidth=79
autocmd BufRead,BufNewFile *.py,*.pyx,*.pxd set expandtab
autocmd BufRead,BufNewFile *.py,*.pyx,*.pxd set autoindent

" Helper for latex
autocmd BufRead,BufNewFile *.tex,*.txt,*.md,*.rst setl spell
autocmd BufRead,BufNewFile *.tex,*.txt,*.md,*.rst setl spell spelllang=en_us
autocmd BufRead,BufNewFile *.tex,*.txt,*.md,*.rst setl noautoindent
" autocmd BufRead,BufNewFile *.tex set colorcolumn=0

" Remove Blanks
autocmd BufWritePre * %s/\s\+$//e

" Brasil spell checking
ca Br setlocal spell spelllang=pt_br

" NERDTree
set modifiable
"autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | wincmd p | endif
map <F2> :NERDTreeToggle<CR>
 autocmd bufenter *
    \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) |
    \    q |
    \ endif
let NERDTreeQuitOnOpen = 0

" Tags
map <F3> :TagbarToggle<CR>
let g:tagbar_width=30

" Autocomplete
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
set completeopt-=preview

" vim-go
let g:go_fmt_autosave = 0
let g:go_doc_keywordprg_enabled = 0

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.class
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|class)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_files = 0
map ; :CtrlPBuffer<CR>
set wildmenu

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 3
let g:syntastic_go_checkers=['go']
let g:syntastic_python_checkers=['flake8']
let g:syntastic_java_checkers=['javac']
let g:syntastic_tex_checkers=['proselint']
let g:syntastic_cpp_include_dirs = ['include', 'third_party']

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 0

" Neovim
let g:python_host_prog = '/Users/flaviovdf/anaconda3/envs/neovim2/bin/python'
let g:python3_host_prog = '/Users/flaviovdf/anaconda3/envs/neovim3/bin/python'
" let g:python_host_prog = '/usr/bin/python'
" let g:python3_host_prog = '/usr/bin/python'
