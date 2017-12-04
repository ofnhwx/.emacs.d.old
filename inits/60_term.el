;;; 60_term.el --- setup term.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:49:41>
;;

;;; Commentary:

;;; Code:

(use-package term
  :config
  (use-package term+
    :if (e:require-package 'term+ nil t)
    :bind
    (:map term+char-map
          ("C-^" . nil)
          ("C-z" . nil)))
  (use-package term+mux
    :if (e:require-package 'term+mux nil t)))

(provide '60_term)
;;; 60_term.el ends here
