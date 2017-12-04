;;; 40_yaml-mode.el --- setup yaml-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:23>
;;

;;; Commentary:

;;; Code:

(use-package yaml-mode
  :if (e:require-package 'yaml-mode nil t))

(provide '40_yaml-mode)
;;; 40_yaml-mode.el ends here
