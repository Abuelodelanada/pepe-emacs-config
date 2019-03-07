;;; package --- Summary
;;; Commentary:
;;; Code:

(load "~/.emacs.d/messages")
(setq load-prefer-newer t)
(package-initialize)
(load "~/.emacs.d/init-packages")
(require 'auto-compile)
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)
(load "~/.emacs.d/require")
(load "~/.emacs.d/variables")
(load "~/.emacs.d/functions")
(load "~/.emacs.d/alias")
(load "~/.emacs.d/automode")
(load "~/.emacs.d/hooks")
(load "~/.emacs.d/shortcuts")
(load "~/.emacs.d/tabbar")

(add-to-list 'default-frame-alist '(fullscreen . maximized)) ;; Maximize window at startup
(tool-bar-mode -1) ;; Hide toolbar
(scroll-bar-mode -1) ;; Hide scrollbar
(menu-bar-mode -1) ;; Hide menubar
(column-number-mode 1) ;; Show column number
(global-nlinum-mode t) ;; Show line-number
(global-auto-complete-mode t) ;; Enable auto-complete
(global-highlight-parentheses-mode t)
(global-git-gutter-mode t)
(powerline-default-theme)
(put 'upcase-region 'disabled nil)
(yas-global-mode 1)
(ido-mode 1)
(dumb-jump-mode 1) ;dumb-jump
(savehist-mode 1)
(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))
(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup))
(put 'downcase-region 'disabled nil)
(set-default 'case-fold-search nil) ; Case sensitive TAGS search
(autoload 'geben "geben" "DBGp protocol frontend, a script debugger" t) ; Geben
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)

(custom-set-variables
 '(blink-cursor-mode t)
 '(custom-safe-themes
   (quote
    ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default)))
 '(dumb-jump-default-project "~")
 '(dumb-jump-force-searcher nil)
 '(dumb-jump-prefer-searcher (quote rg))
 '(dumb-jump-quiet nil)
 '(ecb-layout-name "left6")
 '(ecb-minor-mode-text "")
 '(ecb-options-version "2.50")
 '(ecb-tip-of-the-day nil t)
 '(ecb-windows-width 0.25)
 '(flycheck-check-syntax-automatically (quote (save mode-enabled)))
 '(flycheck-highlighting-mode (quote lines))
 '(flycheck-pycheckers-checkers (quote (pylint pep8)))
 '(global-whitespace-mode t)
 '(history-delete-duplicates t)
 '(history-length 1000)
 '(ido-enable-regexp t)
 '(ido-ignore-files (quote ("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./")))
 '(monokai-background "#000000")
 '(neo-autorefresh t)
 '(neo-mode-line-type (quote neotree))
 '(neo-smart-open t)
 '(neo-theme (quote icons) t)
 '(nlinum-highlight-current-line t)
 '(package-selected-packages
   (quote
    (yasnippet-snippets yaml-mode smarty-mode powerline nlinum nlinum-hl monokai-theme markdown-mode+ jquery-doc iedit highlight-parentheses highlight git-gutter-fringe geben flymd flycheck-color-mode-line flycheck ecb dumb-jump company-php auto-indent-mode all-the-icons adoc-mode ac-php ac-js2 dash-functional ag)))
 '(phpcbf-standard "PSR2")
 '(powerline-default-separator (quote arrow))
 '(powerline-gui-use-vcs-glyph t)
 '(powerline-height 22)
 '(size-indication-mode nil)
 '(tabbar-background-color "gray9")
 '(tabbar-separator (quote (0.5)))
 '(tabbar-use-images t)
 '(whitespace-display-mappings (quote ((tab-mark 9 [187]))))
 '(whitespace-line-column nil)
 '(whitespace-style
   (quote
    (face trailing tabs spaces newline empty indentation space-after-tab space-before-tab space-mark tab-mark newline-mark))))

