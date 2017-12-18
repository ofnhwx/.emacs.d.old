;;; 60_isearch.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/18 11:13:22>
;;

;;; Commentary:

;;; Code:

(use-package isearch
  :bind
  (:map isearch-mode-map
        ("C-i" . avy-isearch)
        ("C-o" . helm-swoop-from-isearch)))

(provide '60_isearch)
;;; 60_isearch.el ends here
