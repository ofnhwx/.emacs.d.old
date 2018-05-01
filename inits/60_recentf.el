;;; 60_recentf.el --- configurations.
;;; Commentary:
;;; Code:

(use-package recentf
  :init
  (set-variable 'recentf-save-file (e:expand "recentf" :cache))
  (set-variable 'recentf-max-menu-items 20)
  (set-variable 'recentf-max-saved-items 3000)
  (set-variable 'recentf-exclude `("^/[^/:]+:" "\\.howm$" "\\.org$" ,(rx bol (eval (e:get-dir :temp)))))
  (set-variable 'recentf-filename-handlers '(abbreviate-file-name))
  :config
  (run-with-idle-timer 300 t 'recentf-save-list)
  (defadvice recentf-save-list (before recentf-save-list--convert-home activate)
    (let ((list nil))
      (dolist (file (mapcar 'abbreviate-file-name recentf-list))
        (or (member file list)
            (push file list)))
      (setq recentf-list (reverse list))))
  (recentf-mode 1))

(use-package recentf-ext
  :after (recentf)
  :ensure t)

(provide '60_recentf)
;;; 60_recentf.el ends here
