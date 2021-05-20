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
call plug#end()

colorscheme gruvbox

nnoremap <A-1> :NERDTreeToggle<CR>

" YAML
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" Markdown
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2

" Racket
au! BufRead,BufNewFile *.ss	setfiletype racket
au! BufRead,BufNewFile *.rkt	setfiletype racket

" Slime
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

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
