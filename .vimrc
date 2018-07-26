""""""""""""""""""""""""""""""""""""
" Set Vundle for plugins
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Read the project .editorconfig file and apply rules
Plugin 'editorconfig/editorconfig-vim'

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'easymotion/vim-easymotion'

" Move between windows with c+hjkl
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'smichaud/vim-snippets'

" Improved status bar (bottom)
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Delete buffer without closing windows (leader+q)
Plugin 'moll/vim-bbye'
" Apply changes directly from quickfix window
Plugin 'stefandtw/quickfix-reflector.vim'

" Git wrapper
Plugin 'tpope/vim-fugitive'
" Git changes display in the 'gutter' on the left with line numbers
Plugin 'airblade/vim-gitgutter'

" Comment with leader+leader
Plugin 'scrooloose/nerdcommenter'
" Tool to quickly change surrounding parentheses, brackets, quotes, XML tags...
Plugin 'tpope/vim-surround'
" Autoclose quotes, parentheses, brackets...
Plugin 'Raimondi/delimitMate'

" Highlight enclosing tags
Plugin 'gregsexton/MatchTag'
" Autoclose html/xml tags
Plugin 'alvan/vim-closetag'
" Extend the % operator to tag
Plugin 'tmhedberg/matchit'

" Javascript highlighting and improved indentation
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mattn/emmet-vim'

" Asynchronous Lint Engine
Plugin 'w0rp/ale'
 
" A bunch of utilities for Python
Plugin 'klen/python-mode'
"Plugin 'ambv/black' # Would require vim built with python 3.6

"Plugin 'derekwyatt/vim-fswitch'
"Plugin 'derekwyatt/vim-protodef'
"Plugin 'bbchung/clighter'

Plugin 'lervag/vimtex'
Plugin 'suan/vim-instant-markdown'

Plugin 'altercation/vim-colors-solarized'
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
set title

set ttyfast

set ignorecase
set smartcase
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
set colorcolumn=81

" Update files automatically when changed externally
set autoread | au CursorHold * checktime | call feedkeys("lh")

" Windows/Buffers settings
map <Leader><bar> <C-w>v
map <Leader>- <C-w>s
map - <C-W>-
map + <C-W>+
set hidden " Remove warning when changing buffer w/o saving

set directory=$HOME/.vim/swapfiles//

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

""""""""""""""""""""""""""""""""""""
" Configurations for plugins

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" NERDTree setup
nmap <Leader>tt :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=0
set wildignore+=*.pyc,*swp,*.DS_Store,*__pycache__,*node_modules*,*.pytest_cache*,*.git
let NERDTreeRespectWildIgnore=1
let g:NERDTreeWinSize=40

" Ctrlp setup
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = 'node_modules\|git'

" Tagbar setup
nmap <Leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/home/smichaud/Programs/ctags-5.8/ctags'
let g:tagbar_sort = 0
let g:tagbar_width = 26

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
let g:ycm_seed_identifiers_with_syntax = 1
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
let g:UltiSnipsJumpForwardTrigger = "<C-J>"
let g:UltiSnipsJumpBackwardTrigger = "<C-K>"
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
set diffopt+=vertical

" FSwitch setup
nmap <F4> :FSHere<CR>
nmap <Leader>gf :FSHere<CR>
function GoToDefElseDec()
    let methodName=expand("<cword>")
    exe "normal :FSHere\<CR>"
    exe "normal /" . methodName . "\<CR>"
endfunction
"nnoremap <Leader>gd :call GoToDefElseDec()<CR>
map <leader>gd  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Airline setup
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nnoremap <Leader>q :Bdelete<CR>
nnoremap <Leader>j :bp<CR>
nnoremap <Leader>k :bn<CR>
nnoremap <Leader><tab> :e#<CR>
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
let g:airline_theme='light'
let g:solarized_base16 = 1

" Quickfix-reflector
let g:qf_modifiable = 1
let g:qf_write_changes = 1

