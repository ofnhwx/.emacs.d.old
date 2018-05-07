;;; 20_zoom-window.el --- configurations.
;;; Commentary:
;;; Code:

(use-package zoom-window
  :ensure t
  :after (elscreen)
  :custom
  (zoom-window-use-elscreen t)
  (zoom-window-mode-line-color "purple")
  :config
  (zoom-window-setup))

(provide '20_zoom-window)
;;; 20_zoom-window.el ends here
