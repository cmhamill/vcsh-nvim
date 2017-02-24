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

" Configure the specified backupdir(s).
"
" In contrast to using 'backupdir' directly, this supports a trailing
" '//' in the specified path indicating that backups should be named
" after the entire path of the original file. This is consistent with
" the behavior of 'directory'.
function! lib#backupdir(path, ...) abort
    " Disable the native backup functionality, as it doesn't work the
    " way we want it to.
    set nobackup
    let &backupdir = join([a:path] + a:000, ',')

    " Ensure all backup directories exist.
    for l:path in split(&backupdir, ',')
        if !isdirectory(l:path)
            call mkdir(l:path)
        endif
    endfor

    " Replace the native backup functionality with our own, called on
    " every BufWritePre event.
    augroup lib_backupdir
        autocmd!
        autocmd BufWritePre * call s:save_backups()
    augroup END
endfunction

" Save backups of the current file in all paths specified by
" 'backupdir'.
function! s:save_backups() abort
    if expand('%:p') =~ &backupskip | return 0 | endif
    for l:backupdir in split(&backupdir, ',')
        call s:save_backup(l:backupdir)
    endfor
endfunction

" Save a backup in the specified directory. If the provided path ends in
" '//', name the backup after the whole path of the original file, with
" '/' characters replaced by '%'.
function! s:save_backup(backupdir) abort
    let l:filename = expand('%:p')
    if a:backupdir =~# '//$'
        let l:backup = escape(
            \ substitute(l:filename, '/', '%', 'g') . &backupext, '%',
        \ )
    else
        let l:backup = escape(expand('%') . &backupext, '%')
    endif

    silent! execute join([
        \ '!cp', resolve(l:filename), a:backupdir . '/' . l:backup,
    \ ], ' ')
endfunction
