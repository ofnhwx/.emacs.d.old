;;; 40_twittering-mode.el --- setup twittering-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/12 15:20:23>
;;

;;; Commentary:

;;; Code:

(use-package twittering-mode
  :if (e:require-package 'twittering-mode nil t)
  :init
  (set-variable 'twittering-use-master-password t)
  :config
  (e:load-config "twittering-mode" t))

(provide '40_twittering-mode)
;;; 40_twittering-mode.el ends here
