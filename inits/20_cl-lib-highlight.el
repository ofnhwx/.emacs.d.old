;;; 20_cl-lib-highlight.el --- configurations.
;;; Commentary:
;;; Code:

(use-package cl-lib-highlight
  :ensure t
  :config
  (cl-lib-highlight-initialize)
  (cl-lib-highlight-warn-cl-initialize))

(provide '20_cl-lib-highlight)
;;; 20_cl-lib-highlight.el ends here
