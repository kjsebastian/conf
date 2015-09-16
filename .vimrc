set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

"plugins
    Plug 'mileszs/ack.vim'
    Plug 'vim-scripts/sessionman.vim'
    Plug 'matchit.zip'
    Plug 'bling/vim-airline'
    Plug 'mbbill/undotree'
    Plug 'kana/vim-textobj-user'
    Plug 'mattn/emmet-vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'godlygeek/tabular'
    Plug 'shougo/unite.vim'
    Plug 'shougo/vimproc.vim', { 'do': 'make' }
    Plug 'marijnh/tern_for_vim'
    Plug 'othree/html5.vim'
    Plug 'amirh/HTML-AutoCloseTag'
    Plug 'jelera/vim-javascript-syntax'
    Plug 'wting/rust.vim'
    Plug 'altercation/vim-colors-solarized'
    Plug 'ajh17/Spacegray.vim'
    Plug 'chriskempson/vim-tomorrow-theme'
    Plug 'chriskempson/base16-vim'
    Plug 'derekwyatt/vim-scala'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'dag/vim2hs'
    Plug 'eagletmt/neco-ghc'
    Plug 'shougo/neocomplete.vim'
    Plug 'whatyouhide/vim-gotham'
    "Plug 'sirver/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'morhetz/gruvbox'

call plug#end()

" general
    set nospell
    filetype plugin indent on
    syntax on
    set mouse=a                                        " automatically enable mouse usage
    set mousehide                                      " hide the mouse cursor while typing
    set encoding=utf-8
    setglobal fileencoding=utf-8
    scriptencoding utf-8
    set clipboard=unnamed
    set virtualedit=onemore                            " allow for cursor beyond last character
    set history=1000                                   " store a ton of history (default is 20)
    set iskeyword-=.                                   " '.' is an end of word designator
    set iskeyword-=#                                   " '#' is an end of word designator
    set iskeyword-=-                                   " '-' is an end of word designator
    set backup                                         " backups are nice ...
    set undofile                                       " so is persistent undo ...
    set undolevels=1000                                " maximum number of changes that can be undone
    set undoreload=10000                               " maximum number lines to save for undo on a buffer reload

" ui & themes
    set background=dark
    set t_Co=256
    color gruvbox
    set tabpagemax=15                                  " only show 15 tabs
    set showmode                                       " display the current mode
    set cursorline                                     " highlight current line
    highlight clear signcolumn                         " signcolumn should match background
    set ruler                                          " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%v\ %p%) " a ruler on steroids
    set showcmd                                        " show partial commands in status line

    set laststatus=2
    set statusline=%<%f\                               " filename
    set statusline+=%w%h%m%r                           " options
    set statusline+=\ [%{&ff}/%y]                      " filetype
    set statusline+=\ [%{getcwd()}]                    " current dir
    set statusline+=%=%-14.(%l,%c%v%)\ %p%%            " right aligned file nav info

    set backspace=indent,eol,start                     " backspace for dummies
    set linespace=0                                    " no extra spaces between rows
    set nu rnu                                         " line numbers on
    set showmatch                                      " show matching brackets/parenthesis
    set incsearch                                      " find as you type search
    set hlsearch                                       " highlight search terms
    set ignorecase                                     " case insensitive search
    set smartcase                                      " case sensitive when uc present
    set wildmenu                                       " show list instead of just completing
    set wildmode=list:longest,full                     " command <tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]                      " backspace and cursor keys wrap too
    set scrolljump=5                                   " lines to scroll when cursor leaves screen
    set scrolloff=3                                    " minimum lines to keep above and below cursor
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:.     " highlight problematic whitespace
    "highlight NonText guifg=#eee8d5
    "highlight specialkey guifg=#eee8d5

" editing & misc
    set showtabline=1
    set nowrap                      " do not wrap long lines
    set autoindent                  " indent at the same level of the previous line
    set smartindent
    set shiftwidth=4                " use indents of 4 spaces
    set expandtab                   " tabs are spaces, not tabs
    set tabstop=4                   " an indentation every four columns
    set softtabstop=4               " let backspace delete indent
    set nojoinspaces                " prevents inserting two spaces after punctuation on a join (j)
    set splitright                  " puts new vsplit windows to the right of the current
    set splitbelow                  " puts new split windows to the bottom of the current
    set pastetoggle=<f12>           " pastetoggle (sane indentation on pastes)


