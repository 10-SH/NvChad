let g:lsp = {'declaration': '', 'definition': '', 'typeDefinition': '', 'implementation': '', 'references': '', 'superMethod': '', 'nextError': '', 'previousError': '', 'format': '', 'renameElement': '' ,'getInformation': '', 'forword': '', 'back': '','copyReference': '', 'SurroundWith': '', 'outLine':''}
let g:explorer = {'openExplorer': '','locationExplorer': ''}
let g:move = {'goLeft':'','goDown':'','goUp':'','goRight':''}

let keymaps = {}

for [k,v] in items(g:lsp)
        let g:keymaps.k = v
endfor

for [k,v] in items(g:explorer)
        let g:keymaps.k = v
endfor

for [k,v] in items(g:move)
        let g:keymaps.k = v
endfor

if g:APP == "idea"
    let mapleader = " "
    set nu
    set relativenumber
    inoremap jj <Esc>
    set NERDTree

    let keymaps.declaration = "action GotoDeclarationOnly"
    let keymaps.definition = "action GotoDeclarationOnly"
    let keymaps.typeDefinition = "action QuickTypeDefinition"
    let keymaps.implementation = "action GotoImplementation"
    let keymaps.references = "action ShowUsages"
    let keymaps.superMethod = "action GotoSuperMethod'"
    let keymaps.nextError = "action GotoNextError"
    let keymaps.previousError = "action GotoPreviousError"
    let keymaps.format = "action ReformatCode"
    let keymaps.renameElement = "action RenameElement"
    let keymaps.getInformation = "action QuickJavaDoc"
    let keymaps.forword = "action Forward"
    let keymaps.back = "action Back"
    let keymaps.copyReference = "action copyReference"
    let keymaps.surroundWith = "action SurroundWith"
    let keymaps.outLine = "action ActivateStructureToolWindow"
    let keymaps.openExplorer = "action NERDTreeToggle"
    let keymaps.locationExplorer = "action NERDTreeFind"
    let keymaps.goLeft = "normal! \<C-w>h"
    let keymaps.goDown = "normal! \<C-w>j"
    let keymaps.goUp = "normal! \<C-w>k"
    let keymaps.goRight = "normal! \<C-w>l"
elseif g:APP == "vscode"
    let mapleader = " "

    let keymaps.declaration = "call VSCodeNotify('editor.action.revealDeclaration')"
    let keymaps.definition = "call VSCodeNotify('editor.action.revealDefinition')"
    " keysmapsLsp.typeDefinition = ""
    let keymaps.implementation = "call VSCodeNotify('editor.action.peekImplementation')"
    let keymaps.references = "call VSCodeNotify('editor.action.goToReferences')"
    " let keymaps.superMethod = ""
    let keymaps.nextError = "call VSCodeNotify('editor.action.marker.nextInFiles')"
    let keymaps.previousError = "call VSCodeNotify('editor.action.marker.prevInFiles')"
    let keymaps.format = "call VSCodeNotify('editor.action.format')"
    let keymaps.renameElement = "call VSCodeNotify('editor.action.rename')"
    let keymaps.getInformation = "call VSCodeNotify('editor.action.showHover')"
    let keymaps.forword = "call VSCodeNotify('workbench.action.navigateForward')"
    let keymaps.back = "call VSCodeNotify('workbench.action.navigateBack')"
    " let keymaps.copyReference = ""
    let keymaps.surroundWith = "call VSCodeNotify('surround.with')"
    let keymaps.outLine = "call VSCodeNotify('outline.focus')"
    let keymaps.openExplorer = "call VSCodeNotify('workbench.files.action.focusFilesExplorer')"
    let keymaps.locationExplorer = "call VSCodeNotify('workbench.files.action.showActiveFileInExplorer')"
    let keymaps.goLeft = "call VSCodeNotify('workbench.action.navigateLeft')"
    let keymaps.goDown = "call VSCodeNotify('workbench.action.navigateDown')"
    let keymaps.goUp = "call VSCodeNotify('workbench.action.navigateUp')"
    let keymaps.goRight = "call VSCodeNotify('workbench.action.navigateRight')"
elseif g:APP == "neovim"
    " 单独定义，不走这里
    " let keymaps.goLeft = "normal! \<C-w>h"
    " let keymaps.goDown = "normal! \<C-w>j"
    " let keymaps.goUp = "normal! \<C-w>k"
    " let keymaps.goRight = "normal! \<C-w>l"
endif

