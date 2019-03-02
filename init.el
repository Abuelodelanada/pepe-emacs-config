;;; package --- Summary
;;; Commentary:
;;; Code:

(package-initialize)
(load "~/.emacs.d/init-packages")
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
(global-linum-mode 1) ;; Show line-number
(hlinum-activate)
(global-auto-complete-mode t) ;; Enable auto-complete
(global-highlight-parentheses-mode t)
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
(global-diff-hl-mode)
(autoload 'geben "geben" "DBGp protocol frontend, a script debugger" t) ; Geben
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)

(custom-set-variables
 '(blink-cursor-mode t)
 '(custom-safe-themes
   (quote
    ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default)))
 '(flycheck-check-syntax-automatically (quote (save mode-enabled)))
 '(flycheck-highlighting-mode (quote lines))
 '(flycheck-pycheckers-checkers (quote (pylint pep8)))
 '(global-whitespace-mode t)
 '(linum-format (quote dynamic))
 '(linum-highlight-current-line t)
 '(linum-use-right-margin nil)
 '(monokai-background "#000000")
 '(neo-autorefresh t)
 '(neo-smart-open t)
 '(package-selected-packages
   (quote
    (yasnippet-snippets yaml-mode smarty-mode powerline linum linum-hl monokai-theme markdown-mode+ jquery-doc iedit highlight-parentheses highlight git-gutter git-gutter-fringe geben flymd flycheck-color-mode-line flycheck ecb dumb-jump diff-hl company-php auto-indent-mode all-the-icons adoc-mode ac-php ac-js2 dash-functional ag)))
 '(phpcbf-standard "PSR2")
 '(powerline-default-separator (quote arrow-fade))
 '(powerline-gui-use-vcs-glyph t)
 '(powerline-height 22)
 '(size-indication-mode nil)
 '(tabbar-background-color "black")
 '(tabbar-separator (quote (0.5)))
 '(tabbar-use-images t)
 '(whitespace-display-mappings (quote ((tab-mark 9 [187]))))
 '(whitespace-line-column nil)
 '(whitespace-style
   (quote
    (face trailing tabs spaces newline empty indentation space-after-tab space-before-tab space-mark tab-mark newline-mark))))

(custom-set-faces
 '(default ((t (:background "#000000" :foreground "#F8F8F2" :weight bold :height 110 :family "Ubuntu Mono"))))
 '(cursor ((t (:background "turquoise1" :foreground "white smoke" :inverse-video t))))
 '(flycheck-color-mode-line-error-face ((t (:box (:line-width 1 :color "DeepPink3") :weight bold))))
 '(flycheck-color-mode-line-info-face ((t (:box (:line-width 1 :color "turquoise1")))))
 '(flycheck-color-mode-line-success-face ((t (:box (:line-width 1 :color "turquoise1")))))
 '(flycheck-color-mode-line-warning-face ((t (:box (:line-width 1 :color "orange")))))
 '(flycheck-error ((t (:underline "#F92672"))))
 '(highlight ((t (:background "black" :foreground "white"))))
 '(ido-first-match ((t (:foreground "cyan" :weight normal))))
 '(ido-incomplete-regexp ((t (:foreground "DeepPink1" :weight bold))))
 '(ido-only-match ((t (:background "cyan" :foreground "black" :weight bold))))
 '(iedit-occurrence ((t (:foreground "green yellow"))))
 '(linum-current-line ((t (:foreground "turquoise2" :weight bold))))
 '(linum-highlight-face ((t (:foreground "spring green" :weight bold))))
 '(magit-branch-local ((t (:foreground "turquoise1"))))
 '(magit-filename ((t (:foreground "DarkOrange1" :weight normal))))
 '(magit-hash ((t (:foreground "orange"))))
 '(magit-log-author ((t (:foreground "aquamarine1"))))
 '(magit-log-date ((t (:foreground "orange"))))
 '(magit-log-graph ((t (:foreground "#75715E"))))
 '(magit-section-heading ((t (:foreground "aquamarine1" :weight bold))))
 '(magit-section-highlight ((t (:background "turquoise4"))))
 '(magit-tag ((t (:foreground "orange" :weight bold))))
 '(mode-line ((t (:background "#49483E" :foreground "#F8F8F0" :box (:line-width 1 :color "black")))))
 '(mode-line-buffer-id ((t (:foreground "white smoke" :weight bold))))
 '(mode-line-inactive ((t ("#000000" nil "#75715E" :background :box nil))))
 '(powerline-active0 ((t (:background "turquoise4"))))
 '(powerline-active1 ((t (:background "turquoise3" :foreground "gray10" :weight bold))))
 '(powerline-active2 ((t (:background "black" :foreground "turquoise1"))))
 '(trailing-whitespace ((t (:background "deep pink" :foreground "white"))))
 '(whitespace-line ((t nil)))
 '(whitespace-newline ((t nil)))
 '(whitespace-space ((t nil)))
 '(whitespace-tab ((t (:foreground "#FD971F" :weight bold))))
 '(whitespace-trailing ((t (:foreground "deep pink" :inverse-video t)))))

(load-theme 'monokai t)
(provide 'init)
;;; init.el ends here
