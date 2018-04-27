;;; 20_shell-pop.el --- configurations.
;;; Commentary:
;;; Code:

(use-package shell-pop
  :ensure t
  :init
  (set-variable 'shell-pop-shell-type '("eshell" "*pop:eshell*" (lambda () (eshell))))
  (set-variable 'shell-pop-window-position "bottom")
  (set-variable 'shell-pop-window-size 50)
  (set-variable 'shell-pop-full-span t))

(provide '20_shell-pop)
;;; 20_shell-pop.el ends here
