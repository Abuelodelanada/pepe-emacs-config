;;; package --- Summary
;;; Commentary:
;;; Code:

(setq gc-cons-threshold 16777216 ; 16mb
      gc-cons-percentage 0.1)

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
(projectile-mode +1)

(put 'downcase-region 'disabled nil)
(set-default 'case-fold-search nil) ; Case sensitive TAGS search
(autoload 'geben "geben" "DBGp protocol frontend, a script debugger" t) ; Geben

(diminish 'abbrev-mode "Abv")
(diminish 'git-gutter-mode)
(diminish 'global-whitespace-mode t)
(diminish 'yas-minor-mode t)
(load-theme 'monokai t)
(load "~/.emacs.d/faces")
(load "~/.emacs.d/customfaces")

(provide 'init)
;;;
