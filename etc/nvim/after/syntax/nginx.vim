syntax region ngxBlock
    \ start=+^+ end=+{+ skip=+\${+
    \ contains=ngxComment,ngxDirectiveBlock,ngxVariableBlock,ngxString,ngxDirective,ngxDirectiveImportant
    \ oneline
