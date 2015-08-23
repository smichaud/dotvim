""""""""""""""""""""""""""""""""""""
" Set Vundle for plugins
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'derekwyatt/vim-protodef'
Plugin 'stefandtw/quickfix-reflector.vim'
Plugin 'smichaud/vim-snippets'
Plugin 'easymotion/vim-easymotion'
Plugin 'altercation/vim-colors-solarized'
" Not plugins, but it is easier to manage with Vundle
Plugin 'seebi/dircolors-solarized'
Plugin 'Anthony25/gnome-terminal-colors-solarized'
call vundle#end()

filetype plugin indent on

""""""""""""""""""""""""""""""""""""
" Set the leader key
let mapleader="\<Space>"

""""""""""""""""""""""""""""""""""""
" General configurations
set encoding=utf-8
set fileencoding=utf-8

set notimeout "To prevent the timeout on the leader key
set ttimeout "To prevent the timeout on the leader key

set ttyfast

set hlsearch
set incsearch
noremap <F8> :nohlsearch<CR>

set history=100
set showcmd
set showmode

set backspace=indent,eol,start
set autoindent
set tabstop=4 shiftwidth=4 expandtab

set scrolloff=999
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
nnoremap H <C-U>
nnoremap L <C-D>

set listchars=tab:▷-,trail:▫,eol:¬
noremap <F7> :set list!<CR>
noremap <F12> :set spell!<CR>

set relativenumber
set nu
set ruler

set wildmenu

set splitbelow
set splitright

set laststatus=2
set colorcolumn=80

" Windows/Buffers settings
map <C-J> <C-W>h<C-W>_
map <C-K> <C-W>l<C-W>_
map - <C-W>-
map + <C-W>+
set hidden " Remove warning when changing buffer w/o saving

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

""""""""""""""""""""""""""""""""""""
" Configurations for plugins

" NERDTree setup
map <F10> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1

" Ctrlp setup
let g:ctrlp_show_hidden = 1

" Tagbar setup
nmap <F2> :TagbarToggle<CR>

" EasyMotion setup
let g:EasyMotion_do_mapping = 0
nmap <Leader>f <Plug>(easymotion-w)
nmap <Leader>s <Plug>(easymotion-s2)

" NERDCommenter setup (removed default mappings in ./after/plugin/MyMaps.vim)
function RemoveNERDCommenterMapping()
    unmap <Leader>cc
    unmap <Leader>cn
    unmap <Leader>c<Space>
    unmap <Leader>cm
    unmap <Leader>ci
    unmap <Leader>c$
    unmap <Leader>cA
    unmap <Leader>cl
    unmap <Leader>cb
    unmap <Leader>cu
endfunction
nnoremap <Leader><Leader> :call NERDComment(0,"toggle")<CR>

" YouCompleteMe setup
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_filetype_blacklist = {}
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_select_completion = ["<tab>", "<Down>"]
let g:ycm_key_list_previous_completion = ["<C-tab>", "<Up>"]
let g:SuperTabDefaultCompletionType = "<tab>"
let g:ycm_complete_in_comments = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
set tags=./tags;

" Ultisnip setup
let g:UltiSnipsExpandTrigger = "<C-J>"
let g:UltiSnipsJumpForwardTrigger = "<C-J>"
let g:UltiSnipsJumpBackwardTrigger = "<C-K>"
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/snippets/UltiSnips/"
map <F3> :UltiSnipsEdit<CR>

" Fugitive and GitGutter setup
map <Leader>gits :Gstatus<CR>
map <Leader>gitc :Gcommit
map <Leader>gitf :Gfetch
map <Leader>gitme :Gmerge
map <Leader>gitpl :Gpull
map <Leader>gitps :Gpush
map <Leader>gita :Git add
map <Leader>gitr :Gremove
map <Leader>gitmo :Gmove
map <Leader>gitd :Gvdiff
map <Leader>gitbr :Git branch
map <Leader>gitl :Glog<CR>
map <Leader>gitbl :Gblame<CR>
map <Leader>gitw :Gbrowset<CR>
map <F6> :GitGutterToggle<CR>
let g:gitgutter_max_signs = 800

