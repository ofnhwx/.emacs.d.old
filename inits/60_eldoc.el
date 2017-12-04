;;; 60_eldoc.el --- setup eldoc.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:21>
;;

;;; Commentary:

;;; Code:

(use-package eldoc
  :diminish eldoc-mode
  :config
  (use-package eldoc-extension
    :if (e:require-package 'eldoc-extension nil t)))

(provide '60_eldoc)
;;; 60_eldoc.el ends here
