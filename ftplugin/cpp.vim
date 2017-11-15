" Check cool option with grep: -i, -A, -B, -C, -r, -v...
nnoremap <Leader>// :grep -r --include=*.{cpp,h,hpp} "" .<Left><Left><Left>

" Remove the carriage return before {
nnoremap <Leader>r{ m`<bar>:%s/\n\s*{/ {/g<CR>``

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

" New cpp class
function NewCppClass(path_and_class_name)
    let class_name = substitute(a:path_and_class_name, "^.*\/", "", "")
    let path = substitute(a:path_and_class_name, class_name . "$", "", "")
    "exe ":e" a:path_and_class_name . ".cpp"
    exe ":e" path . tolower(class_name) . ".cpp"
    exe "normal i#include \"" . tolower(class_name) . ".hpp\"\<CR>\<CR>\<CR>\<Esc>"
    exe "normal i" .  class_name . "::" . class_name . "() {\<CR>}\<CR>\<Esc>"

    "exe ":e" a:path_and_class_name . ".hpp"
    exe ":e" path . tolower(class_name) . ".hpp"
    exe "normal i#ifndef " . toupper(class_name) . "_H\<CR>\<Esc>"
    exe "normal i#define " . toupper(class_name) . "_H\<CR>\<CR>\<CR>\<Esc>"
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
        set makeprg=cd\ ./build\ cmake..\ &&\ make\ -j8
        echo 'set makeprg=cd\ ./build\ cmake\ ..\ &&\ make\ -j8'
    elseif a:make_type ==? 'cmake'
        set makeprg=cd\ ./build\ cmake..\ &&\ make\ -j8
        echo 'set makeprg=cd\ ./build\ cmake\ ..\ &&\ make\ -j8'
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

