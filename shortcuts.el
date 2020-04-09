;;; package --- Summary
;;; Commentary:
;;; Code:

;; Shortcuts
(global-set-key (kbd "%") 'match-paren) ;; Ir al cierre-apertura de ([{
(global-set-key (kbd "<f12>") 'menu-bar-mode)
(global-set-key (kbd "<f7>") 'ecb-minor-mode)
(global-set-key (kbd "C-;") 'iedit-dwim)
(global-set-key (kbd "C-c <down>") 'flycheck-next-error)
(global-set-key (kbd "C-c <up>") 'flycheck-previous-error)
(global-set-key (kbd "C-c <tab>") 'sqlformat)
(global-set-key (kbd "C-c C-k") 'copy-line)
(global-set-key (kbd "C-c C-w") 'copy-word)
(global-set-key (kbd "C-c C-z") 'term-stop-subjob)
(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "C-d") 'duplicate-current-line)
(global-set-key (kbd "C-l") 'goto-line)
(global-set-key (kbd "C-t") 'crear-tags) ;; Create tags shortcut
(global-set-key (kbd "C-x p") 'phpcbf)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-<left>") 'tabbar-backward)
(global-set-key (kbd "M-<up>") 'beginning-of-buffer)
(global-set-key (kbd "M-<down>") 'end-of-buffer)
(global-set-key (kbd "M-<right>") 'tabbar-forward)
(global-set-key (kbd "S-M-<down>") 'enlarge-window)
(global-set-key (kbd "S-M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-M-<right>") 'shrink-window-horizontally)
(global-set-key (kbd "S-M-<up>") 'shrink-window)
(global-set-key (kbd "S-<down>") 'windmove-down)
(global-set-key (kbd "S-<left>") 'windmove-left)
(global-set-key (kbd "S-<right>") 'windmove-right)
(global-set-key (kbd "S-<up>") 'windmove-up)

(provide 'shortcuts)
;;; shortcuts.el ends here
