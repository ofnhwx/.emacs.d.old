;;; 20_edbi.el --- setup edbi.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:23>
;;

;;; Commentary:

;;; Code:

(use-package edbi
  :if (e:require-package 'edbi nil t)
  :init
  (set-variable 'edbi:ds-history-file (e:expand ".edbi-ds-history" :local)))

(provide '20_edbi)
;;; 20_edbi.el ends here
