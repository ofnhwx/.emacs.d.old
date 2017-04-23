;;; 60_eldoc.el --- setup eldoc.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:09:30>
;;

;;; Commentary:

;;; Code:

(use-package eldoc
  :diminish eldoc-mode
  :config
  (use-package eldoc-extension
    :if (e:require-package 'eldoc-extension)))

(provide '60_eldoc)
;;; 60_eldoc.el ends here
