;;; 30_git-complete.el --- configurations.
;;; Commentary:
;;; Code:

(use-package git-complete
  :if (progn (quelpa '(git-complete :fetcher github :repo "zk-phi/git-complete"))
             (locate-library "git-complete"))
  :defer t
  :bind
  (:map base-command-map
        ("C-SPC" . git-complete)))

(provide '30_git-complete)
;;; 30_git-complete.el ends here
