@default_files = ('main.tex');
$lualatex = 'lualatex -halt-on-error -shell-escape -file-line-error --synctex=1 %O %S';
$pdf_mode = 5;
