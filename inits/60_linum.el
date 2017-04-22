;;; 60_linum.el --- setup linum.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/22 23:37:39>
;;

;;; Commentary:

;;; Code:

(use-package linum
  :config
  (use-package hlinum
    :ensure t
    :config
    (hlinum-activate)))

(provide '60_linum)
;;; 60_linum.el ends here
