scriptencoding utf-8

if exists('g:loaded_lib') | finish | endif | let g:loaded_lib = 1

" Initialize vim-plug only if installed, and return a boolean indicating
" the result (true if vim-plug is initialized, false if not).
"
" Accepts a single optional argument to specify the directory in which
" vim-plug will store installed plugins.
function! lib#plug_begin(...) abort
    if !empty(glob(fnamemodify($MYVIMRC, ':h') . '/autoload/plug.vim'))
        if a:0 > 0
            call plug#begin(a:1)
        else
            call plug#begin()
        endif
        return 1
    endif
endfunction

" Check if the specified plugin is installed.
function! lib#has_plugin(plugin) abort
    if exists('g:plugs') && has_key(g:plugs, a:plugin)
        return isdirectory(g:plugs[a:plugin].dir)
    endif
endfunction
