call plug#begin('~/.local/share/nvim/plugged')
Plug 'anntzer/vim-cython'
Plug 'bling/vim-airline'
Plug 'craigemery/vim-autotag'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'flazz/vim-colorschemes'
Plug 'majutsushi/tagbar'
Plug 'moll/vim-bbye'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nanotech/jellybeans.vim'
Plug 'scrooloose/nerdtree'
Plug 'Vimjas/vim-python-pep8-indent'
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


" these lines makes vim return the cursor
" cursor to last file position
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
set textwidth=59
set formatoptions-=t
set colorcolumn=60
hi ColorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" Helper for python code
autocmd BufRead,BufNewFile *.py,*.pyx,*.pxd
      \ set tabstop=4
autocmd BufRead,BufNewFile *.py,*.pyx,*.pxd
      \ set softtabstop=4
autocmd BufRead,BufNewFile *.py,*.pyx,*.pxd
      \ set shiftwidth=4
autocmd BufRead,BufNewFile *.py,*.pyx,*.pxd
      \ set textwidth=59
autocmd BufRead,BufNewFile *.py,*.pyx,*.pxd
      \ set expandtab
autocmd BufRead,BufNewFile *.py,*.pyx,*.pxd
      \ set autoindent

" Helper for latex
autocmd BufRead,BufNewFile *.tex,*.txt,*.md,*.rst
      \ setl spell
autocmd BufRead,BufNewFile *.tex,*.txt,*.md,*.rst
      \ setl spell spelllang=en_us
autocmd BufRead,BufNewFile *.tex,*.txt,*.md,*.rst
      \ setl noautoindent

" Remove Blanks
autocmd BufWritePre * %s/\s\+$//e

" Brasil spell checking
ca Br setlocal spell spelllang=pt_br

" NERDTree
set modifiable
map <F2> :NERDTreeToggle<CR>
 autocmd bufenter *
    \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) |
    \    q |
    \ endif
let NERDTreeQuitOnOpen = 0
let NERDTreeWinSize = 16

" Tags
map <F3> :TagbarToggle<CR>
let g:tagbar_width=16

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
set wildmenu
nmap ; :CtrlPBuffer<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 0

" Neovim
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'

" CoC
" Having longer updatetime (default is 4000 ms = 4s)
" leads to noticeable delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift
" the text each time diagnostics appear/become resolved
set signcolumn=yes


" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
