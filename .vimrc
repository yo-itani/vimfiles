if 1
    syntax on
    set t_Co=256
    set nocompatible
    colorscheme molokai

    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim/
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'thinca/vim-quickrun'
    Plugin 'prabirshrestha/vim-lsp'
    Plugin 'mattn/vim-lsp-settings'
    Plugin 'prabirshrestha/asyncomplete.vim'
    Plugin 'prabirshrestha/asyncomplete-lsp.vim'
    Plugin 'itchyny/lightline.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-surround'
    Plugin 'mattn/emmet-vim'
    call vundle#end()
    filetype plugin indent on

    set tabstop=4
    set shiftwidth=4
    set list
    set autoindent
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
    autocmd FileType css setl tabstop=8 expandtab shiftwidth=2 softtabstop=2
    autocmd BufNewFile *.py 0r $HOME/.vim/template/python.txt
    autocmd BufNewFile index.html 0r $HOME/.vim/template/html.txt
    autocmd BufNewFile .gitignore 0r $HOME/.vim/template/gitignore.txt

    " quickrun
    let g:quickrun_config={'python': {'command': 'python3'}, '*': {'opener': 'split'}}
    if !hasmapto('<Plug>(quickrun)')
    \  && (!exists('g:quickrun_no_default_key_mappings')
    \      || !g:quickrun_no_default_key_mappings)
      silent! map <unique> <Leader>r <Plug>(quickrun)
    endif
    nnoremap n nzz
    nnoremap N Nzz
    nnoremap * *zz
    nnoremap # #zz
    nnoremap g* g*zz
    nnoremap g# g#zz
    nnoremap j gj
    nnoremap k gk
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
