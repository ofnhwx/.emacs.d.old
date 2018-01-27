;;; 20_edbi.el --- setup edbi.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/28 01:20:34>
;;

;;; Commentary:

;;; Code:

(use-package edbi
  :init
  (set-variable 'edbi:ds-history-file (e:expand "edbi-ds-history" :cache)))

(provide '20_edbi)
;;; 20_edbi.el ends here
