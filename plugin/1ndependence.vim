if exists('g:loaded_1ndependence')
    finish
endif
let g:loaded_1ndependence=1

augroup Independence
    au BufNewFile,BufRead * call s:LoadConfig()
augroup END

function s:LoadConfig()
    let l:path = fnameescape(expand("%:p:h"))
    let l:root = system("cd " . l:path . "; echo -n `git rev-parse --show-toplevel`")
    if !isdirectory(l:root)
        return
    endif

    let l:vimrc = l:root . "/.vimrc"
    if filereadable(l:vimrc)
        exec ":source " . l:vimrc
    endif
endfunction

let g:loaded_1ndependence=2
