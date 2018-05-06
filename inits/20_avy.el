;;; 20_avy.el --- configurations.
;;; Commentary:
;;; Code:

(use-package avy
  :ensure t
  :defer t)

(use-package ace-link
  :ensure t
  :config
  (ace-link-setup-default))

(use-package ace-window
  :ensure t
  :defer t)

(e:use-package avy-migemo
  (executable-find "cmigemo")
  :after (avy migemo)
  :ensure t
  :config
  (avy-migemo-mode 1))

(use-package avy-zap
  :ensure t
  :defer t)

(provide '20_avy)
;;; 20_avy.el ends here