nnoremap <Leader>dl :call GetKeymaps("declaration")<cr>
nnoremap <Leader>df :call GetKeymaps("definition")<cr>
nnoremap <Leader>tdf :call GetKeymaps("typeDefinition")<cr>
nnoremap <Leader>im :call GetKeymaps("implementation")<cr>
nnoremap <Leader>rf :call GetKeymaps("references")<cr>
nnoremap <Leader>sm :call GetKeymaps("superMethod")<cr>
nnoremap <Leader>ne :call GetKeymaps("nextError")<cr>
nnoremap <Leader>pe :call GetKeymaps("previousError")<cr>
nnoremap <Leader>re :call GetKeymaps("renameElement")<cr>
nnoremap <Leader>ol :call GetKeymaps("outLine")<cr>
nnoremap <Leader>fm :call GetKeymaps("format")<cr>
nnoremap <Leader>gi :call GetKeymaps("getInformation")<cr>
nnoremap <Leader>= :call GetKeymaps("forword")<cr>
nnoremap <Leader>- :call GetKeymaps("back")<cr>
nnoremap <Leader>cr :call GetKeymaps("copyReference")<cr>
nnoremap <Leader>sw :call GetKeymaps("surroundWith")<cr>
nnoremap <Leader>oe :call GetKeymaps("openExplorer")<cr>
nnoremap <Leader>le :call GetKeymaps("locationExplorer")<cr>
nnoremap <Leader>h :call GetKeymaps("goLeft")<cr>
nnoremap <Leader>l :call GetKeymaps("goRight")<cr>
nnoremap <Leader>k :call GetKeymaps("goUp")<cr>
nnoremap <Leader>j :call GetKeymaps("goDown")<cr>

" --- functions ---

function SetKeymaps(s)
    for [k,v] in items(s)
        let g:keymaps.k = v
    endfor
endfunction

function GetKeymaps(key)
    execute g:keymaps[a:key]
    return ''
endfunction

function! s:range(cmd, ...) abort
    let selection = get(a:, 1, 0)
    normal! gv
    let visualmode = visualmode()
    if visualmode == "V"
        echom 'capitcal V'
        let startLine = line("v")
        let endLine = line(".")
        call VSCodeNotifyRange(a:cmd, startLine, endLine, selection)
    else
        echom 'small V'
        let startPos = getpos("v")
        let endPos = getpos(".")
        call VSCodeNotifyRangePos(a:cmd, startPos[1], endPos[1], startPos[2], endPos[2], selection)
    endif
endfunction

function s:rangeExitSelection(cmd)
    function! s:vscodeRange(...) abort closure
      if !a:0
            let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
            return 'g@'
        elseif a:0 > 1
            let [line1, line2] = [a:1, a:2]
        else
            let [line1, line2] = [line("'["), line("']")]
        endif

        call VSCodeCallRange(a:cmd, line1, line2, 0)
    endfunction

    return function('s:vscodeRange')
endfunction

function! s:split(...) abort
    let direction = 'workbench.action.splitEditorRight'
    let file = a:2

    if a:1 ==? 'h'
        let direction = 'workbench.action.splitEditorLeft'
    elseif a:1 ==? 'l'
        let direction = 'workbench.action.splitEditorRight'
    elseif a:1 ==? 'j'
        let direction = 'workbench.action.splitEditorDown'
    elseif a:1 ==? 'k'
        let direction = 'workbench.action.splitEditorUp'
    endif

    call VSCodeCall(direction)
    if file != ''
        call VSCodeExtensionNotify('open-file', expand(file), 'all')
    endif
endfunction


" 以下为测试代码

" 1
" nnoremap <Leader>dl :execute "set number"<CR>

" 2
" command! GetKemaps execute "set nu"
" nnoremap <Leader>dl :GetKemaps<CR>

" 3
" nnoremap <expr> <Leader>dl GetKemaps("dl") or nnoremap <Leader>dl :call GetKemaps("dl")<CR>
" function GetKemaps(key)
"     execute "set number"
" endfunction

 " \ 这种写法 ideavim 不支持
        " let keymaps = {
        "     \ 'idea_dl': 'action GotoDeclarationOnly',
        "     \ 'idea_df': 'action GotoDeclarationOnly',
        "     \}

"let k=join([g:APP,a:key],"_")
"
" ---bak---
"
" for [k,v] in items(g:lsp)
"     let g:keymaps.k = v
" endfor
" for [k,v] in items(g:explorer)
"     let g:keymaps.k = v
" endfor
" for [k,v] in items(g:move)
"     let g:keymaps.k = v
" endfor
