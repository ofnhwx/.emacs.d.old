;;; 20_psysh.el --- setup psysh.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:18:30>
;;

;;; Commentary:

;;; Code:

(use-package psysh
  :if (and (executable-find "psysh")
           (e:require-package 'psysh)))

(provide '20_psysh)
;;; 20_psysh.el ends here
