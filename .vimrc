"-------------
" vim settings
"-------------

if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
  call dein#begin('~/.vim/dein')

  call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('tomasr/molokai')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('cohama/lexima.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('mattn/emmet-vim')
  let g:lightline = {
    \'colorscheme' : 'wombat'
    \}

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable


" line number
set number

" color
set t_Co=256
set background=dark
colorscheme molokai

" syntax check
syntax on

" search highlight
set hlsearch

" status line
set laststatus=2
set statusline=2
set statusline=%F

" enable backspace key
set backspace=indent,eol,start

" indent
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

filetype plugin indent on

" GNU Global
map <C-n> :cn<CR>
map <C-p> :cp<CR>
map <C-g> :Gtags
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
