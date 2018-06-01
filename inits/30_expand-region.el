;;; 30_expand-region.el --- configurations.
;;; Commentary:
;;; Code:

(use-package expand-region
  :ensure t
  :defer t
  :bind
  (:map global-map
        ("C-<" . er/contract-region)
        ("C->" . er/expand-region)))

(provide '30_expand-region)
;;; 30_expand-region.el ends here
