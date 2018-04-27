;;; 20_undo-tree.el --- configurations.
;;; Commentary:
;;; Code:

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode))

(provide '20_undo-tree)
;;; 20_undo-tree.el ends here
