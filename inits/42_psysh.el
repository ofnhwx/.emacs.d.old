;;; 20_psysh.el --- setup psysh.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:21>
;;

;;; Commentary:

;;; Code:

(use-package psysh
  :if (and (executable-find "psysh")
           (e:require-package 'psysh nil t)))

(provide '20_psysh)
;;; 20_psysh.el ends here
