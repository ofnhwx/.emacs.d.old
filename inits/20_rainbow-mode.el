;;; 20_rainbow-mode.el --- setup rainbow-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/11/29 11:17:39>
;;

;;; Commentary:

;;; Code:

(use-package rainbow-mode
  :if (e:require-package 'rainbow-mode)
  :diminish rainbow-mode
  :init
  (add-hook 'lisp-interaction-mode-hook 'rainbow-mode)
  (add-hook 'emacs-lisp-mode-hook       'rainbow-mode)
  (add-hook 'html-mode-hook             'rainbow-mode)
  (add-hook 'css-mode-hook              'rainbow-mode))

(provide '20_rainbow-mode)
;;; 20_rainbow-mode.el ends here
