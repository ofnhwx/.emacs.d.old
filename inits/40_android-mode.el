;;; 40_android-mode.el --- setup android-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/24 11:49:32>
;;

;;; Commentary:

;;; Code:

(use-package android-mode
  :if (e:require-package 'android-mode)
  :init
  (set-variable 'android-mode-sdk-dir "~/Library/Android/sdk"))

(provide '40_android-mode)
;;; 40_android-mode.el ends here
