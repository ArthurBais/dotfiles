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
" Insert date <F2>
:nnoremap <F2> "=strftime("%d/%m/%y")<CR>P
:inoremap <F2> <C-R>=strftime("%d/%m/%y")<CR>
"Insert name - F3
:nnoremap <F3> iArthur Bais<Esc>
:inoremap <F3> Arthur Bais
" Insert name and date - F5
:nnoremap <F5> "=strftime("%d/%m/%y - Arthur Bais")<CR>P
:inoremap <F5> <C-R>=strftime("%d/%m/%y - Arthur Bais")<CR>
 " open vimrc in a vertical split
 nnoremap <leader>ev :vsp ~/.config/nvim/init.vim<CR>
 nnoremap <leader>sv :source ~/.config/nvim/init.vim <bar> :doautocmd BufRead <CR>
nmap gb <c-^>
" }}}
" Section Folding {{{
set foldenable
set foldmethod=marker
nnoremap <space> za
"}}}
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
" vim:foldmethod=marker:foldlevel=0
