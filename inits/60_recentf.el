;;; 60_recentf.el --- setup recentf.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:21>
;;

;;; Commentary:

;;; Code:

(use-package recentf
  :config
  (use-package recentf-ext
    :if (e:require-package 'recentf-ext nil t)))

(provide '60_recentf)
;;; 60_recentf.el ends here
