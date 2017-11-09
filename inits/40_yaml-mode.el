;;; 40_yaml-mode.el --- setup yaml-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:10:36>
;;

;;; Commentary:

;;; Code:

(use-package yaml-mode
  :if (e:require-package 'yaml-mode))

(provide '40_yaml-mode)
;;; 40_yaml-mode.el ends here
