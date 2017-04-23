;;; 00_template.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 11:52:31>
;;

;;; Commentary:

;;; Code:

(use-package flycheck
  :if (e:require-package 'flycheck)
  :init
  (custom-set-variables
   '(global-flycheck-mode t)))

(provide '00_template)
;;; 00_template.el ends here
