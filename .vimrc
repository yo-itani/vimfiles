if 1
    set completeopt=menuone,noinsert
    call plug#begin('~/.vim/plugged')
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'thinca/vim-quickrun'
    Plug 'itchyny/lightline.vim'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    call plug#end()
    noremap <expr> / getcmdtype() == '/' ? '\/' : '/'
    cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
    syntax on
    set t_Co=256
    set nocompatible
    colorscheme molokai

    filetype plugin indent on

    set tabstop=4
    set shiftwidth=4
    set list
    set expandtab
    set noautoindent
    set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
    set backspace=start,eol,indent
    set expandtab
    set fileencodings=utf-8,cp932,sjis,iso-2022-jp,euc-jp
    set ruler
    set wildmenu
    set laststatus=2
    autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
    autocmd FileType yaml setl tabstop=8 expandtab shiftwidth=2 softtabstop=2
    autocmd FileType html setl tabstop=8 expandtab shiftwidth=2 softtabstop=2 autoindent
    autocmd FileType htmldjango setl tabstop=8 expandtab shiftwidth=2 softtabstop=2
    autocmd FileType vue setl tabstop=8 expandtab shiftwidth=2 softtabstop=2
    autocmd FileType typescript setl tabstop=8 expandtab shiftwidth=2 softtabstop=2
    autocmd FileType json setl tabstop=8 expandtab shiftwidth=2 softtabstop=2
    autocmd FileType javascript setl tabstop=8 expandtab shiftwidth=2 softtabstop=2
    autocmd FileType css setl tabstop=8 expandtab shiftwidth=2 softtabstop=2
    autocmd BufNewFile *.py 1r $HOME/.vim/template/python.txt
    autocmd BufNewFile index.html 0r $HOME/.vim/template/html.txt
    autocmd BufNewFile .gitignore 0r $HOME/.vim/template/gitignore.txt

    " quickrun
    let g:quickrun_config = {'python': {'command': 'python3'}, '*': {'opener': 'split'}}
    set ruler
    set wildmenu
    set laststatus=2
    if !hasmapto('<Plug>(quickrun)')
    \  && (!exists('g:quickrun_no_default_key_mappings')
    \      || !g:quickrun_no_default_key_mappings)
      silent! map <unique> <Leader>r <Plug>(quickrun)
    endif

    " lsp
    let g:lsp_diagnostics_echo_cursor = 1
    nnoremap n nzz
    nnoremap N Nzz
    nnoremap * *zz
    nnoremap # #zz
    nnoremap g* g*zz
    nnoremap g# g#zz
    nnoremap j gj
    nnoremap k gk
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
    nnoremap <leader>r :QuickRun<CR>
    if &term =~ "xterm"
        let &t_ti .= "\e[?2004h"
        let &t_te .= "\e[?2004l"
        let &pastetoggle = "\e[201~"

        function XTermPasteBegin(ret)
            set paste
            return a:ret
        endfunction

        noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
        inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
        cnoremap <special> <Esc>[200~ <nop>
        cnoremap <special> <Esc>[201~ <nop>
    endif
endif
