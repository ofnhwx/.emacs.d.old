;;; 40_twittering-mode.el --- setup twittering-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/28 01:18:37>
;;

;;; Commentary:

;;; Code:

(use-package twittering-mode
  :init
  (set-variable 'twittering-use-master-password t)
  :config
  (e:load-local-config "twittering-mode"))

(provide '40_twittering-mode)
;;; 40_twittering-mode.el ends here
