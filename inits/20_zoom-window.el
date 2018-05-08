;;; 20_zoom-window.el --- configurations.
;;; Commentary:
;;; Code:

(use-package zoom-window
  :ensure t
  :demand t
  :after (elscreen)
  :bind
  (:map ctl-x-map
        ("!" . zoom-window-zoom))
  :custom
  (zoom-window-use-elscreen t)
  (zoom-window-mode-line-color "purple")
  :config
  (zoom-window-setup))

(provide '20_zoom-window)
;;; 20_zoom-window.el ends here
