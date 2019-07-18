call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
" Plug 'dylanaraps/wal.vim'
" Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
" Plug 'maximbaz/lightline-ale'
" Plug 'maximbaz/lightline-trailing-whitespace'
" Plug 'mboughaba/i3config.vim'
Plug 'mhinz/vim-startify'
Plug 'OmniSharp/omnisharp-vim'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
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

" Solarized Options {{{
let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"let g:solarized_underline=1
highlight clear SignColumn
 set background=dark
"set background=light
 colorscheme solarized
" Custom function to togglebetween light and dark background to keep the
" CursorLine settings since the default way of the solarized plugin also
" changes the CursorLine settings
function Togglebackground()
    let &background = ( &background == "dark"? "light" : "dark" ) 
    highlight LineNr ctermbg=None
    highlight CursorLine ctermbg=None
    highlight CursorLine cterm=underline
endfunction
map <F5> :call Togglebackground()<cr>
" }}}

" Omnisharp Options {{{
let g:OmniSharp_server_stdio = 1
" }}}

" Vimwiki Options {{{
set nocompatible
filetype plugin on
" }}}

" FZF Options {{{
    
" }}}

" Wal Options {{{
" colorscheme wal
" }}}

" Vim-latex-live-preview Options {{{
map <Leader>c :LLPStartPreview<cr>
let g:livepreview_previewer = "zathura"
" let g:livepreview_cursorhold_recompile = 0
" }}}
" }}}
