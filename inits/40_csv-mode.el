;;; 40_csv-mode.el --- setup csv-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:22>
;;

;;; Commentary:

;;; Code:

(use-package csv-mode
  :if (e:require-package 'csv-mode nil t))

(provide '40_csv-mode)
;;; 40_csv-mode.el ends here
