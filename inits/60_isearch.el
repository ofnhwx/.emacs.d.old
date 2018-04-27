;;; 60_isearch.el --- configurations.
;;; Commentary:
;;; Code:

(use-package isearch
  :config
  (bind-keys
   :map isearch-mode-map
   ("C-i" . avy-isearch)
   ("C-o" . helm-swoop-from-isearch)))

(provide '60_isearch)
;;; 60_isearch.el ends here
