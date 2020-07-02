;;; package --- Summary
;;; Commentary:
;;; Code:

(load "~/.emacs.d/messages")
(setq load-prefer-newer t)
(package-initialize)
(load "~/.emacs.d/init-packages")

(eval-when-compile
  (require 'use-package))
(load "~/.emacs.d/use-package")
(require 'auto-compile)
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)
(load "~/.emacs.d/require")
(load "~/.emacs.d/variables")
(load "~/.emacs.d/customvariables")
(load "~/.emacs.d/functions")
(load "~/.emacs.d/alias")
(load "~/.emacs.d/automode")
(load "~/.emacs.d/hooks")
(load "~/.emacs.d/shortcuts")
(load "~/.emacs.d/tabbar")

(add-to-list 'default-frame-alist '(fullscreen . maximized)) ;; Maximize window at startup
(column-number-mode t) ;; Show column number
(global-git-gutter-mode t)
(global-highlight-parentheses-mode t)
(global-linum-mode t) ;; Show line-number
(hlinum-activate)
(global-whitespace-mode t)
(ido-mode t)
(menu-bar-mode -1) ;; Hide menubar
(powerline-default-theme)
(put 'upcase-region 'disabled nil)
(savehist-mode 1)
(scroll-bar-mode -1) ;; Hide scrollbar
(tool-bar-mode -1) ;; Hide toolbar
(yas-global-mode 1)

(require 'projectile)
(define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

(add-hook 'after-init-hook 'global-flycheck-mode)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup))
(put 'downcase-region 'disabled nil)
(set-default 'case-fold-search nil) ; Case sensitive TAGS search
(autoload 'geben "geben" "DBGp protocol frontend, a script debugger" t) ; Geben
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)

(diminish 'abbrev-mode "Abv")
(diminish 'git-gutter-mode)
(diminish 'global-whitespace-mode t)
(load-theme 'monokai t)
(load "~/.emacs.d/faces")
(load "~/.emacs.d/customfaces")

(provide 'init)
;;;
