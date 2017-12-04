;;; 60_dired.el --- setup dired.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:48:52>
;;

;;; Commentary:

;;; Code:

(use-package dired
  :bind
  (:map dired-mode-map
        ("r" . wdired-change-to-wdired-mode))
  :config
  (use-package dired+
    :if (e:require-package 'dired+ nil t)))

(provide '60_dired)
;;; 60_dired.el ends here
