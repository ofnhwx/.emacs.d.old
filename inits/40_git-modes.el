;;; 40_git-modes.el --- configurations.
;;; Commentary:
;;; Code:

(use-package gitattributes-mode
  :ensure t
  :commands (gitattributes-mode))

(use-package gitconfig-mode
  :ensure t
  :commands (gitconfig-mode))

(use-package gitignore-mode
  :ensure t
  :commands (gitignore-mode))

(provide '40_git-modes)
;;; 40_git-modes.el ends here
