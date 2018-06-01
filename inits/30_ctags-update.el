;;; 30_ctags-update.el --- configurations.
;;; Commentary:
;;; Code:

(e:use-package ctags-update
  (executable-find "ctags")
  :ensure t
  :defer t
  :hook (php-mode . turn-on-ctags-auto-update-mode))

(provide '30_ctags-update)
;;; 30_ctags-update.el ends here
