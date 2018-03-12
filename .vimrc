set t_Co=256
"set termguicolors
set background=dark
syntax enable
"colorscheme molokai
execute pathogen#infect()
filetype plugin indent on

colorscheme palenight
" color dracula
" Set separator
set fillchars+=vert:│

" Enter command mode without SHIFT
noremap ; :

" Allow saving of files as sudo when I forgot to start vim using sudo.
" cnoremap w!! w !sudo tee > /dev/null %
" command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" those all from youtube cast
set path+=**
set wildmenu

" Shortcut to rapidly toggle `set list` <leader> is the \
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Toggle NERDTree
nmap <leader>n :NERDTreeToggle<CR>

" Relative line number
:set number
:set relativenumber

" get rid from | chars on window separation
" :set fillchars+=vert:\

"allow switch between buffers without saving them
:set hidden

" highlight brackets
set showmatch
" tabs with
set ts=4 sts=4 sw=4 expandtab
set cursorline


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='simple'

" Hard mode breacking arrow keys
noremap <UP> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Move between wondows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" More natural split opening
set splitbelow
set splitright

" prety print json command mode = all file visual mode only selected block
com! -range=% FormatJSON <line1>,<line2>!python -m json.tool

" Source the vimrc file after saving it
" Autoclose Figutive hidden buffers
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
  autocmd BufReadPost fugitive://* set bufhidden=delete
endif

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "style" }

"colorscheme nova
let g:XkbSwitchEnabled = 1

" ansible-vim
" au BufRead,BufNewFile *.yml set filetype=ansible
let g:ansible_unindent_after_newline = 1
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'
