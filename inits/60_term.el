;;; 60_term.el --- setup term.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/03/29 15:25:03>
;;

;;; Commentary:

;;; Code:

(use-package term+
  :after (term)
  :bind
  (:map term+char-map
        ("C-^" . nil)
        ("C-z" . nil)))

(use-package term+mux
  :after (term+))

(provide '60_term)
;;; 60_term.el ends here
