setl sw=2
setl ts=2
setl softtabstop=2

autocmd BufWrite *.go silent! Neoformat gofmt
