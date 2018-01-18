;;; 20_avy.el --- setup avy.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:22>
;;

;;; Commentary:

;;; Code:

(use-package avy
  :if (e:require-package 'avy nil t)
  :config
  (use-package ace-link
    :if (e:require-package 'ace-link nil t)
    :config
    (ace-link-setup-default))
  (use-package ace-window
    :if (e:require-package 'ace-window nil t))
  (use-package avy-zap
    :if (e:require-package 'avy-zap nil t))
  (use-package avy-migemo
    :if (and (executable-find "cmigemo")
             (e:require-package 'avy-migemo nil t))
    :config
    (avy-migemo-mode 1)))

(provide '20_avy)
;;; 20_avy.el ends here
