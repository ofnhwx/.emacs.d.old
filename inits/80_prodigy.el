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
      :kill-signal 'sigkill))
  (defun prodigy:google-ime-skk ()
    (interactive)
    (let ((service (prodigy-find-service "google-ime-skk")))
      (when service
        (prodigy-start-service service))))
  (prodigy:google-ime-skk))

(use-package prodigy
  :no-require
  :after (navi2ch)
  :config
  (let* ((dir (e:ghq-get-path "2chproxy.pl"))
         (cmd (e:expand "2chproxy.pl"  dir))
         (yml (e:expand "2chproxy.yml" dir)))
    (when (executable-find cmd)
      (prodigy-define-service
        :name "2chproxy"
        :command (format "%s --config %s" cmd yml)
        :tags '(general)
        :kill-signal 'sigkill)))
  (defun prodigy:2chproxy ()
    (interactive)
    (let ((service (prodigy-find-service "2chproxy")))
      (when service
        (prodigy-start-service service)))))

(provide '80_prodigy)
;;; 80_prodigy.el ends here
