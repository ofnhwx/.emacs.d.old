;;; 80_prodigy.el --- configurations.
;;; Commentary:
;;; Code:

(use-package prodigy
  :ensure t
  :config
  (when (executable-find "google-ime-skk")
    (prodigy-define-service
      :name "google-ime-skk"
      :command "google-ime-skk"
      :tags '(general)
      :kill-signal 'sigkill)
    (prodigy-start-service (prodigy-find-service "google-ime-skk"))))

(provide '80_prodigy)
;;; 80_prodigy.el ends here
