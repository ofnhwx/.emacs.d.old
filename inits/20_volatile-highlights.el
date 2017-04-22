;;; 20_volatile-highlights.el --- setup volatile-highlights.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/22 23:48:21>
;;

;;; Commentary:

;;; Code:

(use-package volatile-highlights
  :ensure t
  :diminish volatile-highlights-mode
  :config
  (volatile-highlights-mode 1))

(provide '20_volatile-highlights)
;;; 20_volatile-highlights.el ends here
