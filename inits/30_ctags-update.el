;;; 30_ctags-update.el --- configurations.
;;; Commentary:
;;; Code:

(e:use-package ctags-update
  (executable-find "ctags")
  :ensure t
  :defer t
  :hook (php-mode . ctags-check-and-on)
  :config
  (defun ctags-check-and-on ()
    (interactive)
    (let ((path (file-name-directory buffer-file-name)))
      (while (> (length path) 1)
        (if (file-exists-p (e:expand "TAGS" path))
            (progn (turn-on-ctags-auto-update-mode)
                   (setq path nil))
          (setq path (file-name-directory (directory-file-name path))))))))

(provide '30_ctags-update)
;;; 30_ctags-update.el ends here
