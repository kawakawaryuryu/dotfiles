augroup filetypedetect
    au BufRead, BufNewFile *.rb *.erb setfiletype ruby
    au BufRead, BufNewFile *.ts setfiletype typescript
augroup END
