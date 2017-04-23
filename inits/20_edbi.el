;;; 20_edbi.el --- setup edbi.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 11:50:36>
;;

;;; Commentary:

;;; Code:

(use-package edbi
  :if (e:require-package 'edbi)
  :init
  (custom-set-variables
   '(edbi:ds-history-file (e:expand ".edbi-ds-history" :local))))

(provide '20_edbi)
;;; 20_edbi.el ends here
