;;; package --- Summary
;;; Commentary:
;;; Code:

;; Hooks
(add-hook 'window-setup-hook 'on-after-init)
;(add-hook 'php-mode-hook 'php-enable-psr2-coding-style)
(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
(add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup)

(provide 'hooks)
;;; hooks ends here
