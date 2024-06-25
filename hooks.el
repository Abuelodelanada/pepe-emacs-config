;;; -*- lexical-binding: t; -*-
;;; package --- Summary
;;; Commentary:
;;; Code:

;; Hooks
;; Use a hook so the message doesn't get clobbered by other messages.
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs with 'The Pepe emacs config' is ready in %s with %d garbage collections."
                     (format "%.3f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))
(add-hook 'window-setup-hook 'on-after-init)
;(add-hook 'php-mode-hook 'php-enable-psr2-coding-style)

(add-hook 'emacs-startup-hook
  (lambda ()
    (setq file-name-handler-alist pepe--file-name-handler-alist)))

(add-hook 'text-mode-hook (lambda () (setq-local line-spacing 0.1)))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)
(add-hook 'emacs-startup-hook 'my/install-all-the-icons-fonts)

(provide 'hooks)
;;; hooks ends here
