(TeX-add-style-hook
 "fgtt"
 (lambda ()
   (TeX-run-style-hooks
    "latex2e"
    "template"
    "template10")
   (LaTeX-add-labels
    "sec:label"
    "sec:pts"
    "subsec:n"
    "subsec:label"
    "sec:fgu"
    "sec:foot")
   (LaTeX-add-bibliographies
    "ref"))
 :latex)

