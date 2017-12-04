;;; 60_eww.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:50:43>
;;

;;; Commentary:

;;; Code:

(use-package eww
  :bind
  (:map eww-mode-map
        ("o" . ace-link-eww)))

(provide '60_eww)
;;; 60_eww.el ends here
