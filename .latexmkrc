@default_files = ('main.tex');
$lualatex = 'lualatex -halt-on-error -shell-escape -file-line-error --synctex=1 %O %S';
$xelatex = 'xelatex %O -synctex=1 -interaction=nonstopmode %S';
$pdf_mode = 5;
