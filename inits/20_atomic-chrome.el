;;; 20_atomic-chrome.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/13 11:35:56>
;;

;;; Commentary:

;;; Code:

(use-package atomic-chrome
  :if (e:require-package 'atomic-chrome nil t)
  :config
  (atomic-chrome-start-server))

(provide '20_atomic-chrome)
;;; 20_atomic-chrome.el ends here
