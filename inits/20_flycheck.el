;;; 20_flycheck.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/03/29 15:47:26>
;;

;;; Commentary:

;;; Code:

(use-package flycheck
  :init
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
