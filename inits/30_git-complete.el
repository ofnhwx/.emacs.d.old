;;; 30_git-complete.el --- configurations.
;;; Commentary:
;;; Code:

(use-package git-complete
  :if (progn (quelpa '(git-complete :fetcher github :repo "zk-phi/git-complete"))
             (locate-library "git-complete"))
  :defer t)

(provide '30_git-complete)
;;; 30_git-complete.el ends here
