" VIM-PLUG (za to open fold) {{{

" install vim-plug if it isn't already {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

call plug#begin('~/.vim/plugged')

" gruvbox colorscheme
Plug 'morhetz/gruvbox'
" YouCompleteMe
    " For C on Arch, install cmake, clang, make
    " For Go, install go go-tools
    " run install.py --clang-completer --go-completer
    " (.vim/plugged/youcompleteme/.install.py)
Plug 'valloric/youcompleteme'

" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" }}}

" TABS AND LAYOUT {{{
set number 		    " show line numbers
set relativenumber
set numberwidth=1 	" width of the line number column

set wrap            " line wrap

" tabs
set tabstop=4       " how big is a tab
set shiftwidth=0    " amount shifted by << or >> (sw=0 means "same as tabstop")
set expandtab		" replace tabs with spaces
set softtabstop=-1  " tab stop in insert mode (sts=-1 means "same as tabstop")

set colorcolumn=80  " draw a vertical line at 80 characters

" }}} TABS AND LAYOUT

" DEFAULT BEHAVIOUR {{{

set belloff=all

set path+=**		" fuzzy tab completion for files, also searches in subdirectories
set wildmenu        " tab completion menu popup in command window

" }}} DEFAULT BEHAVIOUR

" APPEARANCE {{{

syntax on           " highlighting
set termguicolors   " true colors
set background=dark
colorscheme gruvbox

" }}}

" GENERAL MAPPINGS {{{
" leader key
noremap <space> <nop>
let mapleader = "\<space>"
let maplocalleader = "\\"

" alternate way to switch to normal mode
inoremap kj <esc><right>
vnoremap kj <esc><right>
cnoremap kj <c-u><esc><esc>
inoremap <esc> <nop>

" move line down
nnoremap <leader>j ddp
" move line up
nnoremap <leader>k kddpk

" uppercase  word
inoremap uu <esc>viwUi<esc>ea
" nnoremap <c-u> viwUw

" edit .vimrc

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" reload .vimrc. Also saves current file.
nnoremap <leader>sv :update<cr>:source $MYVIMRC<cr>

" surround visual block with double quotes
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>

" surround visual block with single quotes
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>

" leader h gives help
nnoremap <leader>h :help

" Navigate windows with leader w
noremap <leader>w <c-w>

" Change buffers with leader n
noremap <leader>1 :update<cr>:buffer 1<cr>
noremap <leader>2 :update<cr>:buffer 2<cr>
noremap <leader>3 :update<cr>:buffer 3<cr>
noremap <leader>4 :update<cr>:buffer 4<cr>
noremap <leader>5 :update<cr>:buffer 5<cr>
noremap <leader>6 :update<cr>:buffer 6<cr>
noremap <leader>7 :update<cr>:buffer 7<cr>
noremap <leader>8 :update<cr>:buffer 8<cr>
noremap <leader>9 :update<cr>:buffer 9<cr>

" }}} GENERAL MAPPINGS

" GENERAL HOOKS {{{
    augroup save_hooks
        autocmd!
        " remove trailing whitespace
        autocmd BufWritePre * call RemoveTrailingWhitespace()
    augroup END

    function RemoveTrailingWhitespace()
        let l:n = line(".")
        %s/\s\+$//e
        execute "normal! " . l:n . "G"
    endfunction

    augroup all_filetypes
        " don't autoinsert comments
        " r: on enter. o: on o or O (open line)
        " this needs to be here as formatoptions is often set in file type
        " specific settings which are loaded after .vimrc
        autocmd FileType * set formatoptions-=ro
    augroup END

" }}}

" FILETYPE SPECIFIC SETTINGS {{{

" vimscript {{{
    augroup filetype_vim
        autocmd!
        autocmd FileType vim call SetVimScript()
    augroup END

    function SetVimScript()
        " foldmethod=marker folds on three {s
        setlocal foldmethod=marker
        " close fold marker
        inoremap <buffer> {{{ {{{<cr><cr>" }}}<up>
        " }}}
        " inoremap <buffer> ( ()<left>

        inoreabbrev <buffer> function function<cr>endfunction<up>
        " the 'a' is entered then deleted. It prevents the indentation of the
        " 'augroup END' line from getting messed up by (I think) the default
        " vimscript ftplugin: /usr/share/vim/vim81/ftplugin/vim.vim
        inoreabbrev <buffer> augroup augroup a<cr>augroup END<esc><up>A<bs><bs>
        inoreabbrev <buffer> iff if<cr>endif<up>
        inoreabbrev <buffer> frr for<cr>endfor<up>
        inoreabbrev <buffer> whh while<cr>endwhile<up>
    endfunction

" }}} vimscript

" C {{{
    augroup filetype_c
        autocmd!
        autocmd FileType c call SetC()
    augroup END

    function SetC()
        inoremap <buffer> .. ->
        " inoremap <buffer> ( ()<left>
        " inoremap <buffer> " ""<left>
        inoremap <buffer> ;; <esc>A;<esc>
        inoremap <buffer> {{ <esc>A {<cr>}<esc>O
        inoremap <buffer> {<cr> {<cr>}<esc>O
        inoremap <buffer> whh while () {<cr>}<esc><up>f(a
        inoremap <buffer> frr for () {<cr>}<esc><up>f(a
        inoremap <buffer> iff if () {<cr>}<esc><up>f(a
        inoremap <buffer> inti int i=0; i<x; ++i<esc>Fxxi
    endfunction

" }}} C

" python {{{
    augroup filetype_python
        autocmd!
        autocmd FileType python :call SetPython()
    augroup END

    function SetPython()
        " indentation
        setlocal tabstop=4
        setlocal expandtab
        setlocal shiftwidth=0
        setlocal softtabstop=-1
    endfunction
" }}} python

" Go {{{
    augroup filetype_go
        autocmd!
        autocmd FileType go call SetGo()
        autocmd BufWritePost *.go call GoFmt()
    augroup END

    function SetGo()
        " commands
        nnoremap <leader>r :!clear<cr>:write<cr>:!go run %<cr>

        " snippets
        inoremap <buffer> {{ <esc>A {<cr>}<esc>O
        inoremap <buffer> {<cr> {<cr>}<esc>O
        inoremap <buffer> )) <esc>$i)<esc>
        inoremap <buffer> frr for{<cr>}<esc><up>0fra<space>
        inoremap <buffer> iff if {<cr>}<esc><up>0ffa<space>
        inoremap <buffer> inti int i=0; i<x; ++i<esc>Fxxi
        inoremap <buffer> fpp fmt.Println("")<left><left>
        " debugging
        vnoremap <buffer> <leader>dp <esc>`<Ofmt.Println("pre")<esc>`>ofmt.Println("post")<esc>
    endfunction

    function GoFmt()
        silent! !go fmt %
        silent! edit
        redraw!
    endfunction
" }}}

" text {{{
    augroup filetype_text
        autocmd!
        autocmd FileType text :call SetText()
    augroup END

    function SetText()
        " foldmethod=marker folds on three {s
        setlocal foldmethod=marker
        " close fold marker
        inoremap <buffer> {{{ {{{<cr><cr><cr><cr>}}}<esc>kki
        " }}} curlys to close those on the previous line.
    endfunction
" }}} text

" }}} FILETYPE SPECIFIC SETTINGS

silent! so .local.vim " load an extra config file from the current directory
