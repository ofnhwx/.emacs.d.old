;;; 60_abbrev.el --- configurations.
;;; Commentary:
;;; Code:

(use-package abbrev
  :diminish abbrev-mode
  :custom
  (abbrev-file-name (e:expand "abbrev.defs" :cache))
  (save-abbrevs t)
  :config
  (when (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file)))

(provide '60_abbrev)
;;; 60_abbrev.el ends here
