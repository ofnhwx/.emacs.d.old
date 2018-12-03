;;; 30_highlight-symbol.el --- configurations.
;;; Commentary:
;;; Code:

(use-package highlight-symbol
  :ensure t
  :defer t
  :diminish highlight-symbol-mode
  :hook
  ((prog-mode . highlight-symbol-mode)
   (prog-mode . highlight-symbol-nav-mode))
  :custom
  (highlight-symbol-idle-delay 3.0))

(provide '30_highlight-symbol)
;;; 30_highlight-symbol.el ends here
