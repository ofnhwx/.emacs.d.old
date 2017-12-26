;;; 60_eww.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/22 18:30:25>
;;

;;; Commentary:

;;; Code:

(use-package eww
  :bind
  (:map eww-mode-map
        ("[" . eww-enable-images)
        ("]" . eww-disable-images)
        ("o" . ace-link-eww))
  :config
  (defun eww-disable-images ()
    "ewwで画像表示させない"
    (interactive)
    (setq-local shr-put-image-function 'shr-put-image-alt)
    (eww-reload))
  (defun eww-enable-images ()
    "ewwで画像表示させる"
    (interactive)
    (setq-local shr-put-image-function 'shr-put-image)
    (eww-reload))
  (defun shr-put-image-alt (spec alt &optional flags)
    (insert alt))
  (e:load-config "eww" t))

(provide '60_eww)
;;; 60_eww.el ends here