(custom-set-faces
 '(default ((t (:background "#000000" :foreground "#F8F8F2" :weight bold :height 110 :family "Ubuntu Mono"))))
 '(cursor ((t (:background "#FE8B05" :foreground "white smoke" :inverse-video t))))
 '(ecb-analyse-bucket-element-face ((t (:inherit ecb-analyse-general-face :foreground "gold"))))
 '(ecb-bucket-node-face ((t (:inherit ecb-default-general-face :foreground "#FF6E27" :weight normal))))
 '(ecb-default-highlight-face ((t (:background "#FF6E27" :foreground "white smoke"))))
 '(ecb-methods-general-face ((t (:foreground "#FF6E27" :height 1.0))))
 '(ecb-mode-line-data-face ((t (:foreground "#FF6E27"))))
 '(ecb-mode-line-prefix-face ((t (:foreground "#FF6E27"))))
 '(ecb-tag-header-face ((t (:background "#FF6E27"))))
 '(flycheck-color-mode-line-error-face ((t (:box (:line-width 1 :color "#D90F5A") :weight bold))))
 '(flycheck-color-mode-line-warning-face ((t (:box (:line-width 1 :color "orange")))))
 '(flycheck-error ((t (:underline "#F92672"))))
 '(highlight ((t (:background "black" :foreground "white"))))
 '(ido-first-match ((t (:foreground "#FF6E27" :weight bold))))
 '(ido-incomplete-regexp ((t (:foreground "DeepPink1" :weight bold))))
 '(ido-indicator ((t (:background "#FF6E27" :foreground "#000000" :width condensed))))
 '(ido-only-match ((t (:background "#FF6E27" :foreground "white smoke" :weight bold))))
 '(ido-subdir ((t (:foreground "#F34739"))))
 '(ido-virtual ((t (:foreground "#FF6E27"))))
 '(iedit-occurrence ((t (:foreground "green yellow"))))
 '(magit-branch-local ((t (:foreground "orange"))))
 '(magit-branch-remote ((t (:foreground "#D90F5A"))))
 '(magit-diff-removed ((t (:background "#000000" :foreground "orange red"))))
 '(magit-diff-removed-highlight ((t (:background "#3C3D37" :foreground "orange red"))))
 '(magit-filename ((t (:foreground "#F34739" :weight normal))))
 '(magit-hash ((t (:foreground "#FF6E27"))))
 '(magit-log-author ((t (:foreground "orange"))))
 '(magit-log-date ((t (:foreground "#FF6E27"))))
 '(magit-log-graph ((t (:foreground "#75715E"))))
 '(magit-section-heading ((t (:foreground "#FF6E27" :weight bold))))
 '(magit-section-highlight ((t (:background "gray9"))))
 '(magit-tag ((t (:foreground "orange" :weight bold))))
 '(minibuffer-prompt ((t (:foreground "#FF6E27"))))
 '(mode-line ((t (:background "gray9" :foreground "#F8F8F0" :slant normal))))
 '(mode-line-buffer-id ((t (:foreground "white smoke" :weight bold))))
 '(mode-line-inactive ((t ("#000000" nil "#75715E" :background :box nil))))
 '(neo-banner-face ((t (:background "#000000" :foreground "#F34739" :weight bold))))
 '(neo-dir-link-face ((t (:foreground "#FF6E27"))))
 '(neo-root-dir-face ((t (:background "#000000" :foreground "gold"))))
 '(nlinum ((t (:background "gray5" :foreground "#8F908A" :underline nil))))
 '(nlinum-current-line ((t (:foreground "#FF6E27" :slant normal :weight bold))))
 '(nlinum-highlight-face ((t (:foreground "#FF6E27" :weight bold :slant normal))))
 '(package-name ((t (:foreground "#FF6E27"))))
 '(pass-mode-directory-face ((t (:foreground "#FF6E27" :weight bold))))
 '(pass-mode-entry-face ((t nil)))
 '(powerline-active0 ((t (:background "#F34739"))))
 '(powerline-active1 ((t (:background "#FF6E27" :foreground "white smoke" :weight bold))))
 '(powerline-active2 ((t (:background "gray9" :foreground "#FF6E27"))))
 '(trailing-whitespace ((t (:background "deep pink" :foreground "white"))))
 '(whitespace-line ((t nil)))
 '(whitespace-newline ((t nil)))
 '(whitespace-space ((t nil)))
 '(whitespace-tab ((t (:foreground "#FD971F" :weight bold))))
 '(whitespace-trailing ((t (:foreground "deep pink" :inverse-video t)))))

(load-theme 'monokai t)
(provide 'init)
;;; init.el ends here
