;;; 20_srefactor.el --- configurations.
;;; Commentary:
;;; Code:

(use-package srefactor
  :after (c++-mode)
  :ensure t
  :config
  (bind-keys
   :map c++-mode-map
   ("M-RET" . srefactor-refactor-at-point)))

(provide '20_srefactor)
;;; 20_srefactor.el ends here
