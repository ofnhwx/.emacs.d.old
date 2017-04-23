;;; 60_recentf.el --- setup recentf.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:07:28>
;;

;;; Commentary:

;;; Code:

(use-package recentf
  :config
  (use-package recentf-ext
    :if (e:require-package 'recentf-ext)))

(provide '60_recentf)
;;; 60_recentf.el ends here
