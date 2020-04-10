;;; package --- Summary
;;; Commentary:
;;; Code:

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.adoc" . adoc-mode))
(add-to-list 'auto-mode-alist '("\\.xml" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.xul" . xml-mode))
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(provide 'automode)
;;; automode ends here
