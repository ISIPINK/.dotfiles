" test
syntax on
filetype plugin indent on

"spellcheck
  set spelllang=en_gb,nl
  inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
  set spell
  hi clear SpellBad
  hi SpellBad cterm=underline
  

"sets
  set ts=2 sts=2 sw=2 et ai si
  set relativenumber
  set number
  set scrolloff=10
  set incsearch
  set ignorecase
  autocmd VimEnter * NoMatchParen

 au FileType python setlocal formatprg=autopep8\ -
 au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix 

"colours over column 80 
hi Bang ctermfg=red guifg=red
match Bang /\%>79v.*\%<81v/

"key mappings
  let mapleader=","
  inoremap jj <esc>
  noremap <F2> :NERDTreeToggle<cr>
  noremap  <F4> :ClangFormat<cr>
  autocmd FileType cpp nnoremap <silent><buffer> K <Esc>:!cppman <cword><CR>
  autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
  autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"plugs
  let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
  if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

  call plug#begin()
  Plug 'preservim/NERDTree'
    let NERDTreeShowHidden=1
  Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    let g:UltiSnipsSnippetDirectories=["UltiSnips"]
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'airblade/vim-gitgutter'
  Plug 'rhysd/vim-clang-format'
    let g:clang_format#detect_style_filea = 1
  Plug 'dense-analysis/ale'
    let g:ale_c_clangtidy_checks = 1
  Plug 'frazrepo/vim-rainbow'
    let g:rainbow_active = 1
  Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
    set conceallevel=1
    let g:tex_conceal='abdmg'
  Plug 'jayli/vim-easycomplete'
    let g:easycomplete_tab_trigger="<c-space>"
    let g:easycomplete_tabnine_config = {
    \ 'line_limit': 1000,
    \ 'max_num_result' : 5,
    \ }
  Plug 'jiangmiao/auto-pairs'
  call plug#end()
