;;; 20_rainbow-mode.el --- setup rainbow-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/09/10 15:58:52>
;;

;;; Commentary:

;;; Code:

(use-package rainbow-mode
  :if (e:require-package 'rainbow-mode)
  :diminish rainbow-mode)

(provide '20_rainbow-mode)
;;; 20_rainbow-mode.el ends here
