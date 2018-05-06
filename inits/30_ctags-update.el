;;; 20_ctags-update.el --- configurations.
;;; Commentary:
;;; Code:

(e:use-package ctags-update
  (executable-find "ctags")
  :ensure t
  :defer t
  :hook (php-mode-hook . turn-on-ctags-auto-update-mode))

(provide '20_ctags-update)
;;; 20_ctags-update.el ends here
