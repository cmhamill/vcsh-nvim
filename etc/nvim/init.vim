scriptencoding utf-8

" Global behavioral settings.
let g:mapleader = "\<Space>"
set autowrite
set hidden
set nomodeline  " Disable built-in, insecure modeline handling.
set shada=!,'500,h,r/tmp,r/mnt,r/media
set showcmd
set ttimeout    " Make sure to wait for the rest of a keycode sequence.
set ttimeoutlen=100
set undofile

" Use the X11 CLIPBOARD selection buffer as the '+' register, when
" possible.
if has('clipboard')
    set clipboard+=unnamedplus
endif

" Text-editing behaviorial settings.
set textwidth=72
set formatoptions-=t    " Don't auto-wrap text.
set formatoptions+=c    " Do auto-wrap comments.
set formatoptions-=a
set formatoptions-=r
set formatoptions-=o
set formatoptions+=q
set formatoptions+=n
set formatoptions-=2
set formatoptions+=1
set formatoptions+=j
set ignorecase
set smartcase
set infercase
set showmatch
set copyindent
set preserveindent
set tabstop=8
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make Y work like C and D.
nnoremap Y y$

" Make undo work in insert mode even after <C-U> or <CR>.
inoremap <C-U> <C-G>u<C-U>
inoremap <CR> <C-G>u<CR>

nnoremap <Leader>w :setlocal wrap!<CR>
" When line-wrapping is enabled, use j and k to navigate by apparent
" line, not just actual lines in the file.
augroup wrap_movement
    autocmd!
    autocmd OptionSet wrap if &wrap
        \| nnoremap <buffer> j gj
        \| nnoremap <buffer> k gk
    \| else
        \| silent! nunmap <buffer> j
        \| silent! nunmap <buffer> k
    \| endif
augroup END

" Incremental search with highlighting.
set incsearch
set hlsearch

" Keybinding to clear highlighted search results.
nnoremap <silent> <C-L>
    \ :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>


" Appearance and colorscheme.
set completeopt=longest,menu
set listchars=tab:⇥\ ,trail:␣,precedes:«,extends:»,nbsp:·
set ruler
set scrolloff=2
set sidescrolloff=5
set shortmess=aoOstTWIAcF
set title
set wildmode=longest:full,full
set nowrap
set linebreak
set number
set splitbelow
set splitright
