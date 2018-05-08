;;; 20_visual-regexp.el --- configurations.
;;; Commentary:
;;; Code:

(use-package visual-regexp
  :ensure t
  :defer t
  :bind
  (:map global-map
        ("M-%" . vr/query-replace)))

(provide '20_visual-regexp)
;;; 20_visual-regexp.el ends here
