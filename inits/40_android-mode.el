;;; 40_android-mode.el --- setup android-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/28 01:16:57>
;;

;;; Commentary:

;;; Code:

(use-package android-mode
  :init
  (set-variable 'android-mode-sdk-dir "~/Library/Android/sdk"))

(provide '40_android-mode)
;;; 40_android-mode.el ends here
