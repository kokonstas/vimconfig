:syntax on
:autocmd FileType *      set formatoptions=tcql nocindent comments&
:autocmd FileType c,cpp  set formatoptions=croql cindent comments=sr:/*,mb:*,ex:*/,://
autocmd BufRead,BufNewFile *.txt setlocal spell

:set autoindent
:set autowrite
:ab #d #define
:ab #i #include
:ab #b /********************************************************
:ab #e ********************************************************/
:ab #l /*------------------------------------------------------*/
:set sw=4
:set notextmode
:set notextauto
:set hlsearch
:set incsearch
:set textwidth=70

:set shiftwidth=4
:set tabstop=4

:set nu
:colorscheme molokai
:set mouse=a

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

execute pathogen#infect()
syntax on
filetype plugin indent on

filetype on
filetype plugin on
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

:let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'

cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))

cnoreabbrev <expr> bash ((getcmdtype() is# ':' && getcmdline() is# 'bash')?('ConqueTermVSplit bash'):('bash'))

function! Con()
	:update
	:e ++ff=dos
	:setlocal ff=unix
	:w
endfunction
command! -nargs=0 Convert call Con(<f-args>)

function! CppCompile()
	:w
	:!g++ % -o $(basename % .cpp)
	return 0
endfunction

function! CCompile()
	:w
	:!gcc % -o $(basename % .cpp)
	return 0
endfunction

function! Makey()
	:w
	:!make
	return 0
endfunction



map <silent> <expr> <Leader>gg  CppCompile()
map <silent> <expr> <Leader>mm Makey()
map <silent> <expr> <Leader>cc CCompile()

