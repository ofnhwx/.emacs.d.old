;;; 20_rainbow-mode.el --- setup rainbow-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/28 01:10:47>
;;

;;; Commentary:

;;; Code:

(use-package rainbow-mode
  :diminish rainbow-mode
  :init
  (add-hook 'lisp-interaction-mode-hook 'rainbow-mode)
  (add-hook 'emacs-lisp-mode-hook       'rainbow-mode)
  (add-hook 'html-mode-hook             'rainbow-mode)
  (add-hook 'css-mode-hook              'rainbow-mode))

(provide '20_rainbow-mode)
;;; 20_rainbow-mode.el ends here
