;;; 30_cobol-mode.el --- setup cobol-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/22 23:56:41>
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
    :ensure t)
  (custom-set-variables
   '(cobol-column-marker-1 6)
   '(cobol-column-marker-2 72)))

(provide '30_cobol-mode)
;;; 30_cobol-mode.el ends here
