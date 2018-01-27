;;; 20_avy.el --- setup avy.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/28 00:49:05>
;;

;;; Commentary:

;;; Code:

(use-package avy)

(use-package ace-link
  :after (avy)
  :config
  (ace-link-setup-default))

(use-package ace-window
  :after (avy))

(use-package avy-migemo
  :after (avy migemo)
  :config
  (avy-migemo-mode 1))

(use-package avy-zap
  :after (avy))

(provide '20_avy)
;;; 20_avy.el ends here
