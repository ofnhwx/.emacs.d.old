;;; 20_rainbow-mode.el --- setup rainbow-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/03/29 15:35:56>
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

(use-package rainbow-mode
  :after (php-mode)
  :config
  (add-hook 'php-mode-hook 'rainbow-mode))

(use-package rainbow-mode
  :after (web-mode)
  :config
  (add-hook 'web-mode-hook 'rainbow-mode))

(provide '20_rainbow-mode)
;;; 20_rainbow-mode.el ends here
