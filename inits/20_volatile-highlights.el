;;; 20_volatile-highlights.el --- setup volatile-highlights.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:16:04>
;;

;;; Commentary:

;;; Code:

(use-package volatile-highlights
  :if (e:require-package 'volatile-highlights)
  :diminish volatile-highlights-mode
  :config
  (volatile-highlights-mode 1))

(provide '20_volatile-highlights)
;;; 20_volatile-highlights.el ends here
