;;; package --- Summary
;;; Commentary:
;;; Code:

;; Taken from: https://amitp.blogspot.com/2018/10/emacs-prettier-tabbar.html
;; Tab Bar
(require 'tabbar)
(customize-set-variable 'tabbar-background-color "black")
(customize-set-variable 'tabbar-separator '(0.5))
(customize-set-variable 'tabbar-use-images t)
(tabbar-mode 1)

;; Colors
(set-face-attribute 'tabbar-default nil
                    :background "black" :foreground
                    "black" :distant-foreground "black"
                    :family "Helvetica Neue" :box nil)
(set-face-attribute 'tabbar-unselected nil
                    :background "gray80" :foreground "black" :box nil)
(set-face-attribute 'tabbar-modified nil
                    :foreground "DarkOrange" :box nil
                    :inherit 'tabbar-unselected)
(set-face-attribute 'tabbar-selected nil
                    :background "turquoise4" :foreground "white" :box nil)
(set-face-attribute 'tabbar-selected-modified nil
                    :inherit 'tabbar-selected :foreground "turquoise1" :box nil)
(set-face-attribute 'tabbar-button nil
                    :box nil)

;; Use Powerline to make tabs look nicer
;; (this needs to run *after* the colors are set)
(require 'powerline)
(defvar my/tabbar-height 20)
(defvar my/tabbar-left (powerline-wave-right 'tabbar-default nil my/tabbar-height))
(defvar my/tabbar-right (powerline-wave-left nil 'tabbar-default my/tabbar-height))
(defun my/tabbar-tab-label-function (tab)
  (powerline-render (list my/tabbar-left
                          (format " %s  " (car tab))
                          my/tabbar-right)))
(setq tabbar-tab-label-function #'my/tabbar-tab-label-function)


;; Group tabs by project/directory, and hide some buffers
;; <https://www.emacswiki.org/emacs/TabBarMode#toc15>
(defun my/tabbar-buffer-groups ()
  (cond ((member (buffer-name)
                 '("*Completions*"
                   "*scratch*"
                   "*Messages*"
                   "*Ediff Registry*"))
         (list "#hide"))
        (t (list (or (cdr (project-current))
                     (expand-file-name default-directory))))))


;; Keep tabs sorted <https://www.emacswiki.org/emacs/TabBarMode#toc7>
(defun tabbar-add-tab (tabset object &optional _append_ignored)
"Add to TABSET a tab with value OBJECT if there isn't one there yet.
If the tab is added, it is added at the beginning of the tab list,
unless the optional argument APPEND is non-nil, in which case it is
added at the end."
  (let ((tabs (tabbar-tabs tabset)))
    (if (tabbar-get-tab object tabset)
        tabs
      (let ((tab (tabbar-make-tab object tabset)))
        (tabbar-set-template tabset nil)
        (set tabset (sort (cons tab tabs)
                 (lambda (a b) (string< (buffer-name (car a))
                               (buffer-name (car b))))))))))


(defun toggle-tabbar ()
  "Run toggle-tabbar"
  (interactive)
  (run-tabbar-settings)
  (tabbar-mode (if tabbar-mode -1 1)))


(provide 'tabbar)
;;; alias.el ends here
