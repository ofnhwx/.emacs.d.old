;;; 20_auto-shell-command.el --- setup auto-shell-command.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 10:43:27>
;;

;;; Commentary:

;;; Code:

(use-package auto-shell-command
  :if (e:require-package 'auto-shell-command)
  :config
  (defun ascmd:toggle--display-status ()
    (message "ascmd: %s." (if ascmd:active "enabled" "disabled")))
  (advice-add 'ascmd:toggle :after 'ascmd:toggle--display-status)
  (e:load-config "auto-shell-command" t))

(provide '20_auto-shell-command)
;;; 20_auto-shell-command.el ends here
