;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package ac-js2)
(use-package ac-php)
(use-package ac-php-core)
(use-package adoc-mode)
(use-package ag)
(use-package all-the-icons)
(use-package auto-compile)
(use-package auto-complete)
(use-package auto-indent-mode)
(use-package company)
(use-package company-php)
(use-package diminish)
(use-package dockerfile-mode)
(use-package dumb-jump)
(use-package ecb)
(use-package epl)
(use-package f)
(use-package flycheck
  :custom
  (flycheck-check-syntax-automatically '(save mode-enabled))
  (flycheck-highlighting-mode '(lines))
  (flycheck-pycheckers-checkers '(pylint pep8))
  :custom-face
  (flycheck-error ((t (:underline "#F92672"))))
  (flycheck-color-mode-line-error-face ((t (:inherit 'flycheck-fringe-error :box t :line-width 2 :color "red" :style 'released-button))))
  (flycheck-color-mode-line-warning-face ((t (:inherit 'flycheck-fringe-warning :box t :line-width 2 :color "orange" :style 'released-button)))))
(use-package flycheck-color-mode-line)
(use-package flycheck-mypy)
(use-package flycheck-pycheckers)
(use-package flymd)
(use-package geben)
(use-package git-gutter-fringe)
(use-package highlight)
(use-package highlight-parentheses)
(use-package hlinum)
(use-package iedit)
(use-package jquery-doc)
(use-package js2-mode)
(use-package json-mode)
(use-package linum)
(use-package magit)
(use-package magit-gitflow)
(use-package markdown-mode)
(use-package markdown-mode+)
(use-package markdown-toc)
(use-package markup-faces)
(use-package monokai-theme)
(use-package neotree)
(use-package pass)
(use-package php-mode)
(use-package phpcbf)
(use-package pkg-info)
(use-package popup)
(use-package powerline
  :custom
  (powerline-default-separator "arrow-fade")
  (powerline-gui-use-vcs-glyph t)
  (powerline-height 22)
  :custom-face
  (powerline-active0 ((t (:background "#F34739"))))
  (powerline-active1 ((t (:background "#FF6E27" :foreground "white smoke" :weight bold))))
  (powerline-active2 ((t (:background "gray9" :foreground "#FF6E27")))))

(use-package projectile)
(use-package s)
(use-package seq)
(use-package smarty-mode)
(use-package sqlformat)
(use-package tabbar
  :custom
  (tabbar-background-color "gray9")
  (tabbar-separator 0.5)
  (tabbar-use-images t)
  :custom-face
  (tabbar-separator ((t (:inherit tabbar-default :width normal)))))
(use-package web-mode)
(use-package yaml-mode)
(use-package yasnippet)
(use-package yasnippet-snippets)
;;;




