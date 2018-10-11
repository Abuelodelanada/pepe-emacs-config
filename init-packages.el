;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)


; list the packages you want
(defvar package-list)
(setq package-list
    '(ac-js2 ac-php adoc-mode all-the-icons auto-complete auto-indent-mode company-php company ac-php-core diff-hl dumb-jump ecb f flycheck flycheck-color-mode-line flymd  geben git-gutter highlight highlight-parentheses iedit jquery-doc let-alist markdown-mode+ markdown-mode markup-faces memoize monokai-theme nlinum nlinum-hl php-mode pkg-info epl popup powerline seq skewer-mode js2-mode simple-httpd smarty-mode xcscope yaml-mode yasnippet ag s yasnippet-snippets))
; activate all the packages
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'init-packages)
;;; init-packages.el ends here
