;;; -*- lexical-binding: t; -*-
;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'use-package-ensure)
(setq use-package-always-ensure t)
;(setq use-package-verbose t) ;; Uncomment to debug loading times
(use-package adoc-mode
  :after markup-faces
  :mode "\\.adoc")

(use-package all-the-icons
  :after centaur-tabs)

(use-package auto-compile
  :after poweline
  :custom
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode))
;(use-package benchmark-init
;  :ensure t
;  :config
;  ;; To disable collection of benchmark data after init is done.
;  (add-hook 'after-init-hook 'benchmark-init/deactivate))
(use-package centaur-tabs
  :after powerline
  :unless (not (eq window-system 'x))
  :demand
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward)
  :config
  (centaur-tabs-enable-buffer-alphabetical-reordering)
  (centaur-tabs-group-by-projectile-project)
  (centaur-tabs-mode t)
  (setq
   centaur-tabs-adjust-buffer-order t
   centaur-tabs-height 25
   centaur-tabs-set-bar 'left
   centaur-tabs-set-icons t
   centaur-tabs-set-modified-marker t
   centaur-tabs-show-navigation-buttons t
   centaur-tabs-style "bar"
   x-underline-at-descent-line t)
  :custom-face
  (centaur-tabs-active-bar-face ((t (:background "#FF6E27"))))
  (centaur-tabs-selected ((t (:background "gray9" :foreground "white"))))
  (centaur-tabs-selected-modified ((t (:background "gray9" :foreground "white"))))
  (centaur-tabs-unselected ((t (:background "gray18" :foreground "grey50"))))
  :hook
  (calendar-mode . centaur-tabs-local-mode)
  (dashboard-mode . centaur-tabs-local-mode)
  (dired-mode . centaur-tabs-local-mode)
  (helpful-mode . centaur-tabs-local-mode)
  (org-agenda-mode . centaur-tabs-local-mode)
  (term-mode . centaur-tabs-local-mode))

(use-package company
  :hook
  (php-mode . company-mode)
  (python-mode . company-mode)
  :diminish
  :custom-face
  (company-preview ((t (:background "gray10" :foreground "#F8F8F0"))))
  (company-scrollbar-bg ((t (:background "gray10"))))
  (company-tooltip ((t (:background "gray10" :foreground "#F8F8F0"))))
  (company-tooltip-annotation ((t (:background "gray10" :foreground "green yellow"))))
  (company-tooltip-annotation-selection ((t nil)))
  (company-tooltip-common ((t (:background "gray10" :foreground "orange red" :underline t))))
  (company-tooltip-common-selection ((t (:background "orange red" :foreground "#000000" :underline t))))
  (company-tooltip-mouse ((t (:background "orange red" :foreground "#000000"))))
  (company-tooltip-selection ((t (:background "orange red" :foreground "#000000")))))

(use-package company-php
  :after company
  :init
  (add-hook 'php-mode-hook
          '(lambda ()
            (require 'company-php)
            (company-mode t)
            (add-to-list 'company-backends 'company-ac-php-backend ))))

(use-package company-quickhelp
  :after company
  :custom
   (company-quickhelp-color-background "gray15")
   (company-quickhelp-color-foreground "white smoke")
   (company-quickhelp-use-propertized-text t)
  :init
  (add-hook 'company-mode-hook 'company-quickhelp-mode))

(use-package diminish
  :defer t)

(use-package dockerfile-mode
  :mode "Dockerfile\\'")

(use-package doom-themes
  :after gcmh
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-monokai-pro t)
  (doom-themes-neotree-config) ;; Enable custom neotree theme (all-the-icons must be installed!)
  ;(doom-themes-org-config) ;; Corrects (and improves) org-mode's native fontification.
)

