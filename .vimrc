""""""""""""""""""""""""""""""""""""
" Set Vundle for plugins
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'smichaud/vim-snippets'

Plugin 'bling/vim-airline'
Plugin 'moll/vim-bbye'
Plugin 'stefandtw/quickfix-reflector.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
Plugin 'easymotion/vim-easymotion'

Plugin 'derekwyatt/vim-fswitch'
Plugin 'derekwyatt/vim-protodef'
Plugin 'bbchung/clighter'

Plugin 'lervag/vimtex'

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
nmap <Leader>th :nohlsearch<CR>

set history=100
set showcmd
set showmode

set backspace=indent,eol,start
set autoindent
set tabstop=4 shiftwidth=4 expandtab

set scrolloff=999
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
map H <C-u>
map L <C-d>

set listchars=tab:▷-,trail:▫,eol:¬
nmap <Leader>t<Space> :set list!<CR>
nmap <Leader>tc :set spell!<CR>

set relativenumber
set nu
set ruler
nnoremap <Leader>tn :set relativenumber!<CR><Bar>:set number!<CR>

set wildmenu

set splitbelow
set splitright

set laststatus=2
set colorcolumn=80

" Windows/Buffers settings
map <Leader><bar> <C-w>v
map <Leader>- <C-w>s
map - <C-W>-
map + <C-W>+
set hidden " Remove warning when changing buffer w/o saving

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

""""""""""""""""""""""""""""""""""""
" Configurations for plugins

" NERDTree setup
nmap <Leader>tt :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1

" Ctrlp setup
let g:ctrlp_show_hidden = 1

" Tagbar setup
nmap <Leader>tb :TagbarToggle<CR>

" Tmux-navigator setup
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>

" EasyMotion setup
let g:EasyMotion_do_mapping = 0
nmap <Leader>f <Plug>(easymotion-bd-w)

" NERDCommenter setup 
let g:NERDCreateDefaultMappings = 0
map <Leader><Leader> :call NERDComment(0,"toggle")<CR>

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
set tags=./tags;

" Clighter setup
let g:clighter_libclang_file = '/usr/lib/llvm-3.4/lib/libclang.so.1'
let g:clighter_occurrences_mode = 1

" Ultisnip setup
let g:UltiSnipsExpandTrigger = "<C-Space>"
let g:UltiSnipsJumpForwardTrigger = "<C-Space>"
let g:UltiSnipsJumpBackwardTrigger = "<C-Backspace>"
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/vim-snippets/UltiSnips/"
nmap <Leader>ts :UltiSnipsEdit<CR>

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
nmap <Leader>tg :GitGutterToggle<CR>
let g:gitgutter_max_signs = 800

" FSwitch setup
nmap <F4> :FSHere<CR>
nmap <Leader>gf :FSHere<CR>
function GoToDefElseDec()
    let methodName=expand("<cword>")
    exe "normal :FSHere\<CR>"
    exe "normal /" . methodName . "\<CR>"
endfunction
nnoremap <Leader>gd :call GoToDefElseDec()<CR>

" Airline setup
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nnoremap <Leader>q :Bdelete<CR>
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
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Colors-Solarized setup
call togglebg#map("<F12>")
set t_Co=16
let g:solarized_termcolors=16
let g:solarized_italic=1
let g:solarized_bold=1
let g:solarized_underline=1
syntax enable
set background=dark
colorscheme solarized

" Vimtex setup
let g:tex_flavor = "latex"
let g:vimtex_mappings_enabled=0
let g:vimtex_fold_enabled=0
let g:vimtex_fold_preamble=0
let g:vimtex_fold_sections=0
let g:vimtex_quickfix_mode=0
let g:vimtex_latexmk_options='-pdf -f'
let g:vimtex_latexmk_build_dir='build'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
nmap <Leader>lv <plug>(vimtex-view)
nmap <Leader>ll <plug>(vimtex-compile-toggle)
nmap <Leader>le <plug>(vimtex-errors)

" Protodef setup
let g:disable_protodef_mapping=1
nmap <Leader>rg :set paste<cr>i<c-r>=protodef#ReturnSkeletonsFromPrototypesForCurrentBuffer({})<cr><esc>='[:set nopaste<cr>

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
noremap <Leader>cc "_ddO<ESC>P

" Allow add remove line in normal mode
nnoremap <silent><Leader>xo m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><Leader>xO m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><Leader>o :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><Leader>O :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Search and replace (can use :Ggrep and :grep)
nnoremap <Leader>rr :%s/\<<C-r><C-w>\>/<C-r><C-w>/gc <bar> update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
nnoremap <Leader>S /\c\<<C-r><C-w>\><CR>
nnoremap <Leader>* :Ggrep -w <C-r><C-w><CR><bar>:botright copen<CR>
nnoremap <Leader>/ :Ggrep<Space>
" Check cool option with grep: -i, -A, -B, -C, -r, -v...
" Function to toggle the quickfix window
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    botright copen 10
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

" Indent preprocessor directives
set cinkeys=0{,0},0),:,!^F,o,O,e

nnoremap <Leader>; A;<Esc>
nnoremap <Leader>{ $xa<space>{<Esc>
nnoremap <Leader>} $xa<space>{<Enter>}<Esc>

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
function SetMake(make_type)
    if a:make_type ==? ''
        set makeprg=cd\ ./build\ &&\ make
        echo 'set makeprg=cd\ ./build\ &&\ make'
    elseif a:make_type ==? 'cmake'
        set makeprg=cd\ ./build\ cmake..\ &&\ make
        echo 'set makeprg=cd\ ./build\ cmake\ ..\ &&\ make'
    elseif a:make_type ==? 'catkin'
        let prefix = 'cd /home/smichaud/Workspace/CatkinWorkspace/ && catkin_make --pkg '
        let project = input('Enter catkin project name: ')
        let &makeprg=l:prefix . l:project
    elseif a:make_type ==? 'rosmake'
        let prefix = 'rosmake '
        let project = input('Enter rosmake project name: ')
        let &makeprg=l:prefix . l:project
    endif
endfunction

nnoremap <Leader>bs :call SetMake("")<Left><Left>
nnoremap <Leader>bb :make<CR>
"nnoremap <Leader>brr :! (project=${PWD\#\#*/} && cd /home/smichaud/Workspace/CatkinWorkspace/ && catkin_make --pkg $project)<CR>
"nnoremap <Leader>brt :! (project=${PWD\#\#*/} && cd /home/smichaud/Workspace/CatkinWorkspace/ && catkin_make run_tests_$project)<CR>
nnoremap <Leader>bll :! pdflatex %<CR>
nnoremap <Leader>blb :! pdflatex % && bibtex % && pdflatex %<CR>
nnoremap <Leader>bL :! pdflatex

""""""""""""""""""""""""""""""""""""
" Allow plugins
syntax on
" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufNewFile,BufRead *.launch  set syntax=xml
autocmd QuickFixCmdPost *grep* botright copen
