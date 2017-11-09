;;; 20_avy.el --- setup avy.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 10:45:26>
;;

;;; Commentary:

;;; Code:

(use-package avy
  :if (e:require-package 'avy)
  :config
  (use-package ace-link
    :if (e:require-package 'ace-link)
    :config
    (ace-link-setup-default))
  (use-package ace-window
    :if (e:require-package 'ace-window))
  (use-package avy-zap
    :if (e:require-package 'avy-zap))
  (use-package avy-migemo
    :if (and (executable-find "cmigemo")
             (e:require-package 'avy-migemo))
    :config
    (avy-migemo-mode 1)))

(provide '20_avy)
;;; 20_avy.el ends here
