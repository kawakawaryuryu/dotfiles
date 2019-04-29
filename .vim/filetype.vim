augroup filetypedetect
    au BufRead, BufNewFile *.rb *.erb setfiletype ruby
    au BufRead, BufNewFile *.ts setfiletype typescript
    au BufRead, BufNewFile *.js setfiletype javascript
    au BufRead, BufNewFile *.html setfiletype html
    au BufRead, BufNewFile *.yml *.yaml setfiletype yaml
    au BufRead, BufNewFile *.tf setfiletype terraform
augroup END
