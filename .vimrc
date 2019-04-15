execute pathogen#infect()
"cscope specify
if has("cscope")
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb
if filereadable("cscope.out")
cs add cscope.out
elseif $CSCOPE_DB != ""
cs add $CSCOPE_DB
endif
set csverb
endif
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <F5> :!cscope -Rbkq<CR>\
\:cs reset<CR>
\:!ctags -R .<CR>
\:TlistToggle<CR>
\:TlistToggle<CR>
"nerdtree specify
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"basic settings
let mapleader=" "
set nu
set hlsearch
set autoindent
set backspace=2
syntax on
set bg=dark
set tabstop=4
set expandtab
set shiftwidth=4
colorscheme solarized 
nmap <C-b>n  :bnext<CR>
nmap <C-b>p  :bprev<CR>
nmap <C-b>x  :bdelete<CR>
set wildmenu wildmode=full
set wildchar=<Tab> wildcharm=<C-Z>

function! AutoPair(open, close)
let line = getline('.')
if col('.') > strlen(line) || line[col('.') - 1] == ' '
return a:open.a:close."\<ESC>i"
else
return a:open
endif
endf

function! ClosePair(char)
if getline('.')[col('.') - 1] == a:char
return "\<Right>"
else
return a:char
endif
endf

function! SamePair(char)
let line = getline('.')
if col('.') > strlen(line) || line[col('.') - 1] == ' '
return a:char.a:char."\<ESC>i"
elseif line[col('.') - 1] == a:char
return "\<Right>"
else
return a:char
endif
endf

inoremap ( <c-r>=AutoPair('(', ')')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { <c-r>=AutoPair('{', '}')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ <c-r>=AutoPair('[', ']')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " <c-r>=SamePair('"')<CR>
inoremap ' <c-r>=SamePair("'")<CR>
inoremap ` <c-r>=SamePair('`')<CR>
imap { {}<ESC>i<CR><CR><ESC>ki<Tab>
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
nmap <C-`> :botright copen<CR>

"map save
nmap <silent><C-S>     :w<CR>
imap <silent><C-S>     <ESC>:w<CR>
vmap <silent><C-S>     <ESC>:w<CR>

" Set to auto read when a file is changed from the outside
set autoread

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the Wild menu
set wildmenu

"Always show current position
set ruler

" Be smart when using tabs ;)
set smarttab

" smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

"
"map line exchange

"taglist specify
set tags=tags;
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
map <F2> :TlistToggle<CR>
let Tlist_Auto_Open=1

"easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>w <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)
map <Leader>e <Plug>(easymotion-e)

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_right_sep='<'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>h <Plug>AirlineSelectPrevTab
nmap <leader>l <Plug>AirlineSelectNextTab
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#close_symbol = 'X'
"let g:airline_extensions = ['branch', 'tabline', 'ctrlp']

let g:airline#extensions#ctrlp#show_adjacent_modes = 1
