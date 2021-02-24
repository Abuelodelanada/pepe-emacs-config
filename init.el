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
(global-whitespace-mode t)
(ido-mode t)
(menu-bar-mode -1) ;; Hide menubar
(put 'upcase-region 'disabled nil)
(savehist-mode 1)
(scroll-bar-mode -1) ;; Hide scrollbar
(tool-bar-mode -1) ;; Hide toolbar
(put 'downcase-region 'disabled nil)
(set-default 'case-fold-search nil) ; Case sensitive TAGS search
(diminish 'abbrev-mode "Abv")
(diminish 'global-whitespace-mode "")
(load "~/.emacs.d/faces")
(load "~/.emacs.d/customfaces")

(provide 'init)
;;;
