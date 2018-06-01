;;; 30_visual-regexp.el --- configurations.
;;; Commentary:
;;; Code:

(use-package visual-regexp
  :ensure t
  :defer t
  :bind
  (:map global-map
        ("M-%" . vr/query-replace)))

(provide '30_visual-regexp)
;;; 30_visual-regexp.el ends here
