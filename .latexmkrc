#!/usr/bin/env perl
@default_files = ('cv-llt.tex');
$pdflatex  = 'pdflatex %O -halt-on-error -shell-escape --synctex=1 -interaction=nonstopmode %S';
$lualatex  = 'lualatex %O -halt-on-error -shell-escape --synctex=1 -interaction=nonstopmode %S';
$biber     = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$bibtex    = 'bibtex %O %B';
$clean_ext = "nav out snm sta";
$pdf_mode  = 4;
