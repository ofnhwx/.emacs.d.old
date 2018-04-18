;;; 20_srefactor.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/18 10:08:35>
;;

;;; Commentary:

;;; Code:

(use-package srefactor
  :after (c++-mode)
  :bind
  (:map c++-mode-map
        ("M-RET" . srefactor-refactor-at-point)))

(provide '20_srefactor)
;;; 20_srefactor.el ends here
