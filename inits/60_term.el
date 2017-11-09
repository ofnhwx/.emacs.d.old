;;; 60_term.el --- setup term.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:07:11>
;;

;;; Commentary:

;;; Code:

(use-package term
  :config
  (use-package term+
    :if (e:require-package 'term+))
  (use-package term+mux
    :if (e:require-package 'term+mux)))

(provide '60_term)
;;; 60_term.el ends here
