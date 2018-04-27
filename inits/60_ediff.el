;;; 60_ediff.el --- configurations.
;;; Commentary:
;;; Code:

(use-package ediff
  :init
  (set-variable 'ediff-window-setup-function 'ediff-setup-windows-plain)
  (set-variable 'ediff-split-window-function 'split-window-horizontally))

(provide '60_ediff)
;;; 60_ediff.el ends here
