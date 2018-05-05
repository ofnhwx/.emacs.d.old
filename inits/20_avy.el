;;; 20_avy.el --- configurations.
;;; Commentary:
;;; Code:

(use-package avy
  :ensure t)

(use-package ace-link
  :after (avy)
  :ensure t
  :config
  (ace-link-setup-default))

(use-package ace-window
  :after (avy)
  :ensure t
  :defer t)

(use-package avy-migemo
  :after (avy migemo)
  :ensure t
  :config
  (avy-migemo-mode 1))

(use-package avy-zap
  :after (avy)
  :ensure t
  :ensure t)

(provide '20_avy)
;;; 20_avy.el ends here
