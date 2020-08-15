" Basic settings {{{

set nohlsearch
set cursorline
set number
set relativenumber
set nocompatible
filetype plugin on
set termguicolors

" enable mouse
set mouse=a

" open splits below and right which is more natural than the default
set splitbelow
set splitright

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" syntax on
set autoindent
" move among buffers with CTRL

map <C-J> :bprev!<CR>
map <C-K> :bnext!<CR>
" move lines above or below
 inoremap <C-k> <Esc>:m .-2<CR>==gi
 inoremap <C-j> <Esc>:m .+1<CR>==gi
" ctrl x to close buffer
map <C-X> :bd!<CR>
"To map <Esc> to exit terminal-mode:
    :tnoremap <Esc> <C-\><C-n>

autocmd FileType markdown inoremap <buffer> * **<Esc>i

" Make vim open files on the line that they were previously saved on {{{
	" Uncomment the following to have Vim jump to the last position when                                                       " reopening a file
	if has("autocmd")
	  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	    \| exe "normal! g'\"" | endif
	endif

	" }}}

" }}}
" {{{ My custom functions and macros
" Insert date <F2>
:nnoremap <F2> "=strftime("%d/%m/%y")<CR>P
:inoremap <F2> <C-R>=strftime("%d/%m/%y")<CR>
"Insert name - F3
:nnoremap <F3> iArthur Bais<Esc>
:inoremap <F3> Arthur Bais
" Insert name and date - F5
:nnoremap <F5> "=strftime("%d/%m/%y - Arthur Bais")<CR>P
:inoremap <F5> <C-R>=strftime("%d/%m/%y - Arthur Bais")<CR>
" }}}
" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'bling/vim-bufferline'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag'
Plug 'arcticicestudio/nord-vim'
call plug#end()

"}}}
" Colors {{{
" packadd! dracula
colorscheme dracula
syntax enable
"}}}
" Vimwiki settings {{{
" let g:vimwiki_list = [{'path': '/media/vimwiki', 'template_path': '/media/vimwiki/templates',
"           \ 'template_default': 'default', 'syntax': 'markdown', 'ext': '.md',
"           \ 'path_html': '/media/vimwiki/site_html', 'custom_wiki2html': 'vimwiki_markdown',
"           \ 'template_ext': '.tpl', 
"           \ 'html_filename_parameterization': 1 }]
            let g:vimwiki_list = [{
    \ 'auto_export': 0,
	\ 'path': '$VIMWIKIDIR',
	\ 'template_path': '$VIMWIKIDIR/templates/',
	\ 'template_default': 'GitHub',
	\ 'syntax': 'markdown',
	\ 'ext': '.md',
	\ 'path_html': '$VIMWIKIDIR/site_html/',
	\ 'custom_wiki2html': 'vimwiki2html.sh',
	\ 'template_ext': '.html5'}]
let g:vimwiki_folding = 'expr'
    " }}}
" Coc configs {{{
"" if hidden is not set, TextEdit might fail.
"set hidden
"" Better display for messages
"set cmdheight=2

"" You will have bad experience for diagnostic messages when it's default 4000.
"set updatetime=300
"" use <tab> for trigger completion and navigate to the next complete item
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~ '\s'
"endfunction

"inoremap <silent><expr> <Tab>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<Tab>" :
"      \ coc#refresh()
"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
"" always show signcolumns
"set signcolumn=yes

"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
"nmap <leader>rn <Plug>(coc-rename)
"" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
""}}}
" Section Folding {{{
set foldenable
set foldmethod=marker
nnoremap <space> za
"}}}
"  Airline {{{
" 	let g:airline_powerline_fonts = 1
" 	" display buffers
" 	let g:airline#extensions#tabline#enabled = 1
"  }}}
 " open vimrc in a vertical split
 nnoremap <leader>ev :vsp ~/.config/nvim/init.vim<CR>
 nnoremap <leader>sv :source ~/.config/nvim/init.vim <bar> :doautocmd BufRead <CR>
 " Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
" Update alias when aliasrc is updated
    autocmd BufWritePost *aliasrc !source ~/.config/aliasrc
" vim:foldmethod=marker:foldlevel=0
