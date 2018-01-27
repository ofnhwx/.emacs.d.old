;;; 60_eldoc.el --- setup eldoc.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/28 01:22:23>
;;

;;; Commentary:

;;; Code:

(use-package eldoc
  :diminish eldoc-mode)

(use-package eldoc-extension
  :after (eldoc))

(provide '60_eldoc)
;;; 60_eldoc.el ends here
