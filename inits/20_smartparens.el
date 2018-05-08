;;; 20_smartparens.el --- configurations.
;;; Commentary:
;;; Code:

(use-package smartparens
  :ensure t
  :demand t
  :diminish smartparens-mode
  :config
  (smartparens-global-mode t))

(provide '20_smartparens)
;;; 20_smartparens.el ends here
