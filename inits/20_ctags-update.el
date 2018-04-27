;;; 20_ctags-update.el --- configurations.
;;; Commentary:
;;; Code:

(use-package ctags-update
  :preface (executable-find "ctags")
  :after (php-mode)
  :ensure t
  :config
  (add-hook 'php-mode-hook 'turn-on-ctags-auto-update-mode))

(provide '20_ctags-update)
;;; 20_ctags-update.el ends here
