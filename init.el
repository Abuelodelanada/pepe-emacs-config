;;; package --- Summary
;;; Commentary:
;;; Code:

(package-initialize)
(load "~/.emacs.d/init-packages")

;; Global settings
(require 'iedit)
(setq inhibit-startup-message t) ;; Disable startup messages
(add-to-list 'default-frame-alist '(fullscreen . maximized)) ;; Maximize window at startup
(setq make-backup-files nil) ;; No backup files ~
(setq auto-save-default nil) ;; Stop creating auto #autosave# files
(tool-bar-mode -1) ;; Hide toolbar
(scroll-bar-mode -1) ;; Hide scrollbar
(menu-bar-mode -1) ;; Hide menubar
(column-number-mode 1) ;; Show column number
(global-nlinum-mode 1) ;; Show line-number
(global-auto-complete-mode t) ;; Enable auto-complete
(global-highlight-parentheses-mode t)
(powerline-default-theme)
(setq-default kill-read-only-ok t)
(put 'upcase-region 'disabled nil)
(yas-global-mode 1)
(setq frame-resize-pixelwise t)
(ido-mode 1)
(defvar ido-enable-flex-matching)
(setq ido-enable-flex-matching t)
(dumb-jump-mode 1) ;dumb-jump
(defvar dumb-jump-prefer-searcher)
(setq dumb-jump-prefer-searcher 'rg)
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(defvar yas-prompt-functions)
(setq yas-prompt-functions '(yas-dropdown-prompt
                             yas-ido-prompt
                             yas-completing-prompt))

(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup))
(defvar path-to-ctags)
(setq path-to-ctags "/usr/bin/ctags") ;; <- your ctags path here
(put 'downcase-region 'disabled nil)
(set-default 'case-fold-search nil) ; Case sensitive TAGS search
(global-diff-hl-mode)
(autoload 'geben "geben" "DBGp protocol frontend, a script debugger" t) ; Geben
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(add-to-list 'auto-mode-alist '("\\.php" . php-mode))
(add-to-list 'auto-mode-alist '("\\.module$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.install$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.engine$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.tpl.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.adoc" . adoc-mode))
(add-to-list 'auto-mode-alist '("\\.xml" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.xul" . xml-mode))

;; Hooks
(add-hook 'window-setup-hook 'on-after-init)
;(add-hook 'php-mode-hook 'php-enable-psr2-coding-style)
(add-hook 'js2-mode-hook 'jquery-doc-setup)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-hook 'sql-mode-hook 'sqlformat-on-save-mode)

;; Shortcuts
(global-set-key (kbd "%") 'match-paren) ;; Ir al cierre-apertura de ([{
(global-set-key (kbd "<f12>") 'menu-bar-mode)
(global-set-key (kbd "<f8>") 'neotree-toggle)
(global-set-key (kbd "C-;") 'iedit-dwim)
(global-set-key (kbd "C-c <down>") 'flycheck-next-error)
(global-set-key (kbd "C-c <up>") 'flycheck-previous-error)
(global-set-key (kbd "C-c C-f") 'sqlformat)
(global-set-key (kbd "C-c C-k") 'copy-line)
(global-set-key (kbd "C-c C-w") 'copy-word)
(global-set-key (kbd "C-c C-z") 'term-stop-subjob)
(global-set-key (kbd "C-c c") 'comment-region) ; Comentar regiones marcadas (C-c c):
(global-set-key (kbd "C-c u") 'uncomment-region) ; Descomentar regiones marcadas (C-c u):
(global-set-key (kbd "C-d") 'duplicate-current-line)
(global-set-key (kbd "C-l") 'goto-line)
(global-set-key (kbd "C-t") 'crear-tags) ;; Create tags shortcut
(global-set-key (kbd "C-x p") 'phpcbf)
(global-set-key (kbd "M-<down>") 'enlarge-window)
(global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<right>") 'shrink-window-horizontally)
(global-set-key (kbd "M-<up>") 'shrink-window)
(global-set-key (kbd "S-<down>") 'windmove-down)
(global-set-key (kbd "S-<left>") 'windmove-left)
(global-set-key (kbd "S-<right>") 'windmove-right)
(global-set-key (kbd "S-<up>") 'windmove-up)

;; Alias
(defalias 'bkr 'browse-kill-ring)
(defalias 'lb 'list-buffers)
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'gf 'grep-find)
(defalias 'fd 'find-dired)
(defalias 'tt 'tramp-term)


;; Functions
(defun get-point (symbol &optional arg)
  "Get the point.
SYMBOL.
ARG."
  (funcall symbol arg)
  (point)
  )

(defun copy-thing (begin-of-thing end-of-thing &optional arg)
  "Copy thing between beg & end into kill ring.
BEGIN-OF-THING.
END-OF-THING.
ARG."
  (save-excursion
    (let ((beg (get-point begin-of-thing 1))
	  (end (get-point end-of-thing arg)))
      (copy-region-as-kill beg end)))
  )

(defun paste-to-mark(&optional arg)
  "Paste things to mark, or to the prompt in shell-mode"
  (let ((pasteMe
     	 (lambda()
     	   (if (string= "shell-mode" major-mode)
	       (progn (comint-next-prompt 25535) (yank))
	     (progn (goto-char (mark)) (yank) )))))
    (if arg
	(if (= arg 1)
	    nil
	  (funcall pasteMe))
      (funcall pasteMe))
    ))

(defun copy-word (&optional arg)
  "Copy words at point into ‘kill-ring’.
ARG."
  (interactive "P")
  (copy-thing 'backward-word 'forward-word arg)
  (message "Copying word at point into kill-ring...")
  ;; (Paste-to-mark arg)
  )

(defun duplicate-current-line ()
  "Duplicate the current line."
  (interactive)
  (beginning-of-line nil)
  (let ((b (point)))
    (end-of-line nil)
    (copy-region-as-kill b (point)))
  (beginning-of-line 2)
  (open-line 1)
  (yank)
  (back-to-indentation))


; ctags
(defun crear-tags (dir-name)
  "Create tags file.
DIR-NAME."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -R -e --languages='php' --exclude='cache' %s" path-to-ctags dir-name (directory-file-name dir-name)))
)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %.
ARG."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(defun copy-line (&optional arg)
"Do a ‘kill-line’ but copy rather than kill.
This function directly calls ‘kill-line’, so see documentation of ‘kill-line’
for how to use it including prefix
argument and relevant variables.  This function works by temporarily making the
buffer read-only, so I suggest setting ‘kill-read-only-ok’ to t.
ARG."
  (interactive "P")
  (read-only-mode 1)
  (kill-line arg)
  (read-only-mode 0))


;; iedit
(defun iedit-dwim (arg)
  "Start iedit but use \\[narrow-to-defun] to limit its scope.
ARG."
  (interactive "P")
  (if arg
      (iedit-mode)
    (save-excursion
      (save-restriction
        (widen)
        ;; this function determines the scope of `iedit-start'.
        (if iedit-mode
            (iedit-done)
          ;; `current-word' can of course be replaced by other
          ;; functions.
          (narrow-to-defun)
          (iedit-start (current-word) (point-min) (point-max)))))))


;; Edit files as root
;; http://emacsredux.com/blog/2013/04/21/edit-files-as-root/
(defadvice ido-find-file (after find-file-sudo activate)
  "Find file as root if necessary."
  (unless (and buffer-file-name
               (file-writable-p buffer-file-name))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

; xml-format
(defun xml-format ()
  "Xml-format."
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "xmllint --format -" (buffer-name) t)
    )
  )

(custom-set-variables
 '(blink-cursor-mode t)
 '(flycheck-check-syntax-automatically (quote (save mode-enabled)))
 '(flycheck-highlighting-mode (quote lines))
 '(flycheck-pycheckers-checkers (quote (pylint pep8)))
 '(monokai-background "#000000")
 '(neo-autorefresh t)
 '(neo-smart-open t)
 '(nlinum-highlight-current-line t)
 '(package-selected-packages
   (quote
    (yasnippet-snippets yaml-mode smarty-mode powerline nlinum nlinum-hl monokai-theme markdown-mode+ jquery-doc iedit highlight-parentheses highlight git-gutter geben flymd flycheck-color-mode-line flycheck ecb dumb-jump diff-hl company-php auto-indent-mode all-the-icons adoc-mode ac-php ac-js2 dash-functional ag)))
 '(phpcbf-standard "PSR2")
 '(powerline-default-separator (quote arrow-fade))
 '(powerline-gui-use-vcs-glyph t)
 '(size-indication-mode nil))

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
 '(mode-line ((t (:background "#49483E" :foreground "#F8F8F0" :box (:line-width 1 :color "black")))))
 '(mode-line-buffer-id ((t (:foreground "white smoke" :weight bold))))
 '(mode-line-inactive ((t ("#000000" nil "#75715E" :background :box nil))))
 '(nlinum-current-line ((t (:foreground "turquoise2" :weight bold))))
 '(powerline-active0 ((t (:background "turquoise4"))))
 '(powerline-active1 ((t (:background "turquoise3" :foreground "gray10" :weight bold))))
 '(powerline-active2 ((t (:background "black" :foreground "turquoise1")))))

(load-theme 'monokai t)
(provide 'init)
;;; init.el ends here
