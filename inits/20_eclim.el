;;; 20_eclim.el --- setup eclim.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 11:50:15>
;;

;;; Commentary:

;;; Code:

(use-package eclim
  :if (e:require-package 'eclim)
  :config
  (global-eclim-mode))

(provide '20_eclim)
;;; 20_eclim.el ends here
