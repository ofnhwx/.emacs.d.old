;;; 20_stash.el --- configurations.
;;; Commentary:
;;; Code:

(use-package stash
  :ensure t
  :custom
  (stash-directory (e:expand "stashes" :cache))
  :config
  (defstashapp app 60)
  (defstash kill-ring "kill-ring.el" app (or stashed 'nil)))

(provide '20_stash)
;;; 20_stash.el ends here
