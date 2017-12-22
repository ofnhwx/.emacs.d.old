;;; 20_selected.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/22 15:31:03>
;;

;;; Commentary:

;;; Code:

(use-package selected
  :if (e:require-package 'selected nil t)
  :bind
  (:map selected-keymap
        ("=" . count-words-region)
        ("?" . helm-selected)
        ("d" . downcase-region)
        ("q" . selected-off)
        ("u" . upcase-region))
  :init
  (with-eval-after-load "helm"
    (e:require 'helm-selected t))
  :config
  (selected-global-mode))

(provide '20_selected)
;;; 20_selected.el ends here
