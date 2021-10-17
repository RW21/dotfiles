" Auto-install vim-plug
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
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'ekalinin/Dockerfile.vim'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
call plug#end()

colorscheme gruvbox

nnoremap <A-1> :NERDTreeToggle<CR>

set number

" Lightline
let g:lightline = {
      \ 'colorscheme': 'apprentice',
      \ }

" Jump to definition
function! s:GoToDefinition()
  if CocAction('jumpDefinition')
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error" || ret =~ "错误"
    call searchdecl(expand('<cword>'))
  endif
endfunction

nmap <silent> gd :call <SID>GoToDefinition()<CR>

" Disable cursor
set guicursor=

" Use <tab> for trigger completion and navigate to the next complete item
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

" Julia
autocmd FileType julia setlocal shiftwidth=4 tabstop=4

" Markdown
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2

" racket
au! BufRead,BufNewFile *.ss	setfiletype racket
au! BufRead,BufNewFile *.rkt	setfiletype racket

" slime
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

" FZF
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-f><C-f> :Rg<CR>

" Tabs
nnoremap th :tabprevious<CR>
nnoremap tl :tabnext<CR>
nnoremap <C-t> :tabnew<CR>

" Transparent background
autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE

" Auto create directory on save when missing
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

