;;; 20_emmet-mode.el --- setup emmet-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/11 14:16:14>
;;

;;; Commentary:

;;; Code:

(use-package emmet-mode
  :if (e:require-package 'emmet-mode nil t)
  :bind
  (:map emmet-mode-keymap
        ("<C-return>" . nil)
        ("C-c C-j" . emmet-expand-line)
        ("C-j" . nil))
  :init
  (set-variable 'emmet-indentation 2))

(provide '20_emmet-mode)
;;; 20_emmet-mode.el ends here
