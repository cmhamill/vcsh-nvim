scriptencoding utf-8

if lib#plug_begin()
    " Global behavioral changes.
    Plug 'ConradIrwin/vim-bracketed-paste'
    Plug 'aperezdc/vim-template'
    Plug 'ciaranm/securemodelines'
    Plug 'dietsche/vim-lastplace'
    Plug 'kopischke/vim-fetch'
    Plug 'tpope/vim-repeat'

    " Elaborations on existing features.
    Plug 'simnalamburt/vim-mundo'
    Plug 'tpope/vim-speeddating'
    Plug 'tpope/vim-vinegar'

    " Additional commands.
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'

    " Improvements in usability of searches and movement commands.
    Plug 'haya14busa/incsearch.vim'
    Plug 'unblevable/quick-scope'

    " Additional or improved text editing features.
    Plug 'andrewradev/splitjoin.vim'
    Plug 'chrisbra/unicode.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'matze/vim-move'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-rsi'
    Plug 'tpope/vim-surround'

    " Filetype plugins
    Plug 'bkad/vim-terraform'
    Plug 'cespare/vim-toml'
    Plug 'cmhamill/vim-jrnl'
    Plug 'direnv/direnv.vim'
    Plug 'ekalinin/Dockerfile.vim'
    Plug 'Glench/Vim-Jinja2-Syntax'
    Plug 'moskytw/nginx-contrib-vim'
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'racer-rust/vim-racer'
    Plug 'rust-lang/rust.vim'
    Plug 'saltstack/salt-vim'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'vim-scripts/openvpn'
    Plug 'vim-scripts/SyntaxRange'

    " Building and linting.
    Plug 'neomake/neomake'

    " Appearance and colorscheme.
    Plug 'arakashic/nvim-colors-solarized'
call plug#end() | endif

" Global behavioral settings.
let g:mapleader = "\<Space>"
call lib#backupdir($XDG_DATA_HOME . '/nvim/backup//')
set autowrite
set hidden
set nomodeline  " Disable built-in, insecure modeline handling.
set shada=!,'500,h,r/tmp,r/mnt,r/media
set showcmd
set ttimeout    " Make sure to wait for the rest of a keycode sequence.
set ttimeoutlen=100
set undofile

if lib#has_plugin('vim-template')
    let g:templates_no_builtin_templates = 1
    let g:templates_directory = $XDG_CONFIG_HOME . '/nvim/templates'
endif

" Use the X11 CLIPBOARD selection buffer as the '+' register, when
" possible.
if has('clipboard')
    set clipboard+=unnamedplus
endif

" Make undo work in insert mode even after <C-U> or <CR>.
inoremap <C-U> <C-G>u<C-U>
inoremap <CR>  <C-G>u<CR>

" Show a tree representation of the undo history.
nmap <Leader>u :MundoToggle<CR>

" Make Y work like C and D.
nnoremap Y y$

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

" Incremental search with highlighting.
set incsearch
set hlsearch

" Clear highlighted search results.
nnoremap <silent> <C-L>
    \ :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

if lib#has_plugin('incsearch.vim')
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backword)
    map g/ <Plug>(incsearch-stay)

    if &hlsearch
        " Automatically clear highlighted results on movement.
        let g:incsearch#auto_nohlsearch = 1
        map n  <Plug>(incsearch-nohl-n)
        map N  <Plug>(incsearch-nohl-N)
        map *  <Plug>(incsearch-nohl-*)
        map #  <Plug>(incsearch-nohl-#)
        map g* <Plug>(incsearch-nohl-g*)
        map g# <Plug>(incsearch-nohl-g#)
    endif
endif

if lib#has_plugin('quick-scope')
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
endif

if lib#has_plugin('unicode.vim')
    nmap gC <Plug>(UnicodeGA)
else
    nnoremap gC ga
endif

if lib#has_plugin('vim-easy-align')
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
endif

if lib#has_plugin('vim-move')
    let g:move_key_modifier = 'C'
endif

" Filetype-specific settings.
if lib#has_plugin('vim-jrnl')
    let g:jrnl_tagsymbols = ['+']
    call jrnl#journal_files(
        \ '~/documents/journals/work',
        \ '~/documents/journals/personal',
    \ )
endif
if lib#has_plugin('vim-pandoc')
    let g:pandoc#modules#disabled = ['folding']
endif
if lib#has_plugin('vim-pandoc-syntax')
    let g:pandox#syntax#conceal#use = 0
    let g:pandoc#syntax#codeblocks#embeds#langs = [
        \ 'bash=sh',
        \ 'python',
        \ 'perl',
        \ 'ruby',
    \ ]
endif
if lib#has_plugin('vim-racer')
    let g:racer_cmd = $HOME . '/.cargo/bin/racer'
endif

" Building and linting.
if lib#has_plugin('neomake')
    augroup neomake_settings
        autocmd!
        autocmd BufWritePost * Neomake
    augroup END
    let g:neomake_error_sign   = {'text': '‼', 'texthl': 'Error'}
    let g:neomake_warning_sign = {'text': '!', 'texthl': 'Todo'}
    let g:neomake_info_sign    = {'text': '⚐', 'texthl': 'Todo'}
    let g:neomake_message_sign = {'text': '⚑', 'texthl': 'Todo'}
endif

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

set background=dark
if lib#has_plugin('nvim-colors-solarized') && $TERM !=# 'linux'
    colorscheme solarized
    set cursorline
else
    colorscheme delek
endif

if lib#has_plugin('vim-better-whitespace')
    highlight ExtraWhitespace ctermbg=252
endif
