;;; 20_popwin.el --- setup popwin.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:22:02>
;;

;;; Commentary:

;;; Code:

(use-package popwin
  :if (e:require-package 'popwin)
  :config
  (popwin-mode 1))

(provide '20_popwin)
;;; 20_popwin.el ends here
