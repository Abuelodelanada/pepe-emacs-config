;;; package --- Summary
;;; Commentary:
;;; Code:

;; Hooks
(add-hook 'window-setup-hook 'on-after-init)
;(add-hook 'php-mode-hook 'php-enable-psr2-coding-style)
(add-hook 'js2-mode-hook 'jquery-doc-setup)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-hook 'sql-mode-hook 'sqlformat-on-save-mode)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

(provide 'hooks)
;;; hooks ends here
