;;; 30_kite.el --- setup kite.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/15 18:10:38>
;;

;;; Commentary:

;;; Code:

(use-package kite
  :config
  ;; とりあえず動かさない
  (kite-stop)
  (remove-hook 'post-command-hook 'kite-handle-post-command))

(provide '30_kite)
;;; 30_kite.el ends here
