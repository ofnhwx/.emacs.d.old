;;; 40_java.el.el --- configurations.
;;; Commentary:
;;; Code:

(use-package android-mode
  :ensure t
  :defer t
  :custom
  (android-mode-sdk-dir "~/Library/Android/sdk"))

(use-package meghanada
  :ensure t
  :defer t
  :custom
  (meghanada-server-install-dir (e:expand "meghanada" :cache))
  :config
  (meghanada-company-enable)
  (meghanada-eldoc-enable))

(provide '40_java.el)
;;; 40_java.el.el ends here
