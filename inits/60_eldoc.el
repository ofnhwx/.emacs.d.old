;;; 60_eldoc.el --- setup eldoc.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/22 23:36:48>
;;

;;; Commentary:

;;; Code:

(use-package eldoc
  :diminish eldoc-mode
  :config
  (use-package eldoc-extension
    :ensure t))

(provide '60_eldoc)
;;; 60_eldoc.el ends here
