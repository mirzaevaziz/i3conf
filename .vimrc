    " Use vim settings, rather then vi settings (much better!)
    " This must be first, because it changes other options as a side effect.
    set nocompatible

    " Plugins will be downloaded under the specified directory.
    call plug#begin('~/.vim/plugged')

    " Declare the list of plugins. {{{
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-abolish'
    Plug 'godlygeek/tabular'
    Plug 'junegunn/seoul256.vim'
    Plug 'valloric/youcompleteme'
    Plug 'scrooloose/nerdtree'
    Plug 'kien/ctrlp.vim'
    Plug 'mbbill/undotree'
    Plug 'w0rp/ale'
    Plug 'easymotion/vim-easymotion'
    Plug 'jmcantrell/vim-virtualenv'
    Plug 'majutsushi/tagbar'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'tmhedberg/simpylfold'
    Plug 'tommcdo/vim-exchange'
    " }}}

    " List ends here. Plugins become visible to Vim after this call.
    call plug#end()

    set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim/
    set laststatus=2
    set t_Co=256

    " Change shell
    set shell=bash " Vim expects a POSIX-compliant shell, which Fish (my default shell) is not

    " Change the mapleader from \ to , {{{
    let mapleader=","
    let maplocalleader="\\"
    " }}}

    " Editing behaviour {{{
    set showmode                                   " always show what mode we're currently editing in
    set nowrap                                     " don't wrap lines
    set tabstop=4                                  " a tab is four spaces
    set softtabstop=4                              " when hitting <BS>, pretend like a tab is removed, even if spaces
    set expandtab                                  " expand tabs by default (overloadable per file type later)
    set shiftwidth=4                               " number of spaces to use for autoindenting
    set shiftround                                 " use multiple of shiftwidth when indenting with '<' and '>'
    set backspace=indent,eol,start                 " allow backspacing over everything in insert mode
    set autoindent                                 " always set autoindenting on
    set copyindent                                 " copy the previous indentation on autoindenting
    set number  relativenumber                     " always show line numbers
    set showmatch                                  " set show matching parenthesis
    set ignorecase                                 " ignore case when searching
    set smartcase                                  " ignore case if search pattern is all lowercase,
                                                " case-sensitive otherwise
    set smarttab                                   " insert tabs on the start of a line according to
                                                " shiftwidth, not tabstop
    set scrolloff=4                                " keep 4 lines off the edges of the screen when scrolling
    set virtualedit=all                            " allow the cursor to go in to                                     " invalid  " places
    set hlsearch                                   " highlight search terms
    set incsearch                                  " show search matches as you type
    set gdefault                                   " search/replace                                                   " globally " (on a line) by default
    set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
    set nolist                                     " don't show invisible characters by default,
                                                " but it is enabled for some file types (see later)
    set pastetoggle=<F2>                           " when in insert mode, press <F2> to go to
                                                " paste mode, where you can paste mass data
                                                " that won't be autoindented
    set mouse=a                                    " enable using the mouse if terminal emulator
                                                " supports it (xterm does)
    set fileformats=                               " unix,dos,mac                                                     "
    set formatoptions+=1                           " When wrapping paragraphs, don't end lines
                                                " with 1-letter words (looks stupid)
    set nrformats=                                 " make <C-a> and <C-x> play well with
                                                " zero-padded numbers (i.e. don't consider
                                                " them octal or hex)
    set shortmess+=I                               " hide the launch screen
    set clipboard=unnamed                          " normal OS clipboard interaction
    if has('unnamedplus')
        set clipboard=unnamed,unnamedplus
    endif
    set autoread                                   " automatically reload files changed outside of Vim
    set colorcolumn=80
    colorscheme seoul256
    set background=dark
    syntax enable
    set foldmethod=marker
    set foldcolumn=3

    " Toggle show/hide invisible chars
    nnoremap <leader>i :set list!<cr>

    " Toggle line numbers
    nnoremap <leader>N :setlocal number!<cr>

    " Thanks to Steve Losh for this liberating tip
    " See http://stevelosh.com/blog/2010/09/coming-home-to-vim
    nnoremap / /\v
    vnoremap / /\v

    " Speed up scrolling of the viewport slightly
    nnoremap <C-e> 2<C-e>
    nnoremap <C-y> 2<C-y>
    " }}}

" NERDTree settings {{{
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
nnoremap <leader>N :NERDTreeClose<CR>

" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Use a single click to fold/unfold directories and a double click to open
" files
let NERDTreeMouseMode=2

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store' ]

" }}}

" Shortcuts {{{
" nnoremap <C-h> <C-w>h             " Go to Left window
" nnoremap <C-j> <C-w>j             " Go to Top window
" nnoremap <C-k> <C-w>k             " Go to Down window
" nnoremap <C-l> <C-w>l             " Go to Right window
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

nnoremap <F3> :set hlsearch!<CR>  " Toggle search highlighting
nnoremap <F8> :ALEFix<CR>
" }}}

" Invoke CtrlP, but CommandT style {{{
nnoremap <leader>t :CtrlP<cr>
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
" }}}

" undotree settings {{{
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

nnoremap <F5> :UndotreeToggle<cr>
" }}}

" Tagbar settings {{{
nmap <F7> :TagbarToggle<CR>
" }}}

" Refactoring tools {{{
 " For local replace
nnoremap gr gd[{V%:%s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>
" }}}

" ALE settings {{{
let g:ale_fix_on_save = 1
let g:ale_fixers = {
            \'vim' : ['remove_trailing_lines', 'trim_whitespace'],
            \'python' : ['remove_trailing_lines', 'trim_whitespace',
            \'add_blank_lines_for_python_control_statements',
            \'autopep8','isort','yapf']
            \}
" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" }}}

" .Vimrc settings {{{
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

nmap <leader>v :tabedit $MYVIMRC<CR>
"}}}

" Tabularize settings {{{
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif
"}}}

" Fugitive settings {{{
if has("autocmd")
    autocmd User fugitive
    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
    \   nnoremap <buffer> .. :edit %:h<CR> |
    \ endif
    autocmd BufReadPost fugitive://* set bufhidden=delete
endif
"}}}
