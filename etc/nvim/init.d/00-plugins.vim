if lib#plug_begin()
    " Global behavioral changes.
    Plug 'aperezdc/vim-template'
    Plug 'ciaranm/securemodelines'
    Plug 'ConradIrwin/vim-bracketed-paste'
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
