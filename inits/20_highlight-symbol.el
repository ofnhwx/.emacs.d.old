;;; 20_highlight-symbol.el --- configurations.
;;; Commentary:
;;; Code:

(use-package highlight-symbol
  :ensure t
  :diminish highlight-symbol-mode
  :init
  (set-variable 'highlight-symbol-idle-delay 3.0)
  :config
  (add-hook 'prog-mode-hook 'highlight-symbol-mode)
  (add-hook 'prog-mode-hook 'highlight-symbol-nav-mode))

(provide '20_highlight-symbol)
;;; 20_highlight-symbol.el ends here