" Colors-Solarized setup
call togglebg#map("<F12>")
set t_Co=16
let g:solarized_termcolors=16
let g:solarized_italic=1
let g:solarized_bold=1
let g:solarized_underline=1
syntax enable
set background=light
colorscheme solarized

" Vimtex setup
let g:tex_flavor = "latex"
let g:vimtex_quickfix_autojump = 0
let g:vimtex_quickfix_mode = 0
let g:vimtex_compiler_latexmk = {
        \ 'background' : 1,
        \ 'build_dir' : 'build',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'options' : [
        \   '-pdf',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}

nnoremap <Leader>bl :VimtexCompile<CR>

" Markdown setup

" HTML
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.xml,*.js"
au FileType xml,html,phtml,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:}"

" Javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

let g:user_emmet_expandabbr_key = "<C-e>"
let g:ale_set_quickfix = 1

" Asynchronous Lint Engine
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
nmap <leader>ll :ALELint<CR>

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
noremap <Leader>ciw "_diwp
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
nnoremap <Leader>// :Ggrep<Space>
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

" Use arrow to move text in visual mode
vnoremap <Left> dhPgvhoh
vnoremap <Down> :m '>+1<CR>gv=gv
vnoremap <Up> :m '<-2<CR>gv=gv
vnoremap <Right> dpgvlol

" Use shift+arrow to add blank line before/after in visual block mode
vnoremap <Leader><Left> yPgvr<Space>gv
vnoremap <Leader><Right> ygvr<Space>Pgv

""""""""""""""""""""""""""""""""""""
" Python custom functions/mappings

let g:ycm_python_binary_path = '/usr/bin/python3'

" Python-mode
let g:pymode = 1
let g:pymode_rope_map_space = 0
let g:pymode_folding = 0
let g:pymode_rope_completion_bind = ''
let g:pymode_lint_cwindow = 0

let g:pymode_run_bind = '<leader><F8>'
let g:pymode_breakpoint_bind = '<leader><F8>'
let g:pymode_rope_show_doc_bind = '<leader><F8>'
let g:pymode_rope_goto_definition_bind = '<leader><F8>'
let g:pymode_rope_goto_definition_cmd = '<leader><F8>'
let g:pymode_rope_rename_bind = '<leader><F8>'
let g:pymode_rope_module_to_package_bind = '<leader><F8>'
let g:pymode_rope_extract_method_bind = '<leader><F8>'
let g:pymode_rope_extract_variable_bind = '<leader><F8>'
let g:pymode_rope_use_function_bind = '<leader><F8>'
let g:pymode_rope_move_bind = '<leader><F8>'
let g:pymode_rope_change_signature_bind = '<leader><F8>'

" Jedi deactivate most stuff (keep for function param completion)
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0
"let g:jedi#completions_enabled = 0
"let g:jedi#completions_command = ""
"let g:jedi#show_call_signatures = "1"

"let g:jedi#goto_assignments_command = "<leader>pa"
"let g:jedi#goto_definitions_command = "<leader>pd"
"let g:jedi#documentation_command = "<leader>pk"
"let g:jedi#usages_command = "<leader>pu"
"let g:jedi#rename_command = "<leader>pr"
"let python_highlight_all=1
syntax on

" Indent preprocessor directives
set cinkeys=0{,0},0),:,!^F,o,O,e

nnoremap <Leader>; A;<Esc>
nnoremap <Leader>{ $xa<space>{<Esc>
nnoremap <Leader>} $xa<space>{<Enter>}<Esc>

"nnoremap <Leader>bll :! pdflatex %<CR>
"nnoremap <Leader>blb :! pdflatex % && bibtex % && pdflatex %<CR>
"nnoremap <Leader>bL :! pdflatex

""""""""""""""""""""""""""""""""""""
" Allow plugins
syntax on
" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufNewFile,BufRead *.launch  set syntax=xml
autocmd QuickFixCmdPost *grep* botright copen
" Auto open nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTreeToggle | endif
