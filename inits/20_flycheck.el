;;; 20_flycheck.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/18 14:47:05>
;;

;;; Commentary:

;;; Code:

(use-package flycheck
  :init
  (set-variable 'flycheck-check-syntax-automatically '(save mode-enabled))
  (set-variable 'flycheck-idle-change-delay 3.0)
  (set-variable 'flycheck-phpcs-standard "PSR2")
  :config
  (global-flycheck-mode t))

(use-package flycheck
  :after (web-mode)
  :config
  (flycheck-add-mode 'html-tidy 'web-mode)
  (flycheck-add-mode 'php       'web-mode))

(use-package flycheck-irony
  :after (flycheck irony)
  :config
  (flycheck-irony-setup))

(use-package flycheck-swift
  :after (flycheck swift-mode))

(provide '20_flycheck)
;;; 20_flycheck.el ends here
