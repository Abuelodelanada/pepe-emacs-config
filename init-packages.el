;;; -*- lexical-binding: t; -*-
;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)


; list the packages you want
(defvar package-list)

(setq package-list
      '(use-package))


; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)
    (when (package-installed-p 'all-the-icons)
      (all-the-icons-install-fonts))))


; activate all the packages
(package-initialize)

(provide 'init-packages)
;;; init-packages.el ends here
