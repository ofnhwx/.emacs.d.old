;;; 20_flycheck.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/28 00:37:01>
;;

;;; Commentary:

;;; Code:

(use-package flycheck
  :init
  (set-variable 'flycheck-phpcs-standard "PSR2")
  :config
  (global-flycheck-mode t))

(use-package flycheck-swift
  :after (flycheck))

(provide '20_flycheck)
;;; 20_flycheck.el ends here
