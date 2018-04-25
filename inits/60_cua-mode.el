;;; 60_cua-mode.el --- setup cua-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/25 10:40:37>
;;

;;; Commentary:

;;; Code:

(use-package cua-base
  :init
  (set-variable 'cua-enable-cua-keys nil)
  :config
  (cua-mode 1))

(provide '60_cua-mode)
;;; 60_cua-mode.el ends here
