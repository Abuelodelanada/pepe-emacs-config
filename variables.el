;;; package --- Summary
;;; Commentary:
;;; Code:

(defvar ido-enable-flex-matching)
(defvar dumb-jump-prefer-searcher)
(defvar yas-prompt-functions)
(defvar path-to-ctags)

(setq-default ecb-options-version "2.50")
(setq-default tabbar-background-color "gray9")
(setq-default tabbar-separator 0.5)
(setq-default tabbar-use-images t)
(setq-default auto-save-default nil) ;; Stop creating auto #autosave# files
(setq-default auto-window-vscroll nil)
(setq-default blink-cursor-mode t)
(setq-default custom-safe-themes '("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default))
(setq-default dumb-jump-default-project "~")
(setq-default dumb-jump-force-searcher nil)
(setq-default dumb-jump-prefer-searcher 'ag)
(setq-default dumb-jump-quiet nil)
(setq-default ecb-layout-name "left6")
(setq-default ecb-minor-mode-text "")
(setq-default ecb-options-version "2.50")
(setq-default ecb-tip-of-the-day nil)
(setq-default ecb-tip-of-the-day nil)
(setq-default ecb-windows-width 0.25)
(setq-default fast-but-imprecise-scrolling t) ; https://emacs.stackexchange.com/questions/31402/how-to-avoid-scrolling-with-large-files-hanging-for-short-periods-of-time-hold
(setq-default flycheck-check-syntax-automatically '(save mode-enabled))
(setq-default flycheck-highlighting-mode 'lines)
(setq-default flycheck-pycheckers-checkers '(pylint pep8))
(setq-default frame-resize-pixelwise t)
(setq-default global-whitespace-mode t)
(setq-default history-delete-duplicates t)
(setq-default history-length 1000)
(setq-default ido-enable-flex-matching t)
(setq-default ido-enable-regexp t)
(setq-default ido-ignore-files '("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./"))
(setq-default indent-line-function 'insert-tab)
(setq-default indent-tabs-mode nil)
(setq-default inhibit-startup-message t) ;; Disable startup messages
(setq-default jit-lock-defer-time 0)
(setq-default kill-read-only-ok t)
(setq-default make-backup-files nil) ;; No backup files ~
(setq-default monokai-background "#000000")
(setq-default neo-autorefresh t)
(setq-default neo-mode-line-type 'neotree)
(setq-default neo-smart-open t)
(setq-default neo-theme 'icons)
(setq-default neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq-default nlinum-highlight-current-line t)
(setq-default package-selected-packages '(yasnippet-snippets yaml-mode smarty-mode powerline nlinum nlinum-hl monokai-theme markdown-mode+ jquery-doc iedit highlight-parentheses highlight git-gutter-fringe geben flymd flycheck-color-mode-line flycheck ecb dumb-jump company-php auto-indent-mode all-the-icons adoc-mode ac-php ac-js2 dash-functional ag))
(setq-default path-to-ctags "/usr/bin/ctags") ;; <- your ctags path here
(setq-default phpcbf-standard "PSR2")
(setq-default powerline-default-separator "arrow")
(setq-default powerline-gui-use-vcs-glyph t)
(setq-default powerline-height 22)
(setq-default redisplay-dont-pause t) ; https://masteringemacs.org/article/improving-performance-emacs-display-engine
(setq-default scroll-step 1) ;; keyboard scroll one line at a time
(setq-default size-indication-mode nil)
(setq-default tab-width 4)
(setq-default tabbar-background-color "gray9")
(setq-default tabbar-separator '(0.5))
(setq-default tabbar-use-images t)
(setq-default whitespace-display-mappings '((tab-mark 9 [187])))
(setq-default whitespace-line-column nil)
(setq-default whitespace-style '(face trailing tabs spaces newline empty indentation space-after-tab space-before-tab space-mark tab-mark newline-mark))
(setq-default yas-prompt-functions '(yas-dropdown-prompt yas-ido-prompt yas-completing-prompt))
;(setq projectile-project-search-path '("~/projects/" "~/work/")) ;; Set your project's direcotries copying this line in customvariables.el


(provide 'variables)
;;; variables.el ends here
