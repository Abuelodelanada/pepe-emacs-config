;;; package --- Summary
;;; Commentary:
;;; Code:

;; Hooks
(add-hook 'window-setup-hook 'on-after-init)
;(add-hook 'php-mode-hook 'php-enable-psr2-coding-style)
(add-hook 'js2-mode-hook 'jquery-doc-setup)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
(add-hook 'magit-mode-hook 'my-inhibit-global-linum-mode)
(add-hook 'linum-mode-hook 'my-linum-mode-hook)
(remove-hook 'server-switch-hook 'magit-commit-diff)

(provide 'hooks)
;;; hooks ends here
