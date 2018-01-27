;;; 20_highlight-symbol.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/28 00:59:49>
;;

;;; Commentary:

;;; Code:

(use-package highlight-symbol
  :diminish highlight-symbol-mode
  :init
  (set-variable 'highlight-symbol-idle-delay 1.5)
  :config
  (add-hook 'prog-mode-hook 'highlight-symbol-mode)
  (add-hook 'prog-mode-hook 'highlight-symbol-nav-mode))

(provide '20_highlight-symbol)
;;; 20_highlight-symbol.el ends here
