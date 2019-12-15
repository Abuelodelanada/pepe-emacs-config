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
(load "~/.emacs.d/customvariables")
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

(require 'projectile)
(define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

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

(diminish 'abbrev-mode "Abv")
(diminish 'projectile-mode "Proj")
(diminish 'git-gutter-mode)
(diminish 'global-whitespace-mode)
(diminish 'highlight-parentheses-mode)


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
