;;; package --- Summary
;;; Commentary:
;;; Code:


(eval-after-load 'neotree '(set-face-attribute 'neo-banner-face t :background "#000000" :foreground "#F34739" :weight 'bold))
(eval-after-load 'neotree '(set-face-attribute 'neo-dir-link-face t :foreground "#FF6E27"))
(eval-after-load 'neotree '(set-face-attribute 'neo-root-dir-face t :background "#000000" :foreground "gold"))
(eval-after-load 'pass '(set-face-attribute 'pass-mode-directory-face t :foreground "#FF6E27" :weight 'bold))
(eval-after-load 'pass '(set-face-attribute 'pass-mode-entry-face t))
(set-face-attribute 'cursor t :background "#FE8B05" :foreground "white smoke" :inverse-video t)
(set-face-attribute 'default t :background "#000000" :foreground "#F8F8F2" :weight 'bold :height 110 :family "Ubuntu Mono")

(set-face-attribute 'highlight t :background "black" :foreground "white")
(set-face-attribute 'ido-first-match t :foreground "#FF6E27" :weight 'bold)
(set-face-attribute 'ido-incomplete-regexp t :foreground "DeepPink1" :weight 'bold)
(set-face-attribute 'ido-indicator t :background "#FF6E27" :foreground "#000000" :width 'condensed)
(set-face-attribute 'ido-only-match t :background "#FF6E27" :foreground "white smoke" :weight 'bold)
(set-face-attribute 'ido-subdir t :foreground "#F34739")
(set-face-attribute 'ido-virtual t :foreground "#FF6E27")
(set-face-attribute 'iedit-occurrence t :foreground "green yellow")
(set-face-attribute 'minibuffer-prompt t :foreground "#FF6E27")
(set-face-attribute 'mode-line t :background "gray9" :foreground "#F8F8F0" :slant 'normal)
(set-face-attribute 'mode-line-buffer-id t :foreground "white smoke" :weight 'bold)
(set-face-attribute 'mode-line-inactive t :background "#000000" :box nil :foreground "#75715E")
(set-face-attribute 'linum-highlight-face t :inherit 'default :background "#000000" :foreground "#FF6E27" :slant 'normal :weight 'bold)
(set-face-attribute 'package-name t :foreground "#FF6E27")
(set-face-attribute 'whitespace-line t)
(set-face-attribute 'whitespace-newline t)
(set-face-attribute 'whitespace-space t)
(set-face-attribute 'whitespace-tab t :foreground "#FD971F" :weight 'bold)
(set-face-attribute 'whitespace-trailing t :foreground "orange" :inverse-video t)

(provide 'faces)
;;; faces.el ends here
