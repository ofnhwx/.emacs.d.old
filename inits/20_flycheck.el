;;; 20_flycheck.el --- configurations.
;;; Commentary:
;;; Code:

(use-package flycheck
  :ensure t
  :defer t
  :init
  (set-variable 'flycheck-mode-line-prefix "FC")
  (set-variable 'flycheck-check-syntax-automatically '(save mode-enabled))
  (set-variable 'flycheck-idle-change-delay 3.0)
  (set-variable 'flycheck-phpcs-standard "PSR2")
  (add-hook 'prog-mode-hook 'flycheck-mode))

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
  :ensure t)

(provide '20_flycheck)
;;; 20_flycheck.el ends here
