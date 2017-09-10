set t_Co=256
syntax enable
" colorscheme molokai
execute pathogen#infect()
filetype plugin indent on

" Enter command mode without SHIFT
noremap ; :

" those all from youtube cast
set path+=**
set wildmenu

" Shortcut to rapidly toggle `set list` <leader> is the \
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

au BufNewFile,BufRead *.yml set filetype=ansible

" Relative line number
:set number
:set relativenumber

" get rid from | chars on window separation
:set fillchars+=vert:\ 

"allow switch between buffers without saving them
:set hidden

" tabs with
set ts=4 sts=4 sw=4 expandtab

" Ctrl-P fuzzy finder stuff
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamecollapse = 1

" Hard mode breacking arrow keys
noremap <UP> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" prety print json command mode = all file visual mode only selected block
com! -range=% FormatJSON <line1>,<line2>!python -m json.tool

" Source the vimrc file after saving it
" Autoclose Figutive hidden buffers
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
  autocmd BufReadPost fugitive://* set bufhidden=delete
endif

colorscheme nova
