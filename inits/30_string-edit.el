;;; 30_string-edit.el --- configurations.
;;; Commentary:
;;; Code:

(use-package string-edit
  :ensure t
  :defer t
  :bind
  (:map general-command-map
        ("e" . string-edit-at-point)))

(provide '30_string-edit)
;;; 30_string-edit.el ends here
