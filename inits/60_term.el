;;; 60_term.el --- setup term.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/22 23:47:25>
;;

;;; Commentary:

;;; Code:

(use-package term
  :config
  (use-package term+    :ensure t)
  (use-package term+mux :ensure t))

(provide '60_term)
;;; 60_term.el ends here