" FSwitch setup
map <F4> :FSHere<CR>
function GoToDefElseDec()
    let methodName=expand("<cword>")
    exe "normal :FSHere\<CR>"
    exe "normal /" . methodName . "\<CR>"
endfunction
nnoremap <Leader>gd :call GoToDefElseDec()<CR>

" Airline setup
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nnoremap <Leader>q :bd<CR>
nnoremap <Leader>j :bp<CR>
nnoremap <Leader>k :bn<CR>
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" Colors-Solarized setup
call togglebg#map("<F9>")
set t_Co=16
let g:solarized_termcolors=16
let g:solarized_italic=1
let g:solarized_bold=1
let g:solarized_underline=1
syntax enable
set background=dark
colorscheme solarized

" Protodef setup
let g:disable_protodef_mapping=1
nmap <Leader>vv :set paste<cr>i<c-r>=protodef#ReturnSkeletonsFromPrototypesForCurrentBuffer({})<cr><esc>='[:set nopaste<cr>

""""""""""""""""""""""""""""""""""""
" Custom remapping

" Windows control via leader instead of ctrl
 nnoremap <Leader>wh <C-W>h
 nnoremap <Leader>wl <C-W>l
 nnoremap <Leader>wj <C-W>j
 nnoremap <Leader>wk <C-W>k
 nnoremap <Leader>wv <C-W>v
 nnoremap <Leader>ws <C-W>s
 nnoremap <Leader>wq <C-W>q

" Faster copy/paste from clipboard
noremap <Leader>y "+y
noremap <Leader>Y "+Y
noremap <Leader>p "+p
noremap <Leader>P "+P
noremap <Leader>d "+d

" Faster delete without registry (wipe) and replacement
noremap <Leader>w "_d
noremap <Leader>ciw "_diwP
function AddReplaceLineMapping()
    noremap <Leader>cc "_ddO<ESC>P
endfunction

" Allow add remove line in normal mode
nnoremap <silent><Leader>xo m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><Leader>xO m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><Leader>o :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><Leader>O :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Search and replace (can use :Ggrep and :grep)
nnoremap <Leader>rr :%s/\<<C-r><C-w>\>/<C-r><C-w>/gc <bar> update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
nnoremap <Leader>S /\c\<<C-r><C-w>\><CR>
nnoremap <Leader>* :Ggrep -w <C-r><C-w><CR><bar>:copen<CR>
nnoremap <Leader>/ :Ggrep<Space>
" Check cool option with grep: -i, -A, -B, -C, -r, -v...
" Function to toggle the quickfix window
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction
nmap <silent> \ :QFix<CR>

