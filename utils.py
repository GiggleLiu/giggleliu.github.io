import pypandoc

def md2html(text):
    return pypandoc.convert_text(text, to='html5', format='md',
            extra_args=['--mathjax', '--standalone', '--toc',
                '--template=_includes/markdown_template.html', '--css=static/css/template.css',
                ])


