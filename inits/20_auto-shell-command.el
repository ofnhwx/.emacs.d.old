;;; 20_auto-shell-command.el --- configurations.
;;; Commentary:
;;; Code:

(use-package auto-shell-command
  :if (require 'cl nil t)
  :ensure t
  :demand t
  :init
  (defvar default-mode-line-format nil)
  :config
  (defun ascmd:toggle--display-status ()
    (message "ascmd: %s." (if ascmd:active "enabled" "disabled")))
  (defun ascmd:add-rsync (local server &optional option excludes)
    (let ((exclude (mapconcat 'identity (cl-mapcar (lambda (x) (format "--exclude '%s'" x)) excludes) " ")))
      (ascmd:add `(,local ,(format "rsync %s %s %s %s" (or option "") exclude local server)))))
  (advice-add 'ascmd:toggle :after 'ascmd:toggle--display-status)
  (e:load-local-config "auto-shell-command"))

(provide '20_auto-shell-command)
;;; 20_auto-shell-command.el ends here
