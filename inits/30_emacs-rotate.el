;;; 30_emacs-rotate.el --- configurations.
;;; Commentary:
;;; Code:

(use-package emacs-rotate
  :if (progn (quelpa '(rotate :fetcher github :repo "daichirata/emacs-rotate"))
             (locate-library "rotate"))
  :defer t)

(provide '30_emacs-rotate)
;;; 30_emacs-rotate.el ends here
