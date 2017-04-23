;;; 40_twittering-mode.el --- setup twittering-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:12:01>
;;

;;; Commentary:

;;; Code:

(use-package twittering-mode
  :if (e:require-package 'twittering-mode)
  :init
  (custom-set-variables
   '(twittering-use-master-password t)))

(provide '40_twittering-mode)
;;; 40_twittering-mode.el ends here
