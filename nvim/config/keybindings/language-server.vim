nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" ale mappings
noremap <Leader>cgd :ALEGoToDefinition<CR>
nnoremap <leader>ccf :ALEFix<cr>
noremap <Leader>cfu :ALEFindReferences<CR>
