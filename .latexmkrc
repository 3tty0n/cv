@default_files = ('main.tex');
$lualatex = 'lualatex -halt-on-error -shell-escape -file-line-error --synctex=1 -interaction=nonstopmode %O %S';
$xelatex  = 'xelatex -halt-on-error -shell-escape -file-line-error -synctex=1 -interaction=nonstopmode %O %S';
$pdf_mode = 4;
