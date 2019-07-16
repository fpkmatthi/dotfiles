call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
"Plug 'ycm-core/YouCompleteMe'

call plug#end()


" Plugin Options {{{
" Git Gutter {{{
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 0
let g:gitgutter_max_signs = 500  " default value
let g:gitgutter_override_sign_column_highlight = 0
" TODO: sprinkle some colours
set updatetime=250

" No mappings set by gitgutter with let g:gitgutter_map_keys = 0
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk
nmap <Leader>hp <Plug>GitGutterPreviewHunk
omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual
" }}}

" Lightline Options {{{
let g:lightline = {
    \ 'colorscheme': 'one',
    \ }
" }}}

" Solarized options {{{
syntax enable
"set background=light
let g:solarized_termcolors=256
let g:solarized_termtrans=1
"let g:solarized_underline=1
colorscheme solarized
set background=dark
highlight clear SignColumn
:call gitgutter#highlight#define_sign_column_highlight()
" }}}

" }}}
