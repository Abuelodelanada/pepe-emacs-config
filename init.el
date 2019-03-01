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
(global-auto-complete-mode t) ;; Enable auto-complete
(global-highlight-parentheses-mode t)
(doom-modeline-mode 1)
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
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(custom-safe-themes
        (quote
         ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default)))
 '(flycheck-check-syntax-automatically (quote (save mode-enabled)))
 '(flycheck-highlighting-mode (quote lines))
 '(flycheck-pycheckers-checkers (quote (pylint pep8)))
 '(global-whitespace-mode t)
 '(linum-format " %d ")
 '(linum-highlight-current-line t)
 '(linum-use-right-margin nil)
 '(monokai-background "#000000")
 '(neo-autorefresh t)
 '(neo-smart-open t)
 '(package-selected-packages
        (quote
         (yasnippet-snippets yaml-mode smarty-mode doom-modeline linum linum-hl markdown-mode+ jquery-doc iedit highlight-parentheses highlight git-gutter geben flymd flycheck-color-mode-line flycheck ecb dumb-jump diff-hl company-php auto-indent-mode all-the-icons adoc-mode ac-php ac-js2 dash-functional ag)))
 '(phpcbf-standard "PSR2")
 '(size-indication-mode t)
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
 '(cursor ((t (:background "spring green" :foreground "white smoke" :inverse-video t))))
 '(doom-modeline-bar ((t (:background "orange"))))
 '(doom-modeline-buffer-major-mode ((t (:inherit (mode-line-emphasis bold) :foreground "spring green"))))
 '(doom-modeline-buffer-minor-mode ((t (:inherit (mode-line-buffer-id bold) :foreground "cyan"))))
 '(doom-modeline-buffer-modified ((t (:foreground "orange"))))
 '(doom-modeline-project-dir ((t (:inherit (font-lock-string-face bold) :foreground "cyan"))))
 '(flycheck-color-mode-line-error-face ((t (:weight bold))))
 '(flycheck-color-mode-line-info-face ((t nil)))
 '(flycheck-color-mode-line-success-face ((t nil)))
 '(flycheck-color-mode-line-warning-face ((t nil)))
 '(flycheck-error ((t (:underline "#F92672"))))
 '(highlight ((t (:background "black" :foreground "white"))))
 '(ido-first-match ((t (:foreground "cyan" :weight normal))))
 '(ido-incomplete-regexp ((t (:foreground "DeepPink1" :weight bold))))
 '(ido-only-match ((t (:background "cyan" :foreground "black" :weight bold))))
 '(iedit-occurrence ((t (:foreground "green yellow"))))
 '(linum-current-line ((t (:foreground "turquoise2" :weight bold))))
 '(magit-branch-local ((t (:foreground "turquoise1"))))
 '(magit-filename ((t (:foreground "DarkOrange1" :weight normal))))
 '(magit-hash ((t (:foreground "orange"))))
 '(magit-log-author ((t (:foreground "aquamarine1"))))
 '(magit-log-date ((t (:foreground "orange"))))
 '(magit-log-graph ((t (:foreground "#75715E"))))
 '(magit-section-heading ((t (:foreground "spring green" :weight bold))))
 '(magit-section-highlight ((t (:background "gray9"))))
 '(magit-tag ((t (:foreground "orange" :weight bold))))
 '(mode-line ((t (:background "gray9" :foreground "#F8F8F0" :slant normal))))
 '(mode-line-buffer-id ((t (:foreground "spring green" :weight bold))))
 '(mode-line-inactive ((t ("#000000" nil "#75715E" :background :box nil))))
 '(trailing-whitespace ((t (:background "deep pink" :foreground "white"))))
 '(whitespace-line ((t nil)))
 '(whitespace-newline ((t nil)))
 '(whitespace-space ((t nil)))
 '(whitespace-tab ((t (:foreground "#FD971F" :weight bold))))
 '(whitespace-trailing ((t (:foreground "deep pink" :inverse-video t)))))

(load-theme 'monokai t)
(provide 'init)
;;; init.el ends here
