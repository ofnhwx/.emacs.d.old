;;; 30_tandem.el --- configurations.
;;; Commentary:
;;; Code:

(use-package tandem
  :if (e:ghq-add-load-path "tandem")
  :defer t
  :commands (tandem-host-session
             tandem-join-session
             tandem-show-session
             tandem-kill-session
             tandem-view-agent-log))

(provide '30_tandem)
;;; 30_tandem.el ends here
