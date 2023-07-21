source ~/.vimrc
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
set number
set relativenumber


" Plugs"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('/home/yibotian/.local/share/nvim/plug')
" WITHOUT FULLY UNDERSTAND YOU CAN NOT TRUST
" add plugs here:

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
Plug 'elzr/vim-json'

" markdown
Plug 'plasticboy/vim-markdown'
" tabular plugin is used to format tables
" Plug 'godlygeek/tabular'

" I don't like pandoc-syntax
" Plug 'vim-pandoc/vim-pandoc-syntax'

" it doesn't work and have no error message
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
call plug#end()

let g:python3_host_prog = '/usr/bin/python3'

" Markdown settings"""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> to trigger autocompletion
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" disable header folding
let g:vim_markdown_folding_disabled = 1
" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0
" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1
" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format