" key remappings
    nnoremap <space> <nop>
    let mapleader = ' '

    " easy pane navigation
    nnoremap <c-h> <c-w>h
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-l> <c-w>l

    noremap j gj
    noremap k gk

    noremap $ :call WrapRelativeMotion("$")<cr>
    noremap 0 :call WrapRelativeMotion("0")<cr>
    onoremap $ v:call WrapRelativeMotion("$")<cr>
    vnoremap $ :<c-u>call WrapRelativeMotion("$", 1)<cr>
    vnoremap 0 :<c-u>call WrapRelativeMotion("0", 1)<cr>

    map <s-j> gT
    map <s-k> gt

    " fix shift key on commands
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang Qa qa<bang>
    command! -bang QA qa<bang>

    nnoremap Y y$

    " select pasted text
    nnoremap gp `[v`]

    " easy indenting
    vnoremap < <gv
    vnoremap > >gv

    " use repeat in visual mode
    vnoremap . :normal .<cr>

    " sudo make sandwich
    cmap w!! w !sudo tee % >/dev/null

    " edit helpers
    cnoremap %% <c-r>=expand('%:h').'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    " adjust viewports to the same size
    map <leader>= <c-w>=

    " map <leader>ff to display all lines with keyword under cursor
    " and ask which one to jump to
    nmap <leader>ff [i:let nr = input("which one: ")<bar>exe "normal " . nr ."[\t"<cr>

    " insert mode navigation
    inoremap <c-a> <esc>I
    inoremap <c-e> <esc>A

    " text bubbling
    nmap <c-up> ddkP
    nmap <c-down> ddp
    vmap <c-up> xkP`[V`]
    vmap <c-down> xp`[V`]

    " keep search results centered
    nnoremap n nzzzv
    nnoremap N Nzzzv

    " quickly edit/reload the vimrc file
    nmap <silent> <leader>ev :e ~/.vimrc<cr>
    nmap <silent> <leader>sv :so ~/.vimrc<cr>

    " Make it so that a curly brace automatically inserts an indented line
    inoremap {<CR> {<CR>}<Esc>O<BS><Tab>

    " Remove highlight after search
    nnoremap <leader>\ :nohl<cr>

" custom functions
    " relative motion
    function! WrapRelativeMotion(key, ...)
        let vis_sel=""
        if a:0
            let vis_sel="gv"
        endif
        if &wrap
            execute "normal!" vis_sel . "g" . a:key
        else
            execute "normal!" vis_sel . a:key
        endif
    endfunction
    " restore cursor to file position in previous editing session
    function! ResCur()
        if line("'\"") <= line("$")
            normal! g`"
            return 1
        endif
    endfunction

    augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
    augroup END

     " Initialize directories {
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        let common_dir = parent . '/.' . prefix

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()

    " strip whitespace
    function! StripTrailingWhitespace()
        " preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction

" auto commands
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
    autocmd filetype c,cpp,java,go,php,javascript,python,twig,xml,yml,perl autocmd bufwritepre <buffer> call StripTrailingWhitespace() " strip trailing whitespace

" plugins

    " Tabularize
        nmap <leader>t& :Tabularize /&<cr>
        vmap <leader>t& :Tabularize /&<cr>
        nmap <leader>t= :Tabularize /=<cr>
        vmap <leader>t= :Tabularize /=<cr>
        nmap <leader>t: :Tabularize /:<cr>
        vmap <leader>t: :Tabularize /:<cr>
        nmap <leader>t:: :Tabularize /:\zs<cr>
        vmap <leader>t:: :Tabularize /:\zs<cr>
        nmap <leader>t, :Tabularize /,<cr>
        vmap <leader>t, :Tabularize /,<cr>
        nmap <leader>t<bar> :Tabularize /<bar><cr>
        vmap <leader>t<bar> :Tabularize /<bar><cr>

    " session list
        set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
        nmap <leader>sl :SessionList<cr>
        nmap <leader>ss :SessionSave<cr>
        nmap <leader>sc :SessionClose<cr>

    " tagbar
        nnoremap <silent> <leader>tt :TagbarToggle<cr>

        let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
                \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
                \ 'r:constructor', 'f:functions' ],
            \ 'sro' : '.',
            \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
            \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }

    " UndoTree
        nnoremap <Leader>u :UndotreeToggle<CR>
        " If undotree is opened, it is likely one wants to interact with it.
        let g:undotree_SetFocusWhenToggle=1

    " vim -airline
        let g:airline_powerline_fonts=0
        let g:airline_theme='tomorrow'
        let g:airline_left_sep='›'  " Slightly fancier than '>'
        let g:airline_right_sep='‹' " Slightly fancier than '<'
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#fnamemod=':t'

    " Ultisnips
    let g:UltiSnipsExpandTrigger="<c-k>"
    let g:UltiSnipsJumpForwardTrigger="<c-k>"
    let g:UltiSnipsJumpBackwardTrigger="<c-j>"

" Emmet
    imap <C-l> <C-y>,
    "let g:user_emmet_leader_key="<C-l>"

" Eclim
    let g:EclimCompletionMethod = 'omnifunc'

" NeoComplete
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplete#close_popup() . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" gui settings
    if has('gui_running')
        set guioptions-=t                 " remove the toolbar
        set guifont=TerminusTTF:h14
        "set lines=999 columns=9999
        set guioptions-=r                 " disable right scrollbar
        set guioptions-=L                 " disable left scrollbar
        let g:airline_theme='base16'
    endif
