;;; 30_flycheck.el --- configurations.
;;; Commentary:
;;; Code:

(use-package flycheck
  :ensure t
  :defer t
  :hook ((prog-mode . flycheck-mode)
         (flycheck-mode . flycheck-set-check-syntax-automatically))
  :custom
  (flycheck-mode-line-prefix "FC")
  (flycheck-check-syntax-automatically '(save idle-change new-line mode-enabled))
  (flycheck-idle-change-delay 3.0)
  (flycheck-phpcs-standard "PSR2")
  :config
  (defun flycheck-set-check-syntax-automatically ()
    (when (member major-mode '(c++-mode))
      ;; 常にチェックすると遅いので特定の(遅くなりそうな)モードでは設定を変更する
      (make-local-variable 'flycheck-check-syntax-automatically)
      (set-variable 'flycheck-check-syntax-automatically '(save mode-enabled)))))

(use-package flycheck
  :no-require t
  :after (web-mode)
  :config
  (flycheck-add-mode 'html-tidy 'web-mode)
  (flycheck-add-mode 'php       'web-mode))

(use-package flycheck-irony
  :after (irony)
  :ensure t
  :config
  (flycheck-irony-setup))

(use-package flycheck-swift
  :after (swift-mode)
  :ensure t
  :config
  (flycheck-swift-setup))

(provide '30_flycheck)
;;; 30_flycheck.el ends here
