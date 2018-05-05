;;; 20_ctags-update.el --- configurations.
;;; Commentary:
;;; Code:

(use-package ctags-update
  :if (executable-find "ctags")
  :after (php-mode)
  :ensure t
  :defer t
  :init
  (add-hook 'php-mode-hook 'turn-on-ctags-auto-update-mode))

(provide '20_ctags-update)
;;; 20_ctags-update.el ends here
