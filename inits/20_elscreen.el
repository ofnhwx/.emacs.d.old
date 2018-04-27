;;; 20_elscreen.el --- configurations.
;;; Commentary:
;;; Code:

(use-package elscreen
  :ensure t
  :init
  (set-variable 'elscreen-prefix-key (kbd "C-z"))
  (set-variable 'elscreen-tab-display-kill-screen nil)
  :config
  (elscreen-start))

(provide '20_elscreen)
;;; 20_elscreen.el ends here