" Adjust tabs (==space) and removed trailing whitespaces
nnoremap <Leader>ri m`<bar>:set expandtab<CR><bar>:retab!<CR><bar>:%s/\s\+$//e<CR><bar>gg=G``
" Remove the carriage return before {
nnoremap <Leader>r{ m`<bar>:%s/\n\s*{/ {/g<CR>``

" Use arrow to move text in visual mode
vnoremap <Left> dhPgvhoh
vnoremap <Down> :m '>+1<CR>gv=gv
vnoremap <Up> :m '<-2<CR>gv=gv
vnoremap <Right> dpgvlol

" Use shift+arrow to add blank line before/after in visual block mode
vnoremap <Leader><Left> yPgvr<Space>gv
vnoremap <Leader><Right> ygvr<Space>Pgv

" Add all cpp and hpp to arg and rename the word under cursor
function! QuickfixFilenames()
    " Building a hash ensures we get each buffer only once
    let buffer_numbers = {}
    for quickfix_item in getqflist()
        let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
    endfor
    return join(values(buffer_numbers))
endfunction
function RefactorAllExceptBuild()
    exe 'argdelete *'
    exe 'argadd' "**/*.cpp **/*.hpp"
    if isdirectory("build")
        exe 'argdelete' "build/**"
    endif
    "exe 'argdelete' "."
    "execute 'argdo %s/var/oops/gce'
endfunction

"nnoremap <Leader>RR :call RefactorAllExceptBuild()<CR>
nnoremap <Leader>RR :argadd **/*.cpp **/*.hpp <bar> :argdelete build/** <bar>:argdo %s/\<<C-r><C-w>\>//gc<bar>update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>


""""""""""""""""""""""""""""""""""""
" CPP custom functions/mappings

nnoremap <Leader>; A;<Esc>

" New cpp class
function NewCppClass(path_name)
    let class_name = substitute(a:path_name, "^.*\/", "", "")
    exe ":e" a:path_name . ".cpp"
    exe "normal i#include \"" . class_name . ".hpp\"\<CR>\<CR>\<Esc>"
    exe "normal i" .  class_name . "::" . class_name . "() {\<CR>}\<CR>\<Esc>"

    exe ":e" a:path_name . ".hpp"
    exe "normal i#ifndef " . toupper(class_name) . "_H\<CR>\<Esc>"
    exe "normal i#define " . toupper(class_name) . "_H\<CR>\<CR>\<Esc>"
    exe "normal iclass " . class_name . " {\<CR>\<Esc>"
    exe "normal iprivate:\<CR>\<Esc>"
    exe "normal i\<Tab>\<Tab>// Private variables\<CR>\<Esc>"
    exe "normal ipublic:\<CR>\<Esc>"
    exe "normal i\<Tab>\<Tab>" . class_name . "();\<CR>\<Esc>"
    exe "normal i};\<CR>\<CR>\<Esc>"
    exe "normal i#endif\<Esc>"
endfunction
nnoremap <Leader>nc :call NewCppClass("")<Left><Left>

" Refactor extract to method cpp
function GetClassName()
    :normal mc
    :normal! gg<CR>
    exe "normal! /\^\\S\*::\<CR>"
    let className=expand("<cword>")
    :normal `c
    return className
endfunction
function RemoveParametersType(signature)
    return substitute(a:signature, '\v([\(|,])([^,|\)]*\s+(\w+))', '\1\3', 'g')
endfunction
function ExtractMethod()
    :normal mm
    let signature = input("Enter method signature: ", "")
    exe "normal! O" . RemoveParametersType(signature) . ";\<Esc>"
    exe "normal! ][o\<CR>" . signature . "{\<CR>}\<Esc>P"
    exe "normal! ][%0eebi" . GetClassName() . "::"
    exe "normal :FSHere\<CR>"
    exe "normal! G?private:\<CR>o" . signature . ";\<Esc>"
    exe "normal :FSHere\<CR>"
    exe "normal `mk^df f(\<Esc>"
endfunction
noremap <Leader>rem :call ExtractMethod()<CR>

" Build commands
nnoremap <Leader>bc :! (cd build/ && make)<CR>
nnoremap <Leader>bC :! (cd build/ && cmake .. && make)<CR>
nnoremap <Leader>brr :! (project=${PWD\#\#*/} && cd /home/smichaud/Workspace/CatkinWorkspace/ && catkin_make --pkg $project)<CR>
nnoremap <Leader>brt :! (project=${PWD\#\#*/} && cd /home/smichaud/Workspace/CatkinWorkspace/ && catkin_make run_tests_$project)<CR>
nnoremap <Leader>bll :! pdflatex %<CR>
nnoremap <Leader>blb :! pdflatex % && bibtex % && pdflatex %<CR>
nnoremap <Leader>bL :! pdflatex

""""""""""""""""""""""""""""""""""""
" Allow plugins
syntax on
" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufNewFile,BufRead *.launch  set syntax=xml
autocmd QuickFixCmdPost *grep* copen
autocmd VimEnter *  . call RemoveNERDCommenterMapping()
autocmd VimEnter *  . call AddReplaceLineMapping()
