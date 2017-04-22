;;; 20_edbi.el --- setup edbi.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 00:57:08>
;;

;;; Commentary:

;;; Code:

(use-package edbi
  :ensure t
  :config
  (custom-set-variables
   '(edbi:ds-history-file (e:expand ".edbi-ds-history" :local))))

(provide '20_edbi)
;;; 20_edbi.el ends here
