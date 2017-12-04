;;; 60_eshell.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:40:51>
;;

;;; Commentary:

;;; Code:

(use-package eshell
  :bind
  (:map eshell-mode-map
        ("M-p" . helm-eshell-history)
        ("M-n" . helm-esh-pcomplete)))

(provide '60_eshell)
;;; 60_eshell.el ends here
