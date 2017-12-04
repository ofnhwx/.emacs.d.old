;;; 60_isearch.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:48:38>
;;

;;; Commentary:

;;; Code:

(use-package isearch
  :bind
  (:map isearch-mode-map
        ("C-o" . helm-swoop-from-isearch)))

(provide '60_isearch)
;;; 60_isearch.el ends here
