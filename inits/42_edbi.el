;;; 20_edbi.el --- setup edbi.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/17 16:31:18>
;;

;;; Commentary:

;;; Code:

(use-package edbi
  :if (e:require-package 'edbi nil t)
  :init
  (set-variable 'edbi:ds-history-file (e:expand ".edbi-ds-history" :cache)))

(provide '20_edbi)
;;; 20_edbi.el ends here
