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
      '(ac-js2 ac-php ac-php-core adoc-mode ag auto-compile auto-complete auto-indent-mode company company-php diminish dumb-jump ecb epl f flycheck flycheck-color-mode-line flycheck-mypy flycheck-pycheckers flymd geben git-gutter-fringe highlight highlight-parentheses iedit jquery-doc js2-mode json-mode markdown-mode markdown-mode+ markup-faces monokai-theme neotree linum hlinum magit magit-gitflow markdown-toc pass php-mode phpcbf pkg-info popup powerline projectile s seq smarty-mode sqlformat tabbar web-mode yaml-mode yasnippet yasnippet-snippets all-the-icons))

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)
    (when (package-installed-p 'all-the-icons)
      (all-the-icons-install-fonts))))


; activate all the packages
(package-initialize)

(provide 'init-packages)
;;; init-packages.el ends here
