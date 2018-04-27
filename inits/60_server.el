;;; 60_server.el --- configurations.
;;; Commentary:
;;; Code:

(use-package server
  :init
  (set-variable 'server-auth-dir (e:expand "server" :cache))
  :config
  (when window-system
    (add-hook 'after-init-hook 'server-start)))

(provide '60_server)
;;; 60_server.el ends here
