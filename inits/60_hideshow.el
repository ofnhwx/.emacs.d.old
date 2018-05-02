;;; 60_hideshow.el --- configurations.
;;; Commentary:
;;; Code:

(use-package hideshow
  :diminish hs-minor-mode
  :init
  (add-hook 'prog-mode-hook 'hs-minor-mode))

(provide '60_hideshow)
;;; 60_hideshow.el ends here
