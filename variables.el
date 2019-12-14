;;; package --- Summary
;;; Commentary:
;;; Code:

(defvar ido-enable-flex-matching)
(defvar dumb-jump-prefer-searcher)
(defvar yas-prompt-functions)
(defvar path-to-ctags)

(setq auto-window-vscroll nil)
(setq inhibit-startup-message t) ;; Disable startup messages
(setq make-backup-files nil) ;; No backup files ~
(setq auto-save-default nil) ;; Stop creating auto #autosave# files
(setq ido-enable-flex-matching t)
(setq frame-resize-pixelwise t)
(setq dumb-jump-prefer-searcher 'rg)
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq indent-line-function 'insert-tab)
(setq path-to-ctags "/usr/bin/ctags") ;; <- your ctags path here
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq yas-prompt-functions '(yas-dropdown-prompt
                             yas-ido-prompt
                             yas-completing-prompt))

(setq ecb-tip-of-the-day nil)
(setq redisplay-dont-pause t) ; https://masteringemacs.org/article/improving-performance-emacs-display-engine

; https://emacs.stackexchange.com/questions/31402/how-to-avoid-scrolling-with-large-files-hanging-for-short-periods-of-time-hold
(setq fast-but-imprecise-scrolling t)
(setq jit-lock-defer-time 0)

(setq-default kill-read-only-ok t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
; (setq projectile-project-search-path '("~/projects/" "~/work/")) ;; Set your project's direcotries copying this line in customvariables.el

(provide 'variables)
;;; variables.el ends here
