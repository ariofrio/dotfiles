" Enable word wrap without automatic line breaks.
set wrap
set linebreak
set nolist
set colorcolumn= " hide ruler
set textwidth=0
set wrapmargin=0

" Some useful characters.
inoremap ,\ohm Ω
inoremap ,\micro μ
inoremap ,\Delta Δ
inoremap ,\dee ∂
inoremap ,\parallel ∥

" Some shortcuts that are useful when writing ECE 2C reports.
inoremap ,, <mark></mark><Esc>F<i
nmap     ,, i,,

inoremap ,` <p class="math">``</p><Esc>F`i
nmap     ,` i,`

inoremap ,f <figure markdown="1"><CR>![](img/figure1.svg)<CR><figcaption><CR>Figure 1 – !<CR></figcaption><CR></figure><Esc>2k0f!c<Right>
nmap     ,f i,f
