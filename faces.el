;;; -*- lexical-binding: t; -*-
;;; package --- Summary
;;; Commentary:
;;; Code:

(set-face-attribute 'cursor t :background "#FE8B05" :foreground "white smoke" :inverse-video t)
(set-face-attribute 'default t :background "#000000" :foreground "#F8F8F2" :weight 'normal :height 105)
(set-face-attribute 'ido-first-match t :foreground "#FF6E27" :weight 'bold)
(set-face-attribute 'ido-incomplete-regexp t :foreground "DeepPink1" :weight 'bold)
(set-face-attribute 'ido-indicator t :background "#FF6E27" :foreground "#000000" :width 'condensed)
(set-face-attribute 'ido-only-match t :background "#FF6E27" :foreground "white smoke" :weight 'bold)
(set-face-attribute 'ido-subdir t :foreground "#F34739")
(set-face-attribute 'ido-virtual t :foreground "#FF6E27")
(set-face-attribute 'isearch t :background "orange" :foreground "black" :box nil)
(set-face-attribute 'minibuffer-prompt t :foreground "#FF6E27")
(set-face-attribute 'package-name t :foreground "#FF6E27")
(set-face-attribute 'whitespace-line t)
(set-face-attribute 'whitespace-newline t)
(set-face-attribute 'whitespace-space t)
(set-face-attribute 'whitespace-tab t :foreground "#FD971F" :weight 'bold)
(set-face-attribute 'whitespace-trailing t :foreground "orange" :inverse-video t)

(set-face-attribute 'line-number t :inherit 'default :foreground "dark gray" :slant 'italic :weight 'extra-bold)
(set-face-attribute 'line-number-current-line t :weight 'bold :slant 'italic :foreground "orange")

(provide 'faces)
;;; faces.el ends here