(use-package ecb
  :commands ecb-minor-mode
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

(use-package flycheck
  :ensure t
  :bind (("C-c <down>" . flycheck-next-error)
         ("C-c <up>" . flycheck-previous-error))
  :config
  (setq-default flycheck-disabled-checkers '(python-pylint))
  (setq-default flycheck-highlighting-mode '(lines))
  (setq-default flycheck-indication-mode nil)
  (setq-default flycheck-locate-config-file-functions
   '(flycheck-locate-config-file-home flycheck-locate-config-file-ancestor-directories flycheck-locate-config-file-by-path))
  :init
  (global-flycheck-mode)
  :custom
  (flycheck-check-syntax-automatically '(save mode-enabled))
  (flycheck-highlighting-mode '(lines))
  (flycheck-pycheckers-checkers '(flake8))
  :custom-face
  (flycheck-error ((t (:underline "red"))))
  (flycheck-fringe-error ((t (:foreground "red" :weight bold))))
  (flycheck-fringe-warning ((t (:inherit fringe :foreground "gold"))))
  (flycheck-warning ((t (:underline (:color "gold" :style wave)))))
  )
(use-package flycheck-indicator
  :hook (flycheck-mode . flycheck-indicator-mode))
(use-package flycheck-mypy
  :after (flycheck))

(use-package flycheck-pycheckers
  :after (flycheck))

(use-package flymd
  :after (flycheck))

(use-package gcmh)

(use-package geben
  :commands geben)

(use-package git-gutter
  :hook (prog-mode . git-gutter-mode))

(use-package git-gutter-fringe
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))

(use-package go-mode
  :defer t
  :config
  (add-hook 'go-mode-hook 'lsp-deferred)
  :hook ((before-save . gofmt-before-save)))


(use-package go-guru
  :after (go-mode)
  :hook (go-mode . go-guru-hl-identifier-mode)
  :config
  (setq go-guru-command "~/go/bin/guru"))

(use-package highlight-parentheses
  :defer t
  :init
  (add-hook 'js2-mode-hook 'highlight-parentheses-mode)
  (add-hook 'php-mode-hook 'highlight-parentheses-mode)
  (add-hook 'python-mode-hook 'highlight-parentheses-mode)
  (add-hook 'sql-mode-hook 'highlight-parentheses-mode)
  (add-hook 'markdown-mode-hook 'highlight-parentheses-mode)
  (add-hook 'prog-mode-hook 'highlight-parentheses-mode)
  :diminish)

(use-package iedit
  :defer t
  :bind (("C-;" . iedit-mode))
  :custom-face
  (iedit-occurrence ((t (:foreground "green yellow"))))
  :diminish)

(use-package jquery-doc
  :defer t)

(use-package js2-mode
  :mode "\\.js\\'")

(use-package json-mode
  :mode "\\.json\\'")

(use-package lsp-mode
  :commands (lsp)
  :bind (:map lsp-mode-map
              ("M-g f" . lsp-format-buffer))
  :config
  (setq lsp-auto-guess-root t
        lsp-keep-workspace-alive nil
        lsp-file-watch-threshold nil
        read-process-output-max (* 1024 1024)) ;; 1mb
  )

(use-package lsp-headerline
  :ensure nil
  :config
  (setq lsp-headerline-breadcrumb-segments '(symbols)
        lsp-headerline-breadcrumb-mode t)
  :custom-face
  (lsp-headerline-breadcrumb-path-face ((t (:foreground "orange red"))))
  (lsp-headerline-breadcrumb-separator-face ((t (:foreground "light gray"))))
  (lsp-headerline-breadcrumb-symbols-face ((t (:foreground "dark orange" :weight bold))))
  (lsp-headerline-breadcrumb-symbols-hint-face ((t (:inherit lsp-headerline-breadcrumb-symbols-face :underline (:color "Green" :style wave)))))
  (lsp-headerline-breadcrumb-symbols-info-face ((t (:inherit lsp-headerline-breadcrumb-symbols-face :underline (:color "Green" :style wave)))))
  (lsp-headerline-breadcrumb-symbols-warning-face ((t (:foreground "dark orange"))))
  (lsp-headerline-breadcrumb-unknown-project-prefix-face ((t (:foreground "light gray" :weight bold))))
  )

(use-package lsp-ui
  :commands (lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-sideline-enable nil
        lsp-ui-sideline-ignore-duplicate t
        lsp-ui-peek-enable nil
        lsp-ui-doc-position 'at-point))

(use-package lsp-pyright
  :hook (python-mode . (lambda () (require 'lsp-pyright) (lsp)))
  :config
  (setq lsp-pyright-disable-organize-imports t
        lsp-pyright-log-level "error"))

(use-package magit
  :bind (("C-x g" . magit-status))
  :custom-face
  (magit-branch-local ((t (:foreground "orange"))))
  (magit-branch-remote ((t (:foreground "#D90F5A"))))
  (magit-diff-removed ((t (:foreground "orange red"))))
  (magit-diff-removed-highlight ((t (:foreground "orange red"))))
  (magit-filename ((t (:foreground "#F34739" :weight normal))))
  (magit-hash ((t (:foreground "#FF6E27"))))
  (magit-log-author ((t (:foreground "orange"))))
  (magit-log-date ((t (:foreground "#FF6E27"))))
  (magit-log-graph ((t (:foreground "#75715E"))))
  (magit-section-heading ((t (:foreground "#FF6E27" :weight bold))))
  ;(magit-section-highlight ((t (:background "gray9"))))
  (magit-tag ((t (:foreground "orange" :weight bold))))
  :init
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
  (add-hook 'magit-mode-hook 'my-inhibit-global-linum-mode)
  (remove-hook 'server-switch-hook 'magit-commit-diff))

(use-package magit-gitflow
  :after magit)

(use-package markdown-mode
   :mode (("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("\\.text\\'" . markdown-mode)))

(use-package markdown-toc
  :after markdown-mode)

(use-package markup-faces
  :mode "\\.adoc")

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

(use-package php-mode
  :mode "\\.php"
  :mode "\\.module$"
  :mode "\\.inc$"
  :mode "\\.install$"
  :mode "\\.engine$"
  :mode "\\.tpl.php$")

(use-package popup
  :after company
  :custom-face
  (popup-face ((t (:background "gray10" :foreground "#F8F8F2"))))
  (popup-menu-face ((t (:background "gray10" :foreground "#F8F8F2"))))
  (popup-menu-mouse-face ((t (:background "orange" :foreground "#F8F8F2"))))
  (popup-menu-selection-face ((t (:background "orange red" :foreground "#000000")))))

(use-package powerline
  :defer t
  :init
  (powerline-default-theme)
  :custom
  (powerline-default-separator "arrow-fade")
  (powerline-gui-use-vcs-glyph t)
  (powerline-height 22)
  :custom-face
  (mode-line ((t (:background "gray9" :foreground "#F8F8F0" :slant normal))))
  (mode-line-buffer-id ((t (:foreground "white smoke" :weight bold))))
  (mode-line-inactive ((t :background "#000000" :box nil :foreground "#75715E")))
  (powerline-active0 ((t (:background "#F34739" :foreground "white smoke"))))
  (powerline-active1 ((t (:background "#FF6E27" :foreground "white smoke" :weight bold))))
  (powerline-active2 ((t (:background "gray9" :foreground "#FF6E27")))))

(use-package projectile
  :after centaur-tabs
  :diminish
  :custom
  (projectile-use-git-grep t)
  :init
  (projectile-mode +1)
  :bind-keymap
  ("M-p" . projectile-command-map)
  ("C-c p" . projectile-command-map))

(use-package smarty-mode
  :mode "\\.tpl$")

(use-package guess-language         ; Automatically detect language for Flyspell
  :ensure t
  :defer t
  :init (add-hook 'text-mode-hook #'guess-language-mode)
  :config
  (setq guess-language-langcodes '((en . ("en_GB" "English"))
                                   (es . ("es_AR" "Español AR")))
        guess-language-languages '(en it)
        guess-language-min-paragraph-length 45)
  :diminish guess-language-mode)

(use-package vlf)

(use-package web-mode
  :mode "\\.html?\\'"
  :mode "\\.phtml\\'"
  :mode "\\.phtml\\'")

(use-package which-key
  :defer t
  :config
  (setq which-key-idle-delay 1)
  (setq which-key-idle-secondary-delay 0.05)
  :custom-face
  (which-key-key-face ((t (:foreground "#FF6E27" :weight bold))))
  (which-key-command-description-face ((t (:foreground "white smoke"))))
  (which-key-group-description-face ((t (:foreground "#FE8B05" :weight bold))))
  :init
  (which-key-mode)
  :diminish)

(use-package yaml-mode
  :mode "\\.yml$"
  :mode "\\.yaml$")

(use-package yasnippet
  :hook
  (go-mode . yas-minor-mode)
  (php-mode . yas-minor-mode)
  (python-mode . yas-minor-mode)
  :diminish)

(use-package yasnippet-snippets
  :after yasnippet
  :diminish
  )
;;;
