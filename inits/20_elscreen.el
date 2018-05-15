;;; 20_elscreen.el --- configurations.
;;; Commentary:
;;; Code:

(use-package elscreen
  :ensure t
  :demand t
  :custom
  (elscreen-display-tab nil)
  (elscreen-prefix-key (kbd "C-z"))
  (elscreen-tab-display-kill-screen nil)
  :config
  (elscreen-start))

(provide '20_elscreen)
;;; 20_elscreen.el ends here
