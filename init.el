;;; -*- lexical-binding: t; -*-
;;; package --- Summary
;;; Commentary:
;;; Code:

;; Taken from foom-emacs!
;; A big contributor to startup times is garbage collection. We up the gc
;; threshold to temporarily prevent it from running, then reset it later by
;; enabling `gcmh-mode'. Not resetting it will cause stuttering/freezes.
(setq gc-cons-threshold most-positive-fixnum)

(load "~/.emacs.d/messages")
(setq load-prefer-newer t)
(package-initialize)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(load "~/.emacs.d/init-packages")

(eval-when-compile
  (require 'use-package))
(load "~/.emacs.d/use-package")
(load "~/.emacs.d/variables")
(load "~/.emacs.d/customvariables")
(load "~/.emacs.d/functions")
(load "~/.emacs.d/alias")
(load "~/.emacs.d/automode")
(load "~/.emacs.d/hooks")
(load "~/.emacs.d/shortcuts")

(add-to-list 'default-frame-alist '(fullscreen . maximized)) ;; Maximize window at startup
(column-number-mode t) ;; Show column number
(global-git-gutter-mode t)
(global-linum-mode t) ;; Show line-number
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
(which-key-mode)

(put 'downcase-region 'disabled nil)
(set-default 'case-fold-search nil) ; Case sensitive TAGS search
(autoload 'geben "geben" "DBGp protocol frontend, a script debugger" t) ; Geben

(diminish 'abbrev-mode "Abv")
(diminish 'git-gutter-mode)
(diminish 'global-whitespace-mode "")
(diminish 'yas-minor-mode "")
(load-theme 'monokai t)
(load "~/.emacs.d/faces")
(load "~/.emacs.d/customfaces")

(provide 'init)
;;;
