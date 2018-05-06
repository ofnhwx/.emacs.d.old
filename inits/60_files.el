;;; 60_files.el --- configurations.
;;; Commentary:
;;; Code:

(use-package files
  :init
  (defconst backup-directory (e:expand "backup" :cache))
  ;; backup
  (let ((item (cons "\\.*$" backup-directory)))
    (unless (member item backup-directory-alist)
      (cl-pushnew item backup-directory-alist)))
  (set-variable 'make-backup-files   t)
  (set-variable 'backup-by-copying   t)
  (set-variable 'version-control     t)
  (set-variable 'delete-old-versions t)
  (set-variable 'kept-new-versions   3)
  (set-variable 'kept-old-versions   3)
  ;; auto-save
  (set-variable 'auto-save-default t)
  (set-variable 'auto-save-list-file-prefix (file-name-as-directory backup-directory))
  (set-variable 'auto-save-file-name-transforms `((".*" ,backup-directory t))))

(use-package auto-save-buffers-enhanced
  :after (files)
  :ensure t
  :custom
  (auto-save-buffers-enhanced-quiet-save-p t)
  (auto-save-buffers-enhanced-interval 3)
  (auto-save-buffers-enhanced-save-scratch-buffer-to-file-p t)
  (auto-save-buffers-enhanced-file-related-with-scratch-buffer (e:expand "scratch" :cache))
  :config
  (auto-save-buffers-enhanced t))

(provide '60_files)
;;; 60_files.el ends here
