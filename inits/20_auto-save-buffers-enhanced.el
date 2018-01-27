;;; 20_auto-save-buffers-enhanced.el --- setup auto-save-buffers-enhanced.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/28 00:43:09>
;;

;;; Commentary:

;;; Code:

(use-package auto-save-buffers-enhanced
  :init
  (set-variable 'auto-save-buffers-enhanced-quiet-save-p t)
  (set-variable 'auto-save-buffers-enhanced-interval 3)
   ;; for `*scratch*'
  (set-variable 'auto-save-buffers-enhanced-save-scratch-buffer-to-file-p t)
  (set-variable 'auto-save-buffers-enhanced-file-related-with-scratch-buffer (e:expand ".scratch" :cache))
  :config
  (auto-save-buffers-enhanced t))

(provide '20_auto-save-buffers-enhanced)
;;; 20_auto-save-buffers-enhanced.el ends here
