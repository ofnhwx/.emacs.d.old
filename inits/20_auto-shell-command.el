;;; 20_auto-shell-command.el --- setup auto-shell-command.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:23>
;;

;;; Commentary:

;;; Code:

(use-package auto-shell-command
  :if (e:require-package 'auto-shell-command nil t)
  :config
  (defun ascmd:toggle--display-status ()
    (message "ascmd: %s." (if ascmd:active "enabled" "disabled")))
  (defun ascmd:add-rsync (local server &optional option)
    (ascmd:add `(,local ,(format "rsync %s %s %s" (or option "") local server))))
  (advice-add 'ascmd:toggle :after 'ascmd:toggle--display-status)
  (e:load-config "auto-shell-command" t))

(provide '20_auto-shell-command)
;;; 20_auto-shell-command.el ends here
