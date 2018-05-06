;;; 20_flycheck.el --- configurations.
;;; Commentary:
;;; Code:

(use-package flycheck
  :ensure t
  :defer t
  :hook (prog-mode . flycheck-mode)
  :custom
  (flycheck-mode-line-prefix "FC")
  (flycheck-check-syntax-automatically '(save mode-enabled))
  (flycheck-idle-change-delay 3.0)
  (flycheck-phpcs-standard "PSR2"))

(use-package flycheck
  :no-require t
  :after (web-mode)
  :config
  (flycheck-add-mode 'html-tidy 'web-mode)
  (flycheck-add-mode 'php       'web-mode))

(use-package flycheck-irony
  :after (flycheck irony)
  :ensure t
  :config
  (flycheck-irony-setup))

(use-package flycheck-swift
  :after (flycheck swift-mode)
  :ensure t
  :config
  (flycheck-swift-setup))

(provide '20_flycheck)
;;; 20_flycheck.el ends here
