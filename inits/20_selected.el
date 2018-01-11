;;; 20_selected.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/10 16:18:57>
;;

;;; Commentary:

;;; Code:

(use-package selected
  :if (e:require-package 'selected nil t)
  :diminish selected-minor-mode
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
