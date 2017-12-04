;;; 30_cobol-mode.el --- setup cobol-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:20>
;;

;;; Commentary:

;;; Code:

(use-package cobol-mode
  :mode (("\\.cob\\'" . cobol-mode)
         ("\\.cbl\\'" . cobol-mode)
         ("\\.lst\\'" . cobol-mode)
         ("\\.pco\\'" . cobol-mode)
         ("\\.pcom\\'" . cobol-mode))
  :config
  (use-package column-marker
    :if (e:require-package 'column-marker nil t)
    :init
    (set-variable 'cobol-column-marker-1 6)
    (set-variable 'cobol-column-marker-2 72)))

(provide '30_cobol-mode)
;;; 30_cobol-mode.el ends here
