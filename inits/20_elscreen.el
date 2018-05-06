;;; 20_elscreen.el --- configurations.
;;; Commentary:
;;; Code:

(use-package elscreen
  :ensure t
  :custom
  (elscreen-prefix-key (kbd "C-z"))
  (elscreen-tab-display-kill-screen nil)
  :config
  (elscreen-start))

(provide '20_elscreen)
;;; 20_elscreen.el ends here
