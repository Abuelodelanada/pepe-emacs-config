;;; package --- Summary
;;; Commentary:
;;; Code:

(package-initialize)
(load "~/.emacs.d/init-packages")
(provide 'init)

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
(set-frame-font "Ubuntu Mono 11")
(powerline-default-theme)
(set-cursor-color "#d2ff27")
(setq-default kill-read-only-ok t)
(put 'upcase-region 'disabled nil)
(yas-global-mode 1)
(setq frame-resize-pixelwise t)
(ido-mode 1)
(defvar ido-enable-flex-matching)
(setq ido-enable-flex-matching t)
(dumb-jump-mode 1) ;dumb-jump
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(defvar yas-prompt-functions)
(setq yas-prompt-functions '(yas-dropdown-prompt
                             yas-ido-prompt
                             yas-completing-prompt))

(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))
(global-flycheck-mode 1)
(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup))
(defvar path-to-ctags)
(setq path-to-ctags "/usr/bin/ctags") ;; <- your ctags path here
(put 'downcase-region 'disabled nil)
(set-default 'case-fold-search nil) ; Case sensitive TAGS search
(global-diff-hl-mode)
(autoload 'adoc-mode "adoc-mode" nil t) ; adoc-mode
(autoload 'geben "geben" "DBGp protocol frontend, a script debugger" t) ; Geben
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.php" . php-mode))
(add-to-list 'auto-mode-alist '("\\.module$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.install$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.engine$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.tpl.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist (cons "\\.adoc\\'" 'adoc-mode))


;; Hooks
(add-hook 'window-setup-hook 'on-after-init)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'write-file-hooks 'delete-trailing-whitespace nil t)
(add-hook 'php-mode-hook 'php-enable-psr2-coding-style)
(add-hook 'js2-mode-hook 'jquery-doc-setup)
(add-hook 'js2-mode-hook 'ac-js2-mode)

;; Shortcuts
(global-set-key (kbd "C-l") 'goto-line)
(global-set-key (kbd "M-<down>") 'enlarge-window)
(global-set-key (kbd "M-<up>") 'shrink-window)
(global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<right>") 'shrink-window-horizontally)
(global-set-key (kbd "C-d") 'duplicate-current-line)
(global-set-key (kbd "C-c C-z") 'term-stop-subjob)
(global-set-key (kbd "C-c C-w") 'copy-word)
(global-set-key (kbd "<f12>") 'menu-bar-mode)
(global-set-key (kbd "%") 'match-paren) ;; Ir al cierre-apertura de ([{
(global-set-key (kbd "C-c c") 'comment-region) ; Comentar regiones marcadas (C-c c):
(global-set-key (kbd "C-c u") 'uncomment-region) ; Descomentar regiones marcadas (C-c u):
(global-set-key (kbd "C-c C-k") 'copy-line)
(global-set-key (kbd "C-;") 'iedit-dwim)
(global-set-key (kbd "C-t") 'crear-tags) ;; Create tags shortcut
(global-set-key (kbd "S-<left>")  'windmove-left)
(global-set-key (kbd "S-<right>") 'windmove-right)
(global-set-key (kbd "S-<up>")    'windmove-up)
(global-set-key (kbd "S-<down>")  'windmove-down)

;; Alias
(defalias 'bkr 'browse-kill-ring)
(defalias 'lb 'list-buffers)
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'gf 'grep-find)
(defalias 'fd 'find-dired)
(defalias 'tt 'tramp-term)


;; Functions
(defun get-point (symbol &optional arg)
  "Get the point"
  (funcall symbol arg)
  (point)
  )

(defun copy-thing (begin-of-thing end-of-thing &optional arg)
  "Copy thing between beg & end into kill ring"
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
  "Copy words at point into kill-ring"
  (interactive "P")
  (copy-thing 'backward-word 'forward-word arg)
  (message "Copying word at point into kill-ring...")
  ;; (Paste-to-mark arg)
  )

(defun duplicate-current-line ()
  (interactive)
  (beginning-of-line nil)
  (let ((b (point)))
    (end-of-line nil)
    (copy-region-as-kill b (point)))
  (beginning-of-line 2)
  (open-line 1)
  (yank)
  (back-to-indentation))


(defun edit-current-file-as-root ()
  "Edit the file that is associated with the current buffer as root"
  (interactive)
  (let ((filep (buffer-file-name)))
    (kill-buffer (current-buffer))
    (if filep (find-file (concat "/sudo::" filep))
      (message "Current buffer does not have an associated file."))))

; ctags
(defun crear-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -R --languages='php' --exclude='cache' %s" path-to-ctags dir-name (directory-file-name dir-name)))
)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(defun copy-line (&optional arg)
  "Do a kill-line but copy rather than kill.  This function directly calls
kill-line, so see documentation of kill-line for how to use it including prefix
argument and relevant variables.  This function works by temporarily making the
buffer read-only, so I suggest setting kill-read-only-ok to t."
  (interactive "P")
  (toggle-read-only 1)
  (kill-line arg)
  (toggle-read-only 0))


;; iedit
(defun iedit-dwim (arg)
  "Starts iedit but uses \\[narrow-to-defun] to limit its scope."
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
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "xmllint --format -" (buffer-name) t)
    )
  )

(custom-set-variables
 '(flycheck-highlighting-mode (quote lines))
 '(flycheck-pycheckers-checkers (quote (pylint pep8)))
 '(global-flycheck-mode t)
 '(monokai-background "#000000")
 '(nlinum-highlight-current-line t)
 '(package-selected-packages
   (quote
    (yasnippet-snippets yaml-mode smarty-mode powerline nlinum-hl nlinum monokai-theme markdown-mode+ jquery-doc iedit highlight-parentheses highlight git-gutter geben flymd flycheck-color-mode-line flycheck ecb dumb-jump diff-hl company-php auto-indent-mode all-the-icons adoc-mode ac-php ac-js2 dash-functional ag)))
 '(powerline-default-separator (quote arrow-fade))
 '(powerline-gui-use-vcs-glyph t)
 '(size-indication-mode nil))

(custom-set-faces
 '(flycheck-color-mode-line-error-face ((t (:foreground "red2" :weight bold))))
 '(mode-line ((t ("#49483E" nil "#F8F8F0" :background :box nil))))
 '(mode-line-buffer-id ((t (:foreground "white smoke" :weight bold))))
 '(mode-line-inactive ((t ("#000000" nil "#75715E" :background :box nil))))
 '(nlinum-current-line ((t (:foreground "turquoise2" :weight bold))))
 '(powerline-active0 ((t (:background "turquoise4"))))
 '(powerline-active1 ((t (:background "turquoise3" :foreground "gray10" :weight bold))))
 '(powerline-active2 ((t (:background "black" :foreground "turquoise1")))))

(load-theme 'monokai t)
(provide 'init)
;;; init.el ends here
