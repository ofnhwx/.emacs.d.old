;;; 20_popwin.el --- setup popwin.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:20>
;;

;;; Commentary:

;;; Code:

(use-package popwin
  :if (e:require-package 'popwin nil t)
  :config
  (popwin-mode 1))

(provide '20_popwin)
;;; 20_popwin.el ends here
