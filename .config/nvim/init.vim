" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " autocmd VimEnter * PlugInstall
  " autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'wlangstroth/vim-racket'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'JuliaEditorSupport/julia-vim'
Plug 'mhinz/vim-startify'
call plug#end()

colorscheme gruvbox

nnoremap <A-1> :NERDTreeToggle<CR>

set number

" disable cursor
set guicursor=

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" YAML
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" julia
autocmd FileType julia setlocal shiftwidth=4 tabstop=4

" markdown
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2

" racket
au! BufRead,BufNewFile *.ss	setfiletype racket
au! BufRead,BufNewFile *.rkt	setfiletype racket

" slime
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

" FZF
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <D-F>f :Rg<CR>

" tabs
nnoremap th :tabprevious<CR>
nnoremap tl :tabnext<CR>
nnoremap <C-t> :tabnew<CR>

" transparent background
autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE

" auto create directory on save when missing
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
