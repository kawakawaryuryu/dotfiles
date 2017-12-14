augroup filetypedetect
    au BufRead, BufNewFile *.rb *.erb setfiletype ruby
    au BufRead, BufNewFile *.ts setfiletype typescript
    au BufRead, BufNewFile *.yml *.yaml setfiletype yaml
augroup END
