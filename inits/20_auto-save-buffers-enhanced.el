;;; 20_auto-save-buffers-enhanced.el --- setup auto-save-buffers-enhanced.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 10:42:42>
;;

;;; Commentary:

;;; Code:

(use-package auto-save-buffers-enhanced
  :if (e:require-package 'auto-save-buffers-enhanced)
  :init
  (custom-set-variables
   '(auto-save-buffers-enhanced-quiet-save-p t)
   '(auto-save-buffers-enhanced-interval 3)
   ;; for `*scratch*'
   '(auto-save-buffers-enhanced-save-scratch-buffer-to-file-p t)
   '(auto-save-buffers-enhanced-file-related-with-scratch-buffer
     (e:expand ".scratch" :local)))
  :config
  (auto-save-buffers-enhanced t))

(provide '20_auto-save-buffers-enhanced)
;;; 20_auto-save-buffers-enhanced.el ends here
