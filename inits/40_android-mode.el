;;; 40_android-mode.el --- setup android-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 00:48:46>
;;

;;; Commentary:

;;; Code:

(use-package android-mode
  :ensure t
  :config
  (custom-set-variables
   '(android-mode-sdk-dir "~/Library/Android/sdk")))

(provide '40_android-mode)
;;; 40_android-mode.el ends here
