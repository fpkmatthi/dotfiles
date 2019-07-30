" Shortcuts for snippets in Latex

inoremap <Space><Space> <Esc>/<++><Enter>"_c4l

autocmd FileType tex inoremap ;s \section{}<Enter><Enter><++><Esc>2k$F{a

autocmd FileType tex inoremap ;ss \subsection{}<Enter><Enter><++><Esc>2k$F{a

autocmd FileType tex inoremap ;sss \subsubsection{}<Enter><Enter><++><Esc>2k$F{a
 
autocmd FileType tex inoremap ;be \begin{enumerate}<Enter>\item<Space><Enter>\end{enumerate}<Enter><++><Esc>2k$a

autocmd FileType tex inoremap ;bi \begin{itemize}<Enter>\item<Space><Enter>\end{enumerate}<Enter><++><Esc>2k$a

autocmd FileType tex inoremap ;l \label{}<++><Esc>F{a

autocmd FileType tex inoremap ;b \textbf{}<++><Esc>F{a

autocmd FileType tex inoremap ;i \textit{}<++><Esc>F{a

autocmd FileType tex inoremap ;sq `'<++><Esc>F`a

autocmd FileType tex inoremap ;dq ``"<++><Esc>F`a

autocmd FileType tex inoremap ;tc \textcite{}<++><Esc>F{a

autocmd FileType tex inoremap ;pc \parencite{}<++><Esc>F{a





