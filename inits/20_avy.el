;;; 20_avy.el --- setup avy.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/22 23:58:41>
;;

;;; Commentary:

;;; Code:

(use-package avy
  :ensure t
  :config
  (use-package ace-link
    :ensure t
    :config
    (ace-link-setup-default))
  (use-package ace-window
    :ensure t)
  (use-package avy-zap
    :ensure t)
  (use-package avy-migemo
    :if (executable-find "cmigemo")
    :init
    (e:require-package 'avy-migemo)
    :config
    (avy-migemo-mode 1)))

(provide '20_avy)
;;; 20_avy.el ends here
