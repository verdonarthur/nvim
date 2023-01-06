
let $PATH .= ':/home/arthur/.nvm/versions/node/v18.12.1/bin'

set mouse=a

GuiFont FiraCode\ Nerd\ Font:h10
GuiAdaptiveColor 1
GuiLinespace 5 
GuiTabline 0
GuiPopupmenu 1

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv
