;;; 20_which-key.el --- configurations.
;;; Commentary:
;;; Code:

(use-package which-key
  :ensure t
  :demand t
  :diminish which-key-mode
  :custom
  (which-key-sort-order 'which-key-prefix-then-key-order)
  :config
  (which-key-setup-side-window-right-bottom)
  (which-key-mode))

(provide '20_which-key)
;;; 20_which-key.el ends here
