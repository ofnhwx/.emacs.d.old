;;; 60_cua-mode.el --- configurations.
;;; Commentary:
;;; Code:

(use-package cua-base
  :init
  (set-variable 'cua-enable-cua-keys nil)
  :config
  (cua-mode 1))

(provide '60_cua-mode)
;;; 60_cua-mode.el ends here
