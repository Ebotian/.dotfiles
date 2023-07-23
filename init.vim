" include .vimrc
source ~/.vimrc

" Basic settings
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
set number
set relativenumber


" Plugs"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('/home/yibotian/.local/share/nvim/plug')
" WITHOUT FULLY UNDERSTAND YOU CAN NOT TRUST
" add plugs here:

" i decide to use conquer of completion(coc) project to build a vscode-like-IDE in neovim

" Conquer of Completion IDE project"""""""""""""

" Use release branch (recommended)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Use `:CocUpdate` to see extensions coc use and also update them
" `:CocList extensions` to manage them,`<Tab>` to activate action menu

" Other plugs below"""""""""""""""""""""""""""""

" github copilot
Plug 'github/copilot.vim'
" LanguageClient-neovim
" Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
" ale linter fixer and formater
" Plug 'dense-analysis/ale'

" telescope and dependencies(file find)
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
" or                                , { 'branch': '0.1.x' }
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

" snips
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" JSON front matter highlight plugin
" i consider use coc-json instead
" Plug 'elzr/vim-json'

" markdown
" Plug 'plasticboy/vim-markdown'
" tabular plugin is used to format tables
" Plug 'godlygeek/tabular'

" I don't like pandoc-syntax
" Plug 'vim-pandoc/vim-pandoc-syntax'

" it doesn't work and have no error message
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
call plug#end()

let g:python3_host_prog = '/usr/bin/python3'

" Markdown settings"""""""""""""""""""""""""""""""""""""""""""""""""""""


" COC settings""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" remap <cr> to make it confirm completion
inoremap <silent><expr> <cr> coc#pum#visible()&& coc#pum#info()['index'] != -1 ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" C-style conditional
" First, it checks if the completion menu is visible and if the currently selected completion item is not -1 (i.e., if there is a valid completion item selected). It remaps the behavior of the <CR> (Enter) key in insert mode. If the completion menu is visible, pressing <CR> will select the current completion item. Otherwise, it will insert a newline character and break the undo sequence. It also calls the coc#on_enter() function after inserting a newline character. This function is used to trigger formatting or other custom actions when pressing <CR> in insert mode.
" `\<C-g>u` is a Vim command that is used to break the undo sequence. In Vim, when you make changes to the text, those changes are grouped into undo blocks. Each time you press the `<Esc>` key or move the cursor, a new undo block is created. This means that when you press the `u` key to undo changes, all the changes in the current undo block are undone at once.

" The `\<C-g>u` command inserts a special character into the text that breaks the current undo block. This means that if you make some changes, then insert `\<C-g>u`, and then make some more changes, those changes will be grouped into separate undo blocks. When you press the `u` key to undo changes, only the changes made after the `\<C-g>u` command will be undone.

" In the code you provided, `\<C-g>u` is used after inserting a newline character with `<CR>`. This means that when you press `<CR>` to insert a newline character and select a completion item, those actions will be grouped into separate undo blocks. If you press the `u` key to undo changes, only the selection of the completion item will be undone, not the insertion of the newline character.
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:copilot_no_tab_map = v:true
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ exists('b:_copilot.suggestions') ? copilot#Accept("\<CR>") :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
" The first part of the code defines a function called CheckBackspace() which checks if the cursor is at the first column or if the character before the cursor is a whitespace character. It returns a boolean value based on this condition.
" The second part of the code remaps the behavior of the <Tab> key in insert mode. If the completion menu is visible, pressing <Tab> will select the next completion item. If the completion menu is not visible and the cursor is at the first column or before a whitespace character, pressing <Tab> will insert a tab character. Otherwise, it will refresh the completion suggestions
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
" Use <S-Tab> navigate the completion list, <S-Tab> for <Shift-Tab>
" nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>
" show documentation of symbol under cursor(cursor hover)
" temporary don't konw how it is functioned
"
" Clangd settings
" let g:LanguageClient_serverCommands = {
" \ 'cpp': ['/usr/local/bin/clang+llvm/bin/clangd'],
" \ 'c': ['/usr/local/bin/clang+llvm/bin/clangd'],
" \ }
" let g:LanguageClient_settings = {
"     \ 'clangd.semanticHighlighting': v:ture,
"     \ 'clangd.inlayHints': v:ture,
" \}
autocmd FileType json syntax match Comment +\/\/.\+$+

