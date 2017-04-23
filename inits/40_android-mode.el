;;; 40_android-mode.el --- setup android-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:13:35>
;;

;;; Commentary:

;;; Code:

(use-package android-mode
  :if (e:require-package 'android-mode)
  :init
  (custom-set-variables
   '(android-mode-sdk-dir "~/Library/Android/sdk")))

(provide '40_android-mode)
;;; 40_android-mode.el ends here
