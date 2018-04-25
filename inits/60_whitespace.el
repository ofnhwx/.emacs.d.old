;;; 60_whitespace.el --- setup whitespace.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/25 10:50:40>
;;

;;; Commentary:

;;; Code:

(use-package whitespace
  :diminish global-whitespace-mode
  :init
  (set-variable
   'whitespace-style
   '(face      ;; 'face'で色を付ける
     trailing  ;; 末尾の空白
     tabs      ;; TAB文字
     newline   ;; 改行文字
     spaces    ;; 空白文字
     space-mark
     tab-mark
     newline-mark))
  (set-variable 'whitespace-space-regexp "\\(\x3000+\\)")
  (set-variable
   'whitespace-display-mappings
   '((space-mark   ?\u3000 [?\u25A1])
     (tab-mark     ?\t     [?\u00BB ?\t])
     (newline-mark ?\n     [?\u21B5 ?\n])))
  :config
  (global-whitespace-mode 1))

(provide '60_whitespace)
;;; 60_whitespace.el ends here
