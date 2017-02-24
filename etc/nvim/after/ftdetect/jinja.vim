autocmd BufNewFile,BufRead *.j2,*.jinja,*.jinja2
    \| execute 'doau BufRead ' . fnameescape(expand('<afile>:r'))
    \| call SyntaxRange#Include('{%', '%}', 'jinja')
    \| call SyntaxRange#Include('{{', '}}', 'jinja')
    \| call SyntaxRange#Include('{#', '#}', 'jinja')
    \| call SyntaxRange#Include('{% load_yaml as \S\+ %}', '{% endload %}', 'yaml', 'jinjaSpecial')
