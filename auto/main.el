(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("curve" "a4paper" "skipsamekey" "11pt" "english")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("cochineal" "p" "osf" "swashQ") ("cabin" "medium" "bold") ("zi4" "varqu" "varl" "scale=0.9") ("fontenc" "T1")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "publications"
    "curve"
    "curve11"
    "settings"
    "hyperref"
    "fontspec"
    "cochineal"
    "cabin"
    "zi4"
    "fontenc"
    "luatexja"
    "luatexja-preset")
   (TeX-add-symbols
    "jit")
   (LaTeX-add-bibliographies
    "my-bib"))
 :latex)

