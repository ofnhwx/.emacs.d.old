;;; 20_stash.el --- configurations.
;;; Commentary:
;;; Code:

(use-package stash
  :ensure t
  :demand t
  :custom
  (stash-directory (e:expand "stashes" :cache))
  :config
  (defstash kill-ring "kill-ring.el" nil (or stashed 'nil)))

(provide '20_stash)
;;; 20_stash.el ends here
