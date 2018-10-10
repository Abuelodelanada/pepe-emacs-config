;;; package --- Summary
;;; Commentary:
;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/init-packages")
(provide 'init)

;; Global settings
(setq inhibit-startup-message t) ;; Disable startup messages
(add-to-list 'default-frame-alist '(fullscreen . maximized)) ;; Maximize window at startup
(setq make-backup-files nil) ;; No backup files ~
(setq auto-save-default nil) ;; Stop creating auto #autosave# files

;; Modes
(defun initialize-nlinum (&optional frame)
  (require 'nlinum)
  (add-hook 'prog-mode-hook 'nlinum-mode))
(when (daemonp) (add-hook 'window-setup-hook 'initialize-nlinum))
(global-nlinum-mode 1) ;; Show line-number

(require 'nlinum-hl)

(setq nlinum-highlight-current-line nil)

(tool-bar-mode -1) ;; Hide toolbar
(scroll-bar-mode -1) ;; Hide scrollbar
(menu-bar-mode -1) ;; Hide menubar
(column-number-mode 1) ;; Show column number
(global-auto-complete-mode t) ;; Enable auto-complete
(global-highlight-parentheses-mode t)

(require 'generic-x)

;; Parse these extensions as PHP
(add-to-list 'auto-mode-alist '("\\.php" . php-mode))
(add-to-list 'auto-mode-alist '("\\.module$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.install$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.engine$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.tpl.php$" . php-mode))


;; Shortcuts
(global-set-key (kbd "M-<down>") 'enlarge-window)
(global-set-key (kbd "M-<up>") 'shrink-window)
(global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<right>") 'shrink-window-horizontally)
(global-set-key (kbd "C-d") 'duplicate-current-line)
(global-set-key (kbd "C-c C-z") 'term-stop-subjob)
(global-set-key (kbd "C-c C-w") 'copy-word)
(global-set-key (kbd "<f12>") 'menu-bar-mode)

;; Alias

(defalias 'bkr 'browse-kill-ring)
(defalias 'lb 'list-buffers)
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'gf 'grep-find)
(defalias 'fd 'find-dired)
(defalias 'tt 'tramp-term)

;; Functions

(defun get-point (symbol &optional arg)
  "get the point"
  (funcall symbol arg)
  (point)
  )

(defun copy-thing (begin-of-thing end-of-thing &optional arg)
  "copy thing between beg & end into kill ring"
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


;;;;;;;;;;;;;;;;; Customizaciones José  ;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Code:
;(set-frame-font "Ubuntu Mono 11")
(set-frame-font "Ubuntu Mono derivative Powerline 11")
;(set-frame-font "Monaco 11")

;(global-font-lock-mode 0)

;; Acentos
(require 'iso-transl)

; Goto-line short-cut key
(global-set-key "\C-l" 'goto-line)

; ctags
(setq path-to-ctags "/usr/bin/ctags") ;; <- your ctags path here
(defun crear-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -R --languages='php' --exclude='cache' %s" path-to-ctags dir-name (directory-file-name dir-name)))
)

; Case sensitive TAGS search
(set-default 'case-fold-search nil)

;; Create tags shortcut
(global-set-key "\C-t" 'crear-tags)

;; Ir al cierre-apertura de ([{
(global-set-key "%" 'match-paren)

;;; Comentar regiones marcadas (C-c c):
(global-set-key (kbd "C-c c") 'comment-region)
;;; Descomentar regiones marcadas (C-c u):
(global-set-key (kbd "C-c u") 'uncomment-region)

; Theme
(setq monokai-background "#000000")
(load-theme 'monokai t)
(set-cursor-color "#d2ff27")

;; keyboard scroll one line at a time
(setq scroll-step 1)

;; Ir al cierre-apertura de ([{
(global-set-key "%" 'match-paren)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;; Copiar línea
(defun copy-line (&optional arg)
  "Do a kill-line but copy rather than kill.  This function directly calls
kill-line, so see documentation of kill-line for how to use it including prefix
argument and relevant variables.  This function works by temporarily making the
buffer read-only, so I suggest setting kill-read-only-ok to t."
  (interactive "P")
  (toggle-read-only 1)
  (kill-line arg)
  (toggle-read-only 0))

(setq-default kill-read-only-ok t)
(global-set-key "\C-c\C-k" 'copy-line)


(require 'yasnippet)
(yas-global-mode 1)


;(require 'dropdown-list)
(setq yas-prompt-functions '(yas-dropdown-prompt
                             yas-ido-prompt
                             yas-completing-prompt))

;;; Eliminar espacios en blanco al final de la linea automáticamente al guardar el archivo:
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'write-file-hooks 'delete-trailing-whitespace nil t)

;; ido mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
;(setq ido-use-filename-at-point t) ;; prefer file names near point

;; Powerline
(require 'powerline)
(powerline-default-theme)

;; Atajos para moverme entre ventanas con SHIFT
;(windmove-default-keybindings)

(global-set-key (kbd "S-<left>")  'windmove-left)
(global-set-key (kbd "S-<right>") 'windmove-right)
(global-set-key (kbd "S-<up>")    'windmove-up)
(global-set-key (kbd "S-<down>")  'windmove-down)

;; Emacs code browser
;(require 'ecb)
;(require 'ecb-autoloads)

(global-set-key (kbd "C-c a") 'ecb-activate)
(global-set-key (kbd "C-c d") 'ecb-deactivate)
;(setq ecb-layout-name "left6")
;(setq ecb-tip-of-the-day nil)





;; Markdown Modes
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(put 'upcase-region 'disabled nil)


;; YAML-MODe
(require 'yaml-mode)



;; iedit
(require 'iedit)
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

(global-set-key (kbd "C-;") 'iedit-dwim)
(put 'downcase-region 'disabled nil)

(add-hook 'php-mode-hook 'php-enable-psr2-coding-style)


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

(add-hook 'window-setup-hook 'on-after-init)

; impresión
(setq lpr-command "gtklp")
(setq ps-lpr-command "gtklp")


; https://github.com/dgutov/diff-hl
(global-diff-hl-mode)

; https://stackoverflow.com/questions/69934/set-4-space-indent-in-emacs-in-text-mode#1819405
; Cambiamos TAB por 4 espacios
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)


;http://www.flycheck.org/en/latest/user/quickstart.html#enable-flycheck
(setq flycheck-highlighting-mode 'lines)
(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))


;dumb-jump
(dumb-jump-mode 1)

; xml-format
(defun xml-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "xmllint --format -" (buffer-name) t)
    )
  )

; highlight current line
;(require 'hl-line+)
;(toggle-hl-line-when-idle 1)


(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(require 'jquery-doc)
(add-hook 'js2-mode-hook 'jquery-doc-setup)
(add-hook 'js2-mode-hook 'ac-js2-mode)

; Geben
(autoload 'geben "geben" "DBGp protocol frontend, a script debugger" t)

; adoc-mode
(autoload 'adoc-mode "adoc-mode" nil t)
(add-to-list 'auto-mode-alist (cons "\\.adoc\\'" 'adoc-mode))

(setq frame-resize-pixelwise t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yasnippet-snippets yaml-mode smarty-mode powerline nlinum-hl nlinum monokai-theme markdown-mode+ jquery-doc iedit highlight-parentheses highlight git-gutter geben flymd flycheck-color-mode-line flycheck ecb dumb-jump diff-hl company-php auto-indent-mode all-the-icons adoc-mode ac-php ac-js2 dash-functional ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
