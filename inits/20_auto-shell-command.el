;;; 20_auto-shell-command.el --- setup auto-shell-command.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/25 10:11:42>
;;

;;; Commentary:

;;; Code:

(use-package auto-shell-command
  :if (e:require-package 'auto-shell-command nil t)
  :config
  (defun ascmd:toggle--display-status ()
    (message "ascmd: %s." (if ascmd:active "enabled" "disabled")))
  (defun ascmd:add-rsync (local server &optional option excludes)
    (let ((exclude (mapconcat 'identity (cl-mapcar (lambda (x) (format "--exclude '%s'" x)) excludes) " ")))
      (ascmd:add `(,local ,(format "rsync %s %s %s %s" (or option "") exclude local server)))))
  (advice-add 'ascmd:toggle :after 'ascmd:toggle--display-status)
  (e:load-config "auto-shell-command" t))

(provide '20_auto-shell-command)
;;; 20_auto-shell-command.el ends here
