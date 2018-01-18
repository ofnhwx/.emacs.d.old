;;; 60_eww.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/18 13:45:26>
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
 (e:load-local-config "eww"))

(provide '60_eww)
;;; 60_eww.el ends here
