;;; 40_android-mode.el --- configurations.
;;; Commentary:
;;; Code:

(use-package android-mode
  :ensure t
  :defer t
  :init
  (set-variable 'android-mode-sdk-dir "~/Library/Android/sdk"))

(provide '40_android-mode)
;;; 40_android-mode.el ends here
