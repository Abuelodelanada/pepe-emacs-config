;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package adoc-mode
  :mode "\\.adoc")
(use-package ag)
(use-package all-the-icons)
(use-package auto-compile)
(use-package company)
(use-package company-anaconda
  :init
  (eval-after-load "company"
    '(add-to-list 'company-backends '(company-anaconda :with company-capf)))
  (add-hook 'python-mode-hook 'company-mode)
  (add-hook 'python-mode-hook 'anaconda-mode))
(use-package company-php
  :init
  (add-hook 'php-mode-hook
          '(lambda ()
            (require 'company-php)
            (company-mode t)
            (add-to-list 'company-backends 'company-ac-php-backend ))))
(use-package company-quickhelp
  :init
  (add-hook 'company-mode-hook 'company-quickhelp-mode))
(use-package diminish)
(use-package dockerfile-mode
  :mode "Dockerfile\\'")
(use-package dumb-jump
  :custom
  (dumb-jump-default-project "~")
  (dumb-jump-force-searcher nil)
  (dumb-jump-prefer-searcher 'ag)
  (dumb-jump-quiet nil))
(use-package ecb
  :bind (("<f7>" . ecb-minor-mode))
  :custom
  (ecb-layout-name "left6")
  (ecb-minor-mode-text "")
  (ecb-options-version "2.50")
  (ecb-tip-of-the-day nil)
  (ecb-windows-width 0.25)
  :custom-face
  (ecb-analyse-bucket-element-face ((t (:inherit ecb-analyse-general-face :foreground "gold"))))
  (ecb-bucket-node-face ((t (:inherit ecb-default-general-face :foreground "#FF6E27" :weight normal))))
  (ecb-default-highlight-face ((t (:background "#FF6E27" :foreground "white smoke"))))
  (ecb-methods-general-face ((t (:foreground "#FF6E27" :height 1.0))))
  (ecb-mode-line-data-face ((t (:foreground "#FF6E27"))))
  (ecb-mode-line-prefix-face ((t (:foreground "#FF6E27"))))
  (ecb-tag-header-face ((t (:background "#FF6E27")))))
(use-package epl)
(use-package f)
(use-package flycheck
  :bind (("C-c <down>" . flycheck-next-error)
         ("C-c <up>" . flycheck-previous-error))
  :custom
  (flycheck-check-syntax-automatically '(save mode-enabled))
  (flycheck-highlighting-mode '(lines))
  (flycheck-pycheckers-checkers '(pylint pep8))
  :custom-face
  (flycheck-error ((t (:underline "#F92672"))))
  (flycheck-color-mode-line-error-face ((t (:inherit 'flycheck-fringe-error :box t :line-width 2 :color "red" :style 'released-button))))
  (flycheck-color-mode-line-warning-face ((t (:inherit 'flycheck-fringe-warning :box t :line-width 2 :color "orange" :style 'released-button)))))
(use-package flycheck-color-mode-line)
(use-package flycheck-mypy)
(use-package flycheck-pycheckers)
(use-package flymd)
(use-package geben)
(use-package git-gutter-fringe)
(use-package highlight
  :custom-face
  (highlight ((t (:background "black" :foreground "white")))))
(use-package highlight-parentheses)
(use-package hlinum
  :custom-face
  (linum-highlight-face ((t (:inherit default :background "#000000" :foreground "#FF6E27" :slant normal :weight bold)))))
(use-package iedit
  :custom-face
  (iedit-occurrence ((t (:foreground "green yellow")))))
(use-package jquery-doc)
(use-package js2-mode
    :config
    (dumb-jump-mode t)
    :mode "\\.js\\'")
(use-package json-mode
  :mode "\\.json\\'")
(use-package linum
  :init
  (add-hook 'linum-mode-hook 'my-linum-mode-hook))
(use-package magit
  :bind (("C-x g" . magit-status))
  :custom-face
  (magit-branch-local ((t (:foreground "orange"))))
  (magit-branch-remote ((t (:foreground "#D90F5A"))))
  (magit-diff-removed ((t (:background "#000000" :foreground "orange red"))))
  (magit-diff-removed-highlight ((t (:background "#3C3D37" :foreground "orange red"))))
  (magit-filename ((t (:foreground "#F34739" :weight normal))))
  (magit-hash ((t (:foreground "#FF6E27"))))
  (magit-log-author ((t (:foreground "orange"))))
  (magit-log-date ((t (:foreground "#FF6E27"))))
  (magit-log-graph ((t (:foreground "#75715E"))))
  (magit-section-heading ((t (:foreground "#FF6E27" :weight bold))))
  (magit-section-highlight ((t (:background "gray9"))))
  (magit-tag ((t (:foreground "orange" :weight bold))))
  :init
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
  (add-hook 'magit-mode-hook 'my-inhibit-global-linum-mode)
  (remove-hook 'server-switch-hook 'magit-commit-diff))

(use-package magit-gitflow)
(use-package markdown-mode
  :mode (("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("\\.text\\'" . markdown-mode)))

(use-package markdown-mode+)
(use-package markdown-toc)
(use-package markup-faces)
(use-package monokai-theme)
(use-package neotree
  :bind (("<f8>" . neotree-toggle))
  :custom
  (neo-autorefresh t)
  (neo-mode-line-type '(neotree))
  (neo-smart-open t)
  (neo-theme (if (display-graphic-p) 'icons 'arrow))
  :custom-face
  (neo-banner-face ((t (:background "#000000" :foreground "#F34739" :weight bold))))
  (neo-dir-link-face ((t (:foreground "#FF6E27"))))
  (neo-root-dir-face ((t (:background "#000000" :foreground "gold")))))
(use-package pass
  :custom-face
  (pass-mode-directory-face ((t (:foreground "#FF6E27" :weight bold))))
  (pass-mode-entry-face ((t))))
(use-package php-mode
  :config
  (dumb-jump-mode t)
  :mode "\\.php"
  :mode "\\.module$"
  :mode "\\.inc$"
  :mode "\\.install$"
  :mode "\\.engine$"
  :mode "\\.tpl.php$")
(use-package phpcbf
  :custom
  (phpcbf-standard "PSR12"))
(use-package pkg-info)
(use-package popup)
(use-package powerline
  :custom
  (powerline-default-separator "arrow-fade")
  (powerline-gui-use-vcs-glyph t)
  (powerline-height 22)
  :custom-face
  (mode-line ((t (:background "gray9" :foreground "#F8F8F0" :slant normal))))
  (mode-line-buffer-id ((t (:foreground "white smoke" :weight bold))))
  (mode-line-inactive ((t :background "#000000" :box nil :foreground "#75715E")))
  (powerline-active0 ((t (:background "#F34739"))))
  (powerline-active1 ((t (:background "#FF6E27" :foreground "white smoke" :weight bold))))
  (powerline-active2 ((t (:background "gray9" :foreground "#FF6E27")))))

(use-package projectile)
(use-package s)
(use-package seq)
(use-package smarty-mode)
(use-package sqlformat)
(use-package tabbar
  :bind (("M-<left>" . tabbar-backward)
         ("M-<right>" . tabbar-forward))
  :custom
  (tabbar-background-color "gray9")
  (tabbar-separator 0.5)
  (tabbar-use-images t)
  :custom-face
  (tabbar-separator ((t (:inherit tabbar-default :width normal)))))
(use-package web-mode)
(use-package yaml-mode)
(use-package yasnippet)
(use-package yasnippet-snippets)
;;;
