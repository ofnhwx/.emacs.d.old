;;; 30_shell-pop.el --- configurations.
;;; Commentary:
;;; Code:

(use-package shell-pop
  :ensure t
  :defer t
  :custom
  (shell-pop-shell-type '("eshell" "*pop:eshell*" (lambda () (eshell))))
  (shell-pop-window-position "bottom")
  (shell-pop-window-size 50)
  (shell-pop-full-span t))

(provide '30_shell-pop)
;;; 30_shell-pop.el ends here
